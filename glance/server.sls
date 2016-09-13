{%- from "glance/map.jinja" import glance with context %}

include:
  - glance.config.api
  - glance.config.registry

{{ glance.name }}:
  pkg.installed:
    - refresh: False
    - name: {{ glance.pkg }}
    - require_in:
      - file: /etc/glance/glance-api.conf
      - file: /etc/glance/glance-registry.conf

{{ glance.api.service }}:
  service.running:
    - name: {{ glance.api.service }}
    - enable: True
    - restart: True
    - require:
      - pkg: {{ glance.name }}
      - file: /etc/glance/glance-api.conf
    - watch:
      - file: /etc/glance/glance-api.conf

{{ glance.registry.service }}:
  service.running:
    - name: {{ glance.registry.service }}
    - enable: True
    - restart: True
    - require:
      - pkg: {{ glance.name }}
      - file: /etc/glance/glance-registry.conf
    - watch:
      - file: /etc/glance/glance-registry.conf

{{ glance.name }}_sync_db:
  cmd.run:
    - name: glance-manage db_sync
    - require:
      - file: /etc/glance/glance-api.conf
      - file: /etc/glance/glance-registry.conf
