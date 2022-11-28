-- https://github.com/kevinhwang91/rnvimr

local M = {}

function M.before() end

function M.load()
    vim.g.rnvimr_enable_ex = 1 -- Make Ranger replace Netrw and be the file explorer
    vim.g.rnvimr_enable_picker = 0 -- Make Ranger to be hidden after picking a file
    vim.g.rnvimr_edit_cmd = "drop" -- Replace `$EDITOR` candidate with this command to open the selected file
    vim.g.rnvimr_draw_border = 1 -- Disable a border for floating window
    vim.g.rnvimr_hide_gitignore = 1
    vim.g.rnvimr_enable_bw = 1 -- Make Neovim wipe the buffers corresponding to the files deleted by Ranger
    vim.g.rnvimr_shadow_winblend = 70 -- Add a shadow window, value is equal to 100 will disable shadow
    vim.g.rnvimr_ranger_cmd = { "ranger", "--cmd=set draw_borders both" } -- Draw border with both
    vim.g.rnvimr_vanilla = 1 -- use Ranger default configuration
end

vim.keymap.set("n", "<leader>rt", "<cmd>:RnvimrToggle<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>rs", "<cmd>:RnvimrResize<CR>", { silent = true, noremap = true })

function M.after() end

return M
