#!/bin/bash

if [ -z $1 ]
then
    echo "this script nedd an argument : deploy, update)"
    exit 1
fi

# Settings file location
CONF_HOME="conf/home"

install_softwares()
{
    # install git
    sudo apt install git

    # install zsh
    gsudo apt install -y zsh
    # install oh-my-zsh
    sh -c "$(wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sed 's:env zsh -l::g' | sed 's:chsh -s .*$::g')"
    rm install.sh
    # install zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

    # install docker.io
    sudo apt install docker.io
    # install docker-compose
    sudo apt install docker-compose

    # install vscode
    sudo snap install --classic code
}

deploy() { 
    install_softwares

    # copy configuration files from CONF to HOME directory
    echo "deploy settings files to $HOME"
    cp -R conf/home/. $HOME

    # apply the new configuration
    source $HOME/.zshrc

    # schedule the update
    echo "Create crontab job for updating conf files"
    CRON_CMD="$PWD/myconfs.bash update"
    CRON_JOB="0 0 * * * $CRON_CMD"
    ( crontab -l | grep -v -F "$CRON_CMD" ; echo "$CRON_JOB" ) | crontab -
}

update() {
    # update HOME configuration files to CONF
    for FILE in $(cd conf/home && find . -type f); do
        echo "update file $FILE"
        cp $HOME/$FILE $CONF_HOME/$FILE
    done
}

case $1 in
"deploy")
    deploy
;;

"update")
    update
;;

*)
    echo "invalid argument $1, valid argument are : deploy, update"
    exit 1
;;
esac