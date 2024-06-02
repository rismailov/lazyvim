-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Save file
vim.keymap.set({ "n" }, "<leader>w", "<cmd>w<cr><esc>", { desc = "Save File" })

-- Center cursor when scrolling (tip from prime: https://www.youtube.com/watch?v=KfENDDEpCsI)
vim.keymap.set({ "n" }, "<C-d>", "<C-d>zz", { desc = "Scroll [d]own" })
vim.keymap.set({ "n" }, "<C-u>", "<C-u>zz", { desc = "Scroll [u]p" })

-- Move lines up & down in visual mode (using 'x' instead of 'v' because it's considered a best practice)
vim.keymap.set("x", "J", ":m '>+1<cr>gv=gv")
vim.keymap.set("x", "K", ":m '<-2<cr>gv=gv")

-----------------------
-- Terminal - start
-----------------------
-- delete default LazyVim keymaps
vim.keymap.del("n", "<leader>ft")
vim.keymap.del("n", "<leader>fT")
vim.keymap.del("n", "<c-/>")
vim.keymap.del("n", "<c-_>")

-- add custom keymap
local lazyterm = function()
    local util = require("lazyvim.util")
    util.terminal.open(nil, { cwd = util.root() })
end

vim.keymap.set("n", "<leader>t", lazyterm, { desc = "Open [t]erminal" })
-----------------------
-- Terminal - end
-----------------------

-- Snippets
local ls = require("luasnip")
vim.keymap.set({ "i", "s" }, "<c-k>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, { silent = true })
