# Content

- My ansible playbooks to setup my personal workstations
- My dotfiles for ricing linux machine

## Setup

- install curl

- launch the following command

```bash
sudo curl -SL https://raw.githubusercontent.com/H-ADJI/.dotfiles/master/install.sh | sh
```

- Install zen browser via flatpak
- Install sync browser profile
- Initialize transcrypt using

```bash
transcrypt -y -p {SUPER-SECURE-PASSWORD}
```

- Setup ssh key permission for ssh-agent using :

```bash
chmod 600 {SSH_PRIVATE_KEY}
```

- Add ssh key to ssh-agent using

```bash
ssh-add {SSH_PRIVATE_KEY}
```

- Apply docker post install setup [here](https://docs.docker.com/engine/install/linux-postinstall/)
