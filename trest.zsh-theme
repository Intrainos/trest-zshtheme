ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[white]%}[±"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[white]%}]%{$reset_color%}" 
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}×"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%} ✔"

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg_bold[green]%}+"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg_bold[blue]%}!"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg_bold[red]%}-"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg_bold[purple]%}>"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg_bold[yellow]%}#"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[magenta]%}?"

ZSH_THEME_GIT_PROMPT_SHA_BEFORE=" %{$fg_bold[white]%}[%{$fg_bold[cyan]%}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$fg_bold[white]%}]"

function IDENT() {
	if [[ "$USER" == "root" ]]; then
		echo "%{$fg[green]%}#"; 
	else
		echo "%{$fg[green]%}$";
	fi
}

function git_infoer() {
	if git rev-parse --git-dir > /dev/null 2>&1; then
		if [[ -z $(git_prompt_info) ]]; then
			echo "%{$fg[blue]%}detached-head%{$reset_color%}) $(git_prompt_status) $(git_prompt_short_sha)"
		else
			echo "$(git_prompt_info) $(git_prompt_status) $(git_prompt_short_sha)"
		fi
	else
		echo "$reset_color"
	fi
}

PROMPT='
%{$fg[white]%}%n@%m %{$fg[yellow]%}%~ $(git_infoer)
%{$fg_bold[cyan]%}%* $reset_color> $(IDENT) $reset_color'
