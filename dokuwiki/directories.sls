{% from "dokuwiki/map.jinja" import dokuwiki with context %}

dokuwiki-directory:
  file.directory:
    - name: {{ dokuwiki.directory }}
    - user: 33
    - group: 33
    - dir_mode: 755
    - file_mode: 644
    - recurse:
      - user
      - group
      - mode
    - makedirs: True
