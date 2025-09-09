-- setup lazy.nvim first
require("config.lazy")

-- get lsp configs running
vim.lsp.enable("javals")
vim.lsp.enable("cls")

-- Setup inline diagonistic information
vim.diagnostic.config({ virtual_text = true })

-- Setup autocomplete
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method('textDocument/completion') then
              -- Optional: trigger autocompletion on EVERY keypress. May be slow!
      local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
      client.server_capabilities.completionProvider.triggerCharacters = chars
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})

vim.cmd("set completeopt+=noselect")

-- Just random vim settings
vim.g.mapleader = " "
vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.relativenumber = true
