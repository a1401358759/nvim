-- https://github.com/nvim-telescope/telescope.nvim

local api = require("utils.api")

local M = {
    requires = {
        "telescope",
    },
}

function M.before()
    M.register_key()
end

function M.load()
    local trouble = require("trouble.providers.telescope")
    M.telescope.setup({
        defaults = {
            mappings = {
                i = { ["<c-t>"] = trouble.open_with_trouble },
                n = { ["<c-t>"] = trouble.open_with_trouble },
            },
            prompt_prefix = " ",
            selection_caret = " ",
            initial_mode = "insert",
            selection_strategy = "reset",
            sorting_strategy = "descending",
            layout_strategy = "horizontal", -- bottom_pane
            color_devicons = true,
            entry_prefix = " ",
            multi_icon = " ",
            file_ignore_patterns = { "node_modules" },
            -- config
            layout_config = {
                bottom_pane = {
                    height = 15,
                    preview_cutoff = 100,
                    prompt_position = "bottom",
                },
            },
        },
        pickers = {
            buffers = {
                mappings = {
                    i = {
                        ["<c-d>"] = "delete_buffer",
                    },
                    n = {
                        ["dd"] = "delete_buffer",
                    },
                },
            },
        },
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = "smart_case",
            },
        },
    })
end

function M.after()
    M.telescope.load_extension("fzf")

    -- FIX: https://github.com/nvim-telescope/telescope.nvim/issues/699
    vim.api.nvim_create_autocmd({ "BufEnter" }, {
        pattern = { "*" },
        command = "normal zx",
    })
end

function M.register_key()
    api.map.bulk_register({
        {
            mode = { "n" },
            lhs = "<leader>ff",
            rhs = ":Telescope find_files<CR>",
            options = { silent = true },
            description = "Find files in the current workspace",
        },
        {
            mode = { "n" },
            lhs = "<leader>fg",
            rhs = ":Telescope live_grep<CR>",
            options = { silent = true },
            description = "Find string in the current workspace",
        },
        {
            mode = { "n" },
            lhs = "<leader>fo",
            rhs = ":Telescope oldfiles<CR>",
            options = { silent = true },
            description = "Find telescope history",
        },
        {
            mode = { "n" },
            lhs = "<leader>fh",
            rhs = ":Telescope resume<CR>",
            options = { silent = true },
            description = "Find last lookup",
        },
        {
            mode = { "n" },
            lhs = "<leader>ft",
            rhs = ":Telescope help_tags<CR>",
            options = { silent = true },
            description = "Find all help document tags",
        },
        {
            mode = { "n" },
            lhs = "<leader>fm",
            rhs = ":Telescope marks<CR>",
            options = { silent = true },
            description = "Find marks in the current workspace",
        },
        {
            mode = { "n" },
            lhs = "<leader>fi",
            rhs = ":Telescope highlights<CR>",
            options = { silent = true },
            description = "Find all neovim highlights",
        },
        {
            mode = { "n" },
            lhs = "<leader>fb",
            rhs = ":Telescope buffers<CR>",
            options = { silent = true },
            description = "Find all buffers",
        },
        {
            mode = { "n" },
            lhs = "<leader>f/",
            rhs = ":Telescope search_history<CR>",
            options = { silent = true },
            description = "Find all search history",
        },
        {
            mode = { "n" },
            lhs = "<leader>f:",
            rhs = ":Telescope command_history<CR>",
            options = { silent = true },
            description = "Find all command history",
        },
    })
end

return M
