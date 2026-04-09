eval `/usr/bin/vsc_env csh`

setenv LMOD_SYSTEM_NAME "${VSC_INSTITUTE_CLUSTER}-${VSC_ARCH_LOCAL}${VSC_ARCH_SUFFIX}"

if ("$VSC_INSTITUTE_CLUSTER" == "sofia") then
    set modroot_subdir = "$VSC_INSTITUTE_CLUSTER"
else
    set modroot_subdir = "$VSC_INSTITUTE_LOCAL"
endif

set modulesroot = "/apps/${modroot_subdir}/${VSC_OS_LOCAL}/${VSC_ARCH_LOCAL}${VSC_ARCH_SUFFIX}/modules"

set CLUSTER_MODULEPATH = "$modulesroot/system/all"

set i = 2022
while ($i <= 2027)
  if ( -d  $modulesroot/${i}a/all ) then
    set CLUSTER_MODULEPATH = "$modulesroot/${i}a/all:${CLUSTER_MODULEPATH}"
  endif
  if ( -d  $modulesroot/${i}b/all ) then
    set CLUSTER_MODULEPATH = "$modulesroot/${i}b/all:${CLUSTER_MODULEPATH}"
  endif
  @ i++
end

if (-d "/etc/modulefiles/vsc") then
    setenv CLUSTER_MODULEPATH "${CLUSTER_MODULEPATH}:/etc/modulefiles/vsc"
endif

setenv MODULEPATH "${CLUSTER_MODULEPATH}"

unset CLUSTER_MODULEPATH

# vim: set ft=csh:
