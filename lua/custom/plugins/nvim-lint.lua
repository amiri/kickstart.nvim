return {
  'mfussenegger/nvim-lint',
  -- event = 'LazyFile',
  opts = {},
  config = function()
    local lint = require 'lint'

    -- Example linter configurations (modify as needed)
    lint.linters_by_ft = {
      javascript = { 'eslint' },
      typescript = { 'eslint' },
      javascriptreact = { 'eslint' },
      typescriptreact = { 'eslint' },
      lua = { 'selene' },
      luau = { 'selene' },
    }

    -- Autocmds to run linting automatically
    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      group = vim.api.nvim_create_augroup('lint', { clear = true }),
      callback = function()
        require('lint').try_lint()
      end,
    })
  end,
}
