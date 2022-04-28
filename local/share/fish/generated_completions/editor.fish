# editor
# Autogenerated from man page /usr/share/man/man1/editor.1.gz
complete -c editor -s t -d 'Finds tag in the tags file, the associated file becomes the current file and …'
complete -c editor -s q -d 'QuickFix mode.  Display the first error in errorfile'
complete -c editor -s e -d 'Ex mode, reading stdin as Ex commands.  ":help Ex-mode"'
complete -c editor -s E -d 'Ex mode, reading stdin as text.  :help Ex-mode'
complete -c editor -o es -d 'Silent (non-interactive) Ex mode, reading stdin as Ex commands'
complete -c editor -o '\\&Es' -d 'Silent (non-interactive) Ex mode, reading stdin as text'
complete -c editor -s d -d 'Diff mode'
complete -c editor -s R -d 'Read-only mode.  Sets the \'readonly\' option.  Implies n'
complete -c editor -s m -d 'Resets the \'write\' option, to disable file modifications'
complete -c editor -s M -d 'Resets the \'write\' and \'modifiable\' options, to disable file and buffer modif…'
complete -c editor -s b -d 'Binary mode.  ":help edit-binary"'
complete -c editor -s l -d 'Lisp mode.  Sets the \'lisp\' and \'showmatch\' options'
complete -c editor -s A -d 'Arabic mode.  Sets the \'arabic\' option'
complete -c editor -s H -d 'Hebrew mode.  Sets the \'hkmap\' and \'rightleft\' options'
complete -c editor -s V -d 'Verbose mode.  Prints debug messages'
complete -c editor -s D -d 'Debug mode for VimL (Vim script)'
complete -c editor -s n -d 'Disable the use of swap files.  Sets the \'updatecount\' option to 0'
complete -c editor -s r -d 'Recovery mode'
complete -c editor -s L -d 'Alias for r'
complete -c editor -s u -d 'Use vimrc instead of the default ~/. config/nvim/init. vim'
complete -c editor -s i -d 'Use shada instead of the default ~/. local/share/nvim/shada/main. shada'
complete -c editor -l noplugin -d 'Skip loading plugins.  Implied by -u NONE'
complete -c editor -l clean -d 'Mimic a fresh install of Nvim'
complete -c editor -s o -d 'Open N windows stacked horizontally'
complete -c editor -s O -d 'Like o, but tile windows vertically'
complete -c editor -s p -d 'Like o, but for tab pages'
complete -c editor -l cmd -d 'Like c, but execute command before processing any vimrc'
complete -c editor -s S -d 'Source session after the first file argument has been read'
complete -c editor -s s -d 'Read normal mode commands from scriptin'
complete -c editor -s w -d 'Append all typed characters to scriptout'
complete -c editor -s W -d 'Like w, but truncate scriptout'
complete -c editor -l startuptime -d 'During startup, append timing messages to file'
complete -c editor -l api-info -d 'Dump API metadata serialized to msgpack and exit'
complete -c editor -l embed -d 'Use standard input and standard output as a msgpack-rpc channel'
complete -c editor -l headless -d 'Do not start a UI'
complete -c editor -l listen -d 'Start RPC server on this pipe or TCP socket'
complete -c editor -s h -d 'Print usage information and exit'
complete -c editor -s v -d 'Print version information and exit'

