lighttpd:
  cert_directory: /etc/lighttpd/cert
  pki_directory: /etc/lighttpd/ssl
  cert_file: ca.crt
  pki_file: ca.key
  pem_file: ca.pem
  document_root: /var/www/html
  {% if grains['os_family'] == 'Debian' %}
  config_file: /etc/lighttpd/lighttpd.conf
  www_user: www-data
  www_group: www-data
  {% endif %}
