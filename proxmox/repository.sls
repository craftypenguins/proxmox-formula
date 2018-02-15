{# vi: set ft=jinja: #}
{% from "proxmox/map.jinja" import proxmox with context %}

proxmox_package_repository:
  pkgrepo.managed:
    - name: deb http://download.proxmox.com/debian {{salt['grains.get']('oscodename')}} pve-no-subscription
    - humanname: Proxmox VE No-Subscription Repository
    - key_url: http://download.proxmox.com/debian/key.asc
    - file: /etc/apt/sources.list.d/pve-nosub-repo.list
    - refresh_db: True

#proxmox_package_enterprise_repository:
#  pkgrepo.managed:
#    - name: "deb https://enterprise.proxmox.com/debian {{salt['grains.get']('oscodename')}} pve-enterprise"
#    - humanname: Proxmox VE No-Subscription Repository
#    - key_url: http://download.proxmox.com/debian/key.asc
#    - file: /etc/apt/sources.list.d/pve-enterprise.list
#    - refresh_db: False
#    - disabled: True

#proxmox_package_enterprise_repository:
#  pkgrepo.absent:
#    - name: pve-enterprise


#TODO: Remove Enterprise Repo from sources
