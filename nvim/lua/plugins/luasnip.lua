return {
    "L3MON4D3/LuaSnip",
    tag = "v2.3.0", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!:).
    build = "make install_jsregexp",
    config = function() 
        print("setitng up luasnip")
        local ls = require("luasnip")

        ls.config.set_config {
            history = false,
            updateevents = "TextChanged,TextChangedI",
        }

        for _, ftPath in ipairs(vim.api.nvim_get_runtime_file("lua/zemzale/snippets/*.lua", true)) do
            loadfile(ftPath)()
        end
    end
}
