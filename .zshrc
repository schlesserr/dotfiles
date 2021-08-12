export ZSH="/home/schlesser/.oh-my-zsh"
ZSH_THEME="spaceship"
plugins=(git )

source $ZSH/oh-my-zsh.sh


SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  venv          # virtualenv section
  exec_time     # Execution time
  line_sep      # Line break
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
SPACESHIP_USER_SHOW=always
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SYMBOL="❯"
SPACESHIP_CHAR_SUFFIX=" "

#venv
SPACESHIP_VENV_SHOW=true
SPACESHIP_VENV_PREFIX="("
SPACESHIP_VENV_SUFFIX=")"
SPACESHIP_VENV_SYMBOL=
SPACESHIP_VENV_GENERIC_NAMES=()
SPACESHIP_VENV_COLOR=blue

export MICRO_TRUECOLOR=1

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files -g "!{venv,.venv/*}"'

fd() {
  preview="git diff $@ --color=always -- {-1}"
  git diff $@ --name-only | fzf -m --ansi --preview $preview
}

export EDITOR=vim
export NNN_FIFO='/tmp/nnn.fifo' 
export NNN_PLUG='p:preview-tui'
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

alias pyconvert="~/Python/convert && source .venv/bin/activate"
alias dbs="systemctl start redis && systemctl start postgresql"
