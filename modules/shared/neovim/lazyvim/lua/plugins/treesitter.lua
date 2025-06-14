return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    highlight = {
      enable = true,
    },
    rainbow = {
      enable = true,
      extended_mode = true,
      max_file_lines = 1000,
    },
    indent = {
      enable = true,
    },
    ensure_installed = {
      "dockerfile",
      "go",
      "vim",
      "vimdoc",
      "yaml",
    },
  },
}
