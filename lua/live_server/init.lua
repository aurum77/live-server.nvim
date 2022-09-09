local M = {}

local _LIVE_SERVER_PATH = vim.fn.stdpath "data" .. "/live-server/"
local config = require "live_server.config"

M.setup = function(user_config)
  if config.validate(user_config) then
    _LIVE_SERVER_PARAMS = config.parameterize(user_config)
  else
    _LIVE_SERVER_PARAMS = config.parameterize(config.default_config)
  end
end

M.start = function()
  _LIVE_SERVER_COMMAND = { "npm", "x", "--prefix", _LIVE_SERVER_PATH, "live-server", "--", _LIVE_SERVER_PARAMS }
  SERVER_JOB = vim.fn.jobstart(vim.tbl_flatten(_LIVE_SERVER_COMMAND), {
    on_stdout = function(channel_id, data, name)
      local out = string.gsub(data[1], "[[^\27\155][][()#;?%d]*[A-PRZcf-ntqry=><~]", "")
      print(out)
    end,
  })
  print "Started live-server!"
end

M.stop = function()
  if SERVER_JOB == nil then
    print "live-server not running!"
  else
    vim.fn.jobstop(SERVER_JOB)
    SERVER_JOB = nil
    print "Stopped live-server!"
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
