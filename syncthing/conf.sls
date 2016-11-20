{% from "syncthing/map.jinja" import syncthing, syncthing_config with context %}

include:
  - syncthing

syncthing-config:
  file.managed:
    - name: {{ syncthing.conf_file }}
    - source: salt://syncthing/templates/conf.jinja
    - template: jinja
    - context:
      config: {{ syncthing_config }}
    - watch_in:
      - service: syncthing
    - require:
      - pkg: syncthing
