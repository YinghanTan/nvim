local theme = {
  fill = "TabLineFill",
  head = "TabLine",
  current_tab = "TabLineSel",
  tab = "TabLine",
  win = "TabLine",
  tail = "TabLine",
}

local tab_count = function()
  local num_tabs = #vim.api.nvim_list_tabpages()
  if num_tabs > 1 then
    local tabpage_number = tostring(vim.api.nvim_tabpage_get_number(0))
    return tabpage_number .. "/" .. tostring(num_tabs)
  end
end


local change_mark = function(tab)
  local already_marked = false
  return tab.wins().foreach(function(win)
    local bufnr = vim.fn.getwininfo(win.id)[1].bufnr
    local bufinfo = vim.fn.getbufinfo(bufnr)[1]
    if not already_marked and bufinfo.changed == 1 then
      already_marked = true
      return " "
    else
      return ""
    end
  end)
end

local window_count = function(tab)
  local api = require "tabby.module.api"
  local win_count = #api.get_tab_wins(tab.id)
  if win_count == 1 then
    return "1"
  else
    return "[" .. win_count .. "]"
  end
end

return {
  "nanozuki/tabby.nvim",
  event = "VeryLazy",
  config = function()

    vim.o.showtabline = 2
    vim.opt.sessionoptions = 'curdir,folds,globals,help,tabpages,terminal,winsize'

    require("tabby.tabline").set(function(line)
      return {
        {
          { "  ", hl = theme.head },
          -- { tab_count(), hl = theme.head },
          -- line.sep(" ", theme.head, theme.fill),
          -- line.sep(" ", theme.head, theme.fill),
        },
        line.tabs().foreach(function(tab)
          local hl = tab.is_current() and theme.current_tab or theme.tab
          return {
            -- line.sep("", hl, theme.fill),
            -- line.sep("", hl, theme.fill),
            tab.is_current() and "" or "",
            tab.number(),
            tab.name(),
            -- window_count(tab),
            -- change_mark(tab),
            -- line.sep(" ", hl, theme.fill),
            -- line.sep(" ", hl, theme.fill),
            line.sep(" ", hl, theme.fill),
            hl = hl,
            margin = " ",
          }
        end),
        hl = theme.fill,
      }
    end, {
      buf_name = {
        mode = "unique",
      },
    })
  end,
}



-- gt	Go to the next tab page.
-- {count}gt	Go to tab page {count}.  The first tab page has number one.
-- g<Tab>		Go to previous (last accessed) tab page.
-- gT		Go to the previous tab page.
