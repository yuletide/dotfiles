# settings for Mapnik.framework Installer to enable Mapnik programs and python bindings
export PATH=/Library/Frameworks/Mapnik.framework/Programs:$PATH
export PYTHONPATH=/Library/Frameworks/Mapnik.framework/Python:$PYTHONPATH
# settings for qgis plugin dev
export QGIS_PLUGINPATH=/Users/ayule/code/qgis_plugins:
# Settings for postgres
export PGDATA=/usr/local/var/postgres:$PGDATA
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

alias lsf='ls -Foah'

export EC2_HOME=~/.ec2
# export PATH=$PATH:$EC2_HOME/bin
# export EC2_PRIVATE_KEY=`ls $EC2_HOME/pk-*.pem`
# export EC2_CERT=`ls $EC2_HOME/cert-*.pem`
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/

[[ -s "/Users/ayule/.rvm/scripts/rvm" ]] && source "/Users/ayule/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

################################################################
# python virtualenv & virtualenvwrapper
# set virtualenvwrapper env variables
# note: will use the first python found in path (see comment below)
# references:
# http://www.doughellmann.com/docs/virtualenvwrapper/install.html
# http://docwhat.org/2011/06/virtualenv-on-os-x/
################################################################
# set the root path for virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
#
# uncomment and set to use specific python (requires re-source)
# export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2.7
#
# ensure that all new environments are isolated from the
# system site-packages directory
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
#
# pip is designed to work with virtualenv, in that it can be
# given the path to a virtualenv environment (with -E or
# --environment) and it will know to install to that
# environment instead of the system site-package locations.
# the next two lines make pip use the same directory
# for virtualenvs as virtualenvwrapper and detect an
# active (active in the virtualenv/wrapper context)
# virtualenv and install to it, without having to pass it
# the -E parameter
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true
#
# load up all the virtualenvwrapper goodness so you can
# call its commands from the command line easily
source /usr/local/bin/virtualenvwrapper.sh


