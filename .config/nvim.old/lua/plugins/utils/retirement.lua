return {
  "chrisgrieser/nvim-early-retirement",
  config = true,
  event = "VeryLazy",
  opts = {
    retirementAgeMins = 20,
    minimumBufferNum = 4,
    ignoreAltFile = true, -- will not close the alternate file
    ignoreSpecialBuftypes = false,
    notificationOnAutoClose = true,
    ignoreFilenamePattern = "",
    ignoredFiletypes = {},
  },
}
