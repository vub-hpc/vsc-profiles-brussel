eval "$(/usr/bin/vsc_env bash)"

export LMOD_SYSTEM_NAME="${VSC_INSTITUTE_CLUSTER}-${VSC_ARCH_LOCAL}${VSC_ARCH_SUFFIX:-}"

HYDRA_MODULEPATH=
for i in {2016..2025}; do
  if [ -d "/apps/brussel/${VSC_OS_LOCAL}/${VSC_ARCH_LOCAL}${VSC_ARCH_SUFFIX:-}/modules/${i}a/all" ]; then
    HYDRA_MODULEPATH=/apps/brussel/${VSC_OS_LOCAL}/${VSC_ARCH_LOCAL}${VSC_ARCH_SUFFIX:-}/modules/${i}a/all:$HYDRA_MODULEPATH
  fi
  if [ -d "/apps/brussel/${VSC_OS_LOCAL}/${VSC_ARCH_LOCAL}${VSC_ARCH_SUFFIX:-}/modules/${i}b/all" ]; then
    HYDRA_MODULEPATH=/apps/brussel/${VSC_OS_LOCAL}/${VSC_ARCH_LOCAL}${VSC_ARCH_SUFFIX:-}/modules/${i}b/all:$HYDRA_MODULEPATH
  fi
done

export MODULEPATH=$HYDRA_MODULEPATH:/etc/modulefiles/vsc

unset HYDRA_MODULEPATH

# vim: set ft=sh:
