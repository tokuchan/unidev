# llvm-cov-14
# Autogenerated from man page /usr/share/man/man1/llvm-cov-14.1.gz
complete -c llvm-cov-14 -o fprofile-arcs -o ftest-coverage -d instrumentation
complete -c llvm-cov-14 -s a -l all-blocks -d 'Display all basic blocks'
complete -c llvm-cov-14 -s b -l branch-probabilities -d 'Display conditional branch probabilities and a summary of branch information'
complete -c llvm-cov-14 -s c -l branch-counts -d 'Display branch counts instead of probabilities (requires -b)'
complete -c llvm-cov-14 -s m -l demangled-names -d 'Demangle function names'
complete -c llvm-cov-14 -s f -l function-summaries -d 'Show a summary of coverage for each function instead of just one summary for …'
complete -c llvm-cov-14 -l help -d 'Display available options (âhelp-hidden for more)'
complete -c llvm-cov-14 -s l -l long-file-names -d 'For coverage output of files included from the main source file, add the main…'
complete -c llvm-cov-14 -s n -l no-output -d 'Do not output any . gcov files.  Summary information is still displayed'
complete -c llvm-cov-14 -s o -l object-directory -l object-file -d 'Find objects in DIR or based on FILEâs path'
complete -c llvm-cov-14 -s p -l preserve-paths -d 'Preserve path components when naming the coverage output files'
complete -c llvm-cov-14 -s r -d 'Only dump files with relative paths or absolute paths with the prefix specifi…'
complete -c llvm-cov-14 -s s -d 'Source prefix to elide'
complete -c llvm-cov-14 -s t -l stdout -d 'Print to stdout instead of producing . gcov files'
complete -c llvm-cov-14 -s u -l unconditional-branches -d 'Include unconditional branches in the output for the âbranch-probabilities …'
complete -c llvm-cov-14 -o version -d 'Display the version of llvm-cov'
complete -c llvm-cov-14 -s x -l hash-filenames -d 'Use md5 hash of file name when naming the coverage output files'
complete -c llvm-cov-14 -o show-branches -d 'Show coverage for branch conditions in terms of either count or percentage'
complete -c llvm-cov-14 -o show-line-counts -d 'Show the execution counts for each line.  Defaults to true, unless another'
complete -c llvm-cov-14 -o show
complete -c llvm-cov-14 -o show-expansions -d 'Expand inclusions, such as preprocessor macros or textual inclusions, inline …'
complete -c llvm-cov-14 -o show-instantiations -d 'For source regions that are instantiated multiple times, such as templates in…'
complete -c llvm-cov-14 -o show-regions -d 'Show the execution counts for each region by displaying a caret that points t…'
complete -c llvm-cov-14 -o show-line-counts-or-regions -d 'Show the execution counts for each line if there is only one region on the li…'
complete -c llvm-cov-14 -o use-color -d 'Enable or disable color output.  By default this is autodetected'
complete -c llvm-cov-14 -o arch -d 'Specify a list of architectures such that the Nth entry in the list correspon…'
complete -c llvm-cov-14 -o name -d 'Show code coverage only for functions with the given name'
complete -c llvm-cov-14 -o name-allowlist -d 'Show code coverage only for functions listed in the given file'
complete -c llvm-cov-14 -o name-whitelist -d 'Show code coverage only for functions listed in the given file'
complete -c llvm-cov-14 -o name-regex -d 'Show code coverage only for functions that match the given regular expression'
complete -c llvm-cov-14 -o ignore-filename-regex -d 'Skip source code files with file paths that match the given regular expression'
complete -c llvm-cov-14 -o format -d 'Use the specified output format'
complete -c llvm-cov-14 -o tab-size -d 'Replace tabs with <TABSIZE> spaces when preparing reports'
complete -c llvm-cov-14 -o output-dir -d 'Specify a directory to write coverage reports into'
complete -c llvm-cov-14 -o Xdemangler -d 'Specify a symbol demangler'
complete -c llvm-cov-14 -o num-threads -s j -d 'Use N threads to write file reports (only applicable when -output-dir is spec…'
complete -c llvm-cov-14 -o compilation-dir -d 'Directory used as a base for relative coverage mapping paths'
complete -c llvm-cov-14 -o fcoverage-compilation-dir -o ffile-compilation-dir
complete -c llvm-cov-14 -o line-coverage-gt -d 'Show code coverage only for functions with line coverage greater than the giv…'
complete -c llvm-cov-14 -o line-coverage-lt -d 'Show code coverage only for functions with line coverage less than the given …'
complete -c llvm-cov-14 -o region-coverage-gt -d 'Show code coverage only for functions with region coverage greater than the g…'
complete -c llvm-cov-14 -o region-coverage-lt -d 'Show code coverage only for functions with region coverage less than the give…'
complete -c llvm-cov-14 -o path-equivalence -d 'Map the paths in the coverage data to local source file paths'
complete -c llvm-cov-14 -o show-region-summary -d 'Show statistics for all regions.  Defaults to true'
complete -c llvm-cov-14 -o show-branch-summary -d 'Show statistics for all branch conditions.  Defaults to true'
complete -c llvm-cov-14 -o show-functions -d 'Show coverage summaries for each function.  Defaults to false'
complete -c llvm-cov-14 -o show-instantiation-summary -d 'Show statistics for all function instantiations.  Defaults to false'
complete -c llvm-cov-14 -o summary-only -d 'Export only summary information for each file in the coverage data'
complete -c llvm-cov-14 -o skip-expansions -d 'Skip exporting macro expansion coverage data'
complete -c llvm-cov-14 -o skip-functions -d 'Skip exporting per-function coverage data'

