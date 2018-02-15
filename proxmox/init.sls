{# vi: set ft=jinja: #}
{% from "proxmox/map.jinja" import proxmox with context %}

{%- if grains["oscodename"]|lower == 'jessie' %}
include:
  - proxmox.repository
  - proxmox.hosts
  - proxmox.install
{%- else %}
jessie-based-only:
  test.fail_without_changes:
    - name: "Proxmox can only be installed on Debian Jessie"
{%- endif %}


