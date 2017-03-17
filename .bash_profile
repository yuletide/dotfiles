[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
#source ~/.profile

alias be="bundle exec"

export PATH="/Applications/Postgres.app/Contents/Versions/9.4/bin:$PATH"


# settings for Mapnik.framework Installer to enable Mapnik programs and python bindings
export PATH=/Library/Frameworks/Mapnik.framework/Programs:$PATH
export PYTHONPATH=/Library/Frameworks/Mapnik.framework/Python:$PYTHONPATH
# settings for qgis plugin dev
export QGIS_PLUGINPATH=/Users/ayule/code/qgis_plugins:
export GDAL_DATA=/usr/local/share/gdal:$GDAL_DATA

# Settings for postgres
export PGDATA=/usr/local/var/postgres:$PGDATA
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

alias lsf='ls -Foah'

export EC2_HOME=~/.ec2
# export PATH=$PATH:$EC2_HOME/bin
# export EC2_PRIVATE_KEY=`ls $EC2_HOME/pk-*.pem`
# export EC2_CERT=`ls $EC2_HOME/cert-*.pem`
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/

