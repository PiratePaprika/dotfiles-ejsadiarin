-- local Util = require("lazyvim.util")

return {
  {
    "smjonas/inc-rename.nvim",
    config = function()
      require("inc_rename").setup()
    end,
  },

  {
    "mg979/vim-visual-multi",
  },

  -- Tmux Navigation
  -- vim.g.tmux_navigator_no_mappings = 1
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<M-h>", "<cmd>TmuxNavigateLeft<cr>" },
      { "<M-j>", "<cmd>TmuxNavigateDown<cr>" },
      { "<M-k>", "<cmd>TmuxNavigateUp<cr>" },
      { "<M-l>", "<cmd>TmuxNavigateRight<cr>" },
      { "<M-\\>", "<cmd>TmuxNavigatePrevious<cr>" },
    },
  },

  -- {
  --   "folke/noice.nvim",
  --   opts = function(_, opts)
  --     table.insert(opts.routes, {
  --       filter = {
  --         event = "notify",
  --         find = "No information available",
  --       },
  --       opts = { skip = true },
  --     })
  --   end,
  --   presets = { inc_rename = true },
  --   cmdline = { enabled = false },
  --   messages = { enabled = false },
  -- },
  -- extend noice functionality
  --  {
  -- 	"folke/noice.nvim",
  -- 	opts = function(_, opts)
  -- 		table.insert(opts.routes, {
  -- 			filter = {
  -- 				event = "notify",
  -- 				find = "No information available",
  -- 			},
  -- 			opts = { skip = true },
  -- 		})
  -- 	end,
  -- 	presets = { inc_rename = true },
  -- },

  {
    "norcalli/nvim-colorizer.lua",
    opts = {
      filetypes = {
        "html",
        "css",
        "javascript",
        "typescript",
        "typescriptreact",
        "javascriptreact",
        "lua",
      },
      user_default_options = {
        mode = "background",
        tailwind = false, -- Enable tailwind colors
      },
    },
  },
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = true,
    opts = {
      color_square_width = 2,
    },
  },
  -- highlight css colors
  -- {
  --   "brenoprata10/nvim-highlight-colors",
  --   opts = {
  --     ft = { "css" },
  --     config = true,
  --     lazy = true,
  --   },
  -- },
  {
    "windwp/nvim-autopairs",
    event = "VeryLazy",
    -- event = "InsertEnter",
    opts = {
      disable_filetype = { "TelescopePrompt", "vim" },
    },
  },

  {
    "echasnovski/mini.surround",
    opts = {
      mappings = {
        add = "sa",
        delete = "sd",
        find = "sf",
        find_left = "sF",
        highlight = "sh",
        replace = "sr",
        update_n_lines = "sn",
      },
    },
  },
  {
    "windwp/nvim-ts-autotag",
    lazy = false,
    opts = {
      enable_close_on_slash = false,
      autotag = {
        enable = true,
      },
    },
  },
  {
    "Issafalcon/lsp-overloads.nvim",
    -- next_signature = "<C-j>"
    -- previous_signature = "<C-k>"
    -- next_parameter = "<C-l>"
    -- previous_parameter = "<C-h>"
    -- close_signature = "<A-s>"
  },

  -- {
  --   "barrett-ruth/live-server.nvim",
  --   build = "npm i -g live-server",
  --   config = true,
  --   opts = {
  --     args = { "--host=localhost", "--port=8080" },
  --   },
  --   -- :h live-server
  --   -- :LiveServerStart
  --   -- :LiveServerStop
  -- },

  {
    "AndrewRadev/inline_edit.vim",
    -- Execute :InlineEdit within the script tag.
    -- A proxy buffer is opened with only the javascript.
    -- Saving the proxy buffer updates the original one.
    -- You can reindent, lint, slice and dice as much as you like.
  },

  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "sindrets/diffview.nvim",
    -- opts = {
    --   default = {
    --     layout = "diff3_mixed",
    --   },
    -- },
    keys = {
      { "<leader>gd", "<CMD>DiffviewOpen<CR>", desc = "Git Diff View" },
      { "<leader>gf", "<CMD>DiffviewFileHistory %<CR>", desc = "Git Diff File History" },
      { "<leader>gx", "<CMD>DiffviewClose<CR>", desc = "Git Diff Close" },
    },
    config = function()
      require("diffview").setup({
        keymaps = {
          view = {
            ["<tab>"] = false,
            {
              "n",
              "<s-tab>",
              require("diffview.actions").select_next_entry,
              { desc = "Open the diff for the next file" },
            },
            { "n", "<leader>e", require("diffview.actions").toggle_files, { desc = "Toggle file panel" } },
          },
          file_panel = {
            ["<tab>"] = false,
            {
              "n",
              "<s-tab>",
              require("diffview.actions").select_next_entry,
              { desc = "Open the diff for the next file" },
            },
            { "n", "<leader>e", require("diffview.actions").toggle_files, { desc = "Toggle file panel" } },
          },
          file_history_panel = {
            ["<tab>"] = false,
            {
              "n",
              "<s-tab>",
              require("diffview.actions").select_next_entry,
              { desc = "Open the diff for the next file" },
            },
            { "n", "<leader>e", require("diffview.actions").toggle_files, { desc = "Toggle file panel" } },
          },
        },
      })
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    keys = {
      {
        "<leader>cp",
        ft = "markdown",
        "<cmd>MarkdownPreviewToggle<cr>",
        desc = "Markdown Preview",
      },
    },
    config = function()
      vim.cmd([[do FileType]])
    end,
  },

  {
    "shortcuts/no-neck-pain.nvim",
    lazy = false,
    version = "*",
    -- opts = {
    --   buffers = {
    --     scratchpad = {
    --       enabled = true,
    --     },
    --     bo = {
    --       pathToFile = "~/vault/",
    --       filetype = "md",
    --     },
    --   },
    -- },
    keys = {
      {
        "<leader>ue",
        "<CMD>NoNeckPain<CR>",
        desc = "Center the buffer",
      },
    },
    -- config = function()
    --   require("no-neck-pain").setup({
    --     buffers = {
    --       scratchPad = {
    --         -- set to `false` to
    --         -- disable auto-saving
    --         enabled = true,
    --         -- set to `nil` to default
    --         -- to current working directory
    --         location = "~/Documents/",
    --       },
    --       bo = {
    --         filetype = "md",
    --       },
    --     },
    --   })
    -- end,
  },

  {
    "laytan/cloak.nvim",
    lazy = false,
    opts = {
      enabled = true,
      cloak_character = "*",
      -- The applied highlight group (colors) on the cloaking, see `:h highlight`.
      highlight_group = "Comment",
      -- Applies the length of the replacement characters for all matched
      -- patterns, defaults to the length of the matched pattern.
      cloak_length = nil, -- Provide a number if you want to hide the true length of the value.
      -- Whether it should try every pattern to find the best fit or stop after the first.
      try_all_patterns = true,
      -- Set to true to cloak Telescope preview buffers. (Required feature not in 0.1.x)
      cloak_telescope = true,
      patterns = {
        {
          -- Match any file starting with '.env'.
          -- This can be a table to match multiple file patterns.
          file_pattern = ".env*",
          -- Match an equals sign and any character after it.
          -- This can also be a table of patterns to cloak,
          -- example: cloak_pattern = { ':.+', '-.+' } for yaml files.
          cloak_pattern = { "=.+", ":.+", "-.+" },
          -- A function, table or string to generate the replacement.
          -- The actual replacement will contain the 'cloak_character'
          -- where it doesn't cover the original text.
          -- If left empty the legacy behavior of keeping the first character is retained.
          replace = nil,
        },
      },
    },
    keys = {
      { "<leader>,h", "<CMD>CloakToggle<CR>", desc = "Hide/Toggle Cloak" },
      { "<leader>uH", "<CMD>CloakToggle<CR>", desc = "Hide/Toggle Cloak" },
    },
  },

  {
    "mfussenegger/nvim-ansible",
    keys = {
      { "<leader>,e", "", desc = "+ansible", mode = { "n", "v" } },
      {
        "<leader>,er",
        function()
          require("ansible").run()
        end,
        silent = true,
        desc = "Run Ansible Playbook",
      },
      {
        "<leader>,ea",
        "<CMD>set ft=yaml.ansible<CR>",
        silent = true,
        desc = "set ft=yaml.ansible",
      },
    },
  },
}

