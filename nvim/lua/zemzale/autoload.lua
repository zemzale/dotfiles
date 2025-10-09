local M = {}

M.setup = function()
	local cwd = vim.fn.getcwd()
	local autoloaded_file = cwd .. "/autoload.lua"

	if vim.uv.fs_stat(autoloaded_file) then
		local ok, err = pcall(dofile, autoloaded_file)
		if not ok then
			vim.notify(err, vim.log.levels.ERROR)
		else
			vim.notify("loaded autolod", vim.log.levels.INFO)
		end
	end
end

return M
