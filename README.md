# dotfiles

Personal dotfiles managed with [chezmoi](https://chezmoi.io).

## Install on a new machine

```sh
# 1. Install chezmoi
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b ~/.local/bin

# 2. Install zsh + oh-my-zsh
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 3. Apply dotfiles
chezmoi init --apply git@github.com-ryoguritno:ryoguritno/dotfiles-chezmoi.git
```

## After restore — manual steps

Install binaries:
- `lsd`, `atuin`, `fastfetch`, `ghostty`, `neovim`, `pokemon-colorscripts`
- oh-my-zsh plugins: `zsh-autosuggestions`, `zsh-syntax-highlighting`

Re-authenticate cloud CLIs:
- `aws configure` (or `aws sso login`)
- `kubectl` config (per cluster)
- `gcloud auth login`
- `az login`

## What is NOT in this repo (set up manually)

| File | Reason |
|------|--------|
| `~/.aws/credentials` | AWS access keys |
| `~/.kube/config` | Kubernetes cluster configs/tokens |
| `~/.gnupg/` | GPG keys |
| `~/.env` | Local secrets |
| `~/.claude/` | Managed separately |
