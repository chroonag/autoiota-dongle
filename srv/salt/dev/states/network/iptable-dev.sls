dev-iptables-persistent-installed:
  pkg.installed:
    - name: iptables-persistent

dev-iptables-ipv4-rules-config:
  file.managed:
    - name: /etc/iptables/rules.v4
    - source: salt://network/files/iptable-ipv4-dev.rules
    - require:
      - pkg: iptables-persistent

dev-ipv6-rules-deleted:
  file.absent:
    - name: /etc/iptables/rules.v6  # Must be deleted to prevent boot error when ipv6 is diabled

# load rules immediately instead of waiting until next reboot
dev-iptables-ipv4-rules-loaded:
  cmd.run:
    - name: "iptables-restore < /etc/iptables/rules.v4"
    - onchanges:
      - file: dev-iptables-ipv4-rules-config
