if vim.g.loaded_live_server == 1 then
  return
end

vim.g.loaded_live_server = 1

vim.api.nvim_create_user_command("LiveServer", function()
  require("live_server.init").toggle()
end, {})

vim.api.nvim_create_user_command("LiveServerStart", function()
  require("live_server.init").start()
end, {})

vim.api.nvim_create_user_command("LiveServerStop", function()
  require("live_server.init").stop()
end, {})

vim.api.nvim_create_user_command("LiveServerInstall", function()
  require("live_server.util").install()
end, {})
