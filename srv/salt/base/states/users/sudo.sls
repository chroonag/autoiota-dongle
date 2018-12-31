# enable sudo without password

{% for username, userdata in pillar.get('users', {}).items() %}
users_disable_sudo_password_{{username}}:
  file.append:
    - name: {{ salt['pillar.get']('sudo:sudoers_file', '') }}
    - text:
      {{username}} ALL=(ALL) NOPASSWD:ALL
{% endfor %}
