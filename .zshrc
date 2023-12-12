export ZSH="/home/schlesser/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(git vi-mode zsh-syntax-highlighting poetry)

VI_MODE_SET_CURSOR=true
MODE_INDICATOR="%F{yellow}+%f"

source $ZSH/oh-my-zsh.sh


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f -H'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_TMUX_OPTS='-d 40%'

export EDITOR=vim
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

alias :q='exit'

alias ls='exa -l'
alias la='exa -la'
alias tree='exa -T'
alias rr='reboot'
alias pshell='poetry shell'
alias hx='helix'

fzf-down() {
  fzf-tmux --min-height 20 --border --bind ctrl-/:toggle-preview "$@"
}

p() {
    du -a . | awk '{print $2}' | fzf-down --multi --preview-window right:70% --preview 'bat --style=numbers --color=always --line-range :500 {}' | xargs -r $EDITOR
}

function alfred() {
    type=$BUFFER
    zle backward-kill-line
    echo "fd --type f -e $type . $HOME | rofi -keep-right -dmenu -i -p Files -multiselect | xargs -I {} xdg-open {}"
    fd --type f -e $type . $HOME | rofi -keep-right -dmenu -i -p Files -multiselect | xargs -I {} xdg-open {}
    zle reset-prompt
    zle redisplay
}

zle -N alfred
bindkey '^@' alfred
                            

bindkey -s '^P' '$(p)^M'
eval "$(starship init zsh)"

export PATH="/home/schlesser/.local/bin:$PATH"
complete -C '/usr/bin/aws_completer' aws

export MANPAGER="bat -p -l man"
export BAT_THEME="gruvbox-dark"
export VIMINIT='source ~/.vim/init.vim'
