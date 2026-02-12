vim.lsp.config('clangd', {
  cmd = {
    'clangd',
    -- This enables the built-in "linter" functionality for C/C++
    '--clang-tidy',
    '--background-index',
    '-j=4',
  },
  filetypes = { 'c', 'h', 'cpp', 'hpp', 'cc', 'hh' },
})
vim.lsp.enable 'clangd'

vim.lsp.config('rust_analyzer', {
  settings = {
    ['rust-analyzer'] = {
      -- This ensures rust-analyzer's internal diagnostics are off
      -- (as you had before)
      diagnostics = {
        enable = false,
      },
      -- This enables Clippy and runs it on every save
      check = {
        command = 'clippy',
      },
      checkOnSave = true,
    },
  },
})
vim.lsp.enable 'rust_analyzer'

vim.lsp.config('zls', {
  settings = {
    zls = {
      enable_build_on_save = true,
    },
  },
})
vim.lsp.enable 'zls'

return {}
