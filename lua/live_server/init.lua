local M = {}

M.start = function()
	print("Started live server!")
end

M.stop = function()
  print("Stopped live server!")
end

M.install = function()
  print("Installing live server to " .. vim.fn.stdpath "data" .. "/live-server")
end

M.uninstall = function ()
  print("Uninstalling live server")
end

M.check_update = function()
  print("Checking for live server updates from NPM registry")
end

return M
