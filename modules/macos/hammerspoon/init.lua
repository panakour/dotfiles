local hotkey = require("hs.hotkey")
local window  = require("hs.window")

local hyper = { "ctrl", "cmd", "shift" }

hs.window.animationDuration = 0

hotkey.bind(hyper, "R", function() hs.reload() end)
hs.alert.show("Config loaded")

-- utility that snaps left/right then, if already snapped, jumps screen
local function cascadeMove(dir)
  local win    = window.focusedWindow()
  if not win then return end
  local s      = win:screen()
  local sf     = s:frame()
  local f      = win:frame()
  local tol    = 8  -- allow an 8px “fudge” for window borders, etc.

  if dir == "left" then
    -- are we already in the left half?
    if math.abs(f.x - sf.x) < tol
      and math.abs(f.w - sf.w/2) < tol
    then
      local west = s:toWest()
      if west then
        win:moveToScreen(west)
        win:moveToUnit({0,0,1,1})
      end
    else
      win:moveToUnit({0,0,0.5,1})
    end

  elseif dir == "right" then
    -- are we already in the right half?
    if math.abs(f.x - (sf.x + sf.w/2)) < tol
      and math.abs(f.w - sf.w/2) < tol
    then
      local east = s:toEast()
      if east then
        win:moveToScreen(east)
        win:moveToUnit({0,0,1,1})
      end
    else
      win:moveToUnit({0.5,0,0.5,1})
    end
  end
end

hotkey.bind(hyper, "Left",  function() cascadeMove("left")  end)
hotkey.bind(hyper, "Right", function() cascadeMove("right") end)

hotkey.bind(hyper, "Up",    function()
  window.focusedWindow():moveToUnit({0,0,1,0.5})
end)
hotkey.bind(hyper, "Down",  function()
  window.focusedWindow():moveToUnit({0,0.5,1,0.5})
end)

hotkey.bind(hyper, "return", function()
  window.focusedWindow():maximize()
end)

hotkey.bind(hyper, "'", function()
  local win = window.focusedWindow()
  local f   = win:frame()
  local mx  = win:screen():frame()

  f.x, f.y = mx.x + mx.w*0.1, mx.y + mx.h*0.1
  f.w, f.h = mx.w*0.8,      mx.h*0.8

  win:setFrame(f)
  win:centerOnScreen()
end)

hotkey.bind(hyper, "T", function()
  hs.application.launchOrFocus("Ghostty")
end)

hotkey.bind(hyper, "B", function()
  hs.application.launchOrFocus("Google Chrome")
end)


hotkey.bind(hyper, "G", function()
  hs.application.launchOrFocus("Phpstorm")
end)
