export ZSH="/home/schlesser/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(git vi-mode zsh-syntax-highlighting poetry httpie)

VI_MODE_SET_CURSOR=true
MODE_INDICATOR="%F{yellow}+%f"

source $ZSH/oh-my-zsh.sh


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f -H'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# export FZF_TMUX_OPTS='-d 40%'
export FZF_TMUX_OPTS='-p80%,60%'
# morhetz/gruvbox
export FZF_DEFAULT_OPTS='--color=bg+:#3c3836,bg:#1d2021,spinner:#fb4934,hl:#928374,fg:#ebdbb2,header:#928374,info:#8ec07c,pointer:#fb4934,marker:#fb4934,fg+:#ebdbb2,prompt:#fb4934,hl+:#fb4934'

export EDITOR=vim
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

alias :q='exit'

alias ls='exa -l'
alias la='exa -la'
# alias tree='exa -T'
alias rr='reboot'
alias yazi='kitty -e yazi'

fzf-down() {
  fzf-tmux --min-height 20 --border --bind ctrl-/:toggle-preview "$@"
}

p() {
    du -a . | awk '{print $2}' | fzf-down --multi --preview-window right:70% --preview 'bat --style=numbers --color=always --line-range :500 {}' | xargs -r $EDITOR
}

function alfred() {
    type=$BUFFER
    zle backward-kill-line
    echo "fd --type f -e $type . $PWD | rofi -keep-right -dmenu -i -p Files -multiselect | xargs -I {} xdg-open {}"
    fd . $PWD | rofi -keep-right -dmenu -i -p Files -multiselect -theme gruvbox-dark-hard | xargs -I {} xdg-open {}
    zle reset-prompt
    zle redisplay
}

zle -N alfred
bindkey '^@' alfred
                            

bindkey -s '^P' '$(p)^M'
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

export PATH="/home/schlesser/.local/bin:$PATH"
complete -C '/usr/bin/aws_completer' aws

export MANPAGER="bat -p -l man"
export BAT_THEME="gruvbox-dark"
export VIMINIT='source ~/.vim/init.vim'
