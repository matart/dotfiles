export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="dracula"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

[ -f /opt/minidev/dev.sh ] && source /opt/minidev/dev.sh
[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh
[[ -f /opt/dev/sh/chruby/chruby.sh ]] && type chruby >/dev/null 2>&1 || chruby () { source /opt/dev/sh/chruby/chruby.sh; chruby "$@"; }
[[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)

export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
export PUPPETEER_EXECUTABLE_PATH=`which chromium`

alias v="nvim"
alias vs="dev cd shopify && v ."
alias rgc="rg --glob='!test' --glob='!spec'"
alias rgt="rg --glob='*_test.rb'"
alias dev_style='./bin/style'
alias dev_style_all='./bin/style --include-branch-commits'
alias dev_test='./bin/test'
alias dev_tc='./bin/srb tc'
alias dev_rbi='./bin/tapioca dsl'
alias dev_packages='./bin/packwerk update-deprecations'
alias r="bin/rails"
alias logs_server='journalctl --follow --output=json --unit=proc-shopify--shopify@server.service --lines=20000 | /opt/spin/bin/journalfmt'
alias logs_worker='journalctl --follow --output=json --unit=proc-shopify--shopify@worker.service --lines=20000 | /opt/spin/bin/journalfmt'


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


