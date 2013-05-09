parent nodes: [ObjC](ObjC.html)\
\

Remove macports {.heading-level2}
---------------

[http://guide.macports.org/chunked/installing.macports.uninstalling.html](http://guide.macports.org/chunked/installing.macports.uninstalling.html)\
 \
 Uninstalling MacPorts can be a drastic step, and depending on the issue
you are experiencing, you may not need to do so. If you are unsure, ask
on the macports-users mailing list first.\
 \
 If you need to uninstall MacPorts, and your port command is
functioning, first uninstall all the installed ports by running this
command in the Terminal:\
 \
 %% sudo port -fp uninstall installed\
 All that will be left in your installation prefix now will be files
that were not registered to any port. This includes configuration files,
databases, any files which MacPorts renamed in order to allow a forced
installation or upgrade, and the base MacPorts software itself. You may
wish to save your configuration files (most are in \${prefix}/etc),
databases, or any other unique data by moving it aside.\
 \
 To remove all remaining traces of MacPorts, run the following command
in the Terminal. If you have changed prefix, applications\_dir or
frameworks\_dir from their default values, then replace /opt/local with
your prefix, replace /Applications/MacPorts with your applications\_dir,
and/or add your frameworks\_dir to the list, respectively.\
 \
 %% sudo rm -rf

If you use a shell other than bash (perhaps tcsh), you may need to
adjust the above to fit your shell's syntax. Also note that depending on
which version of MacPorts you have and which ports you have installed,
not all of the above paths will exist on your system. This is OK.
