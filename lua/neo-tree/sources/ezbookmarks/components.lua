local highlights = require("neo-tree.ui.highlights")
local common = require("neo-tree.sources.common.components")

local M = {}

M.ezbookmarks_header = function(config, node, state)
  local highlight = config.highlight or highlights.GIT_ADDED
  local text = " EZBookMark"
  if node:is_expanded() then
    text = " EZBookMark"
  end
  return {
    text = text,
    highlight = highlight,
  }

end

return vim.tbl_deep_extend("force", common, M)
