-- vim.notify = require("notify")

return {
  {
    "j-hui/fidget.nvim",
    lazy = false,
    opts = {
      notification = {
        poll_rate = 10, -- How frequently to update and render notifications
        filter = vim.log.levels.INFO, -- Minimum notifications level
        history_size = 128, -- Number of removed messages to retain in history
        override_vim_notify = true,
        -- configs = { default = require("fidget.option.notification").default_config },
        -- Conditionally redirect notifications to another backend
        redirect = function(msg, level, opts)
          if opts and opts.on_open then
            -- vim.notify = require("fidget.notification").notify
            -- if vim.notify == true then
            --   require("fidget.integration.nvim-notify").delegate(msg, level, opts)
            -- end
            return require("fidget.integration.nvim-notify").delegate(msg, level, opts)
          end
        end,
        view = {
          stack_upwards = true,
          icon_separator = " ",
          group_separator = "---",
          group_separator_hl = "Comment",
        },
        window = {
          winblend = 0,
          align = "bottom",
          relative = "editor",
        },
      },
      logger = {
        level = vim.log.levels.WARN, -- Minimum logging level
        max_size = 10000, -- Maximum log file size, in KB
        float_precision = 0.01, -- Limit the number of decimals displayed for floats
        -- Where Fidget writes its logs to
        path = string.format("%s/fidget.nvim.log", vim.fn.stdpath("cache")),
      },
    },
    keys = {
      {
        "<leader>sf",
        function()
          require("telescope").extensions.notify.notify(require("notify").history())
        end,
        desc = "Open notification history",
      },
    },
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 3000,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.25)
      end,
      on_open = function(win)
        vim.api.nvim_win_set_config(win, { zindex = 100 })
      end,
      background_colour = "#000000",
      stages = "static",
      render = "compact",
    },
    -- opts = {
    --   timeout = 3000,
    --   render = "compact",
    --   stages = "static",
    --   minimum_width = 20,
    --   max_height = function()
    --     return math.floor(vim.o.lines * 0.75)
    --   end,
    --   max_width = function()
    --     return math.floor(vim.o.columns * 0.25)
    --   end,
    --   on_open = function(win)
    --     vim.api.nvim_win_set_config(win, { zindex = 100 })
    --   end,
    --   on_close = function() end,
    --   background_colour = "NotifyBackground",
    --   fps = 30,
    --   icons = {
    --     DEBUG = "",
    --     ERROR = "",
    --     INFO = "",
    --     TRACE = "✎",
    --     WARN = "",
    --   },
    --   level = 1,
    --   time_formats = {
    --     notification = "%T",
    --     notification_history = "%FT%T",
    --   },
    --   top_down = true,
    -- },
    -- keys = {
    --   {
    --     "<leader>sf",
    --     function()
    --       require("telescope").extensions.notify.notify(require("notify").history())
    --     end,
    --     desc = "Open notification history",
    --   },
    -- },
    -- config = function()
    --   vim.notify.setup({
    --     minimum_width = 20,
    --     timeout = 3000,
    --     max_height = function()
    --       return math.floor(vim.o.lines * 0.75)
    --     end,
    --     max_width = function()
    --       return math.floor(vim.o.columns * 0.25)
    --     end,
    --     on_open = function(win)
    --       vim.api.nvim_win_set_config(win, { zindex = 100 })
    --     end,
    --     on_close = function() end,
    --     -- background_colour = "#000000",
    --     background_colour = "NotifyBackground",
    --     fps = 30,
    --     icons = {
    --       DEBUG = "",
    --       ERROR = "",
    --       INFO = "",
    --       TRACE = "✎",
    --       WARN = "",
    --     },
    --     level = 2,
    --     -- minimum_width = 50,
    --     stages = "static",
    --     render = "compact",
    --     -- render = "default",
    --     -- stages = "fade_in_slide_out",
    --     time_formats = {
    --       notification = "%T",
    --       notification_history = "%FT%T",
    --     },
    --     -- timeout = 5000,
    --     top_down = true,
    --   })
    --
    --   -- Utility functions shared between progress reports for LSP and DAP
    --   -- local client_notifs = {}
    --   --
    --   -- local function get_notif_data(client_id, token)
    --   --   if not client_notifs[client_id] then
    --   --     client_notifs[client_id] = {}
    --   --   end
    --   --
    --   --   if not client_notifs[client_id][token] then
    --   --     client_notifs[client_id][token] = {}
    --   --   end
    --   --
    --   --   return client_notifs[client_id][token]
    --   -- end
    --   --
    --   -- local spinner_frames = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" }
    --   --
    --   -- local function update_spinner(client_id, token)
    --   --   local notif_data = get_notif_data(client_id, token)
    --   --
    --   --   if notif_data.spinner then
    --   --     local new_spinner = (notif_data.spinner + 1) % #spinner_frames
    --   --     notif_data.spinner = new_spinner
    --   --
    --   --     notif_data.notification = vim.notify(nil, nil, {
    --   --       hide_from_history = true,
    --   --       icon = spinner_frames[new_spinner],
    --   --       replace = notif_data.notification,
    --   --     })
    --   --
    --   --     vim.defer_fn(function()
    --   --       update_spinner(client_id, token)
    --   --     end, 100)
    --   --   end
    --   -- end
    --   --
    --   -- local function format_title(title, client_name)
    --   --   return client_name .. (#title > 0 and ": " .. title or "")
    --   -- end
    --   --
    --   -- local function format_message(message, percentage)
    --   --   return (percentage and percentage .. "%\t" or "") .. (message or "")
    --   -- end
    -- end,
  },
  -- {
  --   "mrded/nvim-lsp-notify",
  --   requires = { "rcarriga/nvim-notify" },
  --   config = function()
  --     require("lsp-notify").setup({
  --       icons = {
  --         spinner = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" },
  --       },
  --     })
  --   end,
  -- },
}