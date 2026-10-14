return {
  'WhoIsSethDaniel/mason-tool-installer.nvim',
  opts = {
    ensure_installed = {
      'lua-language-server',
      'luau-lsp',
      'stylua',
      'ts_ls',
      'eslint-lsp',
      'prettierd',
      'json-lsp',
    },
  },
  dependencies = {
    {
      'williamboman/mason.nvim',
      build = ':MasonUpdate',
      opts = {},
    },
  },
}
