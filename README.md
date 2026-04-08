# dotfiles

Personal dotfiles managed with [chezmoi](https://chezmoi.io).

## Restore on a new device (full guide)

### Prerequisites

Before applying dotfiles, set up SSH key for the `ryoguritno` GitHub account:

```sh
# Generate SSH key (if you don't have one)
ssh-keygen -t ed25519 -C "your-email@example.com" -f ~/.ssh/id_ed25519_ryoguritno

# Add public key to GitHub → Settings → SSH keys
cat ~/.ssh/id_ed25519_ryoguritno.pub

# Add to ~/.ssh/config
cat >> ~/.ssh/config << 'EOF'
Host github.com-ryoguritno
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519_ryoguritno
EOF

# Test connection
ssh -T git@github.com-ryoguritno
```

### Step 1 — Install system dependencies

```sh
sudo apt update && sudo apt install -y \
  zsh curl git build-essential
```

### Step 2 — Install zsh + oh-my-zsh

```sh
# Set zsh as default shell
chsh -s $(which zsh)

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install oh-my-zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

### Step 3 — Install chezmoi and apply dotfiles

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b ~/.local/bin
export PATH="$HOME/.local/bin:$PATH"

chezmoi init --apply git@github.com-ryoguritno:ryoguritno/dotfiles-chezmoi.git
```

### Step 4 — Install tools referenced in dotfiles

```sh
# lsd (modern ls replacement, used in .zshrc)
sudo apt install lsd   # or: cargo install lsd

# atuin (shell history)
curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh

# fastfetch
sudo add-apt-repository ppa:zhangsongcui3371/fastfetch
sudo apt install fastfetch

# pokemon-colorscripts (used in .zshrc with fastfetch)
git clone https://gitlab.com/phoneybadger/pokemon-colorscripts.git /tmp/pokemon-colorscripts
cd /tmp/pokemon-colorscripts && sudo ./install.sh

# neovim (v0.9+ recommended for LazyVim)
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt install neovim

# ghostty terminal — download from https://ghostty.org/download

# tmux (if not installed)
sudo apt install tmux
```

### Step 5 — Re-authenticate cloud CLIs

```sh
# AWS
aws configure   # or: aws sso login --profile <profile>

# Google Cloud
gcloud auth login
gcloud auth application-default login

# kubectl — restore per cluster (copy from old machine or re-generate)
# az login   # Azure CLI
```

### Step 6 — Restore secrets manually

Copy these from your old machine or secret store — they are intentionally NOT in this repo:

| File | How to restore |
|------|----------------|
| `~/.aws/credentials` | `aws configure` or copy from old machine |
| `~/.kube/config` | Re-generate per cluster or copy from old machine |
| `~/.gnupg/` | Export from old machine: `gpg --export-secret-keys > keys.gpg` |
| `~/.env` | Copy from old machine |
| `~/.claude/` | Clone `claude-code-learner-skilss` repo and re-link |

### Verify everything works

```sh
# Check shell loads correctly
zsh

# Check chezmoi is clean
chezmoi status   # should be empty

# Check neovim (plugins install on first launch)
nvim
```

---

## Keeping dotfiles up to date

When you change a tracked dotfile on any machine:

```sh
chezmoi re-add ~/.zshrc   # re-add the changed file
cd ~/.local/share/chezmoi
git add -A
git commit -m "chore: update zshrc"
git push
```

Pull changes on another machine:

```sh
chezmoi update
```

---

## What is NOT in this repo

| File | Reason |
|------|--------|
| `~/.aws/credentials` | AWS access keys |
| `~/.kube/config` | Kubernetes cluster configs/tokens |
| `~/.gnupg/` | GPG keys |
| `~/.env` | Local secrets |
| `~/.claude/` | Managed separately via claude-code-learner-skilss repo |
