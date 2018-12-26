# TODO check path on other Systems

sshd:
  {% if grains['os_family'] == 'Debian' %}
  sshd_config_file: '/etc/ssh/sshd_config'
  {% endif %}
