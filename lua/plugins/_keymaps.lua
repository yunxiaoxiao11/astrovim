local utils = require 'plugins.utils'

return {
  'AstroNvim/astrocore',
  ---@param opts AstroCoreOpts
  opts = function(_, opts)
    if not opts.mappings then opts.mappings = require('astrocore').empty_map_table() end
    local maps = opts.mappings
    utils.vim_keymaps({ 'n', 'v' }, 'H', "v:count == 0 ? 'g^' : '^'", { desc = 'Line start' })
    utils.vim_keymaps({ 'n', 'v' }, 'L', "v:count == 0 ? 'g$' : '$'", { desc = 'Line end' })

    if maps then
      local n = {
        ['<leader>u'] = { '<NOP>', desc = 'Do nothing' },
        ['gj'] = { '<c-o>', desc = 'Jumplist back' },
        ['gk'] = { '<c-i>', desc = 'Jumplist forward' },
        ['<leader>j'] = { 'J', desc = 'J' },
        ['<leader>gi'] = { 'gi', desc = 'Go to Insert' },
        ['U'] = { '<C-R>', desc = 'redo' },
        ['K'] = { function() require('astrocore.buffer').nav(vim.v.count1) end, desc = 'Left buffer' },
        ['J'] = { function() require('astrocore.buffer').nav(-vim.v.count1) end, desc = 'Right buffer' },
        ["<Leader>bo"] = { function() require("astrocore.buffer").close_all(true) end, desc = "Close other buffers" },
        ["<Leader>bh"] = { function() require("astrocore.buffer").close_left() end, desc = "Close left buffers" },
        ["<Leader>bl"] = { function() require("astrocore.buffer").close_right() end, desc = "Close right buffers" },
        ["<A-j>"] = { "<cmd>m .+1<cr>==", desc = "Move Down" },
        ["<A-k>"] = { "<cmd>m .-2<cr>==", desc = "Move Up" },
      }
      local i = {
        ['<A-h>'] = { '<Left>' },
        ['<A-j>'] = { '<Down>' },
        ['<A-k>'] = { '<Up>' },
        ['<A-l>'] = { '<Right>' },
        ['<A-a>'] = { '<ESC>^i' },
        ['<A-w>'] = { '<End>' },
        ['<A-u>'] = { '<Backspace>' },
        ['<A-i>'] = { '<Delete>' },
        ['<A-n>'] = { '<C-o><C-e>' },
        ['<A-m>'] = { '<C-o><C-y>' },

        ['<C-e>'] = { '<C-o><C-e>' },
        ['<C-y>'] = { '<C-o><C-y>' },
        ['<C-d>'] = { '<C-o><C-d>' },
        ['<C-u>'] = { '<C-o><C-u>' },

        ['<A-S-J>'] = { '<esc><cmd>m .+1<cr>==<leader>gi', desc = 'Move down' },
        ['<A-S-K>'] = { '<esc><cmd>m .-2<cr>==<leader>gi', desc = 'Move up' },
        ['<A-[>'] = { "<esc>l<cmd>lua require('nvim-autopairs.fastwrap').show()<cr>", desc = 'fastwrap' },
      }
      local v = {
        ['<M-J>'] = { ":m '>+1<cr>gv=gv", desc = 'Move down' },
        ['<M-K>'] = { ":m '<-2<cr>gv=gv", desc = 'Move up' },
      }
      maps.n = vim.tbl_deep_extend("force", maps.n, n)
      maps.i = vim.tbl_deep_extend("force", maps.i, i)
      maps.v = vim.tbl_deep_extend("force", maps.v, v)

      -- unmap
      maps.n['\\'] = false
      maps.n[']b'] = false
      maps.n['[b'] = false
      maps.i['<A-e>'] = false
    end
    opts.mappings = maps
  end,
}
