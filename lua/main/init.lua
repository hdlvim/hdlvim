local M = {}
M.version = "v0.10.4"

---@type UserConfig
M.config = require("main.config")
--- @param user_config UserConfig
function M.setup(user_config)
  require("main.utils.global")
  require("main.basic")
  -- user config override
  M.config = vim.tbl_deep_extend("force", M.config, user_config)
  require("main.env").init(M.config)
  require("main.keybindings")
  local pluginManager = require("main.lazy")
  if not pluginManager.avaliable() then
    pluginManager.install()
  end
  pluginManager.setup()
  require("main.colorscheme").reset()
  require("main.autocmds")
  require("main.lsp")
  require("main.cmp")
  require("main.format")
  require("main.dap")
  require("main.utils.color-preview")
  if M.config.fix_windows_clipboard then
    require("utils.fix-yank")
  end
end

return M
