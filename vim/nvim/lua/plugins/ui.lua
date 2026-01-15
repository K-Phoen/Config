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
  -- Config shortcuts
  { name = "Config: Edit", action = function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end },
  { name = "Config: Lazy", action = ":Lazy" },
  -- UI
  { name = "UI: Toogle symbols outline", action = "<leader>o" },
  { name = "UI: Toogle file explorer", action = "<C-e>" },
  {
    name = "UI: Toggle dimming",
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
  -- Icons
  {
    "nvim-mini/mini.icons",
    lazy = true,
    opts = {
      file = {
        [".keep"] = { glyph = "󰊢", hl = "MiniIconsGrey" },
        ["devcontainer.json"] = { glyph = "", hl = "MiniIconsAzure" },
      },
      filetype = {
        dotenv = { glyph = "", hl = "MiniIconsYellow" },
      },
    },
    init = function()
      package.preload["nvim-web-devicons"] = function()
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
  },
  -- Display keymaps in a popup
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "modern",
      defaults = {},
      spec = {
        {
          mode = { "n", "x" },
          { "<leader>c", group = "code" },
          { "<leader>g", group = "git" },
          { "<leader>gh", group = "hunks" },
          { "<leader>u", group = "ui" },
          { "[", group = "prev" },
          { "]", group = "next" },
          { "g", group = "goto" },
          { "gs", group = "surround" },
          { "z", group = "fold" },
          {
            "<leader>b",
            group = "buffer",
            expand = function()
              return require("which-key.extras").expand.buf()
            end,
          },
          {
            "<leader>w",
            group = "windows",
            proxy = "<c-w>",
            expand = function()
              return require("which-key.extras").expand.win()
            end,
          },
          -- better descriptions
          { "gx", desc = "Open with system app" },
        },
      },
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = true })
        end,
        desc = "Global Keymaps (which-key)",
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
          lualine_x = {'encoding', 'lsp_status', 'filetype'},
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
          { pane = 2, height = 5, padding = 7 }, -- empty space
          { section = "keys", gap = 1, padding = 1 },
          { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
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
  -- Symbols outline
  {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = { -- Example mapping to toggle outline
      { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    opts = {
      -- Your setup opts here
    },
  },
}
