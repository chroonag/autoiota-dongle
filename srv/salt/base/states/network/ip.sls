ip-forward-enabled:
  file.replace:
    - name: /etc/sysctl.conf
    - pattern: "^#?net.ipv4.ip_forward=.*$"
    - repl: net.ipv4.ip_forward=1

# just activate IP forward immediately instead of waiting until next reboot
ip-forward-activated:
  cmd.run:
    - name: "echo 1 > /proc/sys/net/ipv4/ip_forward"
    - onchanges:
      - file: ip-forward-enabled
