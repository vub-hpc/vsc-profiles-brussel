# only for netid
# create $WORKDIR and $TMPDIR

if id -nGz | grep -qFxz netidall ; then

    # Set the temp dir
    if [ x${PBS_JOBID} != "x" ] ; then
        export TMPDIR=/tmp/${USER}.${PBS_JOBID}
    else
        export TMPDIR=/tmp/${USER}
    fi

    if [ ! -d $TMPDIR ]; then
            mkdir $TMPDIR &> /dev/null
            if [ $? -ne 0 ]; then
                echo "Error: failed to initiate your $TMPDIR directory. Please report the problem at hpc@vub.ac.be or hpc@ulb.ac.be"
            else
                chmod go-rwx $TMPDIR
            fi
    fi

    export WORKDIR=/work/${USER}
    export VSC_SCRATCH=$WORKDIR

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
