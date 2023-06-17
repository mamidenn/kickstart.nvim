-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

return {
  "nvim-neo-tree/neo-tree.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function()
    vim.keymap.set('n', '\\', function()
      require('neo-tree.command').execute({
        toggle = true,
        reveal = true,
      })
    end, { silent = true })
    vim.keymap.set('n', '|', function()
      require('neo-tree.command').execute({
        reveal = true
      })
    end, { silent = true })
    --nnoremap / :Neotree toggle current reveal_force_cwd<cr>
    --nnoremap | :Neotree reveal<cr>
    --nnoremap gd :Neotree float reveal_file=<cfile> reveal_force_cwd<cr>
    --nnoremap <leader>b :Neotree toggle show buffers right<cr>
    --nnoremap <leader>s :Neotree float git_status<cr>
    require('neo-tree').setup {}
  end,
}
