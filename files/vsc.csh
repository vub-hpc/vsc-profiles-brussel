eval `/usr/bin/vsc_env csh`

setenv LMOD_SYSTEM_NAME "${VSC_INSTITUTE_CLUSTER}-${VSC_ARCH_LOCAL}${VSC_ARCH_SUFFIX}"

setenv HYDRA_MODULEPATH ""
set i = 2016
while ($i < 2025)
  if ( -d  /apps/brussel/${VSC_OS_LOCAL}/${VSC_ARCH_LOCAL}${VSC_ARCH_SUFFIX}/modules/${i}a/all ) then
    setenv HYDRA_MODULEPATH /apps/brussel/${VSC_OS_LOCAL}/${VSC_ARCH_LOCAL}${VSC_ARCH_SUFFIX}/modules/${i}a/all:${HYDRA_MODULEPATH}
  endif
  if ( -d  /apps/brussel/${VSC_OS_LOCAL}/${VSC_ARCH_LOCAL}${VSC_ARCH_SUFFIX}/modules/${i}b/all ) then
    setenv HYDRA_MODULEPATH /apps/brussel/${VSC_OS_LOCAL}/${VSC_ARCH_LOCAL}${VSC_ARCH_SUFFIX}/modules/${i}b/all:${HYDRA_MODULEPATH}
  endif
  @ i++
end

setenv MODULEPATH ${HYDRA_MODULEPATH}:/etc/modulefiles/vsc
unset HYDRA_MODULEPATH

# vim: set ft=csh:
