export ZSH="$HOME/.oh-my-zsh"
if [ $SPIN ]; then
    ZSH_THEME="spin"
else
    ZSH_THEME="robbyrussell"
fi

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh
if [ -e /Users/mathew/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/mathew/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

export PATH="/usr/local/share/chruby:$PATH"

alias v="nvim"
alias vs="dev cd shopify && v ."
alias rgc="rg --glob='!test' --glob='!spec'"
alias rgt="rg --glob='*_test.rb'"
