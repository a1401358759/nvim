-- https://github.com/nvim-lualine/lualine.nvim

local M = {
    requires = {
        "lualine",
        "swenv.api",
    },
    platform_icons = {
        unix = " ",
        dos = " ",
        mac = " ",
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

local function diff_source()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
        return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed,
        }
    end
end

function M.before() end

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
                    symbols = M.platform_icons,
                },
                { "mode" },
            },
            lualine_b = {
                "branch",
                { "diff", source = diff_source },
                "diagnostics",
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
