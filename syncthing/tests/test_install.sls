{% from "syncthing/map.jinja" import syncthing with context %}

{% for pkg in syncthing.pkgs %}
test_{{pkg}}_is_installed:
  testinfra.package:
    - name: {{ pkg }}
    - is_installed: True
{% endfor %}
