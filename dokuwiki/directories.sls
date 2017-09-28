{% from "dokuwiki/map.jinja" import dokuwiki with context %}

dokuwiki-data-dir:
  file.directory:
    - name: {{ dokuwiki.path['data'] }}
    - user: 33
    - makedirs: True

dokuwiki-plugins-dir:
  file.directory:
    - name: {{ dokuwiki.path['plugins'] }}
    - user: 33
    - makedirs: True

dokuwiki-conf-dir:
  file.directory:
    - name: {{ dokuwiki.path['conf'] }}
    - user: 33
    - makedirs: True

dokuwiki-tpl-dir:
  file.directory:
    - name: {{ dokuwiki.path['tpl'] }}
    - user: 33
    - makedirs: True
