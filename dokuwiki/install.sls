# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "dokuwiki/map.jinja" import dokuwiki with context %}

include:
  - dokuwiki.directories

dokuwiki-image:
  dockerng.image_present:
    - name: {{ dokuwiki.image }}:{{ dokuwiki.branch }}
    - force: True

dokuwiki-install:
  archive.extracted:
    - name: {{ dokuwiki.directory }}/
    - source: https://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz
    - user: 33
    - group: 33
    - skip_verify: True
    - options: --strip-components=1
