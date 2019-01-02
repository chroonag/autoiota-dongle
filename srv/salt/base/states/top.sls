base:
  '*':
    - requirements.pkg-requirements
    - users.addusers
    - users.config-sudo
    - network.hotspot
    - network.dhcp
    - network.ip
    - network.wlanclient

  'os:Raspbian':
      - match: grain
      - raspi.optimize
      - raspi.bootconfig
      - raspi.udev

  'prod*':
    - network.iptable
    - sshd.absent
