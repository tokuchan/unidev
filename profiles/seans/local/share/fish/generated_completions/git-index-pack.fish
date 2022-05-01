# git-index-pack
# Autogenerated from man page /usr/share/man/man1/git-index-pack.1.gz
complete -c git-index-pack -s v -d 'Be verbose about what is going on, including progress status'
complete -c git-index-pack -s o -d 'Write the generated pack index into the specified file'
complete -c git-index-pack -l rev-index -d 'When this flag is provided, generate a reverse index (a '
complete -c git-index-pack -l stdin -d 'When this flag is provided, the pack is read from stdin instead and a copy is…'
complete -c git-index-pack -l fix-thin -d 'Fix a "thin" pack produced by git pack-objects --thin (see git-pack-objects(1…'
complete -c git-index-pack -l keep -d 'Before moving the index into its final destination create an empty '
complete -c git-index-pack -l index-version -d 'This is intended to be used by the test suite only'
complete -c git-index-pack -l strict -d 'Die, if the pack contains broken objects or links'
complete -c git-index-pack -l progress-title -d 'For internal use only. sp Set the title of the progress bar'
complete -c git-index-pack -l check-self-contained-and-connected -d 'Die if the pack contains broken links.  For internal use only'
complete -c git-index-pack -l fsck-objects -d 'For internal use only. sp Die if the pack contains broken objects'
complete -c git-index-pack -l threads -d 'Specifies the number of threads to spawn when resolving deltas'
complete -c git-index-pack -l max-input-size -d 'Die, if the pack is larger than <size>'
complete -c git-index-pack -l object-format -d 'Specify the given object format (hash algorithm) for the pack'
complete -c git-index-pack -l verify -d 'is given, ensure that the existing reverse index is correct'

