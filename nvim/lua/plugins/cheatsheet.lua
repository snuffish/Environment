return {
  "doctorfree/cheatsheet.nvim",
  event = "VeryLazy",
  dependencies = {
    { "nvim-telescope/telescope.nvim" },
    { "nvim-lua/popup.nvim" },
    { "nvim-lua/plenary.nvim" },
  },
  opts = {
    bundled_cheetsheets = {
      enabled = { "default", "lua", "markdown", "regex", "netrw", "unicode" },
      disabled = { "nerd-fonts" },
    },
    bundlebd_plugin_cheatsheets = {
      enabled = {
        "auto-session",
        "goto-preview",
        "octo.nvim",
        "telescope.nvim",
        "vim-easy-align",
        "vim-sandwicchh",
      },
      disabled = { "gitsigns" },
    },
    include_only_installed_plugins = true,
  },
  config = function(_, opts)
    local ctactions = require("cheatsheet.telescope.actions")
    require("cheatsheet").setup({
      opts,
      telescope_mappings = {
        ["<CR>"] = ctactions.select_or_fill_commandline,
        ["<A-CR>"] = ctactions.select_or_execute,
        ["<C-Y>"] = ctactions.copy_cheat_value,
        ["<C-E>"] = ctactions.edit_user_cheatsheet,
      },
    })
  end,
}
