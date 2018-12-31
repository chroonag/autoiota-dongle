# disable ssh password login and blank passwords

sshd_deploy_config_file:
  file.managed:
  - name: {{ salt['pillar.get']('sshd:sshd_config_file', '/etc/ssh/sshd_config') }}
  - source: salt://network/ssh/base_sshd_config
  - user: root
  - group: root
  - mode: 644
  - force: True
  - source_hash: {{ salt['pillar.get']('sshd:sshd_file_hash', '') }} # TODO Auslagern auf URI (http://...)

sshd_deploy_sshbanner:
  file.managed:
    - name: {{ salt['pillar.get']('sshd:sshd_sshbanner_file', '') }}
    - source: salt://network/sshd/sshbanner
    - user: root
    - group: root
    - mode: 644
    - source_hash: {{ salt['pillar.get']('sshd:sshd_banner_hash', '') }} # TODO Auslagern auf URI (http://...)

ssh:
  service.running:
    - enable: True
    - reload: True
    - watch:
      - file: sshd_deploy_config_file
