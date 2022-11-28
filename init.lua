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