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
alias dev_style='./bin/style'
alias dev_style_all='./bin/style --include-branch-commits'
alias dev_test='./bin/test'
alias dev_tc='./bin/srb tc'
alias dev_packages='./bin/packwerk update-deprecations'


# Shopify Functions
function enable_beta() {
	if [ ! -f ./bin/rails ]; then
	    LOC=$(pwd)
	    echo $fg_bold[red] "Cannot find ./bin/rails from \"$LOC\""
	    return 1
	fi
	if [ -z $1 ]; then
	    echo $fg_bold[red] "You need to supply a beta flag"
    	    return 1
	fi
	    
	./bin/rails dev:betas:enable BETA=$1
	return 0
} 

function disable_beta() {
	if [ ! -f ./bin/rails ]; then
	    LOC=$(pwd)
	    echo $fg_bold[red] "Cannot find ./bin/rails from \"$LOC\""
	    return 1
	fi
	if [ -z $1 ]; then
	    echo $fg_bold[red] "You need to supply a beta flag"
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
	./bin/rails dev:shopify_payments:setup SHOP_ID=1 COUNTRY=US

	return 0
}

function payment_toggle() {
	if [ $1 = 'on' ]; then
	dev integration enable ShopifyUS/hosted-fields
	dev integration enable ShopifyUS/cardsink
	dev integration enable ShopifyUS/cardserver
elif
	[ $1 = 'off' ]; then
	dev integration disable ShopifyUS/hosted-fields
	dev integration disable ShopifyUS/cardsink
	dev integration disable ShopifyUS/cardserver
else
	echo "Must choose on or off"
	fi
}

[[ -f /opt/dev/sh/chruby/chruby.sh ]] && type chruby >/dev/null 2>&1 || chruby () { source /opt/dev/sh/chruby/chruby.sh; chruby "$@"; }
