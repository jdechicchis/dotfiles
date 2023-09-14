# dotfiles

## NVIM Setup

Install Neovim. Clone this repo to `~/dev`.

Symlink:
- `ln -s ~/dev/dotfiles/nvim ./nvim`

## `zsh` Setup

Install [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh). Use the [powerlevel10k](https://github.com/romkatv/powerlevel10k) theme.

Setup plugins: `plugins=(git zsh-autosuggestions zsh-syntax-highlighting kubectl)`.

Might need to do:
```
ZSH_DISABLE_COMPFIX="true"
```

## tmux

Run `./tmux_setup.sh`.
