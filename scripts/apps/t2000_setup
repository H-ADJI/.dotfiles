nala install libzbar0
mkdir /opt/T1000
chmod -R 777 /opt/T1000
mkdir -p /opt/T1000/fonts/
chmod -R 777 /opt/T1000/fonts
echo "pcm.!default {" \
  "type plug" \
  "slave {" \
  "pcm 'hw:0,0'" \
  "rate 48000" \
  "}" \
  "}" >/etc/asound.conf
mkdir -p /etc/pulse && echo -e "default-sample-rate = 48000\nalternate-sample-rate = 48000" >/etc/pulse/daemon.conf
