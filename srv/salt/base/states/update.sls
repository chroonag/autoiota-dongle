update-installed-packages:
  pkg.uptodate:
    - refresh: true

# Update raspi firmware
raspi-update:
  cmd.run:
    - name: rpi-update
    - env:
      - SKIP_WARNING: '1'
    - require:
      - pkg: update-installed-packages
