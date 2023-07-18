function vpn--start
sudo openvpn --config ~/.local/share/openvpn/maystreet.ovpn --daemon
while not sudo resolvectl dns tun0 10.98.16.41 10.98.16.42 2> /dev/null
echo -n .
sleep 1
end
end
