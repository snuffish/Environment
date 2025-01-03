return {
  {
    "neovim/nvim-lspconfig",
    opts = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()

      keys[#keys + 1] = {
        "K",
        false,
      }

      -- return {
      --   completion = {
      --     trigger = {
      --       show_on_insert_on_trigger_character = false,
      --     },
      --   },
      -- }

      -- keys[#keys + 1] = {
      --   "<leader>cA", false
      -- }
      -- keys[#keys + 1] = {
      --   "<leader>cQ",
      --   function()
      --     print("HEEEEJ")
      --   end,
      --   -- expr = true,
      --   desc = "MY OWN KEYMAP",
      --   -- has = "rename",
      -- }
    end,
    keys = {},
  },
  {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = {
      { "<leader>O", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    opts = {},
    config = function()
      require("outline").setup({})
    end,
  },
  {
    "folke/noice.nvim",
    optional = true,
    opts = {
      presets = { inc_rename = true },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "DasGandlaf/nvim-autohotkey",
    },
    config = function()
      local cmp = require("cmp")

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },

        mapping = cmp.mapping.preset.insert({
          ["<PageDown>"] = cmp.mapping.scroll_docs(-4),
          ["<PageUp>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<Esc>"] = cmp.mapping.close(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "autohotkey" },
        }, {
          { name = "buffer" },
        }),
      })
    end,
  },
  {
    "blink.cmp",
    config = function()
      require("blink.cmp").setup()
      require("blink.cmp").setup({
        completion = {
          menu = {
            draw = {
              treesitter = {
                -- Your treesitter configuration here
              },
            },
          },
        },
      })
    end,
  },
}

