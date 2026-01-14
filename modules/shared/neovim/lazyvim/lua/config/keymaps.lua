-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- This file is loaded after all plugins
vim.keymap.set('n', '<leader>e', function()
    require("oil").open()
end, { desc = 'Open file explorer (Oil)' })

vim.keymap.set('n', '<leader>yp', function()
    local path = vim.fn.expand('%:p')
    if path == '' then
        vim.notify('No file path for current buffer', vim.log.levels.WARN)
        return
    end
    vim.fn.setreg('+', path)
    vim.notify('Copied: ' .. path)
end, { desc = 'Yank absolute file path' })
