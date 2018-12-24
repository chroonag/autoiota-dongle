# create required groups

user_add_service_group:
  group.present:
    - name: serviceusers
    - gid: 4000 
