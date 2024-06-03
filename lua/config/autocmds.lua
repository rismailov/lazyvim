-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Disable comment continuation when entering new line under comment.
vim.api.nvim_create_autocmd("FileType", {
    desc = "Disable comment continuation when entering new line under comment.",
    group = vim.api.nvim_create_augroup("format_options", { clear = true }),
    pattern = { "*" },
    callback = function()
        vim.opt.formatoptions:remove({ "c", "r", "o" })
    end,
})

-- Disable diagnostics for .env files (otherwise it complains about unexported vars)
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*.env*",
    group = vim.api.nvim_create_augroup("env_files", { clear = true }),
    callback = function(args)
        vim.diagnostic.enable(false, args)
    end,
})
