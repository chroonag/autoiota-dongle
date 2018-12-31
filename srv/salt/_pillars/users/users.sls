# service user

users:

  serviceuser:
    home: /home/serviceuser
    shell: /bin/bash
    pwd: *
    uid: 4050
    groups: # new (user)group will be created with username
      {% if grains['os_family'] == 'Debian' %}
      - sudo # enable sudo for this user
      {% endif %}
    ssh_auth:
      - ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAjHZ3/esIJvVzF6gpYkdCBLoGCz3CwrBC6ZaqESMYKsaYY7pvycilyq4odogJbxo0vNRyVXdcoR8fMRtzzm1x4QEGlqKHo7pdIdrdSntI6MqeErV5NxEl4SozFP4+ZuVNkAphywrfFxQL36a6FjRtAMil8YttrJppUez5E4fsrMYrCSqKbEeYhjtMJqTkW4GqYLWHBOcTrhHzRwU2Bep4O11R/hKBZP6ycSlRHrmcWml1vs+8scM5LcFvifQ75ORA1UiOe6bWPXbR892jRCIEK9oG4OJEDnqk2weYl/I6ORHTQaVG8lL2nzpDZ6nCe9GijGk4INtlID9yURw4JxhTxw== autoiota serviceuser

sudo:
  sudoers_file: /etc/sudoers
