--
-- vim keybinding to move the focued window by increments of 30
--

-- Disable window animations for movements.
-- The animations get extremely clunky and it doesn't look nice. :(
hs.window.animationDuration = 0

-- left
hs.hotkey.bind({"cmd", "ctrl"}, "H", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  f.x = f.x - 30
  win:setFrame(f)
end)

-- down
hs.hotkey.bind({"cmd", "ctrl"}, "J", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  f.y = f.y + 30
  win:setFrame(f)
end)

-- up
hs.hotkey.bind({"cmd", "ctrl"}, "K", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  f.y = f.y - 30
  win:setFrame(f)
end)

-- right
hs.hotkey.bind({"cmd", "ctrl"}, "L", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  f.x = f.x + 30
  win:setFrame(f)
end)

--
-- vim keybindings for justifying windows and setting their height or width to
-- 1/2 the size, based on which way we are justifying.
--   - horizontal justification -> width = 1/2 * scrren_width
--   - vertical justification -> height = 1/2 * scrren_height
--

-- left
hs.hotkey.bind({"cmd", "shift", "ctrl"}, "H", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local scr = win:screen()

  f.x = scr:frame().x
  f.y = scr:frame().y
  f.w = scr:frame().w / 2
  f.h = scr:frame().h
  win:setFrame(f)
end)

-- down
hs.hotkey.bind({"cmd", "shift", "ctrl"}, "J", function()
  local win = hs.window.focusedWindow()
  local app = win.application(win)
  app.hide(app)
end)

-- up
hs.hotkey.bind({"cmd", "shift", "ctrl"}, "K", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local scr = win:screen()
  local sf = scr:frame()

  f.x = sf.x
  f.y = sf.y
  f.w = sf.w
  f.h = sf.h
  win:setFrame(f)
end)

-- right
hs.hotkey.bind({"cmd", "shift", "ctrl"}, "L", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local scr = win:screen()
  local sf = scr:frame()

  local half_width = sf.w / 2

  f.x = sf.x + (sf.w / 2)
  f.y = sf.y
  f.w = half_width
  f.h = sf.h
  win:setFrame(f)
end)

--
-- keybinding to lock screen
--
hs.hotkey.bind({"cmd", "shift", "ctrl"}, "p", function()
  hs.caffeinate.lockScreen()
end)