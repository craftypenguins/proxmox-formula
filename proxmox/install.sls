{# vi: set ft=jinja: #}
{% from "proxmox/map.jinja" import proxmox with context %}

dist-upgrade-proxmox:
  pkg.uptodate:
    - refresh: True

{% for pkg in ['proxmox-ve','ntp','ssh','postfix','ksm-control-daemon','open-iscsi','systemd-sysv'] %}
{{pkg ~ '_installed'}}:
  pkg.latest:
    - name: {{pkg}}
    - require:
      - pkg: dist-upgrade-proxmox

{% endfor %}
