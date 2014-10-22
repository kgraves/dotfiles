local application = require "mjolnir.application"
local hotkey = require "mjolnir.hotkey"
local window = require "mjolnir.window"
-- local screen = require "mjolnir.screen"
local fnutils = require "mjolnir.fnutils"
local alert = require "mjolnir.alert"

--
-- vim keybinding to move the focued window by increments of 10
--

-- left
hotkey.bind({"cmd", "ctrl"}, "H", function()
  local win = window:focusedwindow()
  local f = win:frame()
  f.x = f.x - 30
  win:setframe(f)
end)

-- down
hotkey.bind({"cmd", "ctrl"}, "J", function()
  local win = window:focusedwindow()
  local f = win:frame()
  f.y = f.y + 30
  win:setframe(f)
end)

-- up
hotkey.bind({"cmd", "ctrl"}, "K", function()
  local win = window:focusedwindow()
  local f = win:frame()
  f.y = f.y - 30
  win:setframe(f)
end)

-- right
hotkey.bind({"cmd", "ctrl"}, "L", function()
  local win = window:focusedwindow()
  local f = win:frame()
  f.x = f.x + 30
  win:setframe(f)
end)

--
-- vim keybindings for justifying windows and setting their height or width to
-- 1/2 the size, based on which way we are justifying.
--   - horizontal justification -> width = 1/2 * scrren_width
--   - vertical justification -> height = 1/2 * scrren_height
--

-- left
hotkey.bind({"cmd", "shift", "ctrl"}, "H", function()
  local win = window:focusedwindow()
  local f = win:frame()
  local scr = win:screen()

  f.x = scr:frame().x
  f.y = scr:frame().y
  f.w = scr:frame().w / 2
  f.h = scr:frame().h
  win:setframe(f)
end)

-- down
hotkey.bind({"cmd", "shift", "ctrl"}, "J", function()
  local win = window:focusedwindow()
  local f = win:frame()
  local scr = win:screen()
  local sf = scr:frame()

  local half_height = sf.h / 2

  f.x = sf.x
  f.y = half_height
  f.w = sf.w
  f.h = half_height
  win:setframe(f)
end)

-- up
hotkey.bind({"cmd", "shift", "ctrl"}, "K", function()
  local win = window:focusedwindow()
  local f = win:frame()
  local scr = win:screen()
  local sf = scr:frame()

  local half_height = sf.h / 2

  f.x = sf.x
  f.y = sf.y
  f.w = sf.w
  f.h = half_height
  win:setframe(f)
end)

-- right
hotkey.bind({"cmd", "shift", "ctrl"}, "L", function()
  local win = window:focusedwindow()
  local f = win:frame()
  local scr = win:screen()
  local sf = scr:frame()

  local half_width = sf.w / 2

  f.x = half_width
  f.y = sf.y
  f.w = half_width
  f.h = sf.h
  win:setframe(f)
end)

-- just for fun, show an alert on a particular key press
-- hotkey.bind({"ctrl", "alt"}, "D", function()
  -- alert.show('hallo hallo from mjolnir', 2)
-- end)
