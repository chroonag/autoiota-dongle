dhcpcd-static-ip-config:
  file.managed:
    - name: /etc/dhcpcd.conf
    - source: salt://network/files/dhcp/dhcpcd.conf

dhcpcd-service-running:
  service.running:
    - name: dhcpcd
    - watch:
      - file: /etc/dhcpcd.conf

dhcpcd-fast-boot-enabled:
  file.absent:
    - name: /etc/systemd/system/dhcpcd.service.d/wait.conf
