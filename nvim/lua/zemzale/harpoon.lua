local keymap = require("zemzale.keymap")

local mark = require("harpoon.mark")
local ui  = require("harpoon.ui")

keymap.nmap({'<leader>a', mark.add_file, {silent = true}})

keymap.nmap({'<leader>1', function () ui.nav_file(1) end, {silent = true}})
keymap.nmap({'<leader>2', function () ui.nav_file(2) end, {silent = true}})
keymap.nmap({'<leader>3', function () ui.nav_file(3) end, {silent = true}})

