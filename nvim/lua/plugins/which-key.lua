return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {},
  config = function()
    -- Hide these which-key mappings
    local hidden = {
      "<leader>b",
      "<Left>",
      "<Right>",
      "<Up>",
      "<Down>",
      -- "<leader>u",
    }

    local wk = require("which-key")
    for _, key in ipairs(hidden) do
      wk.add({
        key,
        hidden = true,
      })
    end

    wk.add({
      "<leader>c",
      desc = "Code",
    })

    -- wk.add({
    --   "<leader>sk",
    --   desc = "Code",
    -- })
  end,
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
