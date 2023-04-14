## My Confs

List of my favourites configuration file.

# Deploy

The script has been written for Ubuntu OS version 22 or greater

it needs apt and snap to work

`sudo ./myconfs.bash deploy`

install softwares : 
    - git
    - zsh
    - oh-my-zsh
    - zsh-autosuggestions
    - docker.io
    - docker-compose
    - vscode (with snap)

then deploy recorded configuration files

lastly schedule an update of the conf in this folder everyday

# Update

`./myconfs.bash update`

copy all recorded configuration files from home to this folder

# Save

when the configuration in home directory change we cans see the diff in git, then we can chose to save the changes in configuration with a commit
