set-raspi-timezone:
  file.symlink:
    - name: /etc/localtime
    - target: /usr/share/zoneinfo/{{ pillar['timezone'] }}