-- icons = {
--   misc = {
--     dots = "󰇘",
--   },
--   dap = {
--     Stopped             = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
--     Breakpoint          = " ",
--     BreakpointCondition = " ",
--     BreakpointRejected  = { " ", "DiagnosticError" },
--     LogPoint            = ".>",
--   },
--   diagnostics = {
--     Error = " ",
--     Warn  = " ",
--     Hint  = " ",
--     Info  = " ",
--   },
--   git = {
--     added    = " ",
--     modified = " ",
--     removed  = " ",
--   },
--   kinds = {
--     Array         = " ",
--     Boolean       = "󰨙 ",
--     Class         = " ",
--     Codeium       = "󰘦 ",
--     Color         = " ",
--     Control       = " ",
--     Collapsed     = " ",
--     Constant      = "󰏿 ",
--     Constructor   = " ",
--     Copilot       = " ",
--     Enum          = " ",
--     EnumMember    = " ",
--     Event         = " ",
--     Field         = " ",
--     File          = " ",
--     Folder        = " ",
--     Function      = "󰊕 ",
--     Interface     = " ",
--     Key           = " ",
--     Keyword       = " ",
--     Method        = "󰊕 ",
--     Module        = " ",
--     Namespace     = "󰦮 ",
--     Null          = " ",
--     Number        = "󰎠 ",
--     Object        = " ",
--     Operator      = " ",
--     Package       = " ",
--     Property      = " ",
--     Reference     = " ",
--     Snippet       = " ",
--     String        = " ",
--     Struct        = "󰆼 ",
--     TabNine       = "󰏚 ",
--     Text          = " ",
--     TypeParameter = " ",
--     Unit          = " ",
--     Value         = " ",
--     Variable      = "󰀫 ",
--   },
