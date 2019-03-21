set netid=`id -nGz | grep -cFxz netidall`

if ( ${netid} == 1 ) then

# Set the temp dir
    if (! $?PBS_JOBID) then
            setenv TMPDIR /tmp/${USER}
    else
            if ("$PBS_JOBID" == "")  then
                    setenv TMPDIR /tmp/${USER}
            else
                    setenv TMPDIR /tmp/${USER}.${PBS_JOBID}
            endif
    endif

    if (! -d $TMPDIR) then
            mkdir $TMPDIR >& /dev/null
            # Problem?
            if ($status != 0) then
                    echo "Warning: failed to initiate your temporary directory $TMPDIR. Please report the problem at hpc@vub.ac.be or hpc@ulb.ac.be"
            else
                    chmod o-rwx $TMPDIR
            endif
    endif


    setenv WORKDIR /work/${USER}

    if (! -d $WORKDIR) then
            mkdir $WORKDIR >& /dev/null
            if ($status != 0) then
                    echo "Warning: failed to initiate your working directory. Please report the problem at hpc@vub.ac.be or hpc@ulb.ac.be"
            else
                    chmod o-rwx $WORKDIR
            endif
    endif

    source /etc/profile.d/modulepath-csh

endif

unset netid
