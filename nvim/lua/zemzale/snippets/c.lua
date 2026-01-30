require("luasnip.session.snippet_collection").clear_snippets("cpp")

local ls = require("luasnip")

local fmta = require("luasnip.extras.fmt").fmta

local s = ls.snippet
local i = ls.insert_node

ls.add_snippets("cpp", {
	s(
		"hdef",
		--- We can add some magic here with TS that we can get the want type in the first test case
		fmta(
			[[
            #ifndef <header>_H
            #define <header>_H
            <finish>
            #endif
            ]],
			{
				header = i(1),
				finish = i(0),
			},
			{
				repeat_duplicates = true,
			}
		)
	),
})
