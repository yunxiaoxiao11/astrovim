local M={}

-- common opts for vim keymap
local common_opts = { expr = true, silent = true }

-- vim keymaps, used to mapping modes, like n,v,o,x
function M.vim_keymaps(modes,key,mapping,opts)
  opts = vim.tbl_extend("force", common_opts, opts or {})
  local v_map = vim.api.nvim_set_keymap
  for _, mode in ipairs(modes) do
    v_map(mode, key, mapping, opts)
  end
end

return M
