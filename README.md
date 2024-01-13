> ## Personal Settings

## Steps to bootstrap a new Mac

1. Clone repo into new hidden directory.

```zsh
# Use SSH (if set up)...
git clone git@github.com:betomossmann/.dotfiles.git ~/.dotfiles

# ...or use HTTPS and switch remotes later.
git clone https://github.com/betomossmann/.dotfiles.git ~/.dotfiles
```


2. Create symlinks in the Home directory to the real files in the repo.

```zsh
# There are better and less manual ways to do this;
# investigate install scripts and bootstrapping tools.
# Example:

ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
```