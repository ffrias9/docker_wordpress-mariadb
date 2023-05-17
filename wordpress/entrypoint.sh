nohup /opt/node_exporter/node_exporter > /dev/null 2>&1 &
apache2ctl -D FOREGROUND -k start
