# ansible-docker

## Use cases

There are 3 main use cases for this Docker image:

1. As an interactive Ansible environment
2. As an Ansible ad-hoc executable
3. As an Ansible playbook executable

### Interactive Ansible environment

You can use this Docker image as an interactive Ansible environment to execute commands and run playbooks without needing to install Anisble, Python, PIP, or any of the dependencies.

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
