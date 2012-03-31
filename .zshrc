source ~/.bashrc
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git ruby rvm)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export HISTCONTROL=erasedups
export HISTSIZE=10000
export CLICOLOR=1
setopt APPEND_HISTORY

dharma=$'☸'

#overwrite oh-my-zsh default git symbols
ZSH_THEME_GIT_PROMPT_DIRTY=$'\u267a '
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_PREFIX="(%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%})"

rvm_gemset_name() {
	GEMSET_NAME=`rvm gemset name`
	if [[ "$GEMSET_NAME" != "" ]]
	then
		echo "|%{$fg[yellow]%}$GEMSET_NAME%{$reset_color%}"
	else
	fi
}

git_custom_status() {
  local cb=$(current_branch)
  if [ -n "$cb" ]; then
	echo "$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)%{$reset_color%}%{$fg[red]%}$(parse_git_dirty)%{$reset_color%}$(rvm_gemset_name)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

drop_beats() {
	echo "%{$fg[cyan]%}$dharma%{$reset_color%} "
}

PROMPT='%{$fg[green]%}%2~%{$reset_color%}$(git_custom_status) $(drop_beats)'
