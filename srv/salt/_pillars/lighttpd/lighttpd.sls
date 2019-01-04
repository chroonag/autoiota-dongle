lighttpd:
  {% if grains['os_family'] == 'Debian' %}
  lighttpd_config_file: '/etc/lighttpd/lighttpd.conf'
  {% endif %}
