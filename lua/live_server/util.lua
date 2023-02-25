local M = {}

local loop = vim.loop

M.install = function()
  local _LIVE_SERVER_PATH = require("live_server.config").default_config.install_path
  if vim.fn.isdirectory(_LIVE_SERVER_PATH) == 0 then
    print("Installing live-server to " .. _LIVE_SERVER_PATH)
    INSTALL_HANDLE = loop.spawn("npm", {
      args = { "i", "live-server", "--prefix", _LIVE_SERVER_PATH },
    }, function()
      print("live-server has been installed at " .. _LIVE_SERVER_PATH)
      INSTALL_HANDLE:close()
    end)
  end
end

return M
