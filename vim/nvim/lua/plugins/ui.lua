local commands = {
  -- Pickers & explorers
  {
    name = "Search: Files",
    action = function() Snacks.picker.files() end,
  },
  {
    name = "Search: Recent",
    action = function() Snacks.picker.recent() end,
  },
  {
    name = "Search: Grep",
    action = function() Snacks.picker.grep() end,
  },
  {
    name = "Search: Notifications history",
    action = function() Snacks.picker.notifications() end,
  },
  {
    name = "Search: Commands history",
    action = function() Snacks.picker.command_history() end,
  },
  -- Shortcuts
  {
    name = "Lazy: Open dashboard",
    action = ":Lazy",
  },
  {
    name = "Tab: Close",
    action = ":tabclose",
  },
  {
    name = "Tab: New",
    action = ":tabnew",
  },
  -- UI
  {
    name = "Focus active scope: Toggle",
    action = function()
      local snacks_dim = require("snacks").dim
      if snacks_dim.enabled then
        snacks_dim.disable()
      else
        snacks_dim.enable()
      end
    end,
  },
}

function show_commands()
  local items = {}

  for idx, command in ipairs(commands) do
    local item = {
      idx = idx,
      name = command.name,
      text = command.name,
      action = command.action,
    }
    table.insert(items, item)
  end

  Snacks.picker({
    title = "Command Palette",
    layout = {
      preset = "default",
      preview = false,
    },
    items = items,
    format = function(item, _)
      return {
        { item.text, item.text_hl },
      }
    end,
    confirm = function(picker, item)
      if type(item.action) == "string" then
        if item.action:find("^:") then
          picker:close()
          return picker:norm(function()
            picker:close()
            vim.cmd(item.action:sub(2))
          end)
        else
          return picker:norm(function()
            picker:close()
            local keys = vim.api.nvim_replace_termcodes(item.action, true, true, true)
            vim.api.nvim_input(keys)
          end)
        end
      end

      return picker:norm(function()
        picker:close()
        item.action()
      end)
    end,
  })
end

return {
  -- Display keymaps in a popup
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "modern",
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = "VeryLazy",
    config = function()
      require("lualine").setup({
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'diff', 'diagnostics'},
          lualine_c = {'filename'},
          lualine_x = {'encoding', 'fileformat', 'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
      })
    end,
  },
  -- Misc QoL things
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true }, -- prevents things like LSP and Treesitter attaching to the buffer when a big file is opened
      dashboard = {
        enabled = true,
        sections = {
          { section = "header" },
          {
            pane = 2,
            height = 5,
            padding = 1,
          },
          { section = "keys", gap = 1, padding = 1 },
          { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          {
            pane = 2,
            icon = " ",
            title = "Git Status",
            section = "terminal",
            enabled = function()
              return Snacks.git.get_root() ~= nil
            end,
            cmd = "git status --short --branch --renames",
            height = 5,
            padding = 1,
            ttl = 5 * 60,
            indent = 3,
          },
          { section = "startup" },
        },
      },
      indent = { enabled = true }, -- Visualize indent guides and scopes
      picker = { enabled = true }, -- Fuzzy finders
      notifier = { enabled = true },
      quickfile = { enabled = true }, -- When doing nvim somefile.txt, it will render the file as quickly as possible, before loading your plugins.
      scope = { enabled = true }, -- Scope detection
      scroll = { enabled = true }, -- Smooth scrolling
      words = { enabled = true }, -- Auto-show LSP references and quickly navigate between them
    },
    keys = {
      {
        "<C-o>",
        function() Snacks.picker.files() end,
        desc = "Search files",
      },
      {
        "<C-p>",
        function() show_commands() end,
        desc = "Command Palette",
      },
    },
  },
}
