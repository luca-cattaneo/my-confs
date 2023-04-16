## My Confs

Deploy and update my favourite software and configuration files

# Deploy

The script has been written for Ubuntu OS version 22 or greater
it needs `apt` and `snap` to work

`sudo ./myconfs.bash deploy`

- install softwares : 
    - git
    - zsh
    - oh-my-zsh
    - zsh-autosuggestions
    - docker.io
    - docker-compose
    - vscode (with snap)
> **_Note_** to add a new software add to the `install_softwares` function in the `myconf.bash` script 

- deploy recorded configuration files to `$HOME` directory
> **_Note_** to add a configuration file att the file and his path to the `conf/home` folder 

- lastly schedule an update of the configuration files in this folder everyday (copy them from `$HOME` diractory)

# Update

`./myconfs.bash update`

- copy all recorded configuration files from `$HOME` diractor to `conf/home` folder

# Save

when the configuration in home directory change we cans see the diff in git, then we can chose to save the changes in configuration with a commit
