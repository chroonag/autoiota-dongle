base:
  '*':
    - requirements.pkg-requirements
    - users.addusers
    - users.config-sudo
    - network.hotspot
    - network.dhcp
    - network.ip
    - network.wlanclient
    - lighttpd.install
    - lighttpd.certificate
    - lighttpd.config

  'prod*':
    - network.iptable
    - sshd.absent

  'os:Raspbian':
      - match: grain
      - raspi.optimize
      - raspi.bootconfig
      - raspi.udev
      - raspi.defaults
