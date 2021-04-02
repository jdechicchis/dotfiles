# dotfiles

## NVIM Setup

Install Neovim.

Symlink:
- `ln -s ~/dotfiles/nvim/init.vim init.vim`
- `ln -s ~/dotfiles/nvim/coc-settings.json coc-settings.json`

## `zsh` Setup

Install [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh). Use the [powerlevel10k](https://github.com/romkatv/powerlevel10k) theme.

Setup plugins: `plugins=(git zsh-autosuggestions zsh-syntax-highlighting kubectl)`.

Might need to do:
```
ZSH_DISABLE_COMPFIX="true"
```
