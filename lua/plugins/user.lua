-- You can also add or configure plugins by creating files in this `plugins/` folder

local get_icon = require("astroui").get_icon

-- Here are some examples:
---@type LazySpec
return {

  -- == Examples of Adding Plugins ==
  -- install with yarn or npm
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    -- build = function() vim.fn["mkdp#util#install"]() end,
    init = function() vim.g.mkdp_filetypes = { "markdown" } end,
    ft = { "markdown" },
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    "tadmccorkle/markdown.nvim",
    ft = "markdown", -- or 'event = "VeryLazy"'
    opts = {
      -- configuration here or empty for defaults
    },
  },
  {
    "MeanderingProgrammer/markdown.nvim",
    name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
    config = function() require("render-markdown").setup {} end,
  },
  {
    "danymat/neogen",
    config = true,
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*"
  },
  -- "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        manual_mode = true,
        detection_methods = { "pattern", "lsp" },
        silent_chdir = false,
      }
    end,
  },
  {
    "cameron-wags/rainbow_csv.nvim",
    config = true,
    ft = {
      "csv",
      "tsv",
      "csv_semicolon",
      "csv_whitespace",
      "csv_pipe",
      "rfc_csv",
      "rfc_semicolon",
    },
    cmd = {
      "RainbowDelim",
      "RainbowDelimSimple",
      "RainbowDelimQuoted",
      "RainbowMultiDelim",
    },
  },

  {
    "cryptomilk/nightcity.nvim",
    config = function()
      require("nightcity").setup { style = "kabuki" }
      vim.cmd.colorscheme "nightcity"
    end,
  },

  -- == Examples of Overriding Plugins ==
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      opts.filesystem.filtered_items.visible = true
      opts.filesystem.filtered_items.hide_dotfiles = false
      opts.filesystem.filtered_items.hide_gitignored = true
    end,
    --       reveal_fsync_root_with_cwd = true,
    --       respect_buf_cwd = true,
    --       update_focused_file = {
    --         enable = true,
    --         update_root = true,
    --         force_cwd = true,
    --       },
    --     }
    --   end,
  },
  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.opts.hl = "Function"
      opts.section.footer.opts.hl = "Comment"
      opts.hl_shortcut = "Error"
      opts.section.header.val = {
        [[                           _                              ]],
        [[                        _ooOoo_                           ]],
        [[                       o8888888o                          ]],
        [[                       88" . "88                          ]],
        [[                       (| -_- |)                          ]],
        [[                       O\  =  /O                          ]],
        [[                    ____/`---'\____                       ]],
        [[                  .'  \\|     |//  `.                     ]],
        [[                 /  \\|||  :  |||//  \                    ]],
        [[                /  _||||| -:- |||||_  \                   ]],
        [[                |   | \\\  -  /'| |   |                   ]],
        [[                | \_|  `\`---'//  |_/ |                   ]],
        [[                \  .-\__ `-. -'__/-.  /                   ]],
        [[              ___`. .'  /--.--\  `. .'___                 ]],
        [[           ."" '<  `.___\_<|>_/___.' _> \"".              ]],
        [[          | | :  `- \`. ;`. _/; .'/ /  .' ; |             ]],
        [[          \  \ `-.   \_\_`. _.'_/_/  -' _.' /             ]],
        [[===========`-.`___`-.__\ \___  /__.-'_.'_.-'==============]],
        [[                        `=--=-'                    hjw    ]],
      }
      opts.config.layout = {
        -- { type = "padding", val = vim.fn.max { 1, vim.fn.floor(vim.fn.winheight(0) * 0.2) } },
        { type = "padding", val = 1 },
        opts.section.header,
        { type = "padding", val = 1 },
        opts.section.buttons,
        { type = "padding", val = 2 },
        opts.section.footer,
      }
      opts.section.buttons.val = {
        opts.button("LDR n  ", get_icon("FileNew", 2, true) .. "New File  "),
        opts.button("LDR f f", get_icon("Search", 2, true) .. "Find File  "),
        opts.button("LDR f o", get_icon("DefaultFile", 2, true) .. "Recents  "),
        opts.button("LDR f p", get_icon("FolderOpen", 2, true) .. "Projects  "),
        opts.button("LDR f w", get_icon("WordFile", 2, true) .. "Find Word  "),
        opts.button("LDR f '", get_icon("Bookmarks", 2, true) .. "Bookmarks  "),
        opts.button("LDR S l", get_icon("Refresh", 2, true) .. "Last Session  "),
      }
      return opts
    end,
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },
}
