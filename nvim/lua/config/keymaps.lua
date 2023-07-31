-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

--[[ Special Keys ]]
map({ "i", "v", "c" }, '<C-[]>', '<Esc>', { silent = true }) -- remap control [ to be escape in insert, visual, and command mode

--[[ Navigation ]]
-- -- Remap for Dealing with Word Wrap Etc. Move based on Visual/Physical Lines
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, '<Up>', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ "n", "x" }, '<Down>', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "i", }, '<Up>', "v:count == 0 ? '<C-o>gk' : 'k'", { expr = true, silent = true })
map({ "i", }, '<Down>', "v:count == 0 ? '<C-o>gj' : 'j'", { expr = true, silent = true })
map("n", "<A-0>", "g0") -- Move to the first character of the visual line in wraps

-- -- Navigate NVim Panes Better
map('n', '<c-k>', ':wincmd k<CR>', { desc = "move to pane above" })
map('n', '<c-j>', ':wincmd j<CR>', { desc = "move to pane below" })
map('n', '<c-h>', ':wincmd h<CR>', { desc = "move to pane left" })
map('n', '<c-l>', ':wincmd l<CR>', { desc = "move to pane right" })
-- map('n', '<c-Down>', ':wincmd j<CR>', { desc = "move to pane below" })
-- map('n', '<c-Up>', ':wincmd k<CR>', { desc = "move to pane above" })
-- map('n', '<c-Left>', ':wincmd h<CR>', { desc = "move to pane left" })
-- map('n', '<c-Right>', ':wincmd l<CR>', { desc = "move to pane right" })

-- -- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- -- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })
map("n", "<A-Down>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-Up>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-Down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-Up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-Down>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-Up>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- -- Move cursor in modes
map("i", "<C-A>", "<HOME>") -- Go to the beginning of current line in insert mode quickly
map("i", "<C-E>", "<END>")  -- Go to the end of current line in insert mode quickly
map("c", "<C-A>", "<HOME>") -- Go to beginning of command in command-line mode
map("c", "<C-E>", "<END>")  -- Go to end of command in command-line mode

-- --Move Chunks of Code in Visual Mode
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- -- half Page Jumps with fixed cursor position
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- -- Keep Cursor Fixed During Search
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- -- Quick Fix Naivgation
map("n", "<C-k>", "<cmd>cnext<CR>zz")
map("n", "<C-j>", "<cmd>cprev<CR>zz")
map("n", "<leader>k", "<cmd>lnext<CR>zz")
map("n", "<leader>j", "<cmd>lprev<CR>zz")

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")
map("v", "<TAB>", "<gv")
map("v", "<S-TAB>", ">gv")

-- -- Misc
map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })         -- Disable default <Space> keymap
map({ "n", "x" }, ";", ":")                                      -- Save key strokes (now we do not need to press shift to enter command mode).
map("t", "<Esc>", [[<c-\><c-n>]])                                -- Use Esc to quit builtin terminal
map("n", "<leader>pv", vim.cmd.Ex)                               -- Execute Ex command
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true }) -- Make file executable
map("n", "/", [[/\v]])                                           -- Always use very magic mode for searching
map("x", "$", "g_")                                              -- Do not include white space characters when using $ in visual mode. See https://vi.stackexchange.com/q/12607/15292
map("i", "<C-D>", "<DEL>")                                       -- Delete the character to the right of the cursor

--[[ Text Manipulation ]]
-- -- Spell Check
map("n", "<F11>", "<cmd>set spell!<cr>", { desc = "toggle spell" })
map("i", "<F11>", "<c-o><cmd>set spell!<cr>", { desc = "toggle spell" })

-- -- search
map('n', '<leader>h', ':nohlsearch<CR>', { desc = 'Clear Highlight' })
map({ "n", "x" }, "gw", "*N", { desc = "Search word under cursor" })

-- -- Saner behaviour of N and n: https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- Dont contaminate:  https://stackoverflow.com/q/10723700/6064933.
map("x", "p", '"_c<Esc>p') -- Replace visual selection with text in register, but not contaminate the register

-- -- Case Manipulation
map("i", "<c-u>", "<Esc>viwUea", { desc = "make upper case" }) -- Turn the word under cursor to upper case
map("i", "<c-t>", "<Esc>b~lea", { desc = "make title case" })  -- Turn the current word into title case

