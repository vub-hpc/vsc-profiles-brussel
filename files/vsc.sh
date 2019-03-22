# only run for VSC accounts
if [ "$(id -u)" -ge "2500000" ]; then

    eval $(/usr/bin/vsc_env bash)

    if [[ $USER =~ "vsc1" ]]; then
        export VSC_SCRATCH=${HOME/user/scratch}
    else
        export VSC_SCRATCH=/work/$USER

        if [ ! -d $VSC_SCRATCH ]; then
            mkdir $VSC_SCRATCH &> /dev/null
            if [ $? -ne 0 ]; then
                echo "Error: failed to initiate your scratch directory. Please report the problem at hpc@vub.ac.be or hpc@ulb.ac.be"
            else
                chmod go-rwx $VSC_SCRATCH
            fi
        fi
    fi

    export VSC_SCRATCH_CLUSTER=$VSC_SCRATCH
    export VSC_SCRATCH_SITE=$VSC_SCRATCH
    export WORKDIR=$VSC_SCRATCH

    source /etc/profile.d/modulepaths-sh
fi
