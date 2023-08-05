-- Note: Since `vim.tbl_deep_extend`, can only merge tables and not lists, 
-- directly setting  `ensure_installed` with the new value overrites all 
-- previous values. If you'd rather extend the default config, wrap it with 
-- list_extend()

return {
    {
        -- easily manage external editor tooling such as LSP servers, DAP servers, linters, and formatters through a single interface.
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                -- Bash/sh
                "bash-language-server", -- Language server for Bash.
                "shellcheck",  -- Static checker for Bash/sh 
                "shfmt", -- A shell formatter (sh/bash/mksh).
                -- Python 
                "pyright", -- Full-Featured StaticlLanguage server for Python
                "flake8",  -- Python style linter, flake8 is a python tool that glues together pycodestyle, pyflakes, mccabe, and third-party plugins to check the style and quality of some Python code. 
                "black", -- Uncompromising code formatter for python
                "isort", -- Formatter to sort imports alphabetically dor Python.
                "autopep8", -- A tool that automatically formats Python code to conform to the PEP 8 style guide..
                "mypy", -- Static Type Checker for Python
                -- Lua
                "stylua",      -- An opinionated Lua code formatter.
                -- Rust
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        ---@class PluginLspOpts
        opts = {
            ---@type lspconfig.options
            servers = {
                -- pyright will be automatically installed with mason and loaded with lspconfig
                pyright = {},
            },
        },
    },
    {
        -- Integrates Tree Sitter (https://github.com/tree-sitter/tree-sitter), which parses code to generate a concrete syntax tree.
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            -- add tsx and treesitter
            vim.list_extend(opts.ensure_installed, {
                "regex",
                "bash",
                "html",
                "json",
                "yaml",
                "lua",
                "markdown",
                "markdown_inline",
                "python",
            })
        end,
    },
    {
        "ThePrimeagen/refactoring.nvim",
        requires = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-treesitter/nvim-treesitter" }
        },
        opts = function()
            require('refactoring').setup({
                prompt_func_return_type = {
                    go = false,
                    java = false,

                    cpp = false,
                    c = false,
                    h = false,
                    hpp = false,
                    cxx = false,
                },
                prompt_func_param_type = {
                    go = false,
                    java = false,

                    cpp = false,
                    c = false,
                    h = false,
                    hpp = false,
                    cxx = false,
                },
                printf_statements = {},
                print_var_statements = {},
            })
        end
    },
    -- Query the the Language Server Protocol to view
    -- a tree of defined symbols by scope
    {
        "simrat39/symbols-outline.nvim",
        cmd = "SymbolsOutline",
        keys = { {
            "<leader>cs",
            "<cmd>SymbolsOutline<cr>",
            desc = "Symbols Outline"
        } },
        config = true,
    },
}