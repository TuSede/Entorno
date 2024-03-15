# Fix the Java Problem
export _JAVA_AWT_WM_NONREPARENTING=1
export GOPATH=$HOME/go
# Enable Powerlevel10k instant prompt. Should stay at the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then

  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"

fi
# Set up the prompt
autoload -Uz promptinit
promptinit
prompt adam1
setopt histignorealldups sharehistory
# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system

autoload -Uz compinit

compinit



zstyle ':completion:*' auto-description 'specify: %d'

zstyle ':completion:*' completer _expand _complete _correct _approximate

zstyle ':completion:*' format 'Completing %d'

zstyle ':completion:*' group-name ''

zstyle ':completion:*' menu select=2

eval "$(dircolors -b)"

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*' list-colors ''

zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s

zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'

zstyle ':completion:*' menu select=long

zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s

zstyle ':completion:*' use-compctl false

zstyle ':completion:*' verbose true



zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

source  ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.

[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh



# Manual configuration



export PATH=root/.local/bin:/snap/bin:/usr/sandbox/:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/share/games:/usr/local/sbin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/opt/nvim-linux64/bin:/usr/local/go/bin:$GOPATH/bin


export ORACLE_HOME=/usr/lib/oracle/19.6/client64/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ORACLE_HOME/lib
export PATH=${ORACLE_HOME}bin:$PATH

# Manual aliases$

alias ll='lsd -lh --group-dirs=first'

alias la='lsd -a --group-dirs=first'

alias l='lsd --group-dirs=first'

alias lla='lsd -lha --group-dirs=first'

alias ls='lsd --group-dirs=first'

alias cat='bat'

alias vi='nvim'

alias vim='nvim'

alias vin='nvim'

alias htb='sudo openvpn TUVPN.ovpn'  # poner tu vpn

alias burp='sudo /opt/Burp-Suite/burp'  # poner tu ruta burpsuite

alias blackstone='nohup sudo /opt/BlackStone/xampp_installer/icon/simple_launch.sh > /dev/null 2>&1 &'

#Interface UP/DOWN
alias wlanUp='sudo ifconfig wlan0 up'
alias wlanDown='sudo ifconfig wlan0 down'

alias eth0Up='sudo ifconfig eth0 up'
alias eth0Down='sudo ifconfig eth0 down'

alias eth1Up='sudo ifconfig eth1 up'
alias eth1Down='sudo ifconfig eth1 down'


alias l_es="setxkbmap -layout es"
alias l_us="setxkbmap -layout us"

## grc dig alias
alias dig='/usr/bin/grc /usr/bin/dig'

## grc gcc alias
alias gcc='/usr/bin/grc /usr/bin/gcc'

## grc ifconfig alias
alias ifconfig='/usr/bin/grc /sbin/ifconfig'

## grc mount alias
alias mount='/usr/bin/grc /bin/mount'

## grc netstat alias
alias netstat='/usr/bin/grc /bin/netstat'

## grc ping alias
alias ping='/usr/bin/grc /bin/ping'

## grc ps alias
alias ps='/usr/bin/grc /bin/ps'

## grc tail alias
alias tail='/usr/bin/grc /usr/bin/tail'

## grc traceroute alias
alias traceroute='/usr/bin/grc /usr/sbin/traceroute'

## grc wdiff alias
alias wdiff='/usr/bin/grc '

## grep aliases
alias grep="grep --color=always"
alias ngrep="grep -n"

alias egrep="egrep --color=auto"

alias fgrep="fgrep --color=auto"

## axel
alias axel="axel -a"

## screen
alias screen="screen -xRR"

## Checksums
alias sha1="openssl sha1"
alias md5="openssl md5"

## Force create folders
alias mkdir="/bin/mkdir -pv"

## List open ports
alias ports="netstat -tulanp"

## Get header
alias header="curl -I"

## Get external IP address
alias ipx="curl -s http://ipinfo.io/ip"

## DNS - External IP #1
alias dns1="dig +short @resolver1.opendns.com myip.opendns.com"

## DNS - External IP #2
alias dns2="dig +short @208.67.222.222 myip.opendns.com"

### DNS - Check ("#.abc" is Okay)
alias dns3="dig +short @208.67.220.220 which.opendns.com txt"

## Directory navigation aliases
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

## strings
alias strings="strings -a"

### Network Services
alias listen="netstat -antp | grep LISTEN"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh



# Plugins

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

source /usr/share/zsh-sudo/sudo.plugin.zsh



# Functions

function mkt(){

	mkdir {nmap,content,exploits,images}

}



# Extract nmap information
# Used: 
# nmap -p- --open -T5 -v -n ip -oG allPorts

function extractPorts(){

	ports="$(cat $1 | grep -oP '\d{1,5}/open' | awk '{print $1}' FS='/' | xargs | tr ' ' ',')"

	ip_address="$(cat $1 | grep -oP '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' | sort -u | head -n 1)"

	echo -e "\n[*] Extracting information...\n" > extractPorts.tmp

	echo -e "\t[*] IP Address: $ip_address"  >> extractPorts.tmp

	echo -e "\t[*] Open ports: $ports\n"  >> extractPorts.tmp

	echo $ports | tr -d '\n' | xclip -sel clip

	echo -e "[*] Ports copied to clipboard\n"  >> extractPorts.tmp

	cat extractPorts.tmp; rm extractPorts.tmp

}



# Set 'man' colors

function mann() {

    env \

    LESS_TERMCAP_mb=$'\e[01;31m' \

    LESS_TERMCAP_md=$'\e[01;31m' \

    LESS_TERMCAP_me=$'\e[0m' \

    LESS_TERMCAP_se=$'\e[0m' \

    LESS_TERMCAP_so=$'\e[01;44;33m' \

    LESS_TERMCAP_ue=$'\e[0m' \

    LESS_TERMCAP_us=$'\e[01;32m' \

    mann "$@"

}



# fzf improvement

function fzf-lovely(){



	if [ "$1" = "h" ]; then

		fzf -m --reverse --preview-window down:20 --preview '[[ $(file --mime {}) =~ binary ]] &&

 	                echo {} is a binary file ||

	                 (bat --style=numbers --color=always {} ||

	                  highlight -O ansi -l {} ||

	                  coderay {} ||

	                  rougify {} ||

	                  cat {}) 2> /dev/null | head -500'



	else

	        fzf -m --preview '[[ $(file --mime {}) =~ binary ]] &&

	                         echo {} is a binary file ||

	                         (bat --style=numbers --color=always {} ||

	                          highlight -O ansi -l {} ||

	                          coderay {} ||

	                          rougify {} ||

	                          cat {}) 2> /dev/null | head -500'

	fi

}



function rmk(){

	scrub -p dod $1

	shred -zun 10 -v $1

}

## Extract file, example. "ex package.tar.bz2"
extractFile() {
  if [[ -f $1 ]]; then
    case $1 in
      *.tar.bz2) tar xjf $1 ;;
      *.tar.gz)  tar xzf $1 ;;
      *.bz2)     bunzip2 $1 ;;
      *.rar)     rar x $1 ;;
      *.gz)      gunzip $1  ;;
      *.tar)     tar xf $1  ;;
      *.tbz2)    tar xjf $1 ;;
      *.tgz)     tar xzf $1 ;;
      *.zip)     unzip $1 ;;
      *.Z)       uncompress $1 ;;
      *.7z)      7z x $1 ;;
      *)         echo $1 cannot be extracted ;;
    esac
  else
    echo $1 is not a valid file
  fi
}


function settarget(){

  echo $1 > /tmp/target

  echo $2 > /tmp/name

}



function cleartarget(){

  echo Null > /tmp/target

  echo Null > /tmp/name

}



# Finalize Powerlevel10k instant prompt. Should stay at the bottom of ~/.zshrc.

(( ! ${+functions[p10k-instant-prompt-finalize]} )) || p10k-instant-prompt-finalize



bindkey "^[[H" beginning-of-line

bindkey "^[[F" end-of-line

bindkey "^[[3~" delete-char

bindkey "^[[1;3C" forward-word

bindkey "^[[1;3D" backward-word



source ~/powerlevel10k/powerlevel10k.zsh-theme

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
typeset -g POWERLEVEL9K_INSTANT_PROMPT=off



# Created by `pipx` on 2023-10-07 23:27:25
export PATH="$PATH:/root/.local/bin"
export PATH=/opt/node-v20.10.0-linux-x64/bin:$PATH
