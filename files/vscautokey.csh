set minuid=2500000
set myid=`id -u`
set netid=`id -nGz | grep -cFxz netidall`

if ( ${myid} >= ${minuid} || ${netid} == 1 ) then
    if ( ! -e ~/.ssh/id_dsa ) then
        if ( -w ~/) then
            ssh-keygen -t dsa -f ~/.ssh/id_dsa -q -N ""
            chmod 600 ~/.ssh/authorized_keys
            cat ~/.ssh/id_dsa.pub >> ~/.ssh/authorized_keys
            chmod 400 ~/.ssh/authorized_keys ~/.ssh/id_dsa ~/.ssh/id_dsa.pub
        endif
    endif
endif

unset minuid
unset myid
unset netid
