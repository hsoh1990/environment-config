# pc environment config

## NeoVim & tmux install
```bash
brew install neovim
brew install tmux
```

## clone config file
```bash
git clone https://github.com/hsoh1990/environment-config.git 
cp -R environment-config/* ~/.config/
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

## hotkey 
```
ss         ## split window h
sv         ## split window v
s+ hjkl    ## move window
sf         ## finder
F1         ## file tree toggle

<C-t> + ?  ## tmux action

todo...
```

## nerd-font ubuntu
```
git clone https://github.com/ryanoasis/nerd-fonts
cd nerd-fonts
sudo ./install.sh
```

## nerd-font Mac brew
```
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font 
```

## nerd-fort Mac curl
```
cd ~/Library/Fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
```
