function pdf--encrypt --description 'AES256-encrypt the specified PDF with a key generated from its hash.'
argparse -n'pdf--encrypt' 'k/key=' 'i/input=' 'o/output=' 'h/help' -- $argv
or return
if test -n "$_flag_help"
echo 'Usage: pdf--encrypt [options]
-k, --key    Specify a key to encrypt with. [Default: use the sha256 sum of the file.]
-i, --input  Specify the file to encrypt.
-o, --output Specify the encrypted file path. [Default: encrypted--<input>]
'
return
end

if test -n "$_flag_input"
set input "$_flag_input"
else
echo 'Must specify --input.'
return
end

if test -n "$_flag_output"
set output "$_flag_output"
else
set output (dirname $input)"/encrypted--"(basename $input)
end

if test -n "$_flag_key"
set key "$_flag_key"
else
set key (pdf--gen-key "$input")
end

echo "Key: ...... $key"
echo "Input: .... $input"
echo "Output: ... $output"
rm "$output"
pdf--encrypt-file -k "$key" -i "$input" -o "$output"
end
