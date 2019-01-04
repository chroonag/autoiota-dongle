install.lighttpd:
  pkg.installed:
    - name: lighttpd

www-data:
  group.present:
    - system: True

www-data:
  user.present:
    - createhome: False
    - groups:
      - www-data

create.www.root.folder:
  file.directory:
    - name: /var/www/html
    - user: lighttpd
    - group: lighttpd
    - dir_mode: 440
    - file_mode: 440
    - makedir: True
    - recurse: # sets the above parameters to all subfolders and files if they already exists
      - user
      - group
      - mode
