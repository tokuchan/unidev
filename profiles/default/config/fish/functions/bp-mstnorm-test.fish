function bp-mstnorm-test
pushd $HHOME/dev/bellport/build-debug \
&& ./bin/mstnorm_test \
&& rm -f ~/.bellport/stats/* \
&& ./bin/mstnorm --feeds byx --pcaps ./sfn0p4_byx_20220608-00-Incr-B-0034.pcap.lz4 --message-stats > /dev/null \
&& ./bin/bpstat -f ~/.bellport/stats/(ls -lsa ~/.bellport/stats/ | grep -v total | sort -r | head -1 | awk '{print $10}') \
&& popd
end
