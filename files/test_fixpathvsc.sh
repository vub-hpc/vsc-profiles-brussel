source vscprompt.sh

test_string_equal(){
    echo -n "TEST: [$1] equal to [$2] ..." >>/dev/stderr
    if [ "$1" == "$2" ];then
        echo success>>/dev/stderr
        echo 0
    else
        echo failed>>/dev/stderr
        echo 1
    fi
}

nfailed=0
ntotal=0

origpaths=(
    /user/brussel/100/vsc10009
    /vscmnt/brussel_pixiu_home/_user_brussel/100/vsc10009
    /user/brussel/100/vsc10009/testpath
    "/user/brussel/100/vsc10009/testpath with spaces"
    /data/brussel/100/vsc10009
    /vscmnt/brussel_pixiu_data/_data_brussel/100/vsc10009
    /data/brussel/vo/000/bvo00005
    /data/brussel/vo/000/bvo00005/vsc10009
    /scratch/brussel/100/vsc10009
    /theia/scratch/brussel/100/vsc10009
    /scratch/brussel/vo/000/bvo00005
    /scratch/brussel/vo/000/bvo00005/vsc10009
    /apps/brussel/CO7/skylake
    /vscmnt/brussel_pixiu_apps/_apps_brussel/CO7/skylake
    /fake/user/brussel/100/vsc10009
    /fake/vscmnt/brussel_pixiu_home/_user_brussel/100/vsc10009
)

expectedpaths=(
    '$VSC_HOME'
    '$VSC_HOME'
    '$VSC_HOME/testpath'
    '$VSC_HOME/testpath with spaces'
    '$VSC_DATA'
    '$VSC_DATA'
    '$VSC_DATA_VO'
    '$VSC_DATA_VO_USER'
    '$VSC_SCRATCH'
    '$VSC_SCRATCH'
    '$VSC_SCRATCH_VO'
    '$VSC_SCRATCH_VO_USER'
    /apps/brussel/CO7/skylake
    /vscmnt/brussel_pixiu_apps/_apps_brussel/CO7/skylake
    /fake/user/brussel/100/vsc10009
    /fake/vscmnt/brussel_pixiu_home/_user_brussel/100/vsc10009
)

for (( i=0; i<=$((${#origpaths[@]}-1)); i++ )); do
    orig=${origpaths[i]}
    expected=${expectedpaths[i]}
    result=$(fixpathvsc vsc10009 bvo00005 "$orig")
    let nfailed+=$(test_string_equal "$result" "$expected")
    let ntotal+=1
done

echo
echo SUMMARY
echo -------
echo PASSED: $(( ntotal - nfailed ))
echo FAILED: $nfailed

exit $nfailed
