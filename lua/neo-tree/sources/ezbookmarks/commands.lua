local vim = vim
local cc = require("neo-tree.sources.common.commands")
local utils = require("neo-tree.utils")
local manager = require("neo-tree.sources.manager")
local refresh = utils.wrap(manager.refresh, "ezbookmarks")

local M = {}

M.cd = function(state)
  local node = state.tree:get_node()
  if node.type == "directory" then
    vim.cmd(':Neotree source=filesystem dir=' .. node.path)
  elseif node.type == "ezbookmarks_header" then
    cc.toggle_node(state)
  end
end

-- For some reason we need this, without it we get:
--     Neo-tree Warn: Invalid mapping for R: nil
M.refresh = refresh

cc._add_common_commands(M)

return M
