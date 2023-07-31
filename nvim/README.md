A custom configuration inspired by, among others, LazyVim, AstroNVim, and Kickstart. Plugins powered by [💤 lazy.nvim](https://github.com/folke/lazy.nvim)

For someone completely new, I suggest using the **LazyVim** a starter template [here](https://github.com/LazyVim/starter)
There's a great video created by [@elijahmanor](https://github.com/elijahmanor) with a walkthrough to get started.
[![Watch the video](https://img.youtube.com/vi/N93cTbtLCIM/hqdefault.jpg)](https://www.youtube.com/watch?v=N93cTbtLCIM)

If you don't know anything about Lua, I recommend taking some time to read through a guide.
One possible example: <https://learnxinyminutes.com/docs/lua/>

## Requirements

- Neovim >= **0.8.0** (needs to be built with **LuaJIT**)
- Git >= **2.19.0** (for partial clones support)
- a [Nerd Font](https://www.nerdfonts.com/) **_(optional)_**
- a **C** compiler for `nvim-treesitter`. See [here](https://github.com/nvim-treesitter/nvim-treesitter#requirements)

## 🚀 Getting Started

- Make a backup of your current Neovim files:

  ```sh
  mv ~/.config/nvim ~/.config/nvim.bak && mv ~/.local/share/nvim ~/.local/share/nvim.bak && rm -rf ~/.cache/nvim
  ```

or

  ```sh
  rm -rf ~/.local/state/nvim && rm -rf ~/.local/share/nvim && rm -rf ~/.cache/nvim
  ```

- Clone the starter

  ```sh
  git clone https://github.com/LazyVim/starter ~/.config/nvim
  ```

- Remove the `.git` folder, so you can add it to your own repo later

  ```sh
  rm -rf ~/.config/nvim/.git
  ```

- Start Neovim!

  ```sh
  nvim
  ```

You should quit NVim after the initial install for everything to work correctly.

## 📂 File Structure

You can add your custom plugin specs under `lua/plugins/`. All files there
will be automatically loaded by [lazy.nvim](https://github.com/folke/lazy.nvim)

<pre>
~/.config/nvim
├── lua
│   ├── config
│   │   ├── autocmds.lua
│   │   ├── keymaps.lua
│   │   ├── lazy.lua
│   │   └── options.lua
│   └── plugins
│       ├── spec1.lua
│       ├── **
│       └── spec2.lua
└── init.lua
</pre>

## ⚙️ Configuration

Refer to the [docs](https://lazyvim.github.io)
