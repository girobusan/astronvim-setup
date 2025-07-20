-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

vim.o.guifont = "FiraCode Nerd Font:h12"
-- Set up custom filetypes
vim.filetype.add {
  extension = {
    ojs = "javascript",
    ejs = "html",
    njk = "html",
  },
  filename = {
    ["README"] = "markdown",
  },
  pattern = {
    ["~/%.config/foo/.*"] = "fooscript",
  },
}
