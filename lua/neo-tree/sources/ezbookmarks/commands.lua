--This file should contain all commands meant to be used by mappings.

local vim = vim
local cc = require("neo-tree.sources.common.commands")
local utils = require("neo-tree.utils")
local inputs = require("neo-tree.ui.inputs")
local popups = require("neo-tree.ui.popups")
local manager = require("neo-tree.sources.manager")
local events = require("neo-tree.events")
local refresh = utils.wrap(manager.refresh, "citc")

local M = {}

M.cd = function(state)
  local node = state.tree:get_node()
  if node.type == "directory" then
    vim.cmd(':Neotree source=filesystem dir=' .. node.path)
  end
end

-- For some reason we need this. It seems like we're inheriting some mappings
-- and it needs to be able to find refresh.
M.refresh = refresh

cc._add_common_commands(M)

return M
