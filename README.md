# yugen 🌌

**yugen** is a Neovim theme inspired by the profound beauty and depth of the concept of "yūgen." It aims to provide a minimalist and aesthetically pleasing color scheme for coding, highlighting both subtle and profound elements in your workspace.

## Installation

To use **yugen** in Neovim, follow the installation instructions below based on your preferred plugin manager.


### Using [lazy.nvim](https://github.com/folke/lazy.nvim)

Add the following line to your lazy configuration:

```lua
{
    'bettervim/yugen',
    config = function()
        vim.cmd.colorscheme('yugen')
    end,
}
```

Then, run the following in Neovim:

```vim
:Lazy sync
```

## Usage

After installing, you can set **yugen** as your colorscheme with:

```vim
colorscheme yugen
```

Add the line to your `init.vim` or `init.lua` to make it your default theme.


## License

yugen is licensed under the MIT License. See the [LICENSE](https://github.com/bettervim/yugen
