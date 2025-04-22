-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- Stop netrw from loading
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

-- Change path to current opened file or directory
local function get_path(str)
  return str:match '(.*[/\\])'
end

if #vim.v.argv > 2 then
  local path = vim.v.argv[3]

  -- Check if path exists
  if vim.uv.fs_stat(path) then
    -- Is it a directory?
    if vim.fn.isdirectory(path) == 1 then
      vim.fn.chdir(path)
    else
      -- If it is a file, get parent
      local dirpath = vim.fs.dirname(path)
      vim.fn.chdir(dirpath)
    end
  end
end

return {}
