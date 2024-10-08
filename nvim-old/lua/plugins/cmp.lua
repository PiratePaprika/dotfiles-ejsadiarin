local compare = require("cmp.config.compare")

return {
  {
    "hrsh7th/nvim-cmp",
    opts = {
      window = {
        completion = {
          side_padding = 1,
          winhighlight = "Normal:FloatNormal,FloatBorder:FloatNormal,CursorLine:TelescopeSelection,Search:None",
          border = "rounded",
        },
        -- completion = {
        --   side_padding = 0,
        --   col_offset = 3,
        --   winhighlight = "Normal:FloatNormal,FloatBorder:FloatNormal,CursorLine:TelescopeSelection,Search:None",
        --   border = "rounded",
        -- },
        documentation = {
          side_padding = 2,
          winhighlight = "Normal:FloatNormal,FloatBorder:FloatNormal,CursorLine:TelescopeSelection,Search:None",
          border = "rounded",
          -- focusable = true,
        },
        -- completion = { border = vim.g.border_style, scrolloff = vim.o.scrolloff, scrollbar = "║" },
        -- documentation = { border = vim.g.border_style, scrolloff = vim.o.scrolloff, scrollbar = "║" },
        -- preview = { border = vim.g.border_style, scrolloff = vim.o.scrolloff, scrollbar = "║" },
      },
      -- sorting = defaults.sorting,
      sorting = {
        comparators = {
          -- Original order: https://github.com/hrsh7th/nvim-cmp/blob/538e37ba87284942c1d76ed38dd497e54e65b891/lua/cmp/config/default.lua#L65-L74
          -- Definitions of compare function https://github.com/hrsh7th/nvim-cmp/blob/main/lua/cmp/config/compare.lua
          compare.offset,
          compare.recently_used, -- higher
          compare.score,
          compare.exact, -- lower
          compare.kind, -- higher (prioritize snippets)
          compare.locality,
          compare.length,
          compare.order,
        },
      },
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, item)
          -- load lspkind icons
          -- item.kind = string.format(" %s  %s", user_icons.kinds[item.kind], item.kind)
          local icons = require("lazyvim.config").icons.kinds
          if icons[item.kind] then
            item.kind = icons[item.kind] .. item.kind
          end

          item.menu = ({
            cmp_tabnine = "[Tabnine]",
            copilot = "[Copilot]",
            spell = "[Spell]",
            buffer = "[Buffer]",
            orgmode = "[Org]",
            look = "[Dictionary]",
            nvim_lsp = "[LSP]",
            git = "[Git]",
            nvim_lua = "[Lua]",
            path = "[Path]",
            tmux = "[Tmux]",
            latex_symbols = "[Latex]",
            luasnip = "[Snippet]",
          })[entry.source.name]

          local label = item.abbr
          local truncated_label = vim.fn.strcharpart(label, 0, 50)
          if truncated_label ~= label then
            item.abbr = truncated_label .. "..."
          end

          return item
        end,
      },
    },
  },
  {
    "L3MON4D3/LuaSnip",
    opts = {
      history = true,
      region_check_events = "InsertEnter",
      delete_check_events = "TextChanged,InsertLeave",
    },
    -- keys = function()
    --   return {}
    -- end,
  },
  -- {
  --   "hrsh7th/nvim-cmp",
  --   version = false, -- last release is way too old
  --   event = "InsertEnter",
  --   dependencies = {
  --     "hrsh7th/cmp-nvim-lsp",
  --     "hrsh7th/cmp-buffer",
  --     "hrsh7th/cmp-path",
  --     "saadparwaiz1/cmp_luasnip",
  --     "hrsh7th/cmp-emoji",
  --   },
  --   opts = function()
  --     local has_words_before = function()
  --       unpack = unpack or table.unpack
  --       local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  --       return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  --     end
  --     vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
  --     local cmp = require("cmp")
  --     local defaults = require("cmp.config.default")()
  --     local luasnip = require("luasnip")
  --     return {
  --       completion = {
  --         completeopt = "menu,menuone,noinsert",
  --       },
  --       snippet = {
  --         expand = function(args)
  --           require("luasnip").lsp_expand(args.body)
  --         end,
  --       },
  --       mapping = cmp.mapping.preset.insert({
  --         ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
  --         ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
  --         ["<C-b>"] = cmp.mapping.scroll_docs(-4),
  --         ["<C-f>"] = cmp.mapping.scroll_docs(4),
  --         ["<C-Space>"] = cmp.mapping.complete(),
  --         ["<C-e>"] = cmp.mapping.abort(),
  --         ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  --         ["<S-CR>"] = cmp.mapping.confirm({
  --           behavior = cmp.ConfirmBehavior.Replace,
  --           select = true,
  --         }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  --         ["<C-CR>"] = function(fallback)
  --           cmp.abort()
  --           fallback()
  --         end,
  --         -- setup supertab (tab for autocompletion)
  --         ["<Tab>"] = cmp.mapping(function(fallback)
  --           if cmp.visible() then
  --             -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
  --             cmp.select_next_item()
  --           -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
  --           -- this way you will only jump inside the snippet region
  --           elseif luasnip.expand_or_jumpable() then
  --             luasnip.expand_or_jump()
  --           elseif has_words_before() then
  --             cmp.complete()
  --           else
  --             fallback()
  --           end
  --         end, { "i", "s" }),
  --         ["<S-Tab>"] = cmp.mapping(function(fallback)
  --           if cmp.visible() then
  --             cmp.select_prev_item()
  --           elseif luasnip.jumpable(-1) then
  --             luasnip.jump(-1)
  --           else
  --             fallback()
  --           end
  --         end, { "i", "s" }),
  --       }),
  --       sources = cmp.config.sources({
  --         { name = "nvim_lsp" },
  --         { name = "luasnip" },
  --         { name = "path" },
  --       }, {
  --         { name = "buffer" },
  --       }),
  --       window = {
  --         -- completion = {
  --         --   side_padding = 0,
  --         --   winhighlight = "Normal:Pmenu,FloatBorder:PmenuSel,CursorLine:PmenuSel,Search:None",
  --         -- },
  --         completion = cmp.config.window.bordered(),
  --         documentation = cmp.config.window.bordered(),
  --       },
  --       formatting = {
  --         -- fields = { "menu", "abbr", "kind" },
  --         fields = { "kind", "abbr", "menu" },
  --         format = function(_, item)
  --           local icons = require("lazyvim.config").icons.kinds
  --           if icons[item.kind] then
  --             item.kind = icons[item.kind] .. item.kind
  --           end
  --           return item
  --         end,
  --       },
  --       experimental = {
  --         ghost_text = {
  --           hl_group = "CmpGhostText",
  --         },
  --       },
  --       sorting = defaults.sorting,
  --     }
  --   end,
  --   ---@param opts cmp.ConfigSchema
  --   config = function(_, opts)
  --     for _, source in ipairs(opts.sources) do
  --       source.group_index = source.group_index or 1
  --     end
  --     require("cmp").setup(opts)
  --   end,
  -- },
}
