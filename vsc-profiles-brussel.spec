Summary: brussel vsc profiles files
Name: vsc-profiles-brussel
Version: 1.0
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
install vsc.sh $RPM_BUILD_ROOT/etc/profile.d/
install vsc.csh $RPM_BUILD_ROOT/etc/profile.d/
install vscautokey.sh $RPM_BUILD_ROOT/etc/profile.d/
install vscautokey.csh $RPM_BUILD_ROOT/etc/profile.d/
install netid.sh $RPM_BUILD_ROOT/etc/profile.d/
install netid.csh $RPM_BUILD_ROOT/etc/profile.d/
install modulepaths.sh $RPM_BUILD_ROOT/etc/profile.d/
install modulepaths.csh $RPM_BUILD_ROOT/etc/profile.d/
install commercial_modules $RPM_BUILD_ROOT/etc/

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
/etc/profile.d/modulepaths.sh
/etc/profile.d/modulepaths.csh
/etc/commercial_modules


%changelog
* Mon Mar 18 2019 Ward Poelmans <ward.poelmans@ugent.be>
- First version (spec file taken from Gent)
