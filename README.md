# pc-config

## NeoVim & tmux install
```bash
brew install neovim
brew install tmux
```

## clone
```bash
git clone https://github.com/hsoh1990/pc-config.git 
cp -R pc-config/* ~/.config/
```

## Packer install
```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
 
nvim ##after NeoVim run
:PackerInstall
```

## etc
```bash
brew install lua-language-server
brew install treesitter
brew install rg

npm install -g @fsouza/prettierd
npm install -g typescript-language-server typescript
npm install -g @tailwindcss/language-server
npm install -g diagnostic-languageserver
```
