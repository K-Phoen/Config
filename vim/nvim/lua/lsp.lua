-- Enable and configure the built-in LSP client.
vim.lsp.enable({
  "cue",
  "gopls",
  "rust_analyzer",
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    local buffer = event.buf

    if client then
      -- Add additional keymaps to the default LSP keymaps.
      --
      -- See: https://neovim.io/doc/user/lsp.html#_global-defaults
      vim.keymap.set("n", "grf", vim.lsp.buf.format, { buffer = buffer, desc = "Format buffer" })
      vim.keymap.set("n", "gra", vim.lsp.buf.code_action, { buffer = buffer, desc = "Code actions" })
      vim.keymap.set("n", "<c-f>", vim.lsp.buf.code_action, { desc = "Code actions" })
      vim.keymap.set("n", "gre", vim.diagnostic.goto_next, { buffer = buffer, desc = "Go to next diagnostic" })
      vim.keymap.set("n", "grp", vim.diagnostic.goto_prev, { buffer = buffer, desc = "Go to previous diagnostic" })
      vim.keymap.set("n", "<c-d>", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
      vim.keymap.set("n", "gry", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      end, { buffer = buffer, desc = "Toggle inlay hints" })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = buffer, desc = "Go to definition" })
      vim.keymap.set("n", "gD", function()
        vim.cmd([[ vsplit ]])
        vim.lsp.buf.definition()
      end, { buffer = buffer, desc = "Go to definition (vsplit)" })

      -- Add normal-mode keymappings for signature help.
      if client:supports_method("textDocument/signatureHelp") then
        vim.keymap.set("n", "<c-s>", function()
          vim.lsp.buf.signature_help()
        end, { desc = "Show signature help" })
      end

      -- Auto-format on save.
      if client:supports_method("textDocument/formatting") then
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = buffer,
          callback = function()
            vim.lsp.buf.format({ bufnr = buffer, id = client.id })
          end,
        })
      end
    end
  end,
})
