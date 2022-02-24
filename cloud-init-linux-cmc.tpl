#cloud-config
hostname: ${host_name}
timezone: Europe/Amsterdam

package_update:  true
package_upgrade: true

power_state:
  mode: reboot

output: { all : '| tee -a /var/log/cloud-init-output.log' }
