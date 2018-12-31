# setup hotspot with dnsmasq and hostapd

include:
  - hostapd
  - dnsmasq

reboot-requested-after-ap-udev-rules-changed:
  module.wait:
    - name: system.reboot

/etc/udev/rules.d/90-ap.rules:
  file.managed:
    - source: salt://network/wlan/hotspot/udev.rules
    - watch_in:
      - module: reboot-requested-after-ap-udev-rules-changed
