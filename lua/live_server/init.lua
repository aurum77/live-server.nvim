local M = {}
local LIVE_SERVER_PATH = vim.fn.stdpath("data") .. "/live-server/"

M.start = function()
	print("Started live-server!")
	SERVER_JOB = vim.fn.jobstart({ "npm", "x", "live-server", "--prefix", LIVE_SERVER_PATH})
end

M.stop = function()
	if SERVER_JOB == nil then
		print("live-server not running!")
	else
		print("Stopped live-server!")
		vim.fn.jobstop(SERVER_JOB)
		SERVER_JOB = nil
	end
end
end

return M
