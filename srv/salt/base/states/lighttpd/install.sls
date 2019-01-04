install.lighttpd:
  pkg.installed:
    - name: lighttpd

www_data_group:
  group.present:
    - name: www-data
    - system: True

www_data_user:
  user.present:
    - name: www-data
    - createhome: False
    - groups:
      - www-data

create.www.root.folder:
  file.directory:
    - name: /var/www/html
    - user: www-data
    - group: www-data
    - dir_mode: 750
    - file_mode: 750
    - makedir: True
    - recurse: # sets the above parameters to all subfolders and files if they already exists
      - user
      - group
      - mode
