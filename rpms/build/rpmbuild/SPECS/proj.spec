%define _topdir   /tmp/rpmbuild
%define name      proj493
%define release   33
%define version   4.9.3

BuildRoot: %{buildroot}
Summary:   Proj4
License:   MIT
Name:      %{name}
Version:   %{version}
Release:   %{release}
Source:    proj-%{version}.tar.gz
Prefix:    /usr/local
Group:     Geography

%description
Proj 4.9.3

%prep
%setup -q -n proj-4.9.3

%build
./configure --prefix=/usr/local
make -j 33

%install
make DESTDIR=%{buildroot} install

%package lib
Group: Geography
Summary: Proj 4.9.3 libraries
%description lib
The libraries

%files
%defattr(-,root,root)
/usr/local/*

%files lib
%defattr(-,root,root)
/usr/local/lib/*