minuid=2500000
myid=$(id -u)
if [ "${myid:-0}" -ge "$minuid" ]; then
    if ! [ -e ~/.ssh/id_rsa ]; then
        if [ -w ~ ]; then
            mkdir -p ~/.ssh
            chmod 700 ~/.ssh
            ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -q -N ""
            touch ~/.ssh/authorized_keys
            chmod 600 ~/.ssh/authorized_keys
            cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
            chmod 400 ~/.ssh/authorized_keys ~/.ssh/id_rsa ~/.ssh/id_rsa.pub
        fi
    fi
fi
