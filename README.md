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

## Use Lazy
```bash
# init.lua가 첫 실행 시 lazy.nvim을 자동 설치(bootstrap)함
# nvim을 열면 플러그인이 자동으로 설치됨
nvim

# 이후 플러그인 관리
:Lazy         # 상태 확인 UI
:Lazy sync    # 설치/업데이트/정리
```

## VSCode settings (symlink)
```bash
# VSCode를 한 번도 안 열었으면 User 폴더가 없을 수 있으므로 먼저 생성
mkdir -p "$HOME/Library/Application Support/Code/User"

# 저장소의 settings.json을 실제 경로에 심링크로 연결 (-f: 기존 파일 덮어씀)
ln -sf ~/.config/vscode/settings.json \
  "$HOME/Library/Application Support/Code/User/settings.json"
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

## hotkey 
```
ss         ## split window horizontal
sv         ## split window vertical
s+ hjkl    ## move window
sf         ## finder
<leader>f  ## find file 
<leader>g  ## live grep
dw         ## delete back work
...

<C-t> + ?  ## tmux action
  %          ## split window vertical
  "          ## split window vertical
  hjkl       ## move window
  <C-hjkl>   ## resize window
```
