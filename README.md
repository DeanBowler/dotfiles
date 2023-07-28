
## Fresh Mac Setup

The environment of a MacBook tootin' full stack developer.

### How do

Create a new SSH key

```zsh
curl https://raw.githubusercontent.com/deanbowler/dotfiles/HEAD/ssh.sh | sh -s "<your-email-address>"
```

Paste it into GitHub

```zsh
pbcopy < ~/.ssh/id_ed25519.pub
```

Clone this repo

```zsh
git clone git@github.com:deanbowler/dotfiles.git ~/.dotfiles
```

Run the setup script

```zsh
~/.dotfiles/setup.sh
```

If you want to customize the packages installed, you can edit the `Brewfile` before running the setup script.

### What does

- Installs [Homebrew](https://brew.sh/)
- Installs a bunch of stuff with Homebrew
- Installs Node via [Volta](https://volta.sh/)
