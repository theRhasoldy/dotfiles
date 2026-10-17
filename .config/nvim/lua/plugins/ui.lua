local M = {}

M.mode_names = {
  n = "󰹇 ",
  i = "󰏫 ",
  v = "󰛐 ",
  V = "󰈈 ",
  ["\22"] = "󰡭 ",
  c = "󰹇 ",
  s = "S",
  S = "S_",
  ["\19"] = "^S",
  R = "",
  r = " ",
  t = "T",
}
M.git_icons = { branch = " ", added = " ", removed = " ", changed = " " }

return {
  {
    "rebelot/heirline.nvim",
    event = "UIEnter",
    opts = function()
      local function get_real_bufnr()
        local bufnr = vim.api.nvim_get_current_buf()
        local bt = vim.bo[bufnr].buftype
        local ft = vim.bo[bufnr].filetype

        -- If we are in a prompt/picker, grab the alternate (previous) buffer
        if bt == "prompt" or ft == "TelescopePrompt" or ft == "snacks_picker_input" then
          local prev_bufnr = vim.fn.bufnr("#")
          if prev_bufnr > 0 then
            return prev_bufnr
          end
        end
        return bufnr
      end

      local conditions = require("heirline.conditions")
      local utils = require("heirline.utils")

      -- Minimal Palette
      local colors = {
        gray = utils.get_highlight("Comment").fg,
        purple = utils.get_highlight("Keyword").fg,
        orange = utils.get_highlight("Exception").fg,
        pink = utils.get_highlight("Operator").fg,
        green = utils.get_highlight("Constant").fg,
        red = utils.get_highlight("Define").fg,
      }

      local Align, Space = { provider = "%=" }, { provider = " " }

      -- 1. Optimized ViMode
      local ViMode = {
        init = function(self)
          self.mode = vim.fn.mode(1)
        end,
        update = { "ModeChanged" },
        provider = function(self)
          return (M.mode_names[self.mode] or "󰹇 ") .. "%)"
        end,
        hl = function(self)
          local m = self.mode:sub(1, 1)
          local color_map = {
            n = colors.orange,
            i = colors.pink,
            v = colors.purple,
            V = colors.purple,
            ["\22"] = colors.purple,
            R = colors.green,
            t = colors.red,
          }
          return { fg = color_map[m] or colors.gray, bold = true }
        end,
      }

      -- 2. Macro Recording Indicator (New)
      local MacroRec = {
        condition = function()
          return vim.fn.reg_recording() ~= ""
        end,
        update = { "RecordingEnter", "RecordingLeave" },
        { provider = " ", hl = { fg = colors.orange, bold = true } },
        {
          provider = function()
            return "@" .. vim.fn.reg_recording()
          end,
          hl = { fg = colors.green, bold = true },
        },
        Space,
      }

      -- 3. Performance-focused FileName
      local FileNameBlock = {
        init = function(self)
          self.target_bufnr = get_real_bufnr()
          self.filename = vim.api.nvim_buf_get_name(self.target_bufnr)
        end,
        {
          provider = function(self)
            local icon, color = require("nvim-web-devicons").get_icon_color(self.filename, nil, { default = true })
            self.icon_color = color
            return icon and (icon .. " ")
          end,
          hl = function(self)
            return { fg = self.icon_color }
          end,
        },
        {
          provider = function(self)
            local f = vim.fn.fnamemodify(self.filename, ":.")
            return f == "" and "[No Name]"
              or (not conditions.width_percent_below(#f, 0.7) and vim.fn.pathshorten(f) or f)
          end,
          hl = function(self)
            return { fg = utils.get_highlight("Directory").fg, bold = vim.bo[self.target_bufnr].modified }
          end,
        },
        {
          condition = function()
            return vim.bo[get_real_bufnr()].modified
          end,
          provider = " ",
          hl = { fg = colors.orange },
        },
      }

      -- 4. Diagnostics with Colors
      local Diagnostics = {
        condition = conditions.has_diagnostics,
        update = { "DiagnosticChanged", "BufEnter" },
        init = function(self)
          self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
          self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
          self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
          self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
        end,
        { provider = " [ ", hl = { fg = colors.gray } },
        {
          provider = function(self)
            return self.errors > 0 and ("󰅚 " .. self.errors .. " ")
          end,
          hl = { fg = colors.red },
        },
        {
          provider = function(self)
            return self.warnings > 0 and ("󰀪 " .. self.warnings .. " ")
          end,
          hl = { fg = colors.orange },
        },
        {
          provider = function(self)
            return self.info > 0 and ("󰋽 " .. self.info .. " ")
          end,
          hl = { fg = colors.purple },
        },
        {
          provider = function(self)
            return self.hints > 0 and ("󰌶 " .. self.hints)
          end,
          hl = { fg = colors.green },
        },
        { provider = "]", hl = { fg = colors.gray } },
      }

      -- 5. Simplified Git (Fixed for Pickers)
      local Git = {
        condition = function()
          return vim.b[get_real_bufnr()].gitsigns_status_dict ~= nil
        end,
        init = function(self)
          local bufnr = get_real_bufnr()
          self.status = vim.b[bufnr].gitsigns_status_dict or { head = "", added = 0, changed = 0, removed = 0 }
        end,
        {
          condition = function(self)
            return self.status.head and self.status.head ~= ""
          end,
          provider = function(self)
            return M.git_icons.branch .. self.status.head .. " "
          end,
          hl = { fg = colors.purple, bold = true },
        },
        {
          condition = function(self)
            return (self.status.added or 0) + (self.status.removed or 0) + (self.status.changed or 0) > 0
          end,
          provider = function(self)
            local res = "[ "
            if (self.status.added or 0) > 0 then
              res = res .. " " .. self.status.added .. " "
            end
            if (self.status.changed or 0) > 0 then
              res = res .. " " .. self.status.changed .. " "
            end
            if (self.status.removed or 0) > 0 then
              res = res .. " " .. self.status.removed .. " "
            end
            return res .. "]"
          end,
          hl = { fg = colors.gray },
        },
      }

      return {
        statusline = {
          condition = function()
            return not conditions.buffer_matches({
              filetype = { "ministarter", "dashboard", "alpha", "starter", "snacks_dashboard" },
            })
          end,
          Space,
          ViMode,
          Space,
          MacroRec,
          Git,
          Align, -- Added MacroRec here
          { provider = " ", hl = { fg = colors.gray }, condition = conditions.lsp_attached },
          Space,
          FileNameBlock,
          Align,
          { provider = "%l:%c | %P", hl = { fg = colors.gray } },
          Space,
        },
        winbar = { Diagnostics, Align, FileNameBlock },
        opts = {
          disable_winbar_cb = function(args)
            return conditions.buffer_matches({
              buftype = { "nofile", "prompt", "help", "quickfix" },
              filetype = { "^git.*", "fugitive", "Trouble", "dashboard", "nterm", "ministarter" },
            }, args.buf)
          end,
        },
      }
    end,
  },
  {
    "snacks.nvim",
    opts = {
      indent = {
        enabled = false,
      },
      ---@class snacks.dashboard.Config
      ---@field enabled? boolean
      ---@field sections snacks.dashboard.Section
      ---@field formats table<string, snacks.dashboard.Text|fun(item:snacks.dashboard.Item, ctx:snacks.dashboard.Format.ctx):snacks.dashboard.Text>
      dashboard = {
        width = 60,
        -- These settings are used by some built-in sections
        preset = {
          header = [[
     _/\/\/\/\/\____/\/\____/\/\______/\/\________/\/\/\/\/\____/\/\/\/\____/\/\________/\/\/\/\/\____/\/\____/\/\_
    _/\/\____/\/\__/\/\____/\/\____/\/\/\/\____/\/\__________/\/\____/\/\__/\/\________/\/\____/\/\__/\/\____/\/\_
   _/\/\/\/\/\____/\/\/\/\/\/\__/\/\____/\/\____/\/\/\/\____/\/\____/\/\__/\/\________/\/\____/\/\____/\/\/\/\___
  _/\/\__/\/\____/\/\____/\/\__/\/\/\/\/\/\__________/\/\__/\/\____/\/\__/\/\________/\/\____/\/\______/\/\_____
 _/\/\____/\/\__/\/\____/\/\__/\/\____/\/\__/\/\/\/\/\______/\/\/\/\____/\/\/\/\/\__/\/\/\/\/\________/\/\_____
______________________________________________________________________________________________________________]],
        },
        -- item field formatters
        sections = {
          { section = "header" },
          function()
            local root = Snacks.git.get_root()
            local in_git = root ~= nil
            local remote = in_git and vim.fn.system("git -C " .. root .. " config --get remote.origin.url") or ""
            local is_bitbucket = remote:find("bitbucket") ~= nil
            local has_bkt = vim.fn.executable("bkt") == 1
            local has_gh = vim.fn.executable("gh") == 1

            local cli = (is_bitbucket and has_bkt) and "bkt" or "gh"
            local limit = cli == "bkt" and "--limit" or "-L"
            local has_cli = (cli == "bkt" and has_bkt) or (cli == "gh" and has_gh)

            local cmds = {
              {
                title = "Open Issues",
                cmd = cli .. " issue list " .. limit .. " 3",
                key = "i",
                action = function()
                  local action_cmd = cli == "bkt" and "bkt repo browse" or "gh issue list --web"
                  vim.fn.jobstart(action_cmd, { detach = true })
                end,
                icon = " ",
                height = 5,
                enabled = in_git and has_cli,
              },
              {
                icon = " ",
                title = "Open PRs",
                cmd = cli .. " pr list " .. limit .. " 3",
                key = "P",
                action = function()
                  local action_cmd = cli == "bkt" and "bkt repo browse" or "gh pr list --web"
                  vim.fn.jobstart(action_cmd, { detach = true })
                end,
                height = 5,
                enabled = in_git and has_cli,
              },
              {
                icon = " ",
                title = "Git Status",
                cmd = "git --no-pager diff --stat -B -M -C",
                height = 10,
                enabled = in_git,
              },
            }
            return vim.tbl_map(function(cmd)
              return vim.tbl_extend("force", {
                section = "terminal",
              }, cmd)
            end, cmds)
          end,
          { section = "startup" },
        },
      },
      explorer = {
        replace_netrw = true,
        trash = true,
      },
      picker = {
        matcher = {
          frecency = true,
          history_bonus = true,
        },
        sources = {
          explorer = {
            auto_close = true,
            hidden = true,
            ignored = true,
            layout = {
              auto_hide = { "input" },
            },
          },
        },
      },
    },
  },
  {
    "folke/noice.nvim",
    opts = { presets = { bottom_search = true, long_message_to_split = true, lsp_doc_border = true } },
  },
  {
    "nvim-mini/mini.hipatterns",
    opts = function(_, opts)
      if not opts.highlighters then
        return
      end

      -- Helper to dynamically create a highlight group with fg = color
      -- using the bg color from the matched highlight group.
      local function get_fg_group(hl_group)
        if not hl_group then
          return nil
        end
        local fg_hl_name = hl_group .. "_fg"
        local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = fg_hl_name })
        if ok and not vim.tbl_isempty(hl) then
          return fg_hl_name
        end

        local ok_orig, orig_hl = pcall(vim.api.nvim_get_hl, 0, { name = hl_group })
        if ok_orig and orig_hl.bg then
          vim.api.nvim_set_hl(0, fg_hl_name, { fg = orig_hl.bg })
          return fg_hl_name
        end
        return hl_group
      end

      local function eol_box(_, _, data)
        local hl_group = get_fg_group(data.hl_group)
        return {
          virt_text = { { "■", hl_group } },
          virt_text_pos = "eol",
          priority = 2000,
        }
      end

      if opts.highlighters.hex_color then
        opts.highlighters.hex_color.extmark_opts = eol_box
      end

      if opts.highlighters.shorthand then
        opts.highlighters.shorthand.extmark_opts = eol_box
      end

      local tailwind_fts = {
        "astro",
        "css",
        "heex",
        "html",
        "html-eex",
        "javascript",
        "javascriptreact",
        "rust",
        "svelte",
        "typescript",
        "typescriptreact",
        "vue",
      }

      opts.highlighters.tailwind_white = {
        pattern = function(buf_id)
          if not vim.tbl_contains(tailwind_fts, vim.bo[buf_id].filetype) then
            return nil
          end
          return "%f[%w:-]()[%w:-]+%-white()%f[^%w:-]"
        end,
        group = function()
          return MiniHipatterns.compute_hex_color_group("#ffffff", "bg")
        end,
        extmark_opts = eol_box,
      }

      opts.highlighters.tailwind_black = {
        pattern = function(buf_id)
          if not vim.tbl_contains(tailwind_fts, vim.bo[buf_id].filetype) then
            return nil
          end
          return "%f[%w:-]()[%w:-]+%-black()%f[^%w:-]"
        end,
        group = function()
          return MiniHipatterns.compute_hex_color_group("#000000", "bg")
        end,
        extmark_opts = eol_box,
      }

      if opts.highlighters.tailwind then
        opts.highlighters.tailwind.extmark_opts = eol_box
      else
        setmetatable(opts.highlighters, {
          __newindex = function(t, k, v)
            if k == "tailwind" then
              v.extmark_opts = eol_box
            end
            rawset(t, k, v)
          end,
        })
      end
    end,
  },
}
