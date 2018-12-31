# enable sudo without password

{% for username, userdata in pillar.get('users', {}).items() %}
users_disable_sudo_password_{{username}}:
  file.append:
    - text:
      {{username}} ALL=(ALL) NOPASSWD:ALL
{% endfor %}
