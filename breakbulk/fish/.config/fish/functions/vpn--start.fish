function vpn--start
  echo "Is OpenVPN currently running?"
  pgrep -fa openvpn

  echo "Starting OpenVPN in daemon mode"
  sudo openvpn --config ~/.local/share/openvpn/maystreet.ovpn --daemon
  pgrep -fa openvpn

  echo "Setting up DNS resolution"
  while not sudo resolvectl dns tun0 10.98.16.41 10.98.16.42 2> /dev/null
    echo -n .
    sleep 10
  end
end
