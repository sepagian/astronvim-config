return {
  {
    "nvim-mini/mini.bracketed",
    version = "*",
    config = function() require("mini.bracketed").setup() end,
  },
  {
    "nvim-mini/mini.icons",
    opts = {
      file = {
        ["README.md"] = { glyph = "󰂺" },
      },
      filetype = {
        c = { glyph = "" },
        go = { glyph = "" },
      },
    },
    specs = {
      {
        "nvim-neo-tree/neo-tree.nvim",
        opts = {
          default_component_configs = {
            icon = {
              provider = function(icon, node)
                local text, hl
                local mini_icons = require "mini.icons"
                if node.type == "file" then
                  text, hl = mini_icons.get("file", node.name)
                end

                if text then icon.text = text end
                if hl then icon.highlight = hl end
              end,
            },
          },
        },
      },
    },
  },
  {
    "nvim-mini/mini.surround",
    version = "*",
    opts = {
      mappings = {
        add = "sa", -- Add surrounding in Normal and Visual modes
        delete = "sd", -- Delete surrounding
        find = "sf", -- Find surrounding (to the right)
        find_left = "sF", -- Find surrounding (to the left)
        highlight = "sh", -- Highlight surrounding
        replace = "sr", -- Replace surrounding

        suffix_last = "l", -- Suffix to search with "prev" method
        suffix_next = "n", -- Suffix to search with "next" method
      },
    },
  },
}
