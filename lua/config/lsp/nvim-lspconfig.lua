-- https://github.com/neovim/nvim-lspconfig

local api = require("utils.api")
local aux_lspconfig = require("utils.aux.lspconfig")

local M = {
    requires = {
        "lspconfig",
        "nvim-navic",
        "mason-lspconfig",
    },
    ignore_list = {
        "W391",
        "E701",
        "E266",
        "E309",
        "E306",
        "E501",
        "C901",
        "C0301",
        "W0142",
        "W0401",
        "W0402",
        "R0201",
        "E1101",
        "E1102",
        "C0103",
        "R0901",
        "R0903",
        "R0904",
        "C1001",
        "W0223",
        "W0232",
        "W0201",
        "E1103",
        "R0801",
        "C0111",
        "E722",
        "W292",
        "E402",
        "F821",
        "W503",
        "E203",
    },
}

function M.before()
    M.register_key()
end

function M.load()
    aux_lspconfig.entry()

    local configurations_dir_path = "config/lsp/server_configurations/"

    for _, server_name in ipairs(M.mason_lspconfig.get_installed_servers()) do
        local require_path = string.format("%s%s", configurations_dir_path, server_name)

        local ok, settings = pcall(require, require_path)

        if not ok then
            settings = {}
        end

        settings.capabilities = aux_lspconfig.get_capabilities()
        settings.handlers = aux_lspconfig.get_headlers(settings)

        settings.on_attach = function(client, bufnr)
            M.nvim_navic.attach(client, bufnr)
            client.server_capabilities.documentFormattingProvider = false
        end

        M.lspconfig[server_name].setup(settings)
    end
    require("lspconfig").pylsp.setup({
        settings = {
            pylsp = {
                configurationSources = { "flake8" },
                plugins = {
                    flake8 = {
                        enabled = true,
                        ignore = M.ignore_list,
                        maxLineLength = 140,
                    },
                    pycodestyle = {
                        enable = false,
                        ignore = M.ignore_list,
                        maxLineLength = 140,
                    },
                    autopep8 = {
                        enable = false,
                        ignore = M.ignore_list,
                        maxLineLength = 140,
                    },
                    pyflakes = {
                        enable = false,
                        ignore = M.ignore_list,
                        maxLineLength = 140,
                    },
                    mccabe = {
                        enable = false,
                        threshold = 100,
                    },
                    pylint = {
                        enable = false,
                        ignore = M.ignore_list,
                        maxLineLength = 140,
                    },
                },
            },
        },
    })
end

function M.after() end

function M.register_key()
    api.map.bulk_register({
        -- {
        --     mode = { "n" },
        --     lhs = "<leader>ca",
        --     rhs = vim.lsp.buf.code_action,
        --     options = { silent = true },
        --     description = "Show code action",
        -- },
        -- {
        --     mode = { "n" },
        --     lhs = "<leader>cn",
        --     rhs = vim.lsp.buf.rename,
        --     options = { silent = true },
        --     description = "Variable renaming",
        -- },
        {
            mode = { "n" },
            lhs = "<leader>cf",
            rhs = function()
                vim.lsp.buf.format({ async = true })
            end,
            options = { silent = true },
            description = "Format buffer",
        },
        -- {
        --     mode = { "n" },
        --     lhs = "gh",
        --     rhs = vim.lsp.buf.hover,
        --     options = { silent = true },
        --     description = "Show help information",
        -- },
        {
            mode = { "n" },
            lhs = "gr",
            rhs = function()
                require("telescope.builtin").lsp_references()
            end,
            options = { silent = true },
            description = "Go to references",
        },
        {
            mode = { "n" },
            lhs = "gi",
            rhs = function()
                require("telescope.builtin").lsp_implementations()
            end,
            options = { silent = true },

            description = "Go to implementations",
        },
        {
            mode = { "n" },
            lhs = "gd",
            rhs = function()
                require("telescope.builtin").lsp_definitions()
            end,
            options = { silent = true },
            description = "Go to definitions",
        },
        {
            mode = { "n" },
            lhs = "gD",
            rhs = function()
                require("telescope.builtin").lsp_type_definitions()
            end,
            options = { silent = true },
            description = "Go to type definitions",
        },
        {
            mode = { "n" },
            lhs = "go",
            rhs = aux_lspconfig.diagnostic_open_float,
            options = { silent = true },
            description = "Show Current Diagnostics",
        },
        {
            mode = { "n" },
            lhs = "gO",
            rhs = function()
                require("telescope.builtin").diagnostics()
            end,
            options = { silent = true },
            description = "Show Workspace Diagnostics",
        },
        {
            mode = { "n" },
            lhs = "[g",
            rhs = aux_lspconfig.goto_prev_diagnostic,
            options = { silent = true },
            description = "Jump to prev diagnostic",
        },
        {
            mode = { "n" },
            lhs = "]g",
            rhs = aux_lspconfig.goto_next_diagnostic,
            options = { silent = true },
            description = "Jump to next diagnostic",
        },
        {
            mode = { "i" },
            lhs = "<c-j>",
            rhs = aux_lspconfig.sigature_help,
            options = { silent = true },
            description = "Toggle signature help",
        },
        {
            mode = { "i", "n" },
            lhs = "<c-b>",
            rhs = aux_lspconfig.scroll_to_up,
            options = { silent = true },
            description = "Scroll up floating window",
        },
        {
            mode = { "i", "n" },
            lhs = "<c-f>",
            rhs = aux_lspconfig.scroll_to_down,
            options = { silent = true },
            description = "Scroll down floating window",
        },
        {
            mode = { "i", "n" },
            lhs = "<c-]>",
            rhs = aux_lspconfig.focus_float_window(),
            options = { silent = true },
            description = "Focus floating window",
        },
    })
end

return M
