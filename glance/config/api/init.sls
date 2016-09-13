{%- from "glance/config/api/map.jinja" import glance with context %}

/etc/glance/glance-api.conf:
  file.managed:
    - source: salt://glance/config/api/files/glance-api.conf
    - template: jinja
