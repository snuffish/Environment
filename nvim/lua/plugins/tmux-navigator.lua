return {
  "christoomey/vim-tmux-navigator",
  vim.keymap.set("n", "<C-l>", "TmuxNavigateLeft<CR>"),
  vim.keymap.set("n", "<C-k>", "TmuxNavigateRight<CR>"),
  vim.keymap.set("n", "<C-j>", "TmuxNavigateDown<CR>"),
  vim.keymap.set("n", "<C-h>", "TmuxNavigateLeft<CR>"),
}
