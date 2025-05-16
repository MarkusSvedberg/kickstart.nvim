local builtin = require 'telescope.builtin'
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Find files in project' })
vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Find files in git repository' })

vim.keymap.set('n', '<leader>ff', function()
  builtin.find_files { hidden = true }
end, { desc = 'Find files in project (including hidden)' })

vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string { search = vim.fn.input 'Grep > ' }
end, { desc = 'Grep search in project' })

vim.keymap.set('n', '<leader>pw', function()
  builtin.grep_string()
end, { desc = 'Grep word under cursor' })

return {}