-- -- Pasting, see https://stackoverflow.com/a/1346777/6064933
map("x", "<leader>p", [["_dP]], { desc = "Register protected Paste" }) -- Paste without destroying register
map("n", "<c-p>", "m`o<ESC>p``", { desc = "paste below current line" })
map("n", "<c-P>", "m`O<ESC>p``", { desc = "paste above current line" })

-- -- Formatting
map("n", "<leader>f", vim.lsp.buf.format)

-- -- -- Misc
-- map("n", "<leader>st", "<cmd>call utils#SynGroup()<cr>", { desc = "check syntax group" }) -- check the syntax group of current cursor position
-- map("n", "<leader>y", "<cmd>%yank<cr>", { desc = "yank entire buffer" })                  -- Copy entire buffer.
-- -- Insert a blank line below or above current line (do not move the cursor),
-- -- see https://stackoverflow.com/a/16136133/6064933
-- map("n", "<space>o", "printf('m`%so<ESC>``', v:count1)", {
--     expr = true,
--     desc = "insert line below",
-- })
-- map("n", "<space>O", "printf('m`%sO<ESC>``', v:count1)", {
--     expr = true,
--     desc = "insert line above",
-- })
-- -- Reselect the text that has just been pasted, see also https://stackoverflow.com/a/4317090/6064933.
-- map("n", "<leader>v", "printf('`[%s`]', getregtype()[0])", {
--     expr = true,
--     desc = "reselect last pasted area",
-- })
-- -- Change text without putting it into the vim register,
-- -- see https://stackoverflow.com/q/54255/6064933
-- map("n", "c", '"_c')
-- map("n", "C", '"_C')
-- map("n", "cc", '"_cc')
-- map("x", "c", '"_c')

--[[ Saving and Reading ]]
-- -- Saving
map({ "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
map({ "v", "n", "s" }, "<C-S>", "<cmd>wall<cr><esc>", { desc = "Save file" })
map({ "i" }, "<C-s>", "<cmd>w<cr><cmd>i<cr><esc>", { desc = "Save file" })
map({ "i" }, "<C-S>", "<cmd>wall<cr><cmd>i<cr><esc>", { desc = "Save file" })
-- -- Quitting
map("n", "<C-w>", "<cmd>wq<cr>", { silent = true, desc = "save and quit" })
map("n", "<leader>W", "<cmd>wall<cr><cmd>qa!<cr>", { silent = true, desc = "save all and quit all" })
-- -- Save and Quit
map("n", "<C-q>", "<cmd>xq<cr>", { silent = true, desc = "quit current window" })
map("n", "<C-Q>", "<cmd>qa!<cr>", { silent = true, desc = "abandon and quit all" })
-- -- creation
map("n", "<leader>n", "<cmd>enew<cr>", { desc = "New File" })

--[[ Tmux ]]
map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

--[[ harpoon ]]
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
map("n", "<leader>a", mark.add_file)
map("n", "<C-e>", ui.toggle_quick_menu)
map("n", "<C-h>", function() ui.nav_file(1) end)
map("n", "<C-t>", function() ui.nav_file(2) end)
map("n", "<C-n>", function() ui.nav_file(3) end)
map("n", "<C-s>", function() ui.nav_file(4) end)

--[[ Telescope ]]
local builtin = require('telescope.builtin')
map('n', '<leader>pf', builtin.find_files, {})
map('n', '<C-p>', builtin.git_files, {})
map('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
map('n', '<leader>vh', builtin.help_tags, {})

map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "help tags" })
map("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "document symbols" })


-- undo tree
map("n", "<leader>u", vim.cmd.UndotreeToggle)

-- toruble
map("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
    { silent = true, noremap = true }
)

-- zen mode
map("n", "<leader>zz", function()
    require("zen-mode").setup {
        window = {
            width = 90,
            options = {}
        },
    }
    require("zen-mode").toggle()
    vim.wo.wrap = false
    vim.wo.number = true
    vim.wo.rnu = true
    ColorMyPencils()
end)
map("n", "<leader>zZ", function()
    require("zen-mode").setup {
        window = {
            width = 80,
            options = {}
        },
    }
    require("zen-mode").toggle()
    vim.wo.wrap = false
    vim.wo.number = false
    vim.wo.rnu = false
    vim.opt.colorcolumn = "0"
    ColorMyPencils()
end)

-- Refactoring
vim.api.nvim_set_keymap("v", "<leader>ri", [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
    { noremap = true, silent = true, expr = false })

-- Debugging
local dap = require 'dap'
local dapui = require 'dapui'
vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Debug: Start/Continue' })
vim.keymap.set('n', '<F1>', dap.step_into, { desc = 'Debug: Step Into' })
vim.keymap.set('n', '<F2>', dap.step_over, { desc = 'Debug: Step Over' })
vim.keymap.set('n', '<F3>', dap.step_out, { desc = 'Debug: Step Out' })
vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
vim.keymap.set('n', '<leader>B', function()
    dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
end, { desc = 'Debug: Set Breakpoint' })
-- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
vim.keymap.set('n', '<F7>', dapui.toggle, { desc = 'Debug: See last session result.' })

--[[ Diagnostic keymaps ]]
map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
map('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

--[[ Fun ]]
map("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

--[[ Lazy ]]
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "open lazy" })
map("n", "<leader><leader>", function()
    vim.cmd("so")
end)

--[[ Misc ]]
map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })
