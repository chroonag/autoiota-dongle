base:
  '*':
    - requirements.pkg-requirements
    - users.addusers
    - users.config-sudo
    - network.hotspot
    - network.dhcp
    - network.ip
    - network.wlanclient
  'dev*':
    - sshd.install
    - sshd.config
  'prod*':
    - network.iptable
    - sshd.absent
