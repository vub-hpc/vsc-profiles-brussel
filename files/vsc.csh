set minuid=2500000
set myid=`id -u`

if ( ${myid} >= ${minuid} ) then

    eval `/usr/bin/vsc_env csh`

    if ( "$USER" =~ vsc1* ) then
        setenv VSC_SCRATCH `echo ${HOME} | sed "s:user:scratch:"`
    else
        setenv VSC_SCRATCH /work/${USER}

        if (! -d $VSC_SCRATCH) then
                mkdir $VSC_SCRATCH >& /dev/null
                if ($status != 0) then
                        echo "Warning: failed to initiate your scratch directory. Please report the problem at hpc@vub.ac.be or hpc@ulb.ac.be"
                else
                        chmod o-rwx $VSC_SCRATCH
                endif
        endif

    endif

    setenv VSC_SCRATCH_NODE /tmp/${USER}
    setenv VSC_SCRATCH /work/${USER}

    setenv VSC_SCRATCH_CLUSTER ${VSC_SCRATCH}
    setenv VSC_SCRATCH_SITE ${VSC_SCRATCH}
    setenv WORKDIR ${VSC_SCRATCH}

    source /etc/profile.d/modulepaths-csh

endif

unset minuid
unset myid
