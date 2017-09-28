# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "dokuwiki/map.jinja" import dokuwiki with context %}

include:
  - dokuwiki.install
  - dokuwiki.directories

dokuwiki-container:
  dockerng.running:
    - name: {{ dokuwiki.name }}
    - image: {{ dokuwiki.image }}:{{ dokuwiki.branch }}
    - binds:
      - {{ dokuwiki.path['data'] }}:/dokuwiki/data/:rw
      - {{ dokuwiki.path['plugins'] }}:/dokuwiki/lib/plugins/:rw
      - {{ dokuwiki.path['conf'] }}:/dokuwiki/conf/:rw
      - {{ dokuwiki.path['tpl'] }}:/dokuwiki/lib/tpl/:rw
    - port_bindings:
      - {{ dokuwiki.port }}:80
    {%- if dokuwiki['environment'] is defined %}
    - environment:
      {%- for env, value in dokuwiki.environment.items() %}
      - {{ env }}: {{ value|yaml_squote }}
      {%- endfor %}
    {%- endif %}
    - require:
      - dockerng: dokuwiki-image
      - file: dokuwiki-data-dir
      - file: dokuwiki-plugins-dir
      - file: dokuwiki-conf-dir
      - file: dokuwiki-tpl-dir
