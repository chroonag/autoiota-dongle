iptables-persistent-installed:
  pkg.installed:
    - name: iptables-persistent

iptables-ipv4-rules-config:
  file.managed:
    - name: /etc/iptables/rules.v4
    - source: salt://network/iptable/iptable-ipv4.rules
    - require:
      - pkg: iptables-persistent

# load rules immediately instead of waiting until next reboot
iptables-ipv4-rules-loaded:
  cmd.run:
    - name: "iptables-restore < /etc/iptables/rules.v4"
    - onchanges:
      - file: iptables-ipv4-rules-config
