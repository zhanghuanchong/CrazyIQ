function __G__TRACKBACK__(errorMessage)
    print("----------------------------------------")
    print("LUA ERROR: " .. tostring(errorMessage) .. "\n")
    print(debug.traceback("", 2))
    print("----------------------------------------")
end

function jumpAnimate(button, onComplete)
    local function zoom1(offset, time, onComplete)
        local x, y = button:getPosition()
        local size = button:getContentSize()

        local scaleX = button:getScaleX() * (size.width + offset) / size.width
        local scaleY = button:getScaleY() * (size.height - offset) / size.height

        transition.moveTo(button, {y = y - offset, time = time})
        transition.scaleTo(button, {
            scaleX     = scaleX,
            scaleY     = scaleY,
            time       = time,
            onComplete = onComplete,
        })
    end

    local function zoom2(offset, time, onComplete)
        local x, y = button:getPosition()
        local size = button:getContentSize()

        transition.moveTo(button, {y = y + offset, time = time / 2})
        transition.scaleTo(button, {
            scaleX     = 1.0,
            scaleY     = 1.0,
            time       = time,
            onComplete = onComplete,
        })
    end

    zoom1(40, 0.08, function()
        zoom2(40, 0.09, function()
            zoom1(20, 0.10, function()
                zoom2(20, 0.11, onComplete)
            end)
        end)
    end)
end

ez = {}
ez.COLOR_BROWN = ccc3(79, 57, 30)
ez.userDefault = CCUserDefault:sharedUserDefault()

function ez:init()
    ez.isBgMusicEnabled = ez.userDefault:getBoolForKey("bgMusic", true)
    ez.isEffectEnabled = ez.userDefault:getBoolForKey("effect", true)
end

function ez:getCurrentLevel()
    return ez.userDefault:getIntegerForKey('currentLevel', 1)
end

function ez:newLabel(t)
    t.font = t.font or 'HOPE';
    t.size = t.size or 45;
    t.color = t.color or ez.COLOR_BROWN;
    t.x = t.x or 0;
    t.y = t.y or 0;
    return ui.newTTFLabel(t)
end

function ez:playEffect(...)
    if ez.isEffectEnabled then
        audio.playEffect(...)
    end
end

function ez:playBackgroundMusic(...)
    if ez.isBgMusicEnabled then
        audio.playBackgroundMusic(...)
    end
end

require("app.MyApp").new():run()
