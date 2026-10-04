return {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  opts = {},
  config = function()
    require('typescript-tools').setup {
      -- You can still pass your standard LSP capabilities or on_attach functions here
      on_attach = function(client, bufnr)
        -- Disable formatting if you prefer Prettier via conform.nvim or null-ls
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false

        -- Your custom keymaps go here (e.g., gd for definition, K for hover)
      end,
      settings = {
        -- spawn separate tsserver process for spawning diagnostics
        separate_diagnostic_server = true,
        -- publish diagnostics on buffer write or insert leave
        publish_diagnostic_on = 'insert_leave',
        -- array of strings to specify plugins for tsserver (e.g. for Vue/Svelte/Astro)
        tsserver_plugins = {},
        -- preferences for formatting and styling
        tsserver_file_preferences = {
          includeInlayParameterNameHints = 'all',
          includeCompletionsForModuleExports = true,
          quotePreference = 'auto',
        },
        jsx_close_tag = {
          enable = true,
          filetypes = { 'javascriptreact', 'typescriptreact' },
        },
      },
    }
  end,
}
