function bp--mstnorm--build-test
    banner--banner Build mstnorm \
        && bp--mstnorm--build \
        && banner--banner Test mstnorm \
        && bp--mstnorm--test $argv
end
