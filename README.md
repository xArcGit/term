1. Install lunarVim

```zsh
LV_BRANCH='release-1.4/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.4/neovim-0.9/utils/installer/install.sh)
```

2. Copy config

- kitty
```zsh
cp -rf kitty ~/.config/
```
- lvim
```zsh
cp -rf lvim ~/.config/
```
- zsh
```
mv ~/.zshrc ~/.zshrc.bak
cp -rf .zshrc ~/
cp -rf .p10k.zsh ~/
```
