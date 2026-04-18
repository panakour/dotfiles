local hotkey = require("hs.hotkey")
local window = require("hs.window")

local hyper = { "cmd", "alt", "ctrl", "shift" }

hs.window.animationDuration = 0

hotkey.bind(hyper, "R", function()
	hs.reload()
end)
hs.alert.show("Config loaded")

-- utility that snaps left/right then, if already snapped, jumps screen
local function cascadeMove(dir)
	local win = window.focusedWindow()
	if not win then
		return
	end
	local s = win:screen()
	local sf = s:frame()
	local f = win:frame()
	local tol = 8 -- allow an 8px “fudge” for window borders, etc.

	if dir == "left" then
		-- are we already in the left half?
		if math.abs(f.x - sf.x) < tol and math.abs(f.w - sf.w / 2) < tol then
			local west = s:toWest()
			if west then
				win:moveToScreen(west)
				win:moveToUnit({ 0, 0, 1, 1 })
			end
		else
			win:moveToUnit({ 0, 0, 0.5, 1 })
		end
	elseif dir == "right" then
		-- are we already in the right half?
		if math.abs(f.x - (sf.x + sf.w / 2)) < tol and math.abs(f.w - sf.w / 2) < tol then
			local east = s:toEast()
			if east then
				win:moveToScreen(east)
				win:moveToUnit({ 0, 0, 1, 1 })
			end
		else
			win:moveToUnit({ 0.5, 0, 0.5, 1 })
		end
	end
end

local function moveLeft()
	cascadeMove("left")
end

local function moveRight()
	cascadeMove("right")
end

local function moveUp()
	local win = window.focusedWindow()
	if not win then return end
	win:moveToUnit({ 0, 0, 1, 0.5 })
end

local function moveDown()
	local win = window.focusedWindow()
	if not win then return end
	win:moveToUnit({ 0, 0.5, 1, 0.5 })
end

hotkey.bind(hyper, "Left", moveLeft)
hotkey.bind(hyper, "h", moveLeft)
hotkey.bind(hyper, "Right", moveRight)
hotkey.bind(hyper, "l", moveRight)
hotkey.bind(hyper, "Up", moveUp)
hotkey.bind(hyper, "k", moveUp)
hotkey.bind(hyper, "Down", moveDown)
hotkey.bind(hyper, "j", moveDown)

hotkey.bind(hyper, "return", function()
	local win = window.focusedWindow()
	if not win then return end
	win:maximize()
end)

hotkey.bind(hyper, "S", function()
	hs.eventtap.keyStroke({ "cmd", "shift" }, "4")
end)

hotkey.bind(hyper, "5", function()
	hs.eventtap.keyStroke({ "cmd", "shift" }, "5")
end)

local function centerLargeWindow()
	local win = window.focusedWindow()
	if not win then return end
	local mx = win:screen():frame()
	local f = win:frame()

	f.w, f.h = mx.w * 0.8, mx.h * 0.8
	f.x, f.y = mx.x + (mx.w - f.w) / 2, mx.y + (mx.h - f.h) / 2

	win:setFrame(f)
end

hotkey.bind(hyper, "'", centerLargeWindow)
hotkey.bind(hyper, "\\", centerLargeWindow)

hotkey.bind(hyper, "T", function()
	hs.application.launchOrFocus("Ghostty")
end)

hotkey.bind(hyper, "B", function()
	hs.application.launchOrFocus("Google Chrome")
end)

hotkey.bind(hyper, "P", function()
	hs.application.launchOrFocus("Phpstorm")
end)

hotkey.bind(hyper, "G", function()
	hs.application.launchOrFocus("Goland")
end)

hotkey.bind(hyper, "F", function()
	hs.application.launchOrFocus("Finder")
end)

-- Chrome dev shortcuts: focus Chrome (launch if needed) then send the native keystroke
local function chromeKey(mods, key)
	return function()
		hs.application.launchOrFocus("Google Chrome")
		hs.timer.doAfter(0.05, function()
			hs.eventtap.keyStroke(mods, key)
		end)
	end
end

hotkey.bind(hyper, "1", chromeKey({ "cmd", "alt" }, "i")) -- DevTools (Elements)
hotkey.bind(hyper, "2", chromeKey({ "cmd", "alt" }, "j")) -- DevTools Console
hotkey.bind(hyper, "3", chromeKey({ "cmd", "shift" }, "r")) -- Hard reload, bypass cache
hotkey.bind(hyper, "4", chromeKey({ "cmd", "shift" }, "n")) -- New Incognito window
