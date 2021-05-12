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

[ -f /opt/minidev/dev.sh ] && source /opt/minidev/dev.sh
[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh
if [ -e /Users/mathew/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/mathew/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

export PATH="/usr/local/share/chruby:$PATH"
export LANG=en_US.UTF-8

alias v="nvim"
alias vs="dev cd shopify && v ."
alias rgc="rg --glob='!test' --glob='!spec'"
alias rgt="rg --glob='*_test.rb'"


# Shopify Functions
function enable_beta() {
	if [ ! -f ./bin/rails ]; then
	    LOC=$(pwd)
	    echo "Cannot find ./bin/rails from \"$LOC\""
	    return 1
	fi
	if [ -z $1 ]; then
		echo "You need to supply a beta flag"
		return 1
	fi
	    
	./bin/rails dev:betas:enable BETA=$1
	return 0
} 

function disable_beta() {
	if [ ! -f ./bin/rails ]; then
	    LOC=$(pwd)
	    echo "Cannot find ./bin/rails from \"$LOC\""
	    return 1
	fi
	if [ -z $1 ]; then
		echo "You need to supply a beta flag"
		return 1
	fi
	
	./bin/rails dev:betas:disable BETA=$1
	return 0
}

function subscriptions_setup() {
	if [ ! -f ./bin/rails ]; then
	    LOC=$(pwd)
	    echo "Cannot find ./bin/rails from \"$LOC\""
	    return 1
	fi
	echo "Setting up subs for SPIN"
	./bin/rails dev:create_apps
	./bin/rails dev:subscriptions:setup
	./bin/rails dev:subscriptions:install_prototype_theme
	./bin/rails dev:shopify_payments:setup SHOP_ID=1 COUNTRY=US

	return 0
}
