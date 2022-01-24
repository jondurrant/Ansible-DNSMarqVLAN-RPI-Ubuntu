# Ansible-DNSMarqVLAN-RPI-Ubuntu
Ansible roles for Running Multiple DNS instances on a PI across different VLAN and joining PI to VLANs

Ansible roles tested on Rasperry PI running Ubuntu Focal (20.04)

## Role: OracJoinVLAN
Role to join a device to a VLAN. Takes parameters:

- vlan:  the number of the vlan
- ip: the ip address to be assigned. Assumed ip with a class C (/24)

Role assumes that device is connected via eth0. Would be possible to allow this to be parameterised, just wasn't my need when writting.


Example:

`- {role: OracJoinVLAN, vlan: "13", ip: "192.168.13.5" }`


## Role: OracMultiDNS

Role to configure DNSMasq to run on a specific interface of the server and pick up specific host files for clients talking on that interface.

Configuration files will be created in: /opt/oracMultiDNS

### Parameters:

- interface: name of interface to attach to. For example eth0 or eth0.13
- hostsdir: "/opt/oracMultiDNS/np" director to place the specific host file
- domain: domain that should be searched for an unqualified dns request. So could be local.foo.com or home
- server: ip address of a DNS to look up general request on. Could be 8.8.8.8
- user: User that dnsmasq should run as. Assuming the user exists already, or was created through dnsmasq install

### Example:

` - {role: OracMultiDNS, interface: "eth0",    hostsdir: "/opt/oracMultiDNS/all",   domain: "home", server: "192.168.1.1", user: "dnsmasq"}`

### Files: 
Expects to find host files to copy in and start from.

- files/hosts.all - general host file that all instances will load. Use it for common hosts
- files/hosts.{interface} - specific host file for a specific interface. For exampe hosts.eth0.13


## Example Playbook
Example playbook in the example-play folder. Ansible config file is not provided.

