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
```

