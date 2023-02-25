local M = {}

M.default_config = {
  port = 8080,
  browser_command = "",
  quiet = false,
  no_css_inject = false,
  install_path = vim.fn.stdpath "data" .. "/live-server/",
}

M.validate = function(user_config)
  if type(user_config) ~= "table" then
    return false
  end

  if type(user_config.port) ~= "number" then
    return false
  end

  if type(user_config.browser_command) ~= "string" then
    return false
  end

  if type(user_config.quiet) ~= "boolean" then
    return false
  end

  if type(user_config.no_css_inject) ~= "boolean" then
    return false
  end

  if type(user_config.install_path) ~= "string" then
    return false
  end

  return true
end

M.parameterize = function(user_config)
  local port = user_config.port or M.default_config.port
  local browser_command = user_config.browser_command or M.default_config.browser_command
  local quiet = (user_config.quiet or M.default_config.quiet) and "--quiet" or ""
  local no_css_inject = (user_config.no_css_inject or M.default_config.no_css_inject) and "--no-css-inject" or ""

  local params = {
    "--port=" .. port,
    "--browser=" .. browser_command,
    quiet,
    no_css_inject,
  }

  return params
end

return M
