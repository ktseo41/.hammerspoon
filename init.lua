-- -- if escape is pressed on vscode, then switch to English
-- function detectEscapeOnCodeAndChangeInputToEnglish()
--     local frontmostApplication = hs.application.frontmostApplication()
--     if frontmostApplication and frontmostApplication:name() == "Code" then
--         local caps_mode = hs.hotkey.modal.new()
--         local inputEnglish = "com.apple.keylayout.ABC"
--         local on_caps_mode = function()
--             caps_mode:enter()
--         end
--         local off_caps_mode = function()
--             caps_mode:exit()
--             local input_source = hs.keycodes.currentSourceID()
--             if not (input_source == inputEnglish) then
--                 hs.keycodes.currentSourceID(inputEnglish)
--             end
--             hs.eventtap.keyStroke({'control'}, 'c')
--         end
--         hs.hotkey.bind({}, 'escape', on_caps_mode, off_caps_mode)
--     else
--       hs.eventtap.keyStroke({}, 'escape')
--     end
-- end

-- -- init detectEscapeOnCodeAndChangeInputToEnglish
-- detectEscapeOnCodeAndChangeInputToEnglish()

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
