# proxy
proxy() {
  # 使用mirrored
  export hostip=127.0.0.1 
  # export hostip=$(cat /etc/resolv.conf | grep -oP '(?<=nameserver\ ).*') #获得网关地址
  export proxyPort=7897 #端口
  export https_proxy="http://${hostip}:${proxyPort}";
  export http_proxy="http://${hostip}:${proxyPort}";
  export all_proxy="socks5://${hostip}:${proxyPort}";
  # git config --global http.https://github.com.proxy ${PROXY_HTTP}
  # git config --global https.https://github.com.proxy ${PROXY_HTTP}
  # echo -e "Acquire::http::Proxy \"http://${hostip}:${proxyPort}\";" | sudo tee -a /etc/apt/apt.conf.d/proxy.conf > /dev/null;
  # echo -e "Acquire::https::Proxy \"http://${hostip}:${proxyPort}\";" | sudo tee -a /etc/apt/apt.conf.d/proxy.conf > /dev/null;
  echo "Proxy has been opened."
}
unproxy() {
  unset hostip;
  unset https_proxy;
  unset http_proxy;
  unset all_proxy;
  # git config --global --unset http.https://github.com.proxy
  # git config --global --unset https.https://github.com.proxy
  # sudo sed -i -e "/Acquire::http::Proxy/d" /etc/apt/apt.conf.d/proxy.conf;
  # sudo sed -i -e "/Acquire::https::Proxy/d" /etc/apt/apt.conf.d/proxy.conf;
  echo "Proxy has been closed."
}