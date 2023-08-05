return {
    {
        --[[
            Fugitive is the premier Git plugin for Vim? It's "so awesome, it should be illegal". 
            That's why it's called Fugitive. The crown jewel of Fugitive is :Git (or just :G), 
            which calls any arbitrary Git command. If you know how to use Git at the command line, 
            you know how to use Fugitive.
        --]]
        "tpope/vim-fugitive"
    },
    {
        -- Fugitive-companion to interact with github. If fugitive.vim is the Git, rhubarb.vim is the Hub.
        'tpope/vim-rhubarb',
    },
    {
        'lewis6991/gitsigns.nvim', -- Adds git releated signs to the gutter, as well as utilities for managing changes
        opts = {
            -- See `:help gitsigns.txt`
            signs = {
                add = { text = '+' },
                change = { text = 'm' },
                delete = { text = '-' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
            on_attach = function(bufnr)
                vim.keymap.set('n', '<leader>gp', require('gitsigns').prev_hunk,
                    { buffer = bufnr, desc = '[G]o to [P]revious Hunk' })
                vim.keymap.set('n', '<leader>gn', require('gitsigns').next_hunk,
                    { buffer = bufnr, desc = '[G]o to [N]ext Hunk' })
                vim.keymap.set('n', '<leader>ph', require('gitsigns').preview_hunk,
                    { buffer = bufnr, desc = '[P]review [H]unk' })
            end,
        },
    },
}