eval `/usr/bin/vsc_env csh`

setenv LMOD_SYSTEM_NAME "${VSC_INSTITUTE_CLUSTER}-${VSC_ARCH_LOCAL}${VSC_ARCH_SUFFIX}"

setenv HYDRA_MODULEPATH ""

set modulesroot = "/apps/brussel/${VSC_OS_LOCAL}/${VSC_ARCH_LOCAL}${VSC_ARCH_SUFFIX}/modules"

set i = 2019
if ( -d  $modulesroot/${i}b/all ) then
  setenv HYDRA_MODULEPATH $modulesroot/${i}b/all:${HYDRA_MODULEPATH}
endif

set i = 2020
while ($i < 2025)
  if ( -d  $modulesroot/${i}a/all ) then
    setenv HYDRA_MODULEPATH $modulesroot/${i}a/all:${HYDRA_MODULEPATH}
  endif
  if ( -d  $modulesroot/${i}b/all ) then
    setenv HYDRA_MODULEPATH $modulesroot/${i}b/all:${HYDRA_MODULEPATH}
  endif
  @ i++
end

setenv MODULEPATH ${HYDRA_MODULEPATH}:/etc/modulefiles/vsc

unset HYDRA_MODULEPATH

# vim: set ft=csh:
