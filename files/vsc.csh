eval `/usr/bin/vsc_env csh`

setenv LMOD_SYSTEM_NAME "${VSC_INSTITUTE_CLUSTER}-${VSC_ARCH_LOCAL}${VSC_ARCH_SUFFIX}"

setenv CLUSTER_MODULEPATH "/etc/modulefiles/vsc"

set modulesroot = "/apps/brussel/${VSC_OS_LOCAL}/${VSC_ARCH_LOCAL}${VSC_ARCH_SUFFIX}/modules"

set i = 2019
if ( -d  $modulesroot/${i}b/all ) then
  setenv CLUSTER_MODULEPATH "$modulesroot/${i}b/all:${CLUSTER_MODULEPATH}"
endif

set i = 2020
while ($i < 2025)
  if ( -d  $modulesroot/${i}a/all ) then
    setenv CLUSTER_MODULEPATH "$modulesroot/${i}a/all:${CLUSTER_MODULEPATH}"
  endif
  if ( -d  $modulesroot/${i}b/all ) then
    setenv CLUSTER_MODULEPATH "$modulesroot/${i}b/all:${CLUSTER_MODULEPATH}"
  endif
  @ i++
end

setenv MODULEPATH "${CLUSTER_MODULEPATH}"

unset CLUSTER_MODULEPATH

# vim: set ft=csh:
