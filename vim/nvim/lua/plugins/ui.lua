-- TODO: https://github.com/folke/edgy.nvim ?

local commands = {
  -- Pickers & explorers
  { name = "Search: Files", action = function() Snacks.picker.files() end },
  { name = "Search: Recent", action = function() Snacks.picker.recent() end },
  { name = "Search: Grep", action = function() Snacks.picker.grep() end },
  { name = "Search: Notifications history", action = function() Snacks.picker.notifications() end },
  { name = "Search: Commands history", action = function() Snacks.picker.command_history() end },
  { name = "Search: Buffers", action = function() Snacks.picker.buffers() end },
  { name = "Search: Help pages", action = function() Snacks.picker.help() end },
  { name = "Search: Man pages", action = function() Snacks.picker.man() end },
  { name = "Search: Keymaps", action = function() Snacks.picker.keymaps() end },
  { name = "Search: Symbols (buffer)", action = function() Snacks.picker.lsp_symbols() end },
  { name = "Search: Symbols (workspace)", action = function() Snacks.picker.lsp_workspace_symbols() end },
  -- Git
  { name = "Git: Log", action = function() Snacks.picker.git_log() end },
  { name = "Git: Branches", action = function() Snacks.picker.git_branches() end },
  { name = "Git: Status", action = function() Snacks.picker.git_status() end },
  { name = "Git: Diff", action = function() Snacks.picker.git_diff() end },
  -- Shortcuts
  { name = "Config: Edit", action = function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end },
  { name = "Lazy: Open dashboard", action = ":Lazy" },
  { name = "Tab: Close", action = ":tabclose" },
  { name = "Tab: New", action = ":tabnew" },
  -- UI
  { name = "Code: Toogle document symbols", action = "<leader>cs" },
  {
    name = "Active scope: Toggle focus",
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
      explorer = { -- File explorer
        enabled = true,
        replace_netrw = true, -- Replace netrw with the snacks explorer
      },
      notifier = { enabled = true },
      quickfile = { enabled = true }, -- When doing nvim somefile.txt, it will render the file as quickly as possible, before loading your plugins.
      scope = { enabled = true }, -- Scope detection
      scroll = { enabled = true }, -- Smooth scrolling
      words = { enabled = true }, -- Auto-show LSP references and quickly navigate between them
    },
    keys = {
      { "<C-o>", function() Snacks.picker.files() end, desc = "Search files" },
      { "<C-p>", function() show_commands() end, desc = "Command Palette" },
      { "<C-e>", function() Snacks.explorer() end, desc = "File Explorer" },
    },
  },
  -- Better UI for messages, cmdline and the popupmenu.
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim", -- used for proper rendering and multiple views
    },
  },
  -- Diagnostics, references, ...
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
  -- Pretty tab-line
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      animation = false,
      sidebar_filetypes = {
        -- Use the default values: {event = 'BufWinLeave', text = '', align = 'left'}
        NvimTree = true,
        -- Or, specify the text used for the offset:
        undotree = {
          text = 'undotree',
          align = 'center', -- *optionally* specify an alignment (either 'left', 'center', or 'right')
        },
        -- Or, specify the event which the sidebar executes when leaving:
        ['neo-tree'] = {event = 'BufWipeout'},
        -- Or, specify all three
        Outline = {event = 'BufWinLeave', text = 'symbols-outline', align = 'right'},
      },
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  }
}
