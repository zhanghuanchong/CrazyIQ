
require("config")
require("framework.init")
require("framework.shortcodes")
require("framework.cc.init")
scheduler = require("framework.scheduler")
WoodScene = require("app.scenes.WoodScene")
LevelsScene = require('app.scenes.LevelsScene')
GameScene = require('app.scenes.GameScene')
WoodButton = require('app.ui.WoodButton')
WoodSquare = require('app.ui.WoodSquare')

local MyApp = class("MyApp", cc.mvc.AppBase)

function MyApp:ctor()
    MyApp.super.ctor(self)
end

function MyApp:run()
    CCFileUtils:sharedFileUtils():addSearchPath("res/")
    ez:init()

    display.addSpriteFramesWithFile("image/common.plist", "image/common.png")

    math.randomseed(os.time());

    for k, v in pairs{
        "bg",
        "click",
        "on",
        "off"
    } do
        audio.preloadMusic("sound/"..v..".mp3")
    end

        self:enterScene("SplashScene")
    --  for test
--    self:enterLevelsScene()
--    self:enterUpgradeScene()
--    self:enterGameScene()
--    self:enterGameOverScene()
end

function MyApp:enterMenuScene()
    self:enterScene('MenuScene', nil, 'fade', 0.5, display.COLOR_BLACK)
end

function MyApp:enterLevelsScene()
    self:enterScene('LevelsScene', nil, 'fade', 0.5, display.COLOR_BLACK)
end

function MyApp:enterGameScene()
    self:enterScene('GameScene', nil, 'fade', 0.5, display.COLOR_BLACK)
end

function MyApp:enterGameOverScene()
    self:enterScene('GameOverScene', nil, 'fade', 0.5, display.COLOR_BLACK)
end

function MyApp:enterUpgradeScene()
    self:enterScene('UpgradeScene', nil, 'fade', 0.5, display.COLOR_BLACK)
end

function MyApp:enterPauseScene()

end

function MyApp:pushWoodScene()

end

function MyApp:popWoodScene()

end

function MyApp:onEnterBackground()
    audio.pauseBackgroundMusic()
    audio.pauseAllEffects()
end

function MyApp:onEnterForeground()
    if ez.isBgMusicEnabled then
        audio.resumeBackgroundMusic()
    end
    if ez.isEffectEnabled then
        audio.resumeAllEffects()
    end
end

function MyApp:exit()
    display.removeSpriteFramesWithFile("image/common.plist")
    MyApp.super:exit()
end

return MyApp
