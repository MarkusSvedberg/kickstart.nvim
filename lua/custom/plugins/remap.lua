vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })

vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'Remove next line break' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Jump half page down recenter view' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Jump half page up and recenter view' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'go to next occurence and recenter view' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'go to previous occurence and recenter view' })

vim.keymap.set('n', 'x', '"_x', { desc = 'Delete to null buffer' })
vim.keymap.set('x', '<leader>p', '"_dP', { desc = 'Paste and delete selection to null buffer' })

vim.keymap.set('n', '<leader>y', '"+y', { desc = 'Yank to system clipboard' })
vim.keymap.set('v', '<leader>y', '"+y', { desc = 'Yank to system clipboard' })
vim.keymap.set('n', '<leader>Y', '"+Y', { desc = 'Yank to system clipboard' })

vim.keymap.set('n', '<leader>d', '"_d', { desc = 'Delete to null buffer' })
vim.keymap.set('v', '<leader>d', '"_d', { desc = 'Delete selection to null buffer' })
vim.keymap.set('n', '<leader>c', '"_c', { desc = 'Delete to null buffer and enter insert mode' })

vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz', { desc = 'Go to next compiler error' })
vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz', { desc = 'Go to prev compiler error' })
vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz', { desc = 'Go to next error in list' })
vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz', { desc = 'Go to prev error in list' })

vim.keymap.set('n', '<leader>s', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>', { desc = 'Substitute word under cursor' })

vim.keymap.set('n', '<leader>E', '<cmd> lua vim.diagnostic.open_float()<CR>', { desc = 'Open diagnostic float' })
vim.keymap.set('n', '<leader>hh', '<cmd> lua vim.lsp.buf.hover() <CR>', { desc = 'Show language server hover info' })
vim.keymap.set('n', '<leader>cs', '<cmd> LspClangdSwitchSourceHeader<CR>', { desc = 'Switch to corresponding header/source file' })
vim.keymap.set('n', '<leader>ut', vim.cmd.UndotreeToggle, { desc = 'Toggle UndoTree View' })
vim.keymap.set('n', '<leader>md', '<cmd>MarkdownPreviewToggle<CR>', { desc = 'Toggle Markdown Preview' })

vim.keymap.set('n', 'Q', '<nop>') -- Unbind macro record key
vim.keymap.set({ 'n', 'i', 'c' }, '<Up>', '<nop>')
vim.keymap.set({ 'n', 'i', 'c' }, '<Down>', '<nop>')
vim.keymap.set({ 'n', 'i', 'c' }, '<Left>', '<nop>')
vim.keymap.set({ 'n', 'i', 'c' }, '<Right>', '<nop>')

-- Binds to move around in command mode without arrow keys
vim.keymap.set({ 'i', 'c' }, '<C-l>', '<Right>', { desc = 'Move right' })
vim.keymap.set({ 'i', 'c' }, '<C-h>', '<Left>', { desc = 'Move left' })
vim.keymap.set({ 'i', 'c' }, '<C-j>', '<Down>', { desc = 'Move down' })
vim.keymap.set({ 'i', 'c' }, '<C-k>', '<Up>', { desc = 'Move up' })
vim.keymap.set({ 'i', 'c' }, '<C-w>', '<S-Right>', { desc = 'Go to next word' })
vim.keymap.set({ 'i', 'c' }, '<C-b>', '<S-left>', { desc = 'Go to prev word' })

-- Tab control
vim.keymap.set('n', '<S-h>', 'gT', { desc = 'Switch to prior tab' })
vim.keymap.set('n', '<S-l>', 'gt', { desc = 'Switch to next tab' })

-- Open netrw
vim.keymap.set('n', '<leader>N', '<cmd>Explore<CR>', { desc = 'Open netrw' })

-- Use pretty hover
vim.keymap.set('n', 'K', '<cmd> lua require("pretty_hover").hover() <CR>', { desc = 'Show LSP hover (pretty)' })

-- Neogen keybind
vim.keymap.set('n', '<leader>ng', '<cmd>Neogen<CR>', { desc = 'Generate doxygen snippet' })

-- Luasnip
local ls = require 'luasnip'
vim.keymap.set({ 'i', 's' }, '<A-e>', function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { silent = true, desc = 'Cycle snippet choice' })
vim.keymap.set({ 'i', 's' }, '<A-l>', function()
  ls.jump(1)
end, { silent = true, desc = 'Move to next node in snippet' })
vim.keymap.set({ 'i', 's' }, '<A-h>', function()
  ls.jump(-1)
end, { silent = true, desc = 'Move to previous node in snippet' })

-- Command remaps
-- Bind ':w' to 'write | edit', i.e. write first and then 'edit' the file (reload). This is necessary for clang-tidy.
vim.cmd 'command! W write | edit'
vim.cmd 'command! E tabnew | Ex'

return {}
