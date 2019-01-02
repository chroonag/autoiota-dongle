base:
  '*':
    - requirements.pkg-requirements
    - users.addusers
    - users.config-sudo
    - network.hotspot
    - network.dhcp
    - network.ip
    - network.wlanclient
    - sshd.install
    - sshd.config
