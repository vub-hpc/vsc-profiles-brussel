if [ -z $VSC_OS_LOCAL ]; then
    export VSC_OS_LOCAL=CO7
fi
if [ -z $VSC_INSTITUTE_CLUSTER ]; then
    export VSC_INSTITUTE_CLUSTER=hydra
fi

export VSC_ARCH_LOCAL=''
export VSC_ARCH_SUFFIX=''

if grep -q 'Processor.2378' /proc/cpuinfo
  then
  export VSC_ARCH_LOCAL=shanghai
  export VSC_ARCH_SUFFIX=-ib
elif grep -q 'Processor.6134' /proc/cpuinfo
  then 
  export VSC_ARCH_LOCAL=magnycours
  export VSC_ARCH_SUFFIX=-ib
elif grep -q 'Processor.6274' /proc/cpuinfo
  then
  export VSC_ARCH_LOCAL=interlagos
  export VSC_ARCH_SUFFIX=-ib
elif grep -q 'CPU.E5-2680.v2' /proc/cpuinfo
  then
  export VSC_ARCH_LOCAL=ivybridge
  export VSC_ARCH_SUFFIX=-ib
elif grep -q 'CPU.E5-[0-9]\+.v3' /proc/cpuinfo
  then
  export VSC_ARCH_LOCAL=haswell
  export VSC_ARCH_SUFFIX=-ib
elif grep -q 'CPU.E[57]-[0-9]\+.v4' /proc/cpuinfo
  then
  export VSC_ARCH_LOCAL=broadwell
elif grep -q 'Gold \(6148\|6126\)' /proc/cpuinfo
  then
  export VSC_ARCH_LOCAL=skylake
fi

export LMOD_SYSTEM_NAME="${VSC_INSTITUTE_CLUSTER}-${VSC_ARCH_LOCAL}${VSC_ARCH_SUFFIX:-}"

for i in {2014..2020}; do
  if [ -d /apps/brussel/${VSC_OS_LOCAL}/${VSC_ARCH_LOCAL}${VSC_ARCH_SUFFIX:-}/modules/${i}a/all ]; then
    MODULEPATH=/apps/brussel/${VSC_OS_LOCAL}/${VSC_ARCH_LOCAL}${VSC_ARCH_SUFFIX:-}/modules/${i}a/all:$MODULEPATH
  fi
  if [ -d /apps/brussel/${VSC_OS_LOCAL}/${VSC_ARCH_LOCAL}${VSC_ARCH_SUFFIX:-}/modules/${i}b/all ]; then
    MODULEPATH=/apps/brussel/${VSC_OS_LOCAL}/${VSC_ARCH_LOCAL}${VSC_ARCH_SUFFIX:-}/modules/${i}b/all:$MODULEPATH
  fi
done

#Append commercial modules if user belongs to the group
while read -r gro mod
do
  if [ `id |grep -c $gro` == '1' ]; then
      MODULEPATH=$MODULEPATH:$mod
  fi
done </etc/commercial_modules

export MODULEPATH