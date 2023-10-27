fixpathvsc(){
    path=$PWD

    regex_scratch='^/[^/]+/scratch/brussel/(.*)$'
    regex_home='^/vscmnt/'${VSC_INSTITUTE}'_[^/]+/_[^/]*(user|home)_'${VSC_INSTITUTE}'/(.*)$'
    regex_data='^/vscmnt/'${VSC_INSTITUTE}'_[^/]+/_[^/]*data_'${VSC_INSTITUTE}'/(.*)$'

    # convert real paths to canonical paths
    if [[ $path =~ $regex_scratch ]]; then
        path=/scratch/$VSC_INSTITUTE_LOCAL/${BASH_REMATCH[1]}
    elif [[ $path =~ $regex_home ]]; then
        path=/user/$VSC_INSTITUTE/${BASH_REMATCH[2]}
    elif [[ $path =~ $regex_data ]]; then
        path=/data/$VSC_INSTITUTE/${BASH_REMATCH[1]}
    fi

    # convert canonical paths to environment variable
    if [[ $path =~ ^"$VSC_HOME"(.*)$ ]]; then
        path=\$VSC_HOME${BASH_REMATCH[1]}
    elif [ -n "$VSC_DATA_VO_USER" ] && [[ $path =~ ^"$VSC_DATA_VO_USER"(.*)$ ]]; then
        path=\$VSC_DATA_VO_USER${BASH_REMATCH[1]}
    elif [ -n "$VSC_DATA_VO" ] && [[ $path =~ ^"$VSC_DATA_VO"(.*)$ ]]; then
        path=\$VSC_DATA_VO${BASH_REMATCH[1]}
    elif [[ $path =~ ^"$VSC_DATA"(.*)$ ]]; then
        path=\$VSC_DATA${BASH_REMATCH[1]}
    elif [ -n "$VSC_SCRATCH_VO_USER" ] && [[ $path =~ ^"$VSC_SCRATCH_VO_USER"(.*)$ ]]; then
        # personal scratch might be located inside a generic VO
        if [ "$VSC_SCRATCH_VO_USER" == "$VSC_SCRATCH" ];then
            path=\$VSC_SCRATCH${BASH_REMATCH[1]}
        else
            path=\$VSC_SCRATCH_VO_USER${BASH_REMATCH[1]}
        fi
    elif [ -n "$VSC_SCRATCH_VO" ] && [[ $path =~ ^"$VSC_SCRATCH_VO"(.*)$ ]]; then
        path=\$VSC_SCRATCH_VO${BASH_REMATCH[1]}
    elif [[ $path =~ ^"$VSC_SCRATCH"(.*)$ ]]; then
        path=\$VSC_SCRATCH${BASH_REMATCH[1]}
    fi

    echo "$path"
}

if [ "${USER:0:3}" == "vsc" ]; then
    PS1="\$(if [ \$? != 0 ]; then echo '\[\e[0;31m\]'✘ '\[\e[0m\]'; else echo '\[\e[0;32m\]'✔ '\[\e[0m\]'; fi)"
    PS1+="\[\033[33m\][\$(date '+%H:%M')]\[\033[00m\] "
    PS1+="\u@\h \[\033[01;34m\]\$(fixpathvsc)\[\033[00m\] \\$ "
fi
