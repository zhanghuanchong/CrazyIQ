
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

    for k, v in pairs{
        "bg",
        "click",
        "on",
        "off"
    } do
        audio.preloadMusic("sound/"..v..".mp3")
    end

    display.addSpriteFramesWithFile("image/levels.plist", "image/levels.png")
    display.addSpriteFramesWithFile("image/levels_locked.plist", "image/levels_locked.png")
    display.addSpriteFramesWithFile("image/game_scene.plist", "image/game_scene.png")
    display.addSpriteFramesWithFile("image/buttons.plist", "image/buttons.png")

    self:enterScene("GameScene")
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
--    self:enterScene('GameOverScene', nil, 'fade', 0.5, display.COLOR_BLACK)
    self:enterScene('LevelsScene', nil, 'fade', 0.5, display.COLOR_BLACK)
end

function MyApp:enterLevelClearScene()
--    self:enterScene('LevelClearScene', nil, 'fade', 0.5, display.COLOR_BLACK)
    self:enterScene('LevelsScene', nil, 'fade', 0.5, display.COLOR_BLACK)
end

function MyApp:enterPauseScene()

end

function MyApp:pushWoodScene()

end

function MyApp:popWoodScene()

end

return MyApp
