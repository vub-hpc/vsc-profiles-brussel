set netid=`id -nGz | grep -cFxz netidall`

if ( ${netid} == 1 ) then

    setenv WORKDIR /work/${USER}
    setenv VSC_SCRATCH ${WORKDIR}
    setenv VSC_HOME ${HOME}

    if (! -d $WORKDIR) then
            mkdir $WORKDIR >& /dev/null
            if ($status != 0) then
                    echo "Warning: failed to initiate your working directory. Please report the problem at hpc@vub.ac.be or hpc@ulb.ac.be"
            else
                    chmod o-rwx $WORKDIR
            endif
    endif

    source /etc/profile.d/modulepaths-csh

endif

unset netid
