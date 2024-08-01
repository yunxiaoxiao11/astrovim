-- local utils = require 'plugins.utils'

return {
  {
    "kana/vim-textobj-entire",
    dependencies = {
      "kana/vim-textobj-user",
    },
    config = function()
      vim.g.textobj_entire_no_default_key_mappings = 1
      -- utils.vim_keymaps({'o','x'},'ag',"<Plug>(textobj-entire-a)",{ desc = 'Entire around'})
      -- utils.vim_keymaps({'o','x'},'ig',"<Plug>(textobj-entire-i)",{ desc = 'Entire intent'})
      local map = vim.api.nvim_set_keymap
      local opt = { noremap = true, silent = true }
      map('o', 'ag', '<Plug>(textobj-entire-a)', opt)
      map('x', 'ag', '<Plug>(textobj-entire-a)', opt)
      map('o', 'ig', '<Plug>(textobj-entire-i)', opt)
      map('x', 'ig', '<Plug>(textobj-entire-i)', opt)
    end,
  },
}
