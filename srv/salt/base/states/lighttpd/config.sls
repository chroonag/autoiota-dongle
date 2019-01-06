lighttpd_deploy_config_file:
  file.managed:
  - name: {{ pillar['lighttpd']['config_file'] }}
  - source: salt://lighttpd/files/lighttpd.conf.jinja
  - user: root
  - group: root
  - mode: 644
  - force: True
  - template: jinja

lighttpd:
  service.running:
    - enable: True
    - watch:
      - file: lighttpd_deploy_config_file
