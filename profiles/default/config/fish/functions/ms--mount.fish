function ms--mount --description 'Guess at the host and uid, and mount /'
set host (basename $argv)
sshfs mview@"$host":/ $argv
end
