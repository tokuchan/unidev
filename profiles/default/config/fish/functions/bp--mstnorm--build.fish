function bp--mstnorm--build
pushd $HHOME/dev/bellport/build-debug \
&& make -j6 mstnorm mstnorm_test \
&& popd
end
