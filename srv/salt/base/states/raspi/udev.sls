/etc/udev/rules.d/99-usb.rules:
  file.managed:
    - source: salt://raspi/files/usb.rules

udev-service-restarted-after-usb-rules-changed:
  service.running:
    - name: udev
    - watch:
      - file: /etc/udev/rules.d/99-usb.rules
