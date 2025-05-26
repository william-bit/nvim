return {
  {
    "kevinhwang91/nvim-ufo",
    config = true,
    event = "BufRead",
    keys = {
      { "zM", function() require("ufo").closeAllFolds() end , desc = "Close all folds", mode = { "n" } },
      {  "zR", function() require("ufo").openAllFolds() end , desc = "Open all folds", mode = { "n" } },
    },
    dependencies = { "kevinhwang91/promise-async" },
  },
}
