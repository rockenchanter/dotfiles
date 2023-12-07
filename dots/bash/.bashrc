# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias sb="source ~/.bashrc"
alias ls='ls --color=auto'
alias lm='latexmk -pvc -pdf -jobname=./output/main main.tex'
alias ta='tmux attach || tmux'
alias tks='tmux kill-server'
alias mmo="sudo chown $USER:$USER -R ."
alias poweroff='loginctl poweroff'
alias reboot='loginctl reboot'
alias unblock='sudo rfkill unblock all'

# docker aliases
alias dcp='docker container prune'
alias dip='docker image prune'
alias dri='docker image rm'
alias dls='docker image ls'

PS1='\[\e[0;1m\][\[\e[93m\]\u@\[\e[95m\]\H] \[\e[94m\]\w \[\e[91m\]$(git branch 2>/dev/null | grep '"'"'^*'"'"' | colrm 1 2)\n$ \[\e[0m\]'
function fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

function mpvp() {
    cd ~/media/videos/
    fd
    [ -e "playlist.txt" ] && mpv --save-position-on-quit --playlist=playlist.txt || echo "No playlist file"
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

export EDITOR='nvim'
export GPG_TTY=$(tty)
if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec dbus-run-session sway
fi
