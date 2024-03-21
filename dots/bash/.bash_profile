#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
export NVM_DIR="$HOME/.nvm"
export PATH="${PATH}:${HOME}/.scripts/:/usr/local/texlive/2023/bin/x86_64-linux/"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# load rbenv
eval "$(~/.rbenv/bin/rbenv init - bash)"
