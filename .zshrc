export ZSH="/home/schlesser/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(git vi-mode zsh-syntax-highlighting poetry httpie colored-man-pages)

VI_MODE_SET_CURSOR=true
MODE_INDICATOR="%F{yellow}+%f"

source $ZSH/oh-my-zsh.sh


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f -H'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# export FZF_TMUX_OPTS='-d 40%'
export FZF_TMUX_OPTS='-p80%,60%'

export EDITOR=vim
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

alias :q='exit'

alias v='vim'
alias ls='eza -l'
alias la='eza -la'
alias rr='reboot'
alias ezp='eza -la --git -I ".git|.ruff_cache|__pycache__|.venv" -T'
alias emacs='emacsclient -c -a "emacs"'
alias sa="source .venv/bin/activate"

# fzf-down() {
#   fzf-tmux --min-height 20 --border --bind ctrl-/:toggle-preview "$@"
# }

p() {
    du -a . | awk '{print $2}' | fzf-down --multi --preview-window right:70% --preview 'bat --style=numbers --color=always --line-range :500 {}' | xargs -r $EDITOR
}

rfunction alfred() {
    type=$BUFFER
    zle backward-kill-line
    echo "fd --type f -e $type . $PWD | rofi -keep-right -dmenu -i -p Files -multiselect | xargs -I {} xdg-open {}"
    fd . $PWD | rofi -keep-right -dmenu -i -p Files -multiselect -theme arthur | xargs -I {} xdg-open {}
    zle reset-prompt
    zle redisplay
}

zle -N alfred
bindkey '^@' alfred
                            

bindkey -s '^P' '$(p)^M'

autoload -U edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line
bindkey -M vicmd v edit-command-line

eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"
eval "$(zoxide init zsh)"
# eval "$(starship init zsh)"

export PATH="/home/schlesser/.local/bin:$PATH"
complete -C '/usr/bin/aws_completer' aws

# export MANPAGER="bat -p -l man"
export BAT_THEME="1337"
export VIMINIT='source ~/.vim/init.vim'
export PATH="$HOME/.config/emacs/bin:$PATH"
export TERMINAL='xterm-ghostty'
export PATH='/home/schlesser/.duckdb/cli/latest':$PATH
