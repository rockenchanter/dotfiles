#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export NVM_DIR="$HOME/.nvm"
export PATH="${PATH}:/usr/local/texlive/2024/bin/x86_64-linux/:${HOME}/.local/bin/"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
