# ucf
# Autogenerated from man page /usr/share/man/man1/ucf.1.gz
complete -c ucf -s h -l help -d 'Print a short usage message'
complete -c ucf -s n -l no-action -d 'Dry run'
complete -c ucf -s d -l debug -d 'Set the debug level to the (optional) level  n (n defaults to 1)'
complete -c ucf -s p -l purge -d 'Removes all vestiges of the file from the state hashfile'
complete -c ucf -s v -l verbose -d 'Make the script be very verbose about setting internal variables'
complete -c ucf -s P -l package -d 'Don\'t follow dpkg-divert diversions by package foo when updating configuratio…'
complete -c ucf -s s -l src-dir -d 'Set the source directory (historical md5sums are expected to live in files an…'
complete -c ucf -l sum-file -d 'Force the historical md5sums to be read from this file, rather than defaultin…'
complete -c ucf -l three-way -d 'This turns on the option, during installation, for the user to be offered a c…'
complete -c ucf -l debconf-ok -d 'Indicate that it is ok for  ucf to use an already running debconf instance fo…'
complete -c ucf -l debconf-template -d 'Instruct ucf to use the named multiselect debconf template instead of the nor…'
complete -c ucf -l state-dir -d 'Set the state directory to /path/to/dir instead of the default  /var/lib/ucf'
complete -c ucf -s Z -d 'Set SELinux security context of destination file to default type'

