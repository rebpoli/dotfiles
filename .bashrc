## noniterative
[ -z "${PS1:-}" ] && return

export HISTFILESIZE=100000
export HISTSIZE=100000
export TERM="xterm-256color"

shopt -s histappend

source ${HOME}/bin/git-sh-prompt
export GIT_PS1_SHOWDIRTYSTATE=1

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

umask 027

export EDITOR=vim


# Load shared NanGate .bashrc

alias iftop='sudo iftop'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias ls='ls --color --group-directories-first'
alias ll='ls -lah'
alias l='ls -l -h'
alias term='gnome-terminal'
alias dir='ls -l -h --color=auto'
#alias cd='echo "Entering from ['`pwd`']" && cd'
alias cd..='cd ..'
alias s='cd ..'
alias vi='vim'
alias pu="pushd"
alias po="popd"
alias P="pushd +1"
alias p="pushd -0"
alias grep='grep --color=always -n'

alias PYENV=". ~/bin/PYENV_Geomec"

eval `dircolors ${HOME}/.dircolors`

## Avalia se estamos dentro de um container para identificar o ambiente
SING=""
if ! [[ -z "${__SINGTAG}" ]]; then
  SING=" ($__SINGTAG)"
fi

function prompt_command {
    TERMWIDTH=${COLUMNS}
    GITST=$(__git_ps1)
    
    #Calculate the width of the prompt:
    newPWD="${PWD}"
    datetime=$(date +'%y-%b-%d %H:%M')
    extra="${EXTRA_PROMPT}"
      
    let promptsize=$(echo -n "--------(${datetime})-$SING--(${PWD})--${extra}--${GITST}" | wc -c | tr -d " ")
    let fillsize=${TERMWIDTH}-${promptsize}
    fill=""
    while [ "$fillsize" -gt "0" ] 
    do 
        fill="${fill}-"
        let fillsize=${fillsize}-1
    done

    if [ "$fillsize" -lt "0" ]
    then
        let cut=3-${fillsize}
	newPWD="...$(echo -n $PWD | sed -e "s/\(^.\{$cut\}\)\(.*\)/\2/")"
    fi
}

PROMPT_COMMAND=prompt_command

function twtty {

    local GRAY="\[\033[1;30m\]"
    local LIGHT_GRAY="\[\033[0;37m\]"
    local WHITE="\[\033[1;37m\]"
    local NO_COLOUR="\[\033[0m\]"

    local LIGHT_BLUE="\[\033[1;34m\]"
    local YELLOW="\[\033[1;33m\]"

    local LIGHT_GREEN="\[\e[1;32m\]"
    local GREEN="\[\e[0;32m\]"
    local CYAN="\[\e[0;36m\]"
    local LIGHT_CYAN="\[\e[1;36m\]"
    local RED="\[\e[0;31m\]"
    local PURPLE="\[\e[1;35m\]"
    local DARK_PURPLE="\[\e[0;35m\]"

    local DASH=$LIGHT_GRAY;
    local DATE=$LIGHT_GREEN;
    local FULLPATH=$LIGHT_GREEN;
    local DELIMITER=$LIGHT_GRAY;
    local USR=$YELLOW;
    local SERVER=$YELLOW;
    local LOCAL_DIR=$LIGHT_GREEN;

    local LONG_DASH=$LIGHT_GRAY
    if ! [[ -z $SING ]];
    then
      LONG_DASH="${PURPLE}"
    fi

    case $TERM in
        xterm*)
            TITLEBAR='\[\033]0;\u@\h:\w\007\]'
            ;;
        *)
            TITLEBAR=""
            ;;
    esac

    PS1="$TITLEBAR\
$DATE\${datetime}\
$DELIMITER$PURPLE$SING$RED\${GITST}$LONG_DASH\
${DELIMITER} -${LONG_DASH}-\${fill}$LIGHT_CYAN\${extra}$NO_COLOUR${DELIMITER}-\
$FULLPATH \${newPWD} \
$DELIMITER-$DASH-\
\n\
$USR\u\
$DELIMITER@$SERVER\h\
$DELIMITER\${BRANCH1}$LIGHT_CYAN\${BRANCH2}\
$DELIMITER:$LOCAL_DIR\W\
$DELIMITER:$WHITE\$$DELIMITER$NO_COLOUR " 



    PS2="$DELIMITER-$DASH-$DASH-$NO_COLOUR "
}

twtty

export PATH="$PATH:/home/renato/.local/bin"

alias PGE-Geomec='cd ~/dev/Doutorado/PGE383-AdvGeomec/'
alias PGE-Petrop='cd ~/dev/Doutorado/PGE381L-AdvPetrophysics/'
alias PGE-Research='cd ~/dev/Doutorado/Research/'

alias CD101='cd dev/lm23_hdd/chimas4d/demos/101-MULTIMESH/'
alias CD102='cd dev/lm23_hdd/chimas4d/demos/102-MULTIMESH-SKEMPTON/'

alias g-commit-all='git commit -a --allow-empty-message -m ""'
alias g-push='git push'
alias g-commit-push='g-commit-all && git push'
alias g-status='git status'
export GOPATH=${HOME}/go
export PATH=/usr/local/go/bin:${PATH}:${GOPATH}/bin

#export PETSC_DIR=/opt/petsc

if [[ "${__SINGTAG}" -eq "CHIMAS-ENV" ]]; then
  [ -d "/lm23_hdd/chimas4d" ] && cd /lm23_hdd/chimas4d
  [ -d "/lm23_hdd/dev/chimas4d" ] && cd /lm23_hdd/dev/chimas4d
fi

if [[ "${__SINGTAG}" -eq "FENICS" ]]; then
  [ -d "/proj" ] && cd /proj
#  [ -d "/proj" ] && source /proj/python_venv/poromec/bin/activate
fi

export XAUTHORITY=$HOME/.Xauthority
export PATH=/usr/local/go/bin:${PATH}
export PATH=/home/renato/bin:${PATH}

# # Some nice coloring so we know where we are
export HOSTNAME=$HOSTNAME
if [[ "${HOSTNAME}" -eq "PGE-B3MHBZ2-LNX" ]] ; then
	echo -e '\e]11;rgb:05/0E/05\a'
    alias paraview='/opt/paraview/ParaView-5.13.1-MPI-Linux-Python3.10-x86_64/bin/paraview'
    export HWLOC_COMPONENTS="-gl"
fi

source ~/build/pyenv/bin/activate
