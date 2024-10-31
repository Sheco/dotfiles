return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      mappings = {
        ["<C-D>"] = {
          function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            local cmd = "ripdrag -x -b "..path
            vim.fn.system(cmd)
          end,
          desc = "Drag and drop this file"
        }
      }
    }
  }
}
