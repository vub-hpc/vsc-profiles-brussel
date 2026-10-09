eval `/usr/bin/vsc_env csh`

setenv LMOD_SYSTEM_NAME "${VSC_INSTITUTE_CLUSTER}-${VSC_ARCH_LOCAL}${VSC_ARCH_SUFFIX}"

if ("$VSC_INSTITUTE_CLUSTER" == "sofia") then
    set modroot_subdir = "$VSC_INSTITUTE_CLUSTER"
else
    set modroot_subdir = "$VSC_INSTITUTE_LOCAL"
endif

set modulesroot = "/apps/${modroot_subdir}/${VSC_OS_LOCAL}/${VSC_ARCH_LOCAL}${VSC_ARCH_SUFFIX}/modules"

set CLUSTER_MODULEPATH = "$modulesroot/system/all"

set year = 2022
while ($year <= 2030)
  if ( -d  $modulesroot/${year}a/all ) then
    set CLUSTER_MODULEPATH = "$modulesroot/${year}a/all:${CLUSTER_MODULEPATH}"
  endif
  if ( -d  $modulesroot/${year}b/all ) then
    set CLUSTER_MODULEPATH = "$modulesroot/${year}b/all:${CLUSTER_MODULEPATH}"
  endif
  if ( -d  $modulesroot/${year}.1/all ) then
    set CLUSTER_MODULEPATH = "$modulesroot/${year}.1/all:${CLUSTER_MODULEPATH}"
  endif
  if ( -d  $modulesroot/${year}.2/all ) then
    set CLUSTER_MODULEPATH = "$modulesroot/${year}.2/all:${CLUSTER_MODULEPATH}"
  endif
  if ( -d  $modulesroot/${year}.3/all ) then
    set CLUSTER_MODULEPATH = "$modulesroot/${year}.3/all:${CLUSTER_MODULEPATH}"
  endif
  @ year++
end

if (-d "/etc/modulefiles/vsc") then
    setenv CLUSTER_MODULEPATH "${CLUSTER_MODULEPATH}:/etc/modulefiles/vsc"
endif

setenv MODULEPATH "${CLUSTER_MODULEPATH}"

unset CLUSTER_MODULEPATH

# vim: set ft=csh:
