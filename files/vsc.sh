eval "$(/usr/bin/vsc_env bash)"

export LMOD_SYSTEM_NAME="${VSC_INSTITUTE_CLUSTER}-${VSC_ARCH_LOCAL}${VSC_ARCH_SUFFIX:-}"

CLUSTER_MODULEPATH="/etc/modulefiles/vsc"

modulesroot="/apps/brussel/${VSC_OS_LOCAL}/${VSC_ARCH_LOCAL}${VSC_ARCH_SUFFIX:-}/modules"

CLUSTER_MODULEPATH="$modulesroot/system/all:$CLUSTER_MODULEPATH"

for i in {2022..2030}; do
  if [ -d "$modulesroot/${i}a/all" ]; then
    CLUSTER_MODULEPATH="$modulesroot/${i}a/all:$CLUSTER_MODULEPATH"
  fi
  if [ -d "$modulesroot/${i}b/all" ]; then
    CLUSTER_MODULEPATH="$modulesroot/${i}b/all:$CLUSTER_MODULEPATH"
  fi
done

export MODULEPATH="$CLUSTER_MODULEPATH"

unset CLUSTER_MODULEPATH

# vim: set ft=sh:
