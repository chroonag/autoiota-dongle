# new users with groups and home directory

{% for username, userdata in pillar.get('users', {}).items() %}
{% set user_group = username %}
{% set user_home = userdata.get('home', '/home/%s' %username) %}

# create groups defined in userdata
{% for groupname in userdata.get('groups', []) %}
users_{{username}}_{{groupname}}_group:
  group:
    - name: {{groupname}}
    - present
{% endfor %}

# create user group and user
users_{{username}}_user:
  group.present:
    - name: {{user_group}}
    - gid: {{userdata['uid']}}
  user.present:
    - name: {{username}}
    - home: {{user_home}}
    - shell: {{userdata.get('shell')}}
    - uid: {{userdata.get('uid')}}
    - password: {{userdata.get('pwd')}}
    - groups:
      - {{user_group}}
      {% for group in userdata.get('groups', []) %}
      - {{group}}
      {% endfor %}

# add pub keys to authorized_keys
{% if 'ssh_auth' in userdata %}
{% for ssh_key in userdata['ssh_auth'] %}
users_ssh_auth_{{username}}_{{loop.index0}}:
  ssh_auth.present:
    - user: {{username}}
    - name: {{ssh_key}}
{% endfor %}
{% endif %}

{% endfor %}
