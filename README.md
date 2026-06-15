```text
                       .,,uod8B8bou,,.
              ..,uod8BBBBBBBBBBBBBBBBRPFT?l!i:.
         ,=m8BBBBBBBBBBBBBBBRPFT?!||||||||||||||
         !...:!TVBBBRPFT||||||||||!!^^""'   ||||
         !.......:!?|||||!!^^""'            ||||
         !.........||||                     ||||
         !.........||||  ##                 ||||
         !.........||||                     ||||
         !.........||||                     ||||
         !.........||||                     ||||
         !.........||||                     ||||
         `.........||||                    ,||||
          .;.......||||               _.-!!|||||
   .,uodWBBBBb.....||||       _.-!!|||||||||!:'
!YBBBBBBBBBBBBBBb..!|||:..-!!|||||||!iof68BBBBBb....
!..YBBBBBBBBBBBBBBb!!||||||||!iof68BBBBBBRPFT?!::   `.
!....YBBBBBBBBBBBBBBbaaitf68BBBBBBRPFT?!:::::::::     `.
!......YBBBBBBBBBBBBBBBBBBBRPFT?!::::::;:!^"`;:::       `.
!........YBBBBBBBBBBRPFT?!::::::::::^''...::::::;         iBBbo.
`..........YBRPFT?!::::::::::::::::::::::::;iof68bo.      WBBBBbo.
  `..........:::::::::::::::::::::::;iof688888888888b.     `YBBBP^'
    `........::::::::::::::::;iof688888888888888888888b.     `
      `......:::::::::;iof688888888888888888888888888888b.
        `....:::;iof688888888888888888888888888888888899fT!
          `..::!8888888888888888888888888888888899fT|!^"'
            `' !!988888888888888888888888899fT|!^"'
                `!!8888888888888888899fT|!^"'
                  `!988888888899fT|!^"'
                    `!9899fT|!^"'
                      `!^"'

```

## Fresh Start

Install Xcode Command Line Tools first if Git is not available yet:

```bash
xcode-select --install
```

Clone and bootstrap:

```bash
git clone git@github.com:vitordwb/dotfiles.git ~/dotfiles
cd ~/dotfiles
./bootstrap.sh
```

If SSH is not configured yet, clone over HTTPS first:

```bash
git clone https://github.com/vitordwb/dotfiles.git ~/dotfiles
```

`bootstrap.sh` is safe to rerun. It installs system dependencies, links dotfiles, installs runtimes, installs tmux plugins, creates an SSH key when missing, applies macOS defaults, and runs a doctor check.

## What Gets Installed

Homebrew packages and apps are defined in `Brewfile`.

Runtime setup:

```text
Node 24 via nvm
Bun
global npm packages from runtime/npm-global.txt
```

Dotfile packages linked with GNU Stow:

```text
git
tmux
nvim
zsh
borders
ssh
aerospace
btop
```

Secrets are not tracked. SSH private keys, tokens, local caches, and app runtime state stay outside this repo.

## Daily Use

Edit config files normally. Symlinked configs are already inside this repo, so commit and push after changes:

```bash
cd ~/dotfiles
git status
git add .
git commit -m "Update dotfiles"
git push
```

Install or relink all dotfiles:

```bash
./install.sh
```

Install selected packages only:

```bash
./install.sh git zsh tmux
```

Run health checks:

```bash
./scripts/doctor.sh
```

## Sync Existing Local Configs

If a config still exists as a regular file or directory in `~`, copy it into this repo before linking it:

```bash
cd ~/dotfiles
./sync-from-home.sh
git diff
./install.sh
```

`install.sh` backs up conflicting regular files to `~/.dotfiles-backup/<timestamp>/` before creating symlinks.

## SSH Setup

The bootstrap creates `~/.ssh/id_ed25519` only if it does not already exist. It copies the public key to the clipboard when possible so it can be added to GitHub.

After adding the key to GitHub, switch the repo remote to SSH if you cloned with HTTPS:

```bash
cd ~/dotfiles
git remote set-url origin git@github.com:vitordwb/dotfiles.git
```

## Optional Flags

Skip macOS defaults during bootstrap:

```bash
SKIP_MACOS_DEFAULTS=1 ./bootstrap.sh
```

Use a different Node major version:

```bash
NODE_VERSION=24 ./bootstrap.sh
```
