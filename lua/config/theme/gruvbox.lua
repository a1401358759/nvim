-- https://github.com/ellisonleao/gruvbox.nvim

local M = {
    requires = {
        "gruvbox",
    },
}

function M.before() end

function M.load()
    M.gruvbox.setup({
        undercurl = true,
        underline = false,
        bold = true,
        italic = false,
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true, -- invert background for search, diffs, statuslines and errors
        contrast = "", -- can be "hard", "soft" or empty string
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = false,
    })
end

function M.after() end

return M
