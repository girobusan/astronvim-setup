-- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
-- return {} -- закомментируйте или удалите эту строку

-- Customize None-ls sources

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      -- Set a formatter
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.prettier,
      -- Раскомментируйте нужные вам форматтеры/линтеры
    }

    -- Фильтруем источники, исключая те, что работают с dart файлами
    config.sources = vim.tbl_filter(function(source)
      -- если источник предназначен для dart, пропускаем его
      if source.filetypes and vim.tbl_contains(source.filetypes, "dart") then return false end
      return true
    end, config.sources)

    return config -- return final config table
  end,
}
