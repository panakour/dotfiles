local function rust_lsp(...)
  local args = { ... }
  return function()
    if vim.fn.exists(":RustLsp") ~= 2 then
      vim.notify("RustLsp is not available in this buffer yet", vim.log.levels.WARN)
      return
    end
    vim.cmd.RustLsp(args)
  end
end

return {
  {
    "mrcjkb/rustaceanvim",
    opts = {
      server = {
        default_settings = {
          ["rust-analyzer"] = {
            check = { command = "clippy" },
          },
        },
      },
    },
    keys = {
      { "<leader>rr", rust_lsp("runnables"), ft = "rust", desc = "Runnables" },
      { "<leader>rd", rust_lsp("renderDiagnostic", "current"), ft = "rust", desc = "Render Diagnostic" },
      { "<leader>re", rust_lsp("explainError", "current"), ft = "rust", desc = "Explain Error" },
      { "<leader>rm", rust_lsp("expandMacro"), ft = "rust", desc = "Expand Macro" },
      { "<leader>ro", rust_lsp("openDocs"), ft = "rust", desc = "Open Docs" },
    },
  },
}
