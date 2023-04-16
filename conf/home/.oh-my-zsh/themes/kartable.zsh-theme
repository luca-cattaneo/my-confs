# username
username() {
   echo "%B%{$fg[green]%}%n%f%b"
}

# hostname 10 char max
host(){
   echo "%B%{$fg[green]%}%10>>%1m%<<%f%b"
}

# current directory
# if more than 3 depth display first directory,...,2depth
directory() {
   echo "%{$fg[red]%}%(5~|%-1~/…/%2~|%3~%f)"
}

# returns red ✘ if there are errors, nothing otherwise
return_status() {
   echo "%(?..%{$fg[red]%}✘%f )"
}

# display prompt character
prompt_char() {
   echo "%(!.#.$)"
}

# git theming
ZSH_THEME_GIT_PROMPT_PREFIX=" ${FG[075]}(${FG[078]}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="${FG[214]}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="${FG[075]})%{$reset_color%}"

# putting it all together
PROMPT='$(return_status)[$(username)@$(host):$(directory)]$(prompt_char) '
RPROMPT='$(git_prompt_info)'
