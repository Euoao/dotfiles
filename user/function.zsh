# proxy
function proxy() {
  # 使用mirrored
  hostip=127.0.0.1 
  # export hostip=$(cat /etc/resolv.conf | grep -oP '(?<=nameserver\ ).*') #获得网关地址
  proxyPort=7897 #端口
  export https_proxy="http://${hostip}:${proxyPort}";
  export http_proxy="http://${hostip}:${proxyPort}";
  export all_proxy="socks5://${hostip}:${proxyPort}";
  # git config --global http.https://github.com.proxy ${PROXY_HTTP}
  # git config --global https.https://github.com.proxy ${PROXY_HTTP}
  # echo -e "Acquire::http::Proxy \"http://${hostip}:${proxyPort}\";" | sudo tee -a /etc/apt/apt.conf.d/proxy.conf > /dev/null;
  # echo -e "Acquire::https::Proxy \"http://${hostip}:${proxyPort}\";" | sudo tee -a /etc/apt/apt.conf.d/proxy.conf > /dev/null;
  echo "Proxy has been opened."
}
function unproxy() {
  unset https_proxy;
  unset http_proxy;
  unset all_proxy;
  # git config --global --unset http.https://github.com.proxy
  # git config --global --unset https.https://github.com.proxy
  # sudo sed -i -e "/Acquire::http::Proxy/d" /etc/apt/apt.conf.d/proxy.conf;
  # sudo sed -i -e "/Acquire::https::Proxy/d" /etc/apt/apt.conf.d/proxy.conf;
  echo "Proxy has been closed."
}


function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}