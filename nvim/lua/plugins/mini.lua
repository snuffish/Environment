local spec_treesitter = require("mini.ai").gen_spec.treesitter

return {
  {
    "echasnovski/mini.ai",
    version = false,
    config = function()
      require("mini.ai").setup({
        custom_textobjects = {
          F = spec_treesitter({ a = "@function.outer", i = "@function.inner" }),
          a = require("mini.ai").gen_spec.argument({ brackets = { "%b()" } }),
          d = { "%f[%d]%d+" }, -- digits
          i = { spec_treesitter({ a = "@conditional.outer", i = "@condition.inner" }) },
        },
      })
    end,
  },
  {
    "echasnovski/mini.surround",
    optional = true,
    event = "VeryLazy",
    opts = {
      mappings = {
        add = "gza",
        delete = "gzd",
        replace = "gzc",
        find = "gzf",
        find_left = "gzF",
        highlight = "gzh",
        update_n_lines = "gzn",
        suffix_last = "l",
        suffix_next = "n",
      },
      n_lines = 500,
      custom_surroundings = {
        ["B"] = { input = { { "%b{}" }, "^.().*().$" }, output = { left = "{", right = "}" } },
      },
    },
    keys = {
      { "gz", "", desc = "+surround" },
    },
  },
  {
    "echasnovski/mini.operators",
    version = false,
    config = function()
      require("mini.operators").setup()
    end,
  },
  {
    "echasnovski/mini.move",
    version = false,
    config = function()
      require("mini.move").setup()
    end,
  },
  {
    "echasnovski/mini.splitjoin",
    version = false,
    config = function()
      require("mini.splitjoin").setup()
    end,
  },
  {
    "echasnovski/mini.basics",
    version = false,
    config = function()
      require("mini.basics").setup()
    end,
  },
}
