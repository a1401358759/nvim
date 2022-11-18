local M = {}

function M.before() end

function M.load()
    local ok, m = pcall(require, "alpha")
    if not ok then
        return
    end

    local dashboard = require("alpha.themes.dashboard")
    local startify = require("alpha.themes.startify")

    startify.section.header.val = {
        [[ ______               __              __  __                     ]],
        [[/\__  _\             /\ \            /\ \/\ \  __                ]],
        [[\/_/\ \/ __  __  _ __\ \ \____    ___\ \ \ \ \/\_\    ___ ___    ]],
        [[   \ \ \/\ \/\ \/\`'__\ \ '__`\  / __`\ \ \ \ \/\ \ /' __` __`\  ]],
        [[    \ \ \ \ \_\ \ \ \/ \ \ \L\ \/\ \L\ \ \ \_/ \ \ \/\ \/\ \/\ \ ]],
        [[     \ \_\ \____/\ \_\  \ \_,__/\ \____/\ `\___/\ \_\ \_\ \_\ \_\]],
        [[      \/_/\/___/  \/_/   \/___/  \/___/  `\/__/  \/_/\/_/\/_/\/_/]],
        [[                                                                 ]],
    }

    dashboard.section.buttons.val = {
        dashboard.button("f", "  Find file", "<leader>ff", {}),
        dashboard.button("o", "  Recently used files", "<leader>fo", {}),
        dashboard.button("g", "  Find text", "<leader>fg", {}),
        dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>", {}),
        dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>", {}),
        dashboard.button("u", "  Update plugins", ":PackerSync<CR>", {}),
        dashboard.button("s", "  Load Session", "<leader>sl", {}),
        dashboard.button("q", "  Quit Neovim", ":qa<CR>", {}),
    }

    local function footer()
        local total_plugins = #vim.tbl_keys(packer_plugins)
        local datetime = os.date(" %Y-%m-%d   %H:%M:%S")
        local version = vim.version()
        local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch

        return datetime .. "   " .. total_plugins .. " plugins" .. nvim_version_info
    end

    dashboard.section.footer.val = footer()

    dashboard.section.footer.opts.hl = "Type"
    dashboard.section.header.opts.hl = "Include"
    dashboard.section.buttons.opts.hl = "Keyword"

    dashboard.opts.opts.noautocmd = true

    -- startify config
    startify.section.bottom_buttons.val = {
        startify.button("s", "  Load Session", "<leader>sl"),
        startify.button("q", "  Quit NVIM", ":qa<CR>"),
    }

    M.alpha = m
    M.alpha.setup(startify.opts)
end

function M.after() end

return M
