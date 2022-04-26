# llvm-exegesis-14
# Autogenerated from man page /usr/share/man/man1/llvm-exegesis-14.1.gz
complete -c llvm-exegesis-14 -o help -d 'Print a summary of command line options'
complete -c llvm-exegesis-14 -o opcode-index -d 'Specify the opcode to measure, by index'
complete -c llvm-exegesis-14 -o opcode-name -d 'Specify the opcode to measure, by name'
complete -c llvm-exegesis-14 -o snippets-file -d 'Specify the custom code snippet to measure.  See example 2 for details'
complete -c llvm-exegesis-14 -o mode -d 'Specify the run mode'
complete -c llvm-exegesis-14 -o x86-lbr-sample-period -d 'Specify the LBR sampling period - how many branches before we take a sample'
complete -c llvm-exegesis-14 -o repetition-mode -d 'Specify the repetition mode'
complete -c llvm-exegesis-14 -o num-repetitions -d 'Specify the target number of executed instructions'
complete -c llvm-exegesis-14 -o loop-body-size -d 'Only effective for -repetition-mode=[loop|min]'
complete -c llvm-exegesis-14 -o max-configs-per-opcode -d 'Specify the maximum configurations that can be generated for each opcode'
complete -c llvm-exegesis-14 -o benchmarks-file -d 'File to read (analysis mode) or write (latency/uops/inverse_throughput modes)…'
complete -c llvm-exegesis-14 -o analysis-clusters-output-file -d 'If provided, write the analysis clusters as CSV to this file'
complete -c llvm-exegesis-14 -o analysis-inconsistencies-output-file -d 'If non-empty, write inconsistencies found during analysis to this file'
complete -c llvm-exegesis-14 -o analysis-clustering -d 'Specify the clustering algorithm to use.  By default DBSCAN will be used'
complete -c llvm-exegesis-14 -o analysis-numpoints -d 'Specify the numPoints parameters to be used for DBSCAN clustering (analysis m…'
complete -c llvm-exegesis-14 -o analysis-clustering-epsilon -d 'Specify the epsilon parameter used for clustering of benchmark points (analys…'
complete -c llvm-exegesis-14 -o analysis-inconsistency-epsilon -d 'Specify the epsilon parameter used for detection of when the cluster is diffe…'
complete -c llvm-exegesis-14 -o analysis-display-unstable-clusters -d 'If there is more than one benchmark for an opcode, said benchmarks may end up…'
complete -c llvm-exegesis-14 -o ignore-invalid-sched-class -d 'If set, ignore instructions that do not have a sched class (class idx = 0)'
complete -c llvm-exegesis-14 -o mcpu -d 'If set, measure the cpu characteristics using the counters for this CPU'
complete -c llvm-exegesis-14 -l dump-object-to-disk -d 'By default, llvm-exegesis will dump the generated code to a temporary file to…'
complete -c llvm-exegesis-14 -l - -d 'key:   opcode_name:     ADD64rr   mode:            latency   config:         …'

