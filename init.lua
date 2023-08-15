do
  hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
    hs.reload()
  end)
  hs.alert.show("Config loaded")
end

do
  hs.hotkey.bind({"cmd", "alt"}, "L", function()
    hs.application.open("Slack")
  end)
end

do
  hs.hotkey.bind({"cmd", "alt"}, "K", function()
    hs.application.open("KakaoTalk")
  end)
end

do
  hs.hotkey.bind({"cmd", "alt"}, "N", function()
    hs.application.open("Notion")
  end)
end

do
  hs.hotkey.bind({"cmd", "alt"}, "O", function()
    hs.application.open("Visual Studio Code")
  end)
end

do
  hs.hotkey.bind({"cmd", "alt"}, "E", function()
    hs.application.open("Terminal")
  end)
end

local function changeInputMethodToEnglish()
  hs.keycodes.currentSourceID("com.apple.keylayout.ABC")
end

hs.eventtap.new({ hs.eventtap.event.types.keyDown }, function(e)
  local flags = e:getFlags()
  local keycode = e:getKeyCode()

  -- ESC 키의 keycode는 53입니다.
  if keycode == 53 then
      local app = hs.application.frontmostApplication()
      if app:name() == "Code" then
          changeInputMethodToEnglish()
      end
  end

  -- 이 함수에서는 false를 반환하면 원래의 키 이벤트가 그대로 전달됩니다.
  return false
end):start()