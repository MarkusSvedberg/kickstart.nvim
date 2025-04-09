-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- Stop netrw from loading

vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

function file_exists(name)
  local f = io.open(name, 'r')
  return f ~= nil and io.close(f)
end

function get_path(str)
  return str:match '(.*[/\\])'
end

if #vim.v.argv > 2 then
  path = vim.v.argv[3]

  if not file_exists(path) then
    vim.fn.chdir(path)
  else
    vim.fn.chdir(get_path(path))
  end
end

return {}
