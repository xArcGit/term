1. Install lunarVim

```zsh
LV_BRANCH='release-1.4/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.4/neovim-0.9/utils/installer/install.sh)
```

2. Copy config
```zsh
cp -rf kitty ~/.config/
```
```zsh
cp -rf lvim ~/.config/
```
```
mv ~/.zshrc ~/.zshrc.bak
cp -rf .zshrc ~/
cp -rf .p10k.zsh ~/
```
