# MacOS - Development setup for new machine

these are the configurations I need to setup a new MacOS development environment in a new machine

after finishing your MacOS initial setup, you will face that default screen with many default Apple apps on the docker, and nothing configured

## Settings

these are configurations done in the MacOs settings

### Desktop & Dock

- remove most applications from Dock
- automatic hide
- medium dock
- gennie effect
- "double-click a window's title bar to"   `zoom`
- "minimize windows into application icon" `on`
- "animate opening applications"           `on`
- "show recent applications in dock"       `off`
- "show indicators for open applications"  `on`
- "show suggested and recent apps in Dock" `off`
 
![image-removebg-preview](https://github.com/vitordwb/mac.environment/assets/64985648/6ffab95c-a205-44e9-9459-cfdaac5dc26c)

hot corners shortcut


![image-removebg-preview (4)](https://github.com/vitordwb/mac.environment/assets/64985648/99429181-4cf4-4f84-8991-fcab15caafa7)


### Display

![image-removebg-preview (1)](https://github.com/vitordwb/mac.environment/assets/64985648/f530340a-51bf-49b6-a150-c5c38465884f)

### Displays

![image-removebg-preview (2)](https://github.com/vitordwb/mac.environment/assets/64985648/d54e8c70-30b9-45c7-af47-3eb25122dee7)


### Security

- FileVault `on`

### Siri & Spotight

- ask siri `off`

### Keyboard

- text
- "add full stop with double-space" `off`
- "use smart quotes and dashes" `off`
- use `"` for double quotes
- use `'` for single quotes

![image-removebg-preview (3)](https://github.com/vitordwb/mac.environment/assets/64985648/4fcce15a-86c5-4945-9058-97e486915504)


### Finder

- create a `Developer` folder inside your home folder `~` (it adds a custom icon to the folder)
- sidebar:
- activate all Favorites
- move Library to Favorites
- add Drive and Dropbox to Favorites
- add `Developer` folder to Favorites

![Image description](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/iubdw3xlz4v1o9pr4rt4.png)

- hide all Tags
![Image description](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/fke1msfpu67hr6jc53yx.png)

- show all filename extensions
- remove Items from `bin` after 30 days

 ![Image description](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/bgy7keufnu3lglp5ehwh.png)

## Terminal Settings

_(Affects Finder and other Applications)_

show hidden files

```bash
defaults write com.apple.finder AppleShowAllFiles YES; killall Finder;
```

clear .DS_Store files

```bash
sudo find / -name .DS_Store -delete; killall Finder
```

take screenshots as jpg (usually smaller size) and not png

```bash
defaults write com.apple.screencapture type jpg; killall Finder;
```

show library folder

```bash
chflags nohidden ~/Library; killall Finder;
```

show path bar

```bash
defaults write com.apple.finder ShowPathbar -bool true; killall Finder;
```

show status bar

```bash
defaults write com.apple.finder ShowStatusBar -bool true; killall Finder;
```

# Applications & DevTools

## AppStore

first you need to setup your apple account to be able to use the AppStore, then you will need to download some applications

- [Magnet](https://apps.apple.com/br/app/magnet/id441258766?l=en&mt=12) (alternative: `rectangle`)

- [Xcode](https://apps.apple.com/br/app/xcode/id497799835?l=en&mt=12)

> after installing the Xcode, you need to open it for the first time accept some licenses to use it fully.

install xCode Terminal Tools

```bash
xcode-select --install
```

- accept xCode License

```bash
sudo xcodebuild -license accept
```

## Applications (GUI & DevTools)

first we need to disable Gatekeeper in order to use non-Apple signed applications.

```bash
sudo spctl --master-disable
```

Homebrew

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

now we need to update everything in Homebrew, after the first installation.

```bash
brew update
```

### Homebrew Installation

Here the list is divided into categories so you can know what kind of application you are installing.

#### Browser

- [Zen](https://zen-browser.app/download/)

#### DevTools

- [Sourcetree DesktopApp](https://www.sourcetreeapp.com/)
- [VSCode](https://code.visualstudio.com/)
- [Docker](https://www.docker.com/)
- [Insomnia](https://insomnia.rest/)
- [Jetbrains toolbox](https://www.jetbrains.com/toolbox-app/)

```bash
brew install --cask \
  git \
  visual-studio-code \
  docker \
  insomnia \
  jetbrains-toolbox \
  neovim \
  tmux \
```

#### Utilities

- [Raycast](https://www.raycast.com/)

```bash
brew install --cask \
  raycast \
```

> After installation, copy the content from the file `/mtmr/profile.json`, click in the MTMR icon in the menu bar, and click in `Preferences`, there paste the content, save and restart the application.

#### Extra

- [Lazy Docker](https://github.com/jesseduffield/lazydocker#installation)

```bash
brew install jesseduffield/lazydocker/lazydocker
```

# Git

## Git LFS & Flow

install

```bash
brew install git-lfs git-flow
```

## Configuring the client

set the configuration file

```bash
ln -s $(pwd)/git/gitconfig ~/.gitconfig
```

after executing this commands, configure your Git user settings

```bash
git config --global user.name "Your Name"
git config --global email "you@your-domain.com"
```

### Improving Git Log

you can add more colors to your git log output by executing this command

```bash
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
```

## SSH

```bash
ln -s $(pwd)/ssh/config ~/.ssh/config
```

# Terminal & Oh My Zsh

## Fonts

The first step is to install the basic fonts needed in our terminal.

```bash
# Nerd Fonts
brew tap homebrew/cask-fonts
brew install font-hack-nerd-font
```

copy fonts

```bash
cp -r "$(pwd)/fonts/"* ~/Library/Fonts
```

## ZSH

[oh my Zsh](https://ohmyz.sh/) project is a good terminal add-on to be added in our development environment.

install

```bash
# Oh My ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

set the configuration file

```bash
ln -s $(pwd)/zsh/zshrc ~/.zshrc
```

### Plugins

Here are some plugins that can be used alognside with Oh My Zsh, and make your experience much better.

zsh-autosuggestions

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
```

zsh-syntax-highlighting

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
```

zsh-async

```bash
git clone https://github.com/mafredri/zsh-async ~/.oh-my-zsh/plugins/async
```

zsh-nvm

```bash
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm
```

powerlevel10k

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
```

```bash
ln -s $(pwd)/zsh/p10k ~/.p10k.zsh
```

- yarn-auto-complete
```bash
git clone https://github.com/g-plane/zsh-yarn-autocompletions ~/.oh-my-zsh/custom/plugins/zsh-yarn-autocompletions
```

## Terminal

to add some new configurations and special tools to the terminal, you can execute the following command to import those

set the configuration file

```bash
ln -s $(pwd)/bash/bash_alias ~/.bash_alias
ln -s $(pwd)/bash/bash_profile ~/.bash_profile
ln -s $(pwd)/bash/bashrc ~/.bashrc
ln -s $(pwd)/bash/flutter ~/.flutter
ln -s $(pwd)/bash/nvm-load ~/.nvm-load
ln -s $(pwd)/bash/yarn-autocompletions.yml ~/.yarn-autocompletions.yml
```

>attention, because inside the files `.nvm-load` there are specific configurations, with version based, please edit the file with the appropriate version before loading those.

### Theme

You can change the Mac Terminal application appearance with some quick steps.

1. Terminal > Settings Tab
2. click "Gear" icon
3. click `import`
4. select the `materialshell-dark.terminal` file
5. click Default

![Image description](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/77pu4602w1cusup0rlj1.png)

![Image description](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/gfk6ihhzv4nabghz4z51.png)
  
# Node, NVM, Yarn
## NVM

there is no better way to manage `node` than using [NVM](https://github.com/nvm-sh/nvm)

```bash
# NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
```

### Updating NVM

to update NVM to a newer version, you can use this command without losing your globals. Remember to change `<version>` to the version you want installed.

```bash
nvm install <version> --reinstall-packages-from=$(nvm current)
nvm use <version>
nvm alias default <version>
```

## Yarn

i prefer to use `yarn` as the package manager, but this is a personal selection.

```bash
# Yarn
curl -o- -L https://yarnpkg.com/install.sh | bash
```

## NPMJS.com

set the defaults value for your NPM user

```bash
npm set init.author.name "your name"
npm set init.author.email "you@example.com"
npm set init.author.url "example.com"
```

then login into `NPM` with

```bash
npm adduser
```

# Extra

## Aws

install

```bash
brew install awscli aws-keychain aws-elasticbeanstalk
```
