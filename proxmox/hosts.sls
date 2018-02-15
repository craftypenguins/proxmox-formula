{# vi: set ft=jinja: #}
{% from "proxmox/map.jinja" import proxmox with context %}

{# Proxmox needs hostname to resolve to main IP of system #}
{# Used for Clustering - Probably a LAN IP #}
etc-hosts-blockreplace:
  file.blockreplace:
    - name: /etc/hosts
    - marker_start: "# BLOCK TOP - Below this line managed by SaltStack"
    - marker_end: "# BLOCK BOTTOM - Above this line managed by SaltStack"
    - source: salt://proxmox/templates/hosts.jinja
    - template: 'jinja'
    - context:
        config: {{ proxmox.lookup|json }}
    - show_changes: True
    - prepend_if_not_found: True
    
