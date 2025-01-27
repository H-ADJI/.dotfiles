# Content

- My ansible playbooks to setup my personal workstations
- My dotfiles for ricing linux machine

## Setup

- install curl

- launch the following command

```bash
sudo curl -SL https://raw.githubusercontent.com/H-ADJI/.dotfiles/master/install.sh | sh
```

- initialize transcrypt using

```bash
transcrypt -y -p {SUPER-SECURE-PASSWORD}
```

- setup ssh key permission for ssh-agent using :

```bash
chmod 600 {SSH_KEY}
```

- add ssh key to ssh-agent using

```bash
ssh-add {SSH_KEY}
```

## TODO

- fix docker post-install permission issues
- install and link uv python binaries
