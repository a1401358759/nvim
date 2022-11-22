-- https://github.com/nvim-lualine/lualine.nvim

local public = require("utils.public")
local icons = public.get_icons("platform", true)

local M = {
    requires = {
        "lualine",
        "swenv.api",
    },
    pyversion = vim.fn.system("python --version"):match("%d.*%d"),
}

local function get_venv()
    local res = M.swenv_api.get_current_venv()
    if res then
        return string.format("(virtualenv: '%s')", res.name)
    end
    return string.format("(version: '%s')", M.pyversion)
end

function M.before() end

local hide_in_width = function()
    return vim.fn.winwidth(0) > 80
end

function M.load()
    M.lualine.setup({
        options = {
            theme = "auto",
            icons_enabled = true,
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
            disabled_filetypes = {},
            globalstatus = true,
            refresh = {
                statusline = 100,
                tabline = 100,
                winbar = 100,
            },
        },
        sections = {
            lualine_a = {
                {
                    "fileformat",
                    symbols = icons,
                },
                { "mode" },
            },
            lualine_b = {
                "branch",
                {
                    "diff",
                    colored = true,
                    symbols = { added = "  ", modified = " ", removed = " " },
                    diff_color = {
                        added = { fg = "#98be65" },
                        modified = { fg = "#ecbe7b" },
                        removed = { fg = "#ec5f67" },
                    },
                    cond = hide_in_width,
                },
                {
                    "diagnostics",
                    sources = { "nvim_diagnostic" },
                    sections = { "error", "warn", "hint" },
                    symbols = { error = " ", warn = " ", hint = " " },
                    colored = false,
                    update_in_insert = false,
                    always_visible = true,
                },
            },
            lualine_c = {
                {
                    "filename",
                    file_status = true,
                    path = 1,
                    shorting_target = 40,
                    symbols = {
                        modified = "[+]", -- Text to show when the file is modified.
                        readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
                        unnamed = "[No Name]", -- Text to show for unnamed buffers.
                        newfile = "[New]", -- Text to show for new created file before first writting
                    },
                },
            },
            lualine_x = {
                "encoding",
                "fileformat",
                "filetype",
                {
                    get_venv,
                    cond = function()
                        return vim.bo.filetype == "python"
                    end,
                },
            },
            lualine_y = {
                "progress",
            },
            lualine_z = { "location" },
        },
    })
end
function M.after() end

return M
