function bp-mstnorm-test
pushd $HHOME/dev/bellport/build-debug \
&& figlet mstnorm_test \
&& ./bin/mstnorm_test \
&& figlet mstorm run \
&& ./bin/mstnorm --feeds byx --pcaps ./sfn0p4_byx_20220608-00-Incr-B-0034.pcap.lz4 --bbo-quote --apu | head -10\
&& popd
end
