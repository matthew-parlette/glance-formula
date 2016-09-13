{%- from "glance/map.jinja" import glance with context %}

include:
  - keystone

glance_keystone_user:
  keystone.user_present:
    - name: glance
    - email: {{ salt['pillar.get']('glance:email') }}
    - password: {{ salt['pillar.get']('glance:password') }}
    - tenant: service
    - enable: True
    - roles:
        service:
          - admin
    - require:
      - file: /tmp/wait-port.sh
      - keystone: keystone_default_tenants
      - keystone: keystone_default_roles

glance_keystone_service:
  keystone.service_present:
    - name: glance
    - service_type: image
    - description: Openstack Image
    - require:
      - file: /tmp/wait-port.sh

glance_keystone_endpoint:
  keystone.endpoint_present:
    - name: glance
    - publicurl: http://{{ salt["pillar.get"]("glance:public_ip") }}:9292
    - internalurl: http://{{ salt["pillar.get"]("glance:internal_ip") }}:9292
    - adminurl: http://{{ salt["pillar.get"]("glance:admin_ip") }}:9292
    - require:
      - file: /tmp/wait-port.sh
