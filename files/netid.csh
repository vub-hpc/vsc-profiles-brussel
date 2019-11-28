set netid=`id -nGz | grep -cFxz netidall`

if ( ${netid} == 1 ) then

    setenv WORKDIR /work/${USER}
    setenv VSC_SCRATCH ${WORKDIR}
    setenv VSC_HOME ${HOME}

    source /etc/profile.d/modulepaths-csh

endif

unset netid
