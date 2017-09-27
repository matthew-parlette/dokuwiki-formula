# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "dokuwiki/map.jinja" import dokuwiki with context %}

include:
  - dokuwiki.install

dokuwiki-container:
  dockerng.running:
    - name: {{ dokuwiki.name }}
    - image: {{ dokuwiki.image }}:{{ dokuwiki.branch }}
    - port_bindings:
      - {{ dokuwiki.port }}:3000
    {%- if dokuwiki['environment'] is defined %}
    - environment:
      {%- for env, value in dokuwiki.environment.items() %}
      - {{ env }}: {{ value|yaml_squote }}
      {%- endfor %}
    {%- endif %}
    - require:
      - dockerng: dokuwiki-image
