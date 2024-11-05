return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      -- python stuff
      "pyright",
      "ruff",
      "black",
      -- golang stuff
      "gopls",
      "iferr",
      "goimports",
      "golines",
      "templ",
      -- javascript
      "typescript-language-server",
      "eslint-lsp",
      -- other stuff
      "clangd",
      "htmx-lsp",
      "taplo",
      -- "sqlfluff",
      "sql-formatter",
      "dockerfile-language-server",
      "docker-compose-language-service",
      "prettierd",
      "shellcheck",
      "shfmt",
      "stylua",
    },
  },
}
