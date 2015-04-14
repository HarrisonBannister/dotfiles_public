#!/usr/bin/env bash

# this file gets run in two cases:
# 1. non-login interactive shell
# 2. remote shell (over ssh or similar)

# #2 happens when you run "ssh user@host bash" explicitly.
# in this case, /etc/bash.bashrc has not been previous executed (unlike #1).
# however, we assume that #2 is a recovery mode, so we don't want to do much.
# (also, my google-fu didn't find a way to distinguish them)

. ~/.bash/env
. ~/.bash/interactive

# Path to the bash it configuration
export BASH_IT=$HOME/.bash/.bash_it

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='bobby'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/xvzf/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# Load Bash It
source $BASH_IT/bash_it.sh
