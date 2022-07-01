function bp--with-context
pushd $HHOME/dev/bellport/build-debug \
&& $argv \
&& popd
end
