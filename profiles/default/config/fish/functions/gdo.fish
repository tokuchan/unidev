function gdo --description 'Run the specified command at the root of the project.'
pushd (git rev-parse --show-toplevel)
$argv
popd
end
