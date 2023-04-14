#!/bin/bash

if [ -z $1 ]
then
    echo "this script nedd an argument : deploy, update)"
    exit 1
fi

case $1 in
"deploy")
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

    # copy configuration files to HOME directory
    cp -R conf/home/. $HOME

    # schedule the update
    echo "Create crontab job for updating conf files"
    CRON_CMD="$PWD/myconfs.bash update"
    CRON_JOB="0 0 * * * $CRON_CMD"
    ( crontab -l | grep -v -F "$CRON_CMD" ; echo "$CRON_JOB" ) | crontab -
;;

"update")
    # update home configuration files
    for FILE in $(find conf/home -type f); do
        echo "update file $HOME/$(basename $FILE)"
        cp $HOME/$(basename $FILE) $FILE
    done
;;

*)
    echo "invalid argument $1, valid argument are : deploy, update"
    exit 1
;;
esac