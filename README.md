# live-server.nvim

### Use live-server from NPM inside Neovim seamlessly!

# Installation

```lua
use({
  "aurum77/live-server.nvim",
    run = function()
      require"live_server.util".install()
    end,
    ft = { "html" },
    cmd = { "LiveServer","LiveServerStart","LiveServerStop" },
  })
```

# Usage

Runs when you call `:LiveServer`, in some ways this works similarly to [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)

# Requirements

- npm

# What ?

This plugin installs live-server to

```lua
:lua print(vim.fn.stdpath("data") .. "/live-server/")
```

# ~~When ?~~ How long did it take you to write this ?

It took about a day since I am quite new to Lua and Neovim programming / API

# Why ?

I was bored of Javascript and wanted to learn about creating plugins for Neovim using Lua, also I wasn't able to find plugins that would work similarly to this one!

# Also

~~I like cats :cat:~~ Feel free to open a pull request or give recommendations to au#4829 on Discord

# Thanks

[Neovim Lua Plugin From Scratch](https://www.youtube.com/watch?v=n4Lp4cV8YR0)

[How to Write a Neovim Plugin with Lua](https://www.linode.com/docs/guides/writing-a-neovim-plugin-with-lua/)

[Neovim documentation](https://neovim.io/doc/)
