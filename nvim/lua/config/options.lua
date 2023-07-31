-- vim.options are automatically loaded before lazy.nvim startup
-- See `:help vim.o` or 'https://neovim.io/doc/user/vim.options.html' for more information
-- Default vim.options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/vim.options.lua
-- Add any additional vim.options here

-- [[ General ]]
-- vim.opt.guicursor = "a:blinkon100"     -- Set cursor to blink
vim.o.mouse = 'a'                    -- Enable mouse for all modes for easier scrolling, resizing, etc.
vim.o.backspace = 'indent,eol,start' -- Allow backspacing over everything in insert mode
vim.o.clipboard = 'unnamedplus'      -- Nvim has no direct connection to the system clipboard.
vim.o.termguicolors = true           -- Set term gui colors (make sure your terminal supports this)
vim.opt.scrolloff = 8                -- Mimumim number of screen lines to keep above and below the cursor
vim.opt.sidescrolloff = 8            -- Columns of context
vim.opt.confirm = true               -- Confirm to save changes before exiting modified buffer
vim.opt.grepformat = "%f:%l:%c:%m"   --
vim.opt.grepprg = "rg --vimgrep"     --
vim.opt.inccommand = "nosplit"       -- preview incremental substitute
vim.opt.list = true                  -- Show some invisible characters (tabs...
vim.opt.pumblend = 10                -- Popup blend
vim.opt.pumheight = 10               -- Maximum number of entries in a popup
vim.opt.showmode = false             -- Dont show mode since we have a statusline

-- [[ Editor ]]
vim.wo.number = true         -- Show line numbers
vim.wo.relativenumber = true -- Show relative line numbers
vim.wo.signcolumn = 'yes'    -- Keep signcolumn on by default
vim.opt.showcmd = true       -- Show (partial) command in status line.
vim.opt.cursorline = true    -- Highlight cursor line to make it easier to keep track of the cursor
vim.opt.laststatus = 2       -- Always display the status line. 2: always, 1: only if there are at least two windows, 0: never
vim.opt.conceallevel = 3     -- Hide * markup for bold and italic


-- [[ Line Wrapping ]]
vim.o.breakindent = true   -- Every wrapped line will continue visually indented
-- vim.opt.wrap = true       -- Wrap lines that are too long to fit the screen
vim.opt.wrap = false       -- Wrap lines that are too long to fit the screen
vim.opt.textwidth = 80     -- Maximum width of text that is being inserted
vim.opt.wrapmargin = 0     -- Mimimum Margin size on the right side of the screen
vim.opt.colorcolumn = '+1' -- Highlight lines past 'textwidth' column
vim.opt.linebreak = true   -- Wrap long lines at a character in 'breakat'


-- [[ Tabs and Spaces ]]
vim.opt.tabstop = 4        -- Number of spaces tabs count for
vim.opt.softtabstop = 4    -- Number of spaces tabs count for while editing
vim.opt.shiftwidth = 4     -- Size of an indent
vim.opt.expandtab = true   -- Use spaces instead of tabs
vim.opt.shiftround = true  -- Round indent
vim.opt.smartindent = true -- Insert indents automatically


-- [[ Saving and Reading ]]
vim.opt.autowrite = true                               -- Automatically save before :next, :make etc.
vim.opt.autoread = true                                -- Automatically read file if it changes outside of vim
vim.o.updatetime = 50                                  -- If this many milliseconds nothing is typed the swap file will be written to disk (see crash-recovery).
vim.o.timeout = true                                   -- Wait timeoutlen milliseconds after receiving a mapped key sequence
vim.o.timeoutlen = 300                                 -- Time in milliseconds to wait for by timeout mappings
vim.opt.swapfile = false                               -- Do not create swap files
vim.opt.backup = false                                 -- Do not create backup files
vim.opt.undodir = os.getenv("HOME") .. "/.cache/nvim/undodir" -- Set undo directory
vim.opt.undofile = true                                -- Use undo file
vim.opt.undolevels = 10000

-- [[ Searching ]]
-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true  -- Ignore case in search patterns
vim.o.smartcase = true   -- Override the 'ignorecase' vim.option if the search pattern contains upper case characters
vim.o.hlsearch = false   -- Set highlight on search
vim.opt.incsearch = true -- Makes search incremental like modern browserss

-- [[ misk ]]
vim.opt.spelllang = { "en" }
vim.opt.splitbelow = true              -- Put new windows below current
vim.opt.splitright = true              -- Put new windows right of current
vim.opt.wildmode = "longest:full,full" -- Command-line completion mode
vim.opt.winminwidth = 5                -- Minimum window width

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
