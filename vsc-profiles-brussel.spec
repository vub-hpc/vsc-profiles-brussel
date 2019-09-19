Summary: brussel vsc profiles files
Name: vsc-profiles-brussel
Version: 1.7
Release: 1
License: GPL
Group: Applications/System
Source: %{name}-%{version}.tar.gz
BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-buildroot
BuildArch: noarch
%description
Brussel VSC profiles files

%prep
%setup -q

%build

%install
mkdir -p $RPM_BUILD_ROOT/etc/profile.d/
install -m 644 vsc.sh $RPM_BUILD_ROOT/etc/profile.d/
install -m 644 vsc.csh $RPM_BUILD_ROOT/etc/profile.d/
install -m 644 vscautokey.sh $RPM_BUILD_ROOT/etc/profile.d/
install -m 644 vscautokey.csh $RPM_BUILD_ROOT/etc/profile.d/
install -m 644 netid.sh $RPM_BUILD_ROOT/etc/profile.d/
install -m 644 netid.csh $RPM_BUILD_ROOT/etc/profile.d/
install -m 644 modulepaths-sh $RPM_BUILD_ROOT/etc/profile.d/
install -m 644 modulepaths-csh $RPM_BUILD_ROOT/etc/profile.d/
install -m 644 commercial_modules $RPM_BUILD_ROOT/etc/

%clean
rm -rf %{buildroot}

%files
%defattr(-,root,root,-)
/etc/profile.d/vsc.sh
/etc/profile.d/vsc.csh
/etc/profile.d/vscautokey.sh
/etc/profile.d/vscautokey.csh
/etc/profile.d/netid.sh
/etc/profile.d/netid.csh
/etc/profile.d/modulepaths-sh
/etc/profile.d/modulepaths-csh
/etc/commercial_modules


%changelog
* Thu Sep 19 2019 Ward Poelmans <ward.poelmans@vub.be>
- Add /etc/modulefiles/vsc to MODULEPATH if it exists
* Mon Aug 05 2019 Ward Poelmans <ward.poelmans@vub.be>
- Fix MODULEPATH: set it only once
* Thu Jul 04 2019 Ward Poelmans <ward.poelmans@vub.be>
- Drop creating of TMPDIR directories of netid.
* Mon Mar 18 2019 Ward Poelmans <ward.poelmans@ugent.be>
- First version (spec file taken from Gent)
