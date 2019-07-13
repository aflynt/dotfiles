
################################################################################
# VIM
################################################################################
export EDITOR=/usr/bin/vim

## USE VI IN BASH
set -o vi

test -s ~/.alias && . ~/.alias || true


################################################################################
# CCM+
################################################################################
#PATH=/raid/linux8/apps/starccm/12.04.010-R8/STAR-CCM+12.04.010-R8/star/bin:$PATH
PATH=/raid/linux8/apps/starccm/14.02.012-R8/STAR-CCM+14.02.012-R8/star/bin:$PATH

export CDLMD_LICENSE_FILE=1999@linux9

alias sp='/raid/linux8/apps/starccm/12.04.010-R8/STAR-CCM+12.04.010-R8/star/bin/starccm+ &'
alias asp='/raid/linux4/12.06.011-R8/STAR-CCM+12.06.011-R8/star/bin/starccm+ &'
alias as4='/raid/linux4/12.04.010-R8/STAR-CCM+12.04.010-R8/star/bin/starccm+ &'
alias s126='/raid/linux8/apps/starccm/12.06.010-R8/12.06.010-R8/STAR-CCM+12.06.010-R8/star/bin/starccm+ &'
####alias sss='/raid/linux4/flyntga/starccm+_12.06.011/bin/starccm+ &'
#alias s13='/raid/linux8/apps/starccm/13.04.011-R8/STAR-CCM+13.04.011-R8/star/bin/starccm+ &'
alias s13='/raid/linux8/apps/starccm/13.06.012-R8/STAR-CCM+13.06.012-R8/star/bin/starccm+ &'
alias s2019='/raid/linux8/apps/starccm/14.02.012-R8/STAR-CCM+14.02.012-R8/star/bin/starccm+ -rsh ssh -mpi intel  &'

################################################################################
# PATH
################################################################################
export PATH=/opt/rh/rh-python36/root/usr/bin/:$PATH

# ADD MY CMDS TO PATH
export PATH=~/bin:$PATH
export PATH=.:$PATH

################################################################################
# Python for Computer science
################################################################################
export DIRB=/raid/linux4/flyntga/0_95957_Navy_TF/tmc6/inviscid/6b/data
export DIRA=/raid/linux4/flyntga/0_95957_Navy_TF/tmc6/inviscid/free/data
export scripting=$HOME/scripting
export MACHINE_TYPE=`uname`
export SYSDIR=$scripting
export PREFIX=$SYSDIR/$MACHINE_TYPE

export PYTHONPATH=$scripting/src/tools:$scripting/scitools/lib
export PATH=$scripting/src/tools:$scripting/scitools/bin:$PATH
export PATH=$PREFIX/bin:$PATH

export MANPATH=$PREFIX/man:$MANPATH
export LD_LIBRARY_PATH=$PREFIX/lib:$LD_LIBRARY_PATH

alias python='python3'

################################################################################
# PROMPT
################################################################################
if [[ ${EUID} == 0 ]] ; then
  #PS1='\e[0;31m[\u@\h \W]\$ \e[m '
  #PS1='\e[1;31;48;5;234m\u \e[38;5;240mon \e[1;38;5;28;48;5;234m\h \e[38;5;54m\d \@\e[0m\n\e[0;31;48;5;234m[\w] \e[1m\$\e[0m '
  #PS1='\e[1;31;48;5;234m\u \e[38;5;240mon \e[1;38;5;28;48;5;234m\h \e[0m\e[0;31;48;5;234m[\W] \e[1m\$\e[0m '
  PS1='\e[1;31;48;5;234m\u_\e[1;38;5;28;48;5;234m\h_\e[0m\e[0;31;48;5;234m[\W] \e[1m\$\e[0m '
