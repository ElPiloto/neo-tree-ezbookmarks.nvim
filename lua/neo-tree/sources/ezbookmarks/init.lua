--This file should have all functions that are in the public api and either set
--or read the state of this source.

local vim = vim
local utils = require("neo-tree.utils")
local renderer = require("neo-tree.ui.renderer")
local items = require("neo-tree.sources.ezbookmarks.lib.items")
local events = require("neo-tree.events")
local manager = require("neo-tree.sources.manager")

local M = { name = "ezbookmarks" }

local wrap = function(func)
  return utils.wrap(func, M.name)
end

local get_state = function()
  return manager.get_state(M.name)
end

---Navigate to the given path.
---@param path string Path to navigate to. If empty, will navigate to the cwd.
M.navigate = function(state, path, path_to_reveal)
  state.dirty = false
  if path_to_reveal then
    renderer.position.set(state, path_to_reveal)
  end
  items.get_bookmarks(state)
end

---Configures the plugin, should be called before the plugin is used.
---@param config table Configuration table containing any keys that the user
--wants to change from the defaults. May be empty to accept default values.
M.setup = function(config, global_config)
end

return M
