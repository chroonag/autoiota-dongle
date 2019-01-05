{% set cert_dir = pillar['lighttpd']['cert_directory'] %}
{% set pki_dir = pillar['lighttpd']['pki_directory'] %}
{% set cert_file = pillar['lighttpd']['cert_file'] %}
{% set pki_file = pillar['lighttpd']['pki_file'] %}

create-lighttpd-cert-directory:
  file.directory:
    - name: {{ cert_dir }}
    - user: root
    - group: root
    - makedir: True

create-lighttpd-pki-directory:
  file.directory:
    - name: {{ pki_dir }}
    - user: root
    - group: root
    - makedir: True

issue-self-signed-certificate:
  x509.certificate_managed:
    - name: {{ cert_dir }}/{{ cert_file }}
    - signing_private_key: {{ pki_dir }}/{{ pki_file }}
    - CN: local.autoiota.io
    - days_valid: 3650
    - days_remaining: 0
    - backup: True
    - managed_private_key:
        name: {{ pki_dir }}/{{ pki_file }}
        bits: 4096
        backup: True
    - user: root # arguments for file.managed with kargs
    - group: root
    - mode: 400
    - require:
      - file: create-lighttpd-cert-directory
