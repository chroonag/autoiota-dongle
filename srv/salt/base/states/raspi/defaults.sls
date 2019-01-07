set-raspi-default-timezone:
  file.symlink:
    - name: /etc/localtime
    - target: /usr/share/zoneinfo/{{ pillar['dongle']['default_timezone'] }}

set-raspi-default-wificountry:
  file.replace:
    - name: /etc/default/crda
    - pattern: "^REGDOMAIN=$"
    - repl: "REGDOMAIN={{ pillar['dongle']['default_wificountry'] }}"
    - append_if_not_found: true
