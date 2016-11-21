{% from "syncthing/map.jinja" import syncthing with context %}

include:
  - syncthing

syncthing-config-user:
  sysrc.managed:
    - name: syncthing_user 
    - value: {{ syncthing.user }}

syncthing-config-group:
  sysrc.managed:
    - name: syncthing_group
    - value: {{ syncthing.group }}

syncthing-config-dir:
  sysrc.managed:
    - name: syncthing_dir
    - value: {{ syncthing.dir }}
