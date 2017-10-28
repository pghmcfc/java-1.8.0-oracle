java-1.8.0-oracle
=================

This is based on the SRPM by Paul Howarth found here:

http://www.city-fan.org/ftp/contrib/java/

Building
--------

This uses the NoSource approach, and so when building in mock a
recipe such as the following is needed:

```bash
mock -r fedora-26-x86_64 init
mock -r fedora-26-x86_64 --copyin jdk-8u152-linux-x64.tar.gz /builddir/build/SOURCES
mock --dnf -r fedora-26-x86_64 --no-clean --rebuild java-1.8.0-oracle-1.8.0.152-1.fc26.nosrc.rpm
```

This assumes rpm has been configured as below:

```
# ~/.rpmrc
include:        /usr/lib/rpm/rpmrc
macrofiles: /usr/lib/rpm/macros:/usr/lib/rpm/%{_target}/macros:/etc/rpm/macros.specspo:/etc/rpm/macros:/etc/rpm/%{_target}/macros:~/.rpmmacros
```

```
# ~/.rpmmacros
%_topdir        %(echo $HOME)/Fedora
%_sourcedir     %{_topdir}/%{name}
%_specdir       %{_topdir}/%{name}
%_tmppath       %{_topdir}/tmp
%_builddir      %{_topdir}/BUILD
%_buildroot     %{_topdir}/%{_tmppath}/%{name}-%{version}-root
%_rpmdir        %{_topdir}/%{name}
%_srcrpmdir     %{_topdir}/%{name}
%_rpmfilename   %%{NAME}-%%{VERSION}-%%{RELEASE}.%%{ARCH}.rpm
%packager       %(echo ${USER}@)%(hostname)
%distribution   Fedora
```
