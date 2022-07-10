local vim = vim
local renderer = require("neo-tree.ui.renderer")
local items = require("neo-tree.sources.ezbookmarks.lib.items")

local M = { name = "ezbookmarks" }

M.navigate = function(state)
  state.dirty = false
  items.get_bookmarks(state)
end

---Configures the plugin, should be called before the plugin is used.
---@param config table Configuration table containing any keys that the user
--wants to change from the defaults. May be empty to accept default values.
M.setup = function(config, global_config)
  --currently no config needed.
end

return M
