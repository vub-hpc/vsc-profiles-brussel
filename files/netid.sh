# only for netid
# create $WORKDIR and $TMPDIR

if id -nGz | grep -qFxz netidall ; then

    export WORKDIR=/work/${USER}
    export VSC_SCRATCH=$WORKDIR
    export VSC_HOME=$HOME

    source /etc/profile.d/modulepaths-sh
fi
