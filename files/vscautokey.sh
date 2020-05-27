minuid=2500000
myid=$(id -u)

if [ "${myid:-0}" -ge "$minuid" ] || id -nGz | grep -qFxz netidall ; then
    if ! [ -f ~/.ssh/id_rsa ]; then
        if [ -w ~ ]; then
            ssh-keygen -b 4096 -t rsa -f ~/.ssh/id_rsa -q -N ""
            chmod 600 ~/.ssh/authorized_keys
            cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
            chmod 400 ~/.ssh/id_rsa ~/.ssh/id_rsa.pub
            if [ "${myid:-0}" -ge "$minuid" ]; then
                chmod 400 ~/.ssh/authorized_keys
            fi
        fi
    fi
fi
