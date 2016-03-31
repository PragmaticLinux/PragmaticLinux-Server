#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '

alias ls='ls --color=auto'
export PS1='[\e[36m\]\u\[\e[m\]@\[\e[37m\]\h\[\e[m\]\[\e[32m\]\w\[\e[m\]\\$ '
