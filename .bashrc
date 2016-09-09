# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
[ -r /home/sungmin/.byobu/prompt ] && . /home/sungmin/.byobu/prompt   #byobu-prompt#

## SUNGMIN

## ENCODING
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

## BASE16 COLOR SCHEME
#BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
#BASE16_SHELL="$HOME/.config/base16-shell/base16-monokai.light.sh"
BASE16_SHELL="$HOME/.config/base16-shell/base16-monokai.dark.sh"
#BASE16_SHELL="$HOME/.config/base16-shell/base16-google.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

## SVN
export SVN_EDITOR=vim

## PINTOOL
# export PATH=/home/sungmin/pin-2.14-71313-gcc.4.4.7-linux:$PATH

## ALPHA CROSS COMPILER
# export PATH=/home/sungmin/alphaev67-unknown-linux-gnu/bin:$PATH

## GEM5
#export GEM5=/home/sungmin/svnroot/projects/typedarch/branches/isca2016/gem5
#export GEM5=/home/sungmin/svnroot/projects/typedarch/branches/isca2016_jrop/gem5
#export GEM5=/home/sungmin/svnroot/projects/typedarch/branches/isca2016_vbbi/gem5
#export GEM5=/home/sungmin/tp-taggedArch/typed-gem5
# export GEM5=/home/sungmin/svnroot/projects/typedarch/branches/typedisa_sm/gem5

## VIVADO
# export PATH=/opt/Xilinx/Vivado/2015.2/bin:$PATH
# export PATH=/opt/Xilinx/SDK/2015.2/bin:$PATH
# export PATH=/opt/Xilinx/SDK/2015.2/gnu/arm/lin/bin:$PATH
# export PATH=/opt/Xilinx/SDK/2015.2/tps/lnx64/jre/bin:$PATH

## TYPED ISA
# export TYPED=/home/sungmin/svnroot/projects/typedarch/branches
# export RISCV=/home/sungmin/tp-taggedArch/rocket-chip/riscv
# export PATH=/home/sungmin/tp-taggedArch/rocket-chip/riscv/bin:$PATH

## TAGGED GEM5
# alias addtest='./build/ALPHA/gem5.opt configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l1i_size='16kB' --l1i_assoc=2 --l1d_size='32kB' --l1d_assoc=4 --l2_size='128kB' --l2_assoc=8 -c ../test/add'

alias mailme='history | tail -n 1 | mutt nalbyul@gmail.com -s "END-success" || history | tail -n 1 | mutt -s "End-fail" nalbyul@gmail.com'

## RISCV C++ Cycle Accurate Simulator
# MICRO16
alias emul='./emulator-Top-DefaultCPPConfig +dramsim +memsize=1024 pk'
alias emulp='./emulator-Top-DefaultCPPConfig +dramsim +verbose +memsize=1024 pk'
