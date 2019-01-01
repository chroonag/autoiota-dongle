# setup hotspot with dnsmasq and hostapd formulas

include:
  - hostapd
  - dnsmasq

/etc/udev/rules.d/90-ap.rules:
  file.managed:
    - source: salt://network/wlan/hotspot/udev.rules
