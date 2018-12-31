# runs on system boot

{% set local_users = salt['user.list_users']() %}

{% for username in local_users %}
disable_local_login_{{username}}:
  user.present:
    - name: {{username}}
    - createhome: False
    - password: '*' # disable local login (/etc/shadow)
{% endfor %}
