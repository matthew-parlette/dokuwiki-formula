# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "dokuwiki/map.jinja" import dokuwiki with context %}

dokuwiki-image:
  dockerng.image_present:
    - name: {{ dokuwiki.image }}:{{ dokuwiki.branch }}
    - force: True
