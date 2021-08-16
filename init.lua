-- if escape is pressed on vscode, then switch to English
function detectEscapeOnCodeAndChangeInputToEnglish()
    local frontmostApplication = hs.application.frontmostApplication()
    if frontmostApplication and frontmostApplication:name() == "Code" then
        local caps_mode = hs.hotkey.modal.new()
        local inputEnglish = "com.apple.keylayout.ABC"
        local on_caps_mode = function()
            caps_mode:enter()
        end
        local off_caps_mode = function()
            caps_mode:exit()
            local input_source = hs.keycodes.currentSourceID()
            if not (input_source == inputEnglish) then
                hs.keycodes.currentSourceID(inputEnglish)
            end
            hs.eventtap.keyStroke({'control'}, 'c')
        end
        hs.hotkey.bind({}, 'escape', on_caps_mode, off_caps_mode)
    end
end

-- https://github.com/Hammerspoon/hammerspoon/issues/1039
layoutWatcher = hs.eventtap.new({hs.eventtap.event.types.flagsChanged}, function(e)
    detectEscapeOnCodeAndChangeInputToEnglish()

    local flags = e:getFlags()
    local inputSource = {
        english = "com.apple.keylayout.ABC",
        korean = "com.apple.inputmethod.Korean.2SetKorean",
    }
    local changeInput = function()

        local current = hs.keycodes.currentSourceID()
        local nextInput = nil

        if current == inputSource.english then
            nextInput = inputSource.korean
            for _, screen in ipairs(hs.screen.allScreens()) do
                hs.alert("ㄱㄴㄷ", screen)
            end
        else
            nextInput = inputSource.english
            for _, screen in ipairs(hs.screen.allScreens()) do
                hs.alert("ABC", screen)
            end
        end
        hs.keycodes.currentSourceID(nextInput)
    end

    if flags.cmd and not (flags.alt or flags.shift or flags.ctrl or flags.fn) then
        local keyCode = e:getKeyCode()
        if keyCode == 0x36 then
            changeInput()
        end
    end    
end):start()