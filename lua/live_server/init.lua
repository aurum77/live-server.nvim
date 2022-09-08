local M = {}

local _LIVE_SERVER_PATH = vim.fn.stdpath "data" .. "/live-server/"
local config = require "live_server.config"

M.setup = function(user_config)
  if config.validate_config(user_config) then
    _LIVE_SERVER_PARAMS = config.parameterize_config(user_config)
  else
    _LIVE_SERVER_PARAMS = config.parameterize_config(config.default_config)
  end
end

M.start = function()
  print "Started live-server!"

  _LIVE_SERVER_COMMAND = { "npm", "x", "--prefix", _LIVE_SERVER_PATH, "live-server", "--", _LIVE_SERVER_PARAMS }
  SERVER_JOB = vim.fn.jobstart(vim.tbl_flatten(_LIVE_SERVER_COMMAND))
end

M.stop = function()
  if SERVER_JOB == nil then
    print "live-server not running!"
  else
    print "Stopped live-server!"
    vim.fn.jobstop(SERVER_JOB)
    SERVER_JOB = nil
  end
end

M.toggle = function()
  if SERVER_JOB == nil then
    M.start()
  else
    M.stop()
  end
end

return M
