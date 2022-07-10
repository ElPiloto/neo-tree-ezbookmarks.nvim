local vim = vim
local renderer = require("neo-tree.ui.renderer")
local file_items = require("neo-tree.sources.common.file-items")
local log = require("neo-tree.log")
local git = require("neo-tree.git")
local utils = require("neo-tree.utils")

local M = {}

local make_bookmark_item = function (path)
  local parent_path, name = utils.split_path(path)
  local stat = vim.loop.fs_stat(path)
  local _type = stat and stat.type or "unknown"
  local item = {
    id = path,
    name = path,
    --name = name,
    parent_path = parent_path,
    path = path,
    type = _type,
  }
  return item
end

local make_header = function()
  local item = {
    id = 'ezbookmarks_header',
    name = 'ezbookmarks_header',
    parent_path = '.',
    path = '.',
    type = 'ezbookmarks_header',
    loaded = false,
  }
  return item
end

local get_bookmarks = function ()
  --TODO(elpiloto): Make this a pcall.
  local ezbm_utils = require('ezbookmarks.utils')
  local bookmarks = ezbm_utils.get_lines_from_bookmark_file()
  if not bookmarks then
    return {}
  end
  local items = {}
  for _, line in ipairs(bookmarks) do
    local item = make_bookmark_item(line)
    if item ~= nil then
      table.insert(items, item)
    end
  end
  return items
end

M.get_bookmarks = function(state)
  if state.loading then
    return
  end
  state.loading = true
  local bookmark_items = get_bookmarks()
  state.default_expanded_nodes = {}
  local header_node = make_header()
  header_node.children = bookmark_items
  renderer.show_nodes({header_node}, state)
  state.loading = false
end

return M
