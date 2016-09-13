{%- from "glance/config/registry/map.jinja" import glance with context %}

/etc/glance/glance-registry.conf:
  file.managed:
    - source: salt://glance/config/registry/files/glance-registry.conf
    - template: jinja
