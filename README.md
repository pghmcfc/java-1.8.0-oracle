java-1.8.0-oracle
=================

RPM packaging for Oracle Java SE 8 that's compatible with the way Java is
packaged in Fedora and Red Hat Enterprise Linux.

Issues/enhancements for this package can be raised here:

https://github.com/pghmcfc/java-1.8.0-oracle

or here:

http://trac.city-fan.org/cfo-trac/browser/java-1.8.0-oracle/trunk

Downloading Sources
-------------------

Get the JDK as follows:

- Go to http://www.oracle.com/technetwork/java/javase/downloads/index.html
- Click on the JDK Download button for Java SE 8u261
- You need to accept the Oracle Technology Network License Agreement for Oracle
  Java SE before continuing
- Download the Linux x86 - Compressed Binary (jdk-8u261-linux-i586.tar.gz),
  or on x86_64, the Linux x64 - Compressed Binary (jdk-8u261-linux-x64.tar.gz)
  You may need to create/sign in to an Oracle account at this point

Get the timezone updater as follows:

- Go to http://www.oracle.com/technetwork/java/javase/downloads/index.html
- Click on the Download button for Java Timezone Updater Tool
- Check the box agreeing to the Java SE Timezone Updater License Agreement
- Download the Java SE Timezone Updater 2.3.1 (tzupdater-2.3.1.zip)

Building on Target Host
-----------------------

Just use the provided `build-*` scripts to build either the i586, x86_64, or
both versions.

Building Using Mock
-------------------

This uses the NoSource approach, and so when building in mock a
recipe such as the following is needed:

```bash
mock -r fedora-32-x86_64 init
mock -r fedora-32-x86_64 --copyin jdk-8u261-linux-x64.tar.gz /builddir/build/SOURCES
mock --dnf -r fedora-32-x86_64 --no-clean --rebuild java-1.8.0-oracle-1.8.0.261-1.fc32.nosrc.rpm
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
