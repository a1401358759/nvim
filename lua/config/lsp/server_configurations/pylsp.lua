-- https://github.com/python-lsp/python-lsp-server

local util = require("lspconfig.util")

local root_files = {
    "pyproject.toml",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    "Pipfile",
    "pyrightconfig.json",
    -- customize
    "manage.py",
    "run.py",
}

local M = {}

local ignore_list = {
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
}

M.lsp_config = {
    filetypes = { "python" },
    single_file_support = true,
    cmd = { "pylsp" },
    root_dir = util.root_pattern(unpack(root_files)),
    settings = {
        pylsp = {
            configurationSources = { "flake8" },
            plugins = {
                flake8 = {
                    enabled = true,
                    ignore = ignore_list,
                    maxLineLength = 140,
                },
                pycodestyle = {
                    enable = false,
                    ignore = ignore_list,
                    maxLineLength = 140,
                },
                autopep8 = {
                    enable = false,
                    ignore = ignore_list,
                    maxLineLength = 140,
                },
                pyflakes = {
                    enable = false,
                    ignore = ignore_list,
                    maxLineLength = 140,
                },
                mccabe = {
                    enable = false,
                    threshold = 100,
                },
                pylint = {
                    enable = false,
                    ignore = ignore_list,
                    maxLineLength = 140,
                },
            },
        },
    },
}

return M
