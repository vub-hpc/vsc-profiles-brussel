#!/bin/bash

# script for testing the fixpathvsc function in vscprompt.sh
# @author: Samuel Moors (Vrije Universiteit Brussel)

source "$( dirname -- "${BASH_SOURCE[0]}" )/../files/vscprompt.sh"

test_string_equal(){
    echo -n "TEST: [$1] equal to [$2] ..." >&2
    if [ "$1" == "$2" ];then
        echo -e '\E[32msuccess\E[39;49m' >&2
        echo 0
    else
        echo -e '\E[31mfailed\E[39;49m' >&2
        echo 1
    fi
}

VSC_INSTITUTE_LOCAL=brussel

NFAILED=0
NTOTAL=0

run_tests(){
    echo -- Testing user $USER $VSC_INSTITUTE
    if [ ${#origpaths[@]} -ne ${#expectedpaths[@]} ]; then
        echo 'ERROR: origpaths and expectedpaths do not have the same length'
        exit 1
    fi
    for (( i=0; i<=$((${#origpaths[@]}-1)); i++ )); do
        orig=${origpaths[i]}
        # overwrite PWD environment variable for test
        PWD=$orig
        expected=${expectedpaths[i]}
        result=$(fixpathvsc)
        let NFAILED+=$(test_string_equal "$result" "$expected")
        let NTOTAL+=1
    done
}

# overwrite environment variables for brussel user
USER=vsc10009
VSC_INSTITUTE=brussel
VSC_HOME=/user/brussel/100/vsc10009
VSC_SCRATCH=/scratch/brussel/100/vsc10009
VSC_SCRATCH_VO=/scratch/brussel/vo/000/bvo00005
VSC_SCRATCH_VO_USER=$VSC_SCRATCH_VO/$USER
VSC_DATA=/data/brussel/100/vsc10009
VSC_DATA_VO=/data/brussel/vo/000/bvo00005
VSC_DATA_VO_USER=$VSC_DATA_VO/$USER

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

run_tests

# overwrite environment variables for antwerpen user
USER=vsc20133
VSC_INSTITUTE=antwerpen
VSC_HOME=/user/antwerpen/201/vsc20133
VSC_SCRATCH=/scratch/brussel/vo/000/bvo00002/vsc20133
VSC_SCRATCH_VO=/scratch/brussel/vo/000/bvo00002
VSC_SCRATCH_VO_USER=$VSC_SCRATCH_VO/$USER
VSC_DATA=/data/antwerpen/201/vsc20133
VSC_DATA_VO=/does/not/exist
VSC_DATA_VO_USER=/does/not/exist

origpaths=(
    '/user/antwerpen/201/vsc20133'
    '/vscmnt/antwerpen_storage_home/_user_antwerpen/201/vsc20133'
    '/data/antwerpen/201/vsc20133'
    '/vscmnt/antwerpen_storage_data/_data_antwerpen/201/vsc20133'
    '/scratch/brussel/vo/000/bvo00002/vsc20133'
    '/theia/scratch/brussel/vo/000/bvo00002/vsc20133'
)

expectedpaths=(
    '$VSC_HOME'
    '$VSC_HOME'
    '$VSC_DATA'
    '$VSC_DATA'
    '$VSC_SCRATCH'
    '$VSC_SCRATCH'
)

run_tests

# overwrite environment variables for gent user
USER=vsc40002
VSC_INSTITUTE=gent
VSC_HOME=/user/gent/400/vsc40002
VSC_SCRATCH=/scratch/brussel/vo/000/bvo00003/vsc40002
VSC_SCRATCH_VO=/scratch/brussel/vo/000/bvo00003
VSC_SCRATCH_VO_USER=$VSC_SCRATCH_VO/$USER
VSC_DATA=/data/gent/400/vsc40002
VSC_DATA_VO=/data/gent/vo/000/gvo00002
VSC_DATA_VO_USER=$VSC_DATA_VO/$USER

origpaths=(
    '/user/gent/400/vsc40002'
    '/vscmnt/gent_kyukon_home/_kyukon_home_gent/400/vsc40002'
    '/data/gent/400/vsc40002'
    '/vscmnt/gent_kyukon_data/_kyukon_data_gent/400/vsc40002'
    '/data/gent/vo/000/gvo00002/vsc40002'
    '/vscmnt/gent_kyukon_data/_kyukon_data_gent/vo/000/gvo00002/vsc40002'
    '/scratch/brussel/vo/000/bvo00003/vsc40002'
    '/theia/scratch/brussel/vo/000/bvo00003/vsc40002'
)

expectedpaths=(
    '$VSC_HOME'
    '$VSC_HOME'
    '$VSC_DATA'
    '$VSC_DATA'
    '$VSC_DATA_VO_USER'
    '$VSC_DATA_VO_USER'
    '$VSC_SCRATCH'
    '$VSC_SCRATCH'
)

run_tests

# overwrite environment variables for leuven user
USER=vsc33716
VSC_INSTITUTE=leuven
VSC_HOME=/user/leuven/337/vsc33716
VSC_SCRATCH=/scratch/brussel/vo/000/bvo00004/vsc33716
VSC_SCRATCH_VO=/scratch/brussel/vo/000/bvo00004
VSC_SCRATCH_VO_USER=$VSC_SCRATCH_VO/$USER
VSC_DATA=/data/leuven/337/vsc33716
VSC_DATA_VO=/does/not/exist
VSC_DATA_VO_USER=/does/not/exist

origpaths=(
    '/user/leuven/337/vsc33716'
    '/vscmnt/leuven_icts/_user_leuven/337/vsc33716'
    '/data/leuven/337/vsc33716'
    '/vscmnt/leuven_icts/_data_leuven/337/vsc33716'
    '/scratch/brussel/vo/000/bvo00004/vsc33716'
    '/theia/scratch/brussel/vo/000/bvo00004/vsc33716'
)

expectedpaths=(
    '$VSC_HOME'
    '$VSC_HOME'
    '$VSC_DATA'
    '$VSC_DATA'
    '$VSC_SCRATCH'
    '$VSC_SCRATCH'
)

run_tests

echo
echo SUMMARY
echo -------
echo PASSED: $(( NTOTAL - NFAILED ))
echo FAILED: $NFAILED

exit $NFAILED
