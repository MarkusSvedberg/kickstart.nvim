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

vim.lsp.config('csharp-language-server', {
  cmd = { 'csharp-ls' },
  filetypes = { 'cs' },
  root_dir = vim.fs.root(0, { '*.sln', '.git' }),
})

vim.lsp.enable 'csharp-language-server'

vim.lsp.config('zls', {
  settings = {
    zls = {
      enable_build_on_save = true,
    },
  },
})
vim.lsp.enable 'zls'

return {}
