lighttpd_deploy_config_file:
  file.managed:
  - name: {{ salt['pillar.get']('lighttpd:lighttpd_config_file', '/etc/lighttpd/lighttpd.conf') }}
  - source: salt://lighttpd/files/lighttpd.conf
  - user: root
  - group: root
  - mode: 644
  - force: True

lighttpd:
  service.running:
    - enable: True
    - reload: True
    - watch:
      - file: lighttpd_deploy_config_file
