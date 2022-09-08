local M = {}

local LIVE_SERVER_PATH = vim.fn.stdpath "data" .. "/live-server/"
local loop = vim.loop

M.install = function()
  if vim.fn.isdirectory(LIVE_SERVER_PATH) == 0 then
    print("Installing live-server to " .. LIVE_SERVER_PATH)
    SERVER_HANDLE = loop.spawn("npm", {
      args = { "i", "live-server", "--prefix", LIVE_SERVER_PATH },
    }, function()
      print("live-server has been installed at " .. LIVE_SERVER_PATH)
      SERVER_HANDLE:close()
    end)
  end
end

return M
