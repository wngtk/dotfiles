My personal configuration files. They are designed for a VSCode + NEOVIM stack. You can "install" (by symlinking) the configs using

```sh
./install
```

This command will install neovim plugins (from kiyoon's [dotfiles](https://github.com/kiyoon/dotfiles/blob/26414688f86db9a8f7733e35e6c1890c0011ac36/oh-my-zsh/custom/functions.zsh#L61)):

```sh
nvim +"lua require('lazy').install()" +qa
```

### VSCode + NVIM
- Will allow linux shell commands with `!` only when remote host is linux/WSL.
- [Install VSCodeVim extension](https://marketplace.visualstudio.com/items?itemName=vscodevim.vim)
- Update global [settings.json](./vscode/settings.json)


### Share

The Share folder contains various shared configurations.

The `config.site` file sets debugging-related options for `./configure`
and is used to configure the `CONFIG_SITE` environment
variable[^autoconf_site-default].

```fish
set -Ux CONFIG_SITE ~/.dotfiles/share/config.site
```

[^autoconf_site-default]: https://www.gnu.org/savannah-checkouts/gnu/autoconf/manual/autoconf-2.72/html_node/Site-Defaults.html#Site-Defaults

