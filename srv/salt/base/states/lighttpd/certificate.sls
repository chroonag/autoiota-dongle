{% set cert_dir = pillar['lighttpd']['cert_directory'] %}
{% set cert_file = pillar['lighttpd']['cert_file'] %}
{% set pki_dir = pillar['lighttpd']['pki_directory'] %}
{% set pki_file = pillar['lighttpd']['pki_file'] %}
{% set pem_file = pillar['lighttpd']['pem_file'] %}

install-pkg-m2crypto:
  pkg.installed:
    - name: python-m2crypto

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

managed-private-key:
  x509.private_key_managed:
    - name: {{ pki_dir }}/{{ pki_file }}
    - bits: 4096
    - backup: True
    - require:
      - file: create-lighttpd-pki-directory

issue-self-signed-certificate:
  x509.certificate_managed:
    - name: {{ cert_dir }}/{{ cert_file }}
    - signing_private_key: {{ pki_dir }}/{{ pki_file }}
    - CN: local.autoiota.io
    - days_valid: 365
    - days_remaining: 0
    - backup: True
    - require:
      - file: create-lighttpd-cert-directory
      - pkg: install-pkg-m2crypto

create-pem-file-from-pki:
  file.copy:
    - name: {{ pki_dir }}/{{ pem_file }}
    - source: {{ pki_dir }}/{{ pki_file }}
    - force: True
    - user: root
    - group: root
    - mode: 400
    - require:
      - x509: managed-private-key

append-certificate-to-pem-file:
  file.append:
    - name: {{ pki_dir }}/{{ pem_file }}
    - source: {{ cert_dir }}/{{ cert_file }}
    - require:
      - file: create-pem-file-from-pki
