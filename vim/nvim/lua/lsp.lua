-- Enable and configure the built-in LSP client.
vim.lsp.enable({
  "gopls",
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    local buffer = event.buf

    if client then
      -- Add additional keymaps to the default LSP keymaps.
      --
      -- See: https://neovim.io/doc/user/lsp.html#_global-defaults
      vim.keymap.set("n", "grf", vim.lsp.buf.format, { buffer = buffer })
      vim.keymap.set("n", "grq", vim.diagnostic.setqflist, { buffer = buffer })
      vim.keymap.set("n", "gry", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      end, { buffer = buffer })
      vim.keymap.set("n", "gd", function()
        vim.lsp.buf.definition()
      end, { buffer = buffer })
      vim.keymap.set("n", "gD", function()
        vim.cmd([[ vsplit ]])
        vim.lsp.buf.definition()
      end, { buffer = buffer })
      
      -- Enable completion.
      if
        client:supports_method(vim.lsp.protocol.Methods.textDocument_completion)
      then
        vim.lsp.completion.enable(
          true,
          client.id,
          buffer,
          { autotrigger = true }
        )
        vim.keymap.set("i", "<c-space>", function()
          vim.lsp.completion.get()
        end)
      end

      -- Enable LLM-based inline completions.
      if
        client:supports_method(
          vim.lsp.protocol.Methods.textDocument_inlineCompletion
        )
      then
        vim.lsp.inline_completion.enable(true)
        vim.keymap.set("i", "<c-cr>", function()
          if not vim.lsp.inline_completion.get() then
            return "<c-cr>"
          end
        end, {
          expr = true,
          replace_keycodes = true,
        })
      end

      -- Add normal-mode keymappings for signature help.
      if client:supports_method("textDocument/signatureHelp") then
        vim.keymap.set("n", "<c-s>", function()
          vim.lsp.buf.signature_help()
        end)
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
