---
- name: 'Add name server entry if not already entered'
  hosts: localhost
  become: yes
  tasks:
    - shell: 'cat /etc/resolv.conf'
      register: command_output
    - shell: 'echo "nameserver 10.0.250.10" >> /etc/resolv.conf'
      when: 'command_output.stdout.find("10.0.250.10") == -1'
