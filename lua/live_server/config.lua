local M = {}

M.default_config = {
  port = 8080,
  browser_command = "",
}

M.validate = function(user_config)
  if type(user_config) ~= "table" then
    return false
  end

  if user_config.port then
    if type(user_config.port) ~= "number" then
      return false
    end
  end

  if user_config.browser_command then
    if type(user_config.browser_command) ~= "string" then
      return false
    end
  end

  return true
end

M.parameterize_config = function(user_config)
  local port
  local browser_command

  if not user_config.port then
    port = M.default_config.port
  else
    port = user_config.port
  end

  if not user_config.browser_command then
    browser_command = M.default_config.browser_command
  else
    browser_command = user_config.browser_command
  end

  local params = {
    "--port=" .. port,
    "--browser=" .. browser_command,
  }

  return params
end

return M
