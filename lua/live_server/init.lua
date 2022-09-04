local M = {}
local LIVE_SERVER_PATH = vim.fn.stdpath("data") .. "/live-server/"

M.start = function()
	print("Started live-server!")
	SERVER_JOB = vim.fn.jobstart({ "npm", "x", "live-server", "--prefix", LIVE_SERVER_PATH})
end

M.stop = function()
	print("Stopped live-server!")
	vim.fn.jobstop(SERVER_JOB)
end

return M
