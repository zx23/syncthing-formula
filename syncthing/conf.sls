{% from "syncthing/map.jinja" import syncthing with context %}

include:
  - syncthing

syncthing-config-user:
  sysrc.managed:
    - name: syncthing_user 
    - value: {{ syncthing.user }}
    - require_in:
      - service: syncthing

syncthing-config-group:
  sysrc.managed:
    - name: syncthing_group
    - value: {{ syncthing.group }}
    - require_in:
      - service: syncthing

syncthing-config-dir:
  sysrc.managed:
    - name: syncthing_dir
    - value: {{ syncthing.dir }}
    - require_in:
      - service: syncthing
