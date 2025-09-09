local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require("mason").setup({
    -- Optional: customize install directory
    -- install_root_dir = vim.fn.stdpath("data") .. "/mason",
})

require("mason-lspconfig").setup({
    -- Optional: ensure certain servers are installed automatically
    ensure_installed = { 'jdtls', 'clangd' },
    -- Optional: customize automatic setup for specific servers
    handlers = {
        function(server_name)
            require("lspconfig")[server_name].setup({})
        end
            -- Example for customizing a specific server
            -- ["tsserver"] = function()
            --     require("lspconfig").tsserver.setup({
            --         init_options = {
            --             preferences = {
            --                 disableSuggestions = true,
            --             },
            --         },
            --     })
            -- end,
    },
})
