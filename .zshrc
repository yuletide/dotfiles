#source ~/.bashrc
# source ~/.bash_profile

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
#plugins=(git python npm node osx)
plugins=(git python npm node last-working-dir)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export HISTCONTROL=erasedups
export HISTSIZE=10000
# export CLICOLOR=1
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
    #	echo "$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)%{$reset_color%}%{$fg[red]%}$(parse_git_dirty)%{$reset_color%}$(rvm_gemset_name)$ZSH_THEME_GIT_PROMPT_SUFFIX"
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)%{$reset_color%}%{$fg[red]%}$(parse_git_dirty)%{$reset_color%}$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

drop_beats() {
  echo "%{$fg[red]%}$dharma%{$reset_color%} "
}

alias lsf="ls -Foah"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/ayule/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/ayule/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/ayule/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/ayule/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup


# PROMPT='%{$fg[blue]%}%2~%{$reset_color%}$(git_custom_status) $(drop_beats)'
PROMPT='%{$fg_bold[cyan]%}%2~%{$reset_color%}$(git_custom_status) $(drop_beats)'
# PROMPT="$PROMPT $(drop_beats)"


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# nodenv
eval "$(nodenv init -)"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"

# Poetry
export PATH="/Users/ayule/.local/bin:$PATH"

source ~/.mbxenv
