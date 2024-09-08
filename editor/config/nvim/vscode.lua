if not vim.g.vscode then
    return
end

vim.keymap.set("n", "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "

vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
