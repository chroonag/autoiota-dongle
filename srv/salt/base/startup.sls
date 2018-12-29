# run stuff on system boot

disable_root_login:
  user.present:
    - name: root
    - password: * # disable login (/etc/shadow)
