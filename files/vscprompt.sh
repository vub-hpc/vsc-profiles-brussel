fixpathvsc(){
    path=$PWD

    if [[ $path =~ ^/vscmnt/brussel_pixiu_home/_user_brussel/(.*)$ ]]; then
        path=/user/brussel/${BASH_REMATCH[1]}
    elif [[ $path =~ ^/vscmnt/brussel_pixiu_data/_data_brussel/(.*)$ ]]; then
        path=/data/brussel/${BASH_REMATCH[1]}
    elif [[ $path =~ ^/theia/scratch/brussel/(.*)$ ]]; then
        path=/scratch/brussel/${BASH_REMATCH[1]}
    fi

    if [[ $path =~ ^"/user/brussel/${USER:3:3}/$USER"(.*)$ ]]; then
        path=\$VSC_HOME${BASH_REMATCH[1]}
    elif [[ $path =~ ^"/data/brussel/${USER:3:3}/$USER"(.*)$ ]]; then
        path=\$VSC_DATA${BASH_REMATCH[1]}
    elif [[ $path =~ ^"/data/brussel/vo/${VSC_VO:3:3}/$VSC_VO/$USER"(.*)$ ]]; then
        path=\$VSC_DATA_VO_USER${BASH_REMATCH[1]}
    elif [[ $path =~ ^"/data/brussel/vo/${VSC_VO:3:3}/$VSC_VO"(.*)$ ]]; then
        path=\$VSC_DATA_VO${BASH_REMATCH[1]}
    elif [[ $path =~ ^"/scratch/brussel/${USER:3:3}/$USER"(.*)$ ]]; then
        path=\$VSC_SCRATCH${BASH_REMATCH[1]}
    elif [[ $path =~ ^"/scratch/brussel/vo/${VSC_VO:3:3}/$VSC_VO/$USER"(.*)$ ]]; then
        path=\$VSC_SCRATCH_VO_USER${BASH_REMATCH[1]}
    elif [[ $path =~ ^"/scratch/brussel/vo/${VSC_VO:3:3}/$VSC_VO"(.*)$ ]]; then
        path=\$VSC_SCRATCH_VO${BASH_REMATCH[1]}
    fi

    echo $path
}

if [ "${USER:0:3}" == "vsc" ]; then
    PS1="\$(if [ \$? != 0 ]; then echo '\[\e[0;31m\]'✘ '\[\e[0m\]'; else echo '\[\e[0;32m\]'✔ '\[\e[0m\]'; fi)"
    PS1+="\[\033[33m\][\$(date '+%H:%M')]\[\033[00m\] "
    PS1+="\u@\h \[\033[01;34m\]\$(fixpathvsc)\[\033[00m\] \\$ "
fi

