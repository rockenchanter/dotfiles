#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias sb="source ~/.bashrc"
alias yta='yt-dlp -x --audio-quality 0 --audio-format opus'

# compile latex document to pdf
alias lm='latexmk -pdf -pvc -output-directory=output main.tex'

# git
alias gs='git status'
alias gd='git diff'
alias gc='git commit'
alias gr='git remote --verbose'
alias nc='ncmpcpp'
alias rr='ranger'

# python's virtual environments
alias activate='source .venv/bin/activate'
alias mkenv='python -m venv .venv'

# tmux
alias ta='tmux attach'
alias tks='tmux kill-server'
tl () {
    cd ~/.tmuxp
    session="$(fzf)"
    if [ -n "${session}" ]; then
        tmuxp load $session
    else
        cd -
    fi
}


# PS1='[\u@\h \W]\$ '
PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)'
PS1='\[\e[93m\][\u\[\e[0m\]@\[\e[95m\]\H]\[\e[0m\] \[\e[96m\]\w\[\e[0m\] \[\e[91m\]${PS1_CMD1}\[\e[0m\] \$ '

export GPG_TTY=$(tty)
export EDITOR='nvim'
