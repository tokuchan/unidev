# openssl-fipsinstall
# Autogenerated from man page /usr/share/man/man1/openssl-fipsinstall.1ssl.gz
complete -c openssl-fipsinstall -o help -d 'Print a usage message'
complete -c openssl-fipsinstall -o module -d 'Filename of the \\s-1FIPS\\s0 module to perform an integrity check on'
complete -c openssl-fipsinstall -o out -d 'Filename to output the configuration data to; the default is standard output'
complete -c openssl-fipsinstall -o in -d 'Input filename to load configuration data from'
complete -c openssl-fipsinstall -o verify -d 'Verify that the input configuration file contains the correct information'
complete -c openssl-fipsinstall -o provider_name -d 'Name of the provider inside the configuration file'
complete -c openssl-fipsinstall -o section_name -d 'Name of the section inside the configuration file'
complete -c openssl-fipsinstall -o mac_name -d 'Specifies the name of a supported \\s-1MAC\\s0 algorithm which will be used'
complete -c openssl-fipsinstall -o macopt -d 'Passes options to the \\s-1MAC\\s0 algorithm'
complete -c openssl-fipsinstall -o noout -d 'Disable logging of the self tests'
complete -c openssl-fipsinstall -o no_conditional_errors -d 'Configure the module to not enter an error state if a conditional self test f…'
complete -c openssl-fipsinstall -o no_security_checks -d 'Configure the module to not perform run-time security checks as described abo…'
complete -c openssl-fipsinstall -o self_test_onload -d 'Do not write the two fields related to the \\*(L"test status indicator\\*(R" an…'
complete -c openssl-fipsinstall -o quiet -d 'Do not output pass/fail messages.  Implies -noout'
complete -c openssl-fipsinstall -o corrupt_desc -o corrupt_type -d 'The corrupt options can be used to test failure of one or more self tests by …'

