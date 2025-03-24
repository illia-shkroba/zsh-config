# Installation

This repository should be cloned into *$XDG_CONFIG_HOME/zsh*. For example:

```sh
git clone git@github.com:illia-shkroba/zsh-config.git "${XDG_CONFIG_HOME:-"$HOME"/.config}/zsh"
```

After cloning the repository, the `ZDOTDIR` variable should be set in the */etc/zsh/zshenv*:

```sh
export ZDOTDIR="${XDG_CONFIG_HOME:-"$HOME"/.config}/zsh"
```
