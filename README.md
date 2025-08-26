# My macOS Development Environment

## macOS Settings

### Dock & Mission Control
- Hide Dock automatically
- Medium size
- Genie effect
- Minimize into application icon: `on`
- Show indicators for open apps: `on`
- Show recent apps: `off`
- Double-click window title: `zoom`
- Animate app openings: `on`

### Security
- FileVault: `on`

### Siri & Spotlight
- Ask Siri: `off`

### Keyboard
- Double space = period: `off`
- Smart quotes/dashes: `off`
- Set `"` for double, `'` for single quotes
![Keyboard](https://github.com/vitordwb/mac.environment/assets/64985648/4fcce15a-86c5-4945-9058-97e486915504)

### Finder
- Create `~/Developer` folder (adds icon)
- Sidebar:
  - Enable all Favorites
  - Add: Library, Developer, Drive, Dropbox
- Hide all tags
- Show all filename extensions
- Auto delete Trash after 30 days
![Finder Sidebar](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/iubdw3xlz4v1o9pr4rt4.png)
![Tags](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/fke1msfpu67hr6jc53yx.png)
![Filename extensions](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/bgy7keufnu3lglp5ehwh.png)

---

## Xcode

```bash
xcode-select --install
```

## Homebrew
- Install: [site](https://brew.sh/)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Homebrew Casks
```bash
brew install
  \ git
  \ colima
  \ neovim
  \ tmux
  \ yarn
```


```bash
brew install --cask 
  insomnia 
  jetbrains-toolbox 
  raycast 
  docker
  iterm2
```

---

## Git Setup
```bash
ln -s $(pwd)/git/gitconfig ~/.gitconfig
git config --global user.name "Your Name"
git config --global user.email "you@your-domain.com"
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
```

### SSH
```bash
ln -s $(pwd)/ssh/config ~/.ssh/config
```

---

## Terminal & Zsh

### Fonts
```bash
brew tap homebrew/cask-fonts
brew install font-hack-nerd-font
cp -r "$(pwd)/fonts/"* ~/Library/Fonts
```

### Oh My Zsh
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
ln -s $(pwd)/zsh/zshrc ~/.zshrc
```

#### Plugins
```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/mafredri/zsh-async ~/.oh-my-zsh/plugins/async
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
ln -s $(pwd)/zsh/p10k ~/.p10k.zsh
git clone https://github.com/g-plane/zsh-yarn-autocompletions ~/.oh-my-zsh/custom/plugins/zsh-yarn-autocompletions
```

### Terminal Configuration
```bash
ln -s $(pwd)/bash/bash_alias ~/.bash_alias
ln -s $(pwd)/bash/bash_profile ~/.bash_profile
ln -s $(pwd)/bash/bashrc ~/.bashrc
ln -s $(pwd)/bash/flutter ~/.flutter
ln -s $(pwd)/bash/nvm-load ~/.nvm-load
ln -s $(pwd)/bash/yarn-autocompletions.yml ~/.yarn-autocompletions.yml
```
> Edit `.nvm-load` to match installed Node version.

### Terminal Theme
1. Terminal > Settings
2. Gear icon → Import
3. Select `materialshell-dark.terminal`
4. Set as Default

![Theme Import](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/77pu4602w1cusup0rlj1.png)
![Theme Applied](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/gfk6ihhzv4nabghz4z51.png)
