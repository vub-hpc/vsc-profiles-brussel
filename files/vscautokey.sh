minuid=2500000
myid=$(id -u)

if [ "${myid:-0}" -ge "$minuid" ] || id -nGz | grep -qFxz netidall ; then
    if ! [ -a ~/.ssh/id_dsa ]; then
        if [ -w ~ ]; then
            ssh-keygen -t dsa -f ~/.ssh/id_dsa -q -N ""
            chmod 600 ~/.ssh/authorized_keys
            cat ~/.ssh/id_dsa.pub >> ~/.ssh/authorized_keys
            chmod 400 ~/.ssh/authorized_keys ~/.ssh/id_dsa ~/.ssh/id_dsa.pub
        fi
    fi
fi
