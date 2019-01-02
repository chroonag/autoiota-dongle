iptables-persistent-installed:
  pkg.installed:
    - name: iptables-persistent

iptables-ipv4-rules-config:
  file.managed:
    - name: /etc/iptables/rules.v4
    - source: salt://network/files/iptable-ipv4-dev.rules
    - require:
      - pkg: iptables-persistent

ipv6-rules-deleted:
  file.absent:
    - name: /etc/iptables/rules.v6  # Must be deleted to prevent boot error when ipv6 is diabled

# load rules immediately instead of waiting until next reboot
iptables-ipv4-rules-loaded:
  cmd.run:
    - name: "iptables-restore < /etc/iptables/rules.v4"
    - onchanges:
      - file: iptables-ipv4-rules-config
