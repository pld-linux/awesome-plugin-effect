%define shortname	effect
Summary:	With the Effect "class", you can "tween" properties of objects or functions with different transitions
Summary(hu.UTF-8):	Az effect modullal létre tudsz hozni különféle átmeneteket
Name:		awesome-plugin-%{shortname}
Version:	20100706
Release:	0.1
License:	MIT
Group:		X11/Window Managers/Tools
Source0:	%{shortname}.lua
Source1:	README
Source2:	example-tweening-opacity.lua
Source3:	example-using.lua
URL:		http://awesome.naquadah.org/wiki/Effects
Requires:	awesome >= 3.4
BuildArch:	noarch
BuildRoot:	%{tmpdir}/%{name}-%{version}-root-%(id -u -n)

%description
With the Effect "class", you can "tween" properties of objects or
functions with different transitions.


%description -l hu.UTF-8
Az effect modullal létre tudsz hozni különféle átmeneteket.

%prep

%install
rm -rf $RPM_BUILD_ROOT
install -d $RPM_BUILD_ROOT%{_datadir}/awesome/lib
install %{SOURCE0} $RPM_BUILD_ROOT%{_datadir}/awesome/lib

install  -d $RPM_BUILD_ROOT%{_docdir}/%{name}-%{version}
install %{SOURCE1} %{SOURCE2} %{SOURCE3} $RPM_BUILD_ROOT%{_docdir}/%{name}-%{version}

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(644,root,root,755)
%{_datadir}/awesome/lib/%{shortname}.lua
%doc %{_docdir}/%{name}-%{version}
