# Neo-tree-ezbookmarks.nvim

This provides a custom source for viewing your [ezbookmarks.nvim](https://github.com/lifer0se/ezbookmarks.nvim) bookmarks in [neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim).

## Configuration

Currently, you need to be on a special branch of `neo-tree` to use external sources.

```
use {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "external_sources_take_2", --This is the _special_ branch.
  requires = {
    "nvim-lua/plenary.nvim",
    "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    "ElPiloto/neo-tree-ezbookmarks.nvim", --This is our custom source :)
  },
}
require("neo-tree").setup({
  -- normal config of your ipsums and your lorems
  sources = {
    -- these are the built-in sources, you need to specify them here or they will not be exposed.
    "filesystem",
    "buffers",
    "git_status",
    -- this is our custom source
    "ezbookmarks",
  },
  ezbookmarks = {
    window = {
      mappings = {
        ["<CR>"] = "cd",
      },
    },
    renderers = {
      ezbookmarks_header = {
        {
          "container",
          width = "100%",
          content = {
            {"ezbookmarks_header", zindex=10},
          }
        },
      },
    },

  },
})
```

## Usage

Step 1. Add bookmarks like you normally do using `ezbookmarks.nvim`
Step 2. Run `:Neotree ezbookmarks` to view your bookmarks.
Step 3. Open a bookmark with mapping in config (this is "<CR>" in example config above).
Result: Neotree will open to the directory of your bookmark.

#### ToDo

- [ ] Actually open file bookmarks (I only use dir bookmarks myself).
- [ ] See if we can get support for nested subdirs added to ezbookmarks.nvim
- [ ] Add screenshot.