else
  #PS1='\e[1;38;5;56;48;5;234m\u \e[38;5;240mon \e[1;38;5;28;48;5;234m\h \e[38;5;54m\d \@\e[0m\n\e[0;38;5;56;48;5;234m[\w] \e[1m\$\e[0m '
  #PS1='\e[1;38;5;56;48;5;234m\u \e[38;5;240mon \e[1;38;5;28;48;5;234m\h \e[0m\e[0;38;5;56;48;5;234m[\w] \e[1m\$\e[0m '
  PS1='\e[31m\u_\e[31m\h_\e[0m\e[31m[\W] \e[1m\$\e[0m '
  #PS1='\e[90m\u \e[90mon \e[90m\h \e[0m\e[90m[\w] \e[1m\$\e[0m '
  #PS1='\e[0;31m[\u@\h \W]\$ \e[m '
fi

################################################################################
# HOME PROMPT
################################################################################
# Setting Bash prompt. Capitalizes username and host if root user (my root user uses this same config file).
#if [ "$EUID" -ne 0 ]
#	then export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
#	else export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]ROOT\[$(tput setaf 2)\]@\[$(tput setaf 4)\]$(hostname | awk '{print toupper($0)}') \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
#fi

################################################################################
#ALIASES
################################################################################
alias sour='source ~/.bashrc'
alias rm='rm -i'
alias rmf='rm -f'
alias h='history'
alias vi='vim'
alias rl='rlogin'
alias freeg='free -g'
alias open='okular'
alias src='source ~/.cshrc'
alias lic='lmstat -S'

alias rnn='renamer 1 2>/dev/null ; renamer'
#alias grep='grep -n --color'
alias grep='grep --color'

################################################################################
# CD
################################################################################
alias rr3='cd /raid/linux3/flyntga'
alias rr4='cd /raid/linux4/flyntga'
alias rr8='cd /raid/linux8/flyntga'
alias rr10='cd /raid/linux10/flyntga'
alias rr16='cd /raid/linux16/flyntga'
alias rr19='cd /raid/linux19/flyntga'
alias rr21='cd /raid/linux21/flyntga'
alias rr22='cd /raid/linux22/flyntga'
alias rr23='cd /raid/linux23/flyntga'
alias rr38='cd /raid/linux38/flyntga'
alias rr58='cd /raid/linux58/flyntga'
alias rr59='cd /raid/linux59/flyntga'

################################################################################
# VNC
################################################################################
alias vnc8='vncviewer linux8:2'
alias vnc3='vncviewer linux3:2'
alias vnc4='vncviewer linux4:2'
alias vnc21='vncviewer linux21:2'
alias vnc22='vncviewer linux22:2'
alias vnc23='vncviewer linux23:2'
alias vnc38='vncviewer linux38:2'
alias vnc58='vncviewer linux58:2'
alias vnc59='vncviewer linux59:2'

################################################################################
# LS
################################################################################
alias l='ls -lrtF --time-style locale --color '
alias lsl='ls --color -hl'
alias sl='ls --color -h'
alias sll='ls --color -hl'
alias slsl='ls --color -hl'
alias slsls='ls --color -hl'
alias sls='ls --color -hl'
alias lls='ls --color -hl'
alias la='ls --color -al'
alias ll='ls --color -ltrah'
alias ls='ls --color'

################################################################################
# SSH
################################################################################
alias s3='ssh linux3'
alias s4='ssh linux4'
alias s14='ssh linux14'
alias s15='ssh linux15'
alias s18='ssh linux18'
alias s21='ssh linux21'
alias s22='ssh linux22'

alias s9='ssh linux9'
alias s19='ssh linux19'
alias s23='ssh linux23'
alias s38='ssh linux38'
alias s55='ssh linux55'
alias s58='ssh linux58'
alias s59='ssh linux59'

alias rl3='ssh linux3'
alias rl4='ssh linux4'
alias rl14='ssh linux14'
alias rl15='ssh linux15'
alias rl18='ssh linux18'
alias rl21='ssh linux21'
alias rl22='ssh linux22'

alias rl9='ssh linux9'
alias rl19='ssh linux19'
alias rl23='ssh linux23'
alias rl38='ssh linux38'
alias rl58='ssh linux58'
alias rl59='ssh linux59'

################################################################################
# GIT
################################################################################
alias gst='git status'
alias gco='git commit'
alias glog='git log --pretty=format:"%h %s" --graph'


