-- https://github.com/nvim-tree/nvim-tree.lua

local api = require("utils.api")
local public = require("utils.public")
local icons = public.get_icons("diagnostic", true)

local M = {
    requires = {
        "nvim-tree",
    },
}

function M.before()
    M.register_key()
end

function M.load()
    M.nvim_tree.setup({
        auto_reload_on_write = true,
        disable_netrw = false,
        hijack_unnamed_buffer_when_opening = false,
        ignore_buffer_on_setup = false,
        open_on_setup = false,
        open_on_setup_file = false,
        sort_by = "name",
        root_dirs = {},
        prefer_startup_root = false,
        sync_root_with_cwd = false,
        reload_on_bufenter = false,
        respect_buf_cwd = false,
        on_attach = "disable",
        remove_keymaps = false,
        select_prompts = false,
        hijack_netrw = false,
        hijack_cursor = false,
        update_cwd = true,
        ignore_ft_on_setup = { "dashboard" },
        notify = {
            threshold = vim.log.levels.WARN,
        },
        update_focused_file = {
            enable = true,
            update_cwd = false,
        },
        view = {
            side = "left",
            -- adaptive_size = true,
            width = 30,
            centralize_selection = false,
            hide_root_folder = false,
            preserve_window_proportions = false,
            number = false,
            relativenumber = false,
            signcolumn = "yes",
            mappings = {
                list = {
                    { key = "?", action = "toggle_help" },
                },
            },
            float = {
                enable = false,
                quit_on_focus_loss = true,
                open_win_config = {
                    relative = "editor",
                    border = "rounded",
                    width = 30,
                    height = 30,
                    row = 1,
                    col = 1,
                },
            },
        },
        diagnostics = {
            enable = true,
            show_on_dirs = true,
            icons = {
                hint = icons.Hint,
                info = icons.Info,
                warning = icons.Warn,
                error = icons.Error,
            },
        },
        actions = {
            use_system_clipboard = true,
            change_dir = {
                enable = true,
                global = true,
                restrict_above_cwd = false,
            },
            open_file = {
                resize_window = true,
                window_picker = {
                    enable = true,
                },
            },
        },
        trash = {
            cmd = "trash",
            require_confirm = true,
        },
        filters = {
            dotfiles = false,
            custom = { "node_modules", "\\.cache", "__pycache__", "^.git$", "^.github$" },
            exclude = {},
        },
        renderer = {
            add_trailing = true,
            highlight_git = true,
            highlight_opened_files = "none",
            indent_width = 2,
            indent_markers = {
                enable = false,
                inline_arrows = true,
                icons = {
                    corner = "└",
                    edge = "│",
                    item = "│",
                    bottom = "─",
                    none = " ",
                },
            },
            icons = {
                show = {
                    file = true,
                    folder = true,
                    folder_arrow = true,
                    git = true,
                },
                glyphs = {
                    default = "",
                    symlink = "",
                    git = {
                        unstaged = "✗",
                        staged = "✓",
                        unmerged = "",
                        renamed = "凜",
                        untracked = "★",
                        deleted = "",
                        ignored = "",
                    },
                    folder = {
                        arrow_open = "",
                        arrow_closed = "",
                        default = "",
                        open = "",
                        empty = "",
                        empty_open = "",
                        symlink = "",
                        symlink_open = "",
                    },
                },
            },
        },
    })
end

function M.after() end

function M.register_key()
    api.map.bulk_register({
        {
            mode = { "n" },
            lhs = "<leader>1",
            rhs = function()
                public.toggle_sidebar("NvimTree")
                vim.cmd("NvimTreeToggle")
            end,
            options = { silent = true },
            description = "Open File Explorer",
        },
        {
            mode = { "n" },
            lhs = "<leader>fc",
            rhs = function()
                public.toggle_sidebar("NvimTree")
                vim.cmd("NvimTreeFindFile")
            end,
            options = { silent = true },
            description = "Find the current file and open it in file explorer",
        },
    })
end

return M