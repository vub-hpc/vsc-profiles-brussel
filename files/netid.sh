# only for netid
# create $WORKDIR and $TMPDIR

if id -nGz | grep -qFxz netidall ; then

    export WORKDIR=/work/${USER}
    export VSC_SCRATCH=$WORKDIR
    export VSC_HOME=$HOME

    if [ ! -d $WORKDIR ]; then
        mkdir $WORKDIR &> /dev/null
        if [ $? -ne 0 ]; then
            echo "Error: failed to initiate your working directory. Please report the problem at hpc@vub.ac.be or hpc@ulb.ac.be"
        else
            chmod go-rwx $WORKDIR
        fi
    fi

    source /etc/profile.d/modulepaths-sh
fi
