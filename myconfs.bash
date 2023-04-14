#!/bin/bash

if [ -z $1 ]
then
    echo "this script nedd an argument : deploy, update)"
    exit 1
fi

case $1 in
"deploy")
    # install zsh and oh-my-zosh and plugins
    apt install -y zsh
    sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

    # copy configuration files to HOME directory
    cp -R conf/home/. $HOME

    #TODO : add the update part of this script into crontab
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