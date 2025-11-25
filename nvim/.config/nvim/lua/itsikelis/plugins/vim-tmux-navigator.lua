return {
  "christoomey/vim-tmux-navigator",
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
    "TmuxNavigatorProcessList",
  },
  keys = {
    { "<A-h>", "<cmd> TmuxNavigateLeft<CR>" },
    { "<A-j>", "<cmd> TmuxNavigateDown<CR>" },
    { "<A-k>", "<cmd> TmuxNavigateUp<CR>" },
    { "<A-l>", "<cmd> TmuxNavigateRight<CR>" },
  },
}
