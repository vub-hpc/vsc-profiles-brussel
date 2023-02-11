fixpathbrussel(){
    if [[ $path =~ ^/vscmnt/brussel_pixiu_home/_user_brussel/(.*)$ ]]; then
        path=/user/$VSC_INSTITUTE/${BASH_REMATCH[1]}
    elif [[ $path =~ ^/vscmnt/brussel_pixiu_data/_data_brussel/(.*)$ ]]; then
        path=/data/$VSC_INSTITUTE/${BASH_REMATCH[1]}
    fi
}

fixpathgent(){
    if [[ $path =~ ^/vscmnt/gent_kyukon_home/_kyukon_home_gent/(.*)$ ]]; then
        path=/user/$VSC_INSTITUTE/${BASH_REMATCH[1]}
    elif [[ $path =~ ^/vscmnt/gent_kyukon_data/_kyukon_data_gent/(.*)$ ]]; then
        path=/data/$VSC_INSTITUTE/${BASH_REMATCH[1]}
    fi
}

fixpathantwerpen(){
    if [[ $path =~ ^/vscmnt/antwerpen_storage_home/_user_antwerpen/(.*)$ ]]; then
        path=/user/$VSC_INSTITUTE/${BASH_REMATCH[1]}
    elif [[ $path =~ ^/vscmnt/antwerpen_storage_data/_data_antwerpen/(.*)$ ]]; then
        path=/data/$VSC_INSTITUTE/${BASH_REMATCH[1]}
    fi
}

fixpathleuven(){
    if [[ $path =~ ^/vscmnt/leuven_icts/_user_leuven/(.*)$ ]]; then
        path=/user/$VSC_INSTITUTE/${BASH_REMATCH[1]}
    elif [[ $path =~ ^/vscmnt/leuven_icts/_data_leuven/(.*)$ ]]; then
        path=/data/$VSC_INSTITUTE/${BASH_REMATCH[1]}
    fi
}

fixpathvsc(){
    path=$PWD

    if [[ $path =~ ^/theia/scratch/brussel/(.*)$ ]]; then
        path=/scratch/$VSC_INSTITUTE_LOCAL/${BASH_REMATCH[1]}
    else
        fixpath$VSC_INSTITUTE
    fi

    if [[ $path =~ ^"$VSC_HOME"(.*)$ ]]; then
        path=\$VSC_HOME${BASH_REMATCH[1]}
    elif [[ $path =~ ^"$VSC_DATA_VO_USER"(.*)$ ]]; then
        path=\$VSC_DATA_VO_USER${BASH_REMATCH[1]}
    elif [[ $path =~ ^"$VSC_DATA_VO"(.*)$ ]]; then
        path=\$VSC_DATA_VO${BASH_REMATCH[1]}
    elif [[ $path =~ ^"$VSC_DATA"(.*)$ ]]; then
        path=\$VSC_DATA${BASH_REMATCH[1]}
    elif [[ $path =~ ^"$VSC_SCRATCH_VO_USER"(.*)$ ]]; then
        path=\$VSC_SCRATCH_VO_USER${BASH_REMATCH[1]}
    elif [[ $path =~ ^"$VSC_SCRATCH_VO"(.*)$ ]]; then
        path=\$VSC_SCRATCH_VO${BASH_REMATCH[1]}
    elif [[ $path =~ ^"$VSC_SCRATCH"(.*)$ ]]; then
        path=\$VSC_SCRATCH${BASH_REMATCH[1]}
    fi

    echo $path
}

if [ "${USER:0:3}" == "vsc" ]; then
    PS1="\$(if [ \$? != 0 ]; then echo '\[\e[0;31m\]'✘ '\[\e[0m\]'; else echo '\[\e[0;32m\]'✔ '\[\e[0m\]'; fi)"
    PS1+="\[\033[33m\][\$(date '+%H:%M')]\[\033[00m\] "
    PS1+="\u@\h \[\033[01;34m\]\$(fixpathvsc)\[\033[00m\] \\$ "
fi
