# disable ssh password login and blank passwords

sshd_deploy_config_file:
  file.managed:
  - name: {{ salt['pillar.get']('sshd:sshd_config_file', '/etc/ssh/sshd_config') }}
  - source: salt://sshd/base_sshd_config
  - user: root
  - group: root
  - mode: 644
  - force: True
  - source_hash: {{ salt['pillar.get']('sshd:sshd_file_hash', '') }} # TODO Auslagern auf URI (http://...)

ssh:
  service.reload:
    - watch:
      - file: sshd_deploy_config_file
