{% from "syncthing/map.jinja" import syncthing with context %}

syncthing:
  pkg.installed:
    - pkgs: {{ syncthing.pkgs }}
  service:
    - running
    - name: {{ syncthing.service }}
    - enable: True
    - require:
      - pkg: syncthing
