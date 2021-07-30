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
