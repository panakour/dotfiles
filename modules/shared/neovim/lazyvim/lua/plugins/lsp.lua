return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        bashls = vim.tbl_deep_extend("force", {}, {
          handlers = {
            ["textDocument/publishDiagnostics"] = function(err, res, ...)
              local on_publish_diagnostics = vim.lsp.diagnostic.on_publish_diagnostics
              local file_name = vim.fn.fnamemodify(vim.uri_to_fname(res.uri), ":t")
              -- Only suppress diagnostics for .env files
              if not string.match(file_name, "^%.env") then
                return on_publish_diagnostics(err, res, ...)
              end
              -- Skip diagnostics if it's an .env file
            end,
          },
        }),

        gopls = {
          settings = {
            gopls = {
              semanticTokens = true,
              analyses = {
                unusedparams = true,
              },
              staticcheck = true,
              hints = {
                rangeVariableTypes = false,
              },
            },
          },
        },

        jsonls = {},
        nixd = {},
        nil_ls = false,
        pyright = {
          settings = {
            python = {
              analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                typeCheckingMode = "basic",
                diagnosticMode = "openFilesOnly",
              },
            },
          },
        },
        ruff = {},
        terraformls = {},
        tflint = {},
        yamlls = {
          settings = {
            yaml = {
              keyOrdering = false,
            },
          },
        },
      },
    },
  },
}
