wpa-supplicant-configured:
  file.managed:
    - name: /etc/wpa_supplicant/wpa_supplicant.conf
    - source: salt://network/files/wlan/client/wpa_supplicant.conf.jinja
    - template: jinja

wpa-manager-service-configured:
  file.managed:
    - name: /lib/systemd/system/wpa-manager.service
    - source: salt://network/files/wlan/client/wpa-manager.service

wpa-manager-service-running:
  service.running:
    - name: wpa-manager
    - enable: false # TODO enable with webinterface when login set
    - require:
      - file: /lib/systemd/system/wpa-manager.service
    - watch:
      - file: /lib/systemd/system/wpa-manager.service
      - file: /etc/wpa_supplicant/wpa_supplicant.conf
