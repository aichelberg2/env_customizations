local M = {}

M.border = {
  { "╭", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╮", "FloatBorder" },
  { "│", "FloatBorder" },
  { "╯", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╰", "FloatBorder" },
  { "│", "FloatBorder" },
}

-- Set default options for floating windows
M.float_opts = {
  border = M.border,
  winblend = 0,
}

-- Function to set up LSP handlers with borders
function M.setup_lsp_handlers()
  local handlers = vim.lsp.handlers

  -- LSP handlers
  handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover, M.float_opts
  )
  handlers["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help, M.float_opts
  )
end

return M
