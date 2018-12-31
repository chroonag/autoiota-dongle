# run stuff on system boot

{% set users = salt['user.list_users'] %}

disable_root_login:
  user.present:
    - name: root
    - password: * # disable login (/etc/shadow)
