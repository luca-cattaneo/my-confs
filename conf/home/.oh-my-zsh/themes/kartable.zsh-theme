if [[ ${SSH_TTY} ]] ; then
	# yellow
	USER_HOST_COLOR=214
else
	# green
	USER_HOST_COLOR=078
fi

# username
username() {
   echo "%B%{$FG[${USER_HOST_COLOR}]%}%n%f%b"
}

# hostname 10 char max
host(){
   echo "%B%{$FG[${USER_HOST_COLOR}]%}%10>>%1m%<<%f%b"
}

# current directory
# if more than 3 depth display first directory,...,2depth
directory() {
   echo "%{$FG[196]%}%(5~|%-1~/…/%2~|%3~%f)"
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
# blue or green prefix
ZSH_THEME_GIT_PROMPT_PREFIX=" ${FG[075]}(${FG[078]}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
# yellow dirty
ZSH_THEME_GIT_PROMPT_DIRTY="${FG[214]}*%{$reset_color%}"
# blue suffix
ZSH_THEME_GIT_PROMPT_SUFFIX="${FG[075]})%{$reset_color%}"

# putting it all together
PROMPT='$(return_status)[$(username)@$(host):$(directory)]$(prompt_char) '
RPROMPT='$(git_prompt_info)'
