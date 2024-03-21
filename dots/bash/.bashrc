# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias rs='exec dbus-run-session sway'
alias r4='exec startxfce4'
alias yt='yt-dlp -x --audio-quality 0'


alias nc='ncmpcpp'
alias sb="source ~/.bashrc"
alias ls='ls --color=auto'
alias lm='latexmk -pvc -pdf -jobname=./output/main main.tex'
# tmux
alias ta='tmux attach || tmux'
alias tks='tmux kill-server'

# make mine
alias mm="sudo chown $USER:$USER -R ."

# elogind
alias poweroff='loginctl poweroff'
alias reboot='loginctl reboot'
alias unblock='sudo rfkill unblock all'

# python virtual environments
alias ac='source .venv/bin/activate'
alias mkenv='python -m venv .venv'

# runit aliases for user-services
alias smd="sv down ~/.services/*"
alias smu="sv up ~/.services/*"
alias sms="sv status ~/.services/*"

# git aliases
alias glt='git log --graph --pretty=oneline --abbrev-commit'
alias gs='git status'
alias gl='git log'
alias gr='git remote --verbose'
alias gb='git branch --verbose --all'

# docker aliases
alias dcp='docker container prune'
alias dip='docker image prune'
alias dri='docker image rm'
alias dls='docker image ls'
alias dlc='docker container ls'
alias dc='docker-compose'

# load pywal colorscheme
(cat ~/.cache/wal/sequences &)
PS1='\[\e[0;1m\][\[\e[93m\]\u@\[\e[95m\]\H] \[\e[94m\]\w \[\e[91m\]$(git branch 2>/dev/null | grep '"'"'^*'"'"' | colrm 1 2)\n$ \[\e[0m\]'

function fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

function tl() {
  cd ~/.tmuxp
  session=$(fzf -m)
  if [ -n "$session" ]; then
    tmuxp load $session
  else
    echo 'Operation aborted'
  fi
}

if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec sway
fi

export EDITOR='nvim'
export GPG_TTY=$(tty)
