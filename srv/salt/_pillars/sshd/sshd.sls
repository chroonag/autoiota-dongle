# TODO check path on other Systems

sshd:
  {% if grains['os_family'] == 'Debian' %}
  sshd_config_file: '/etc/ssh/sshd_config'
  {% endif %}
  sshd_file_hash: 34043DF1273E490BE0088899371B1C16DAE5B747E92A6D365CB9B9464EF57E64
