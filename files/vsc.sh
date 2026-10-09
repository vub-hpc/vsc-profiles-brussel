eval "$(/usr/bin/vsc_env bash)"

export LMOD_SYSTEM_NAME="${VSC_INSTITUTE_CLUSTER}-${VSC_ARCH_LOCAL}${VSC_ARCH_SUFFIX:-}"

if [ "$VSC_INSTITUTE_CLUSTER" == "sofia" ]; then
    modroot_subdir="$VSC_INSTITUTE_CLUSTER"
else
    modroot_subdir="$VSC_INSTITUTE_LOCAL"
fi

modulesroot="/apps/${modroot_subdir}/${VSC_OS_LOCAL}/${VSC_ARCH_LOCAL}${VSC_ARCH_SUFFIX:-}/modules"

CLUSTER_MODULEPATH="$modulesroot/system/all"

for year in {2022..2030}; do
  for suffix in a b .1 .2 .3; do
    if [ -d "$modulesroot/${year}${suffix}/all" ]; then
      CLUSTER_MODULEPATH="$modulesroot/${year}${suffix}/all:$CLUSTER_MODULEPATH"
    fi
  done
done

if [ -d "/etc/modulefiles/vsc" ]; then
    CLUSTER_MODULEPATH="$CLUSTER_MODULEPATH:/etc/modulefiles/vsc"
fi

export MODULEPATH="$CLUSTER_MODULEPATH"

unset CLUSTER_MODULEPATH

# vim: set ft=sh:
