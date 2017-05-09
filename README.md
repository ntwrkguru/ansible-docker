# ansible-docker

## Pre-requisites

Install Docker for [Windows]](https://www.docker.com/docker-windows) or [Mac](https://www.docker.com/docker-mac)

## Use cases

There are 3 main use cases for this Docker image:

1. As an interactive Ansible environment
2. As an Ansible playbook executable
3. As an Ansible ad-hoc executable

### Interactive Ansible environment

You can use this Docker image as an interactive Ansible environment to execute commands and run playbooks without needing to install Anisble, Python, PIP, or any of the dependencies. This can be very useful as a sandbox, to test out Ansible, or to run Ansible tasks on a machine without all of the dependencies of Ansible.

```bash
$ docker run -it ansible-docker
/ # which ansible
/usr/bin/ansible
/ #
```

You'll probably want to bind mount a local directory that contains your playbook(s).

```bash
$ docker run -it -v $PWD:/playbooks ansible-docker
/playbook # pwd
/playbook
/playbook # ls
deploy.retry  deploy.yml    foo           hosts
/playbook # ansible-playbook -i hosts deploy.yml 

PLAY [localhost] *******************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************
ok: [localhost]

TASK [ping] ************************************************************************************************************
changed: [localhost]

PLAY RECAP *************************************************************************************************************
localhost                  : ok=2    changed=1    unreachable=0    failed=0
```

### Ansible playbook executable

You don't need to start and interact with the container at all. You can use the image to as an `ansible-playbook` executable.

```bash
$ ls -1
deploy.retry
deploy.yml
foo
hosts
$ docker run -v $PWD:/playbook ntwrkguru/ansible-docker:pb -i hosts deploy.yml 

PLAY [localhost] ***************************************************************

TASK [Gathering Facts] *********************************************************
ok: [localhost]

TASK [ping] ********************************************************************
changed: [localhost]

PLAY RECAP *********************************************************************
localhost                  : ok=2    changed=1    unreachable=0    failed=0
```

Notice how we bind mount a host directory (in this case the current working directory) to /playbook so that we can load the inventory and playbook from our host.

### Ansible ad-hoc executable

You don't need to start and interact with the container at all. You can also use the image as an ad-hoc executable for Ansible commands.

```bash
$ docker run -v $PWD:/playbook ntwrkguru/ansible-docker:command localhost -m setup -a 'filter=ansible_architecture'
 [WARNING]: Host file not found: /etc/ansible/hosts
 [WARNING]: provided hosts list is empty, only localhost is available
localhost | SUCCESS => {
    "ansible_facts": {
        "ansible_architecture": "x86_64"
    }, 
    "changed": false
}
```

Arguably, this isn't very intuitive but it could be useful to send to someone as a "copy-pastable" tool.
