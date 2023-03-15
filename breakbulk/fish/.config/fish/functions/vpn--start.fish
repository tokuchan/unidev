function vpn--start
  sudo openvpn --config ~/.local/share/openvpn/maystreet.ovpn --daemon
end
