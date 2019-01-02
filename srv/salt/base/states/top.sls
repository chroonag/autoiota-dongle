base:
  '*':
    - requirements.pkg-requirements
    - users.addusers
    - users.config-sudo
    - network.hotspot
    - network.dhcp
    - network.ip
    - network.wlanclient

base:
  'dev*':
    - sshd.install
    - sshd.config

base:
  'prod*':
    - network.iptable
    - sshd.absent
