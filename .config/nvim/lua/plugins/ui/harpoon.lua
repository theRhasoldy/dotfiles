return {
  "ThePrimeagen/harpoon",
  opts = {
    global_settings = {
      excluded_filetypes = { "harpoon", "TelescopePrompt", "cmp_docs", "cmp_menu", "noice", "notify" },
    },
  },
  keys = {
    {
      "m",
      function()
        require("harpoon.mark").add_file()
        print("Mark saved!")
      end,
    },
    {
      "<Leader>m",
      function()
        require("telescope").extensions.harpoon.marks({
          initial_mode = "normal",
        })
      end,
      desc = "List harpoon marks in current project",
    },
  },
}
