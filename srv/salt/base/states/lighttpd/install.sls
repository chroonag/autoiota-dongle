install-lighttpd-pkg:
  pkg.installed:
    - name: lighttpd

www-data-group:
  group.present:
    - name: {{ pillar['lighttpd']['www_group'] }}
    - system: True

www-data-user:
  user.present:
    - name: {{ pillar['lighttpd']['www_user'] }}
    - createhome: False
    - groups:
      - {{ pillar['lighttpd']['www_group'] }}

create-www-root-folder:
  file.directory:
    - name: {{ pillar['lighttpd']['document_root'] }}
    - user: {{ pillar['lighttpd']['www_user'] }}
    - group: {{ pillar['lighttpd']['www_group'] }}
    - dir_mode: 540
    - file_mode: 540
    - makedir: True
    - recurse: # sets the above parameters to all subfolders and files if they already exists
      - user
      - group
      - mode
    - require:
      - group: www-data-group
      - user: www-data-user

create-lighttpd-log-folder:
  file.directory:
    - name: {{ pillar['lighttpd']['log_directory'] }}
    - user: {{ pillar['lighttpd']['www_user'] }}
    - group: {{ pillar['lighttpd']['www_group'] }}
    - dir_mode: 750
    - file_mode: 750
    - makedir: True

create-lighttpd-pid-folder:
  file.directory:
    - name: {{ pillar['lighttpd']['pid_directory'] }}
    - user: {{ pillar['lighttpd']['www_user'] }}
    - group: {{ pillar['lighttpd']['www_group'] }}
    - dir_mode: 750
    - file_mode: 750
    - makedir: True

rename-default-lighttpd-index:
  file.rename:
    - name: {{ pillar['lighttpd']['document_root'] }}/index.html
    - source: {{ pillar['lighttpd']['document_root'] }}/index.lighttpd.html
    - require:
      - pkg: install-lighttpd-pkg
