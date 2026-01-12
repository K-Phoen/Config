return {
  -- Adjust tab width based on the current file
  {
    "tpope/vim-sleuth",
    config = function () end
  },
  -- Improves comment syntax, lets Neovim handle multiple types of comments for a single language, and relaxes rules for uncommenting.
  {
    "folke/ts-comments.nvim",
    opts = {},
    event = "VeryLazy",
  },
  -- LSP configs
  {
    "neovim/nvim-lspconfig",
  },
  -- Multiple cursor improvements
  {
  "jake-stewart/multicursor.nvim",
    branch = "1.0",
    config = function()
        local mc = require("multicursor-nvim")
        mc.setup()

        local set = vim.keymap.set

        -- Add or skip cursor above/below the main cursor.
        set({"n", "x"}, "<S-up>", function() mc.lineAddCursor(-1) end, { desc = "Add a cursor above the main cursor" })
        set({"n", "x"}, "<S-down>", function() mc.lineAddCursor(1) end, { desc = "Add a cursor below the main cursor" })
        set({"n", "x"}, "<leader><up>", function() mc.lineSkipCursor(-1) end, { desc = "Remove a cursor above the main cursor" })
        set({"n", "x"}, "<leader><down>", function() mc.lineSkipCursor(1) end, { desc = "Remove a cursor below the main cursor" })

        -- Add a cursor for all matches of cursor word/selection in the document.
        set({"n", "x"}, "<leader>m", mc.matchAllAddCursors, { desc = "Add a cursor for matching word/selection" })

        -- Add and remove cursors with control + left click.
        set("n", "<c-leftmouse>", mc.handleMouse)
        set("n", "<c-leftdrag>", mc.handleMouseDrag)
        set("n", "<c-leftrelease>", mc.handleMouseRelease)

        -- Mappings defined in a keymap layer only apply when there are
        -- multiple cursors. This lets you have overlapping mappings.
        mc.addKeymapLayer(function(layerSet)
            -- Select a different cursor as the main one.
            layerSet({"n", "x"}, "<left>", mc.prevCursor, { desc = "Select a different cursor as the main one (left)" })
            layerSet({"n", "x"}, "<right>", mc.nextCursor, { desc = "Select a different cursor as the main one (right)" })

            -- Delete the main cursor.
            layerSet({"n", "x"}, "<leader>x", mc.deleteCursor, { desc = "Delete the main cursor" })

            -- Enable and clear cursors using escape.
            layerSet("n", "<esc>", function()
                if not mc.cursorsEnabled() then
                    mc.enableCursors()
                else
                    mc.clearCursors()
                end
            end, { desc = "Clear cursors" })
        end)
    end
  }
}
