return { -- Autoformat
  'stevearc/conform.nvim',
  init = function() vim.o.formatexpr = "v:lua.require'conform'.formatexpr()" end,
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  -- keys = {
  --   {
  --     '<leader>f',
  --     function()
  --       require('conform').format { async = false, lsp_format = 'fallback' }
  --     end,
  --     mode = '',
  --     desc = '[F]ormat buffer',
  --   },
  -- },
  keys = {
    {
      '<leader>f',
      function() require('conform').format { async = true, lsp_format = 'fallback' } end,
      mode = { 'n', 'v' },
      desc = 'Format buffer or range',
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      -- Disable "format_on_save lsp_fallback" for languages that don't
      -- have a well standardized coding style. You can add additional
      -- languages here or re-enable it for the disabled ones.
      local disable_filetypes = { c = true, cpp = true }
      if disable_filetypes[vim.bo[bufnr].filetype] then
        return nil
      else
        return {
          timeout_ms = 500,
          lsp_format = 'fallback',
        }
      end
    end,
    formatters_by_ft = {
      html = { 'prettierd', 'prettier', stop_after_first = true },
      javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
      javascript = { 'prettierd', 'prettier', stop_after_first = true },
      markdown = { 'prettierd', 'prettier', stop_after_first = true },
      typescript = { 'prettierd', 'prettier', stop_after_first = true },
      typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
      lua = { 'stylua' },
      luau = { 'stylua' },

      --
      -- You can use 'stop_after_first' to run the first available formatter from the list
      css = { 'prettierd', 'prettier', stop_after_first = true },
      json = { 'prettierd', 'prettier', stop_after_first = true },
      yaml = { 'prettierd', 'prettier', stop_after_first = true },
      -- Conform can also run multiple formatters sequentially
      python = { 'isort', 'black' },
      sh = { 'shfmt' },
      ['*'] = { 'trim_whitespace' },
    },
    default_format_opts = {
      lsp_format = 'fallback',
      timeout_ms = 2000,
    },
    formatters = {
      prettierd = {
        condition = function() return vim.loop.fs_realpath '.prettierrc.js' ~= nil or vim.loop.fs_realpath '.prettierrc.mjs' ~= nil end,
      },
    },
  },
}
