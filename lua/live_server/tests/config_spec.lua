describe("config", function()
  describe("parameterize", function()
    it("can parameterize full configuration", function()
      local config = require "live_server.config"

      local user_config = {
        port = 7567,
        browser_command = "firefox",
      }

      local params = config.parameterize(user_config)

      assert.are.same(params, { "--port=7567", "--browser=firefox" })
    end)

    it("can parameterize partial configuration", function()
      local config = require "live_server.config"

      local user_config = {
        port = 7567,
      }

      local params = config.parameterize(user_config)

      assert.are.same(params, { "--port=7567", "--browser=" })
    end)
  end)

  describe("validate", function()
    it("can return true if valid", function()
      local config = require "live_server.config"

      local user_config = {
        port = 7567,
        browser_command = "firefox",
      }

      assert.is_true(config.validate(user_config))
    end)

    it("can return false if invalid", function()
      local config = require "live_server.config"

      local user_config = {
        port = "this is not a number",
        browser_command = "firefox",
      }

      assert.is_false(config.validate(user_config))
    end)
  end)
end)
