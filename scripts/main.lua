
function __G__TRACKBACK__(errorMessage)
    print("----------------------------------------")
    print("LUA ERROR: " .. tostring(errorMessage) .. "\n")
    print(debug.traceback("", 2))
    print("----------------------------------------")
end

ez = {}
ez.COLOR_BROWN = ccc3(79, 57, 30)
ez.userDefault = CCUserDefault:sharedUserDefault()

function ez:init()
    ez.isBgMusicEnabled = ez.userDefault:getBoolForKey("bgMusic", true)
    ez.isEffectEnabled = ez.userDefault:getBoolForKey("effect", true)
end

function ez:newLabel(t)
    t.font = t.font or 'HOPE';
    t.size = t.size or 45;
    t.color = t.color or ez.COLOR_BROWN;
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
