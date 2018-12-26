# disable ssh password login and blank passwords

sshd_no_password_login:
  file.replace:
    - name: {{ salt['pillar.get']('sshd:sshd_config_file', '/etc/ssh/sshd_config') }}
    - pattern: '#?PasswordAuthentication\s(yes|no).*(\n|\r)'
    - repl: 'PasswordAuthentication no'

sshd_no_blank_password:
  file.replace:
    - name: {{ salt['pillar.get']('sshd:sshd_config_file', '/etc/ssh/sshd_config') }}
    - pattern: '#?PermitEmptyPasswords\s(yes|no).*(\n|\r)'
    - repl: 'PermitEmptyPasswords no'

sshd_no_root_access:
  file.replace:
    - name: {{ salt['pillar.get']('sshd:sshd_config_file', '/etc/ssh/sshd_config') }}
    - pattern: '#?PermitRootLogin\s.*(\n|\r)'
    - repl: 'PermitRootLogin no'

sshd:
  service.running:
    - reload: True
    - watch:
      - file: sshd_no_password_login
      - file: sshd_no_blank_password
      - file: sshd_no_root_access
