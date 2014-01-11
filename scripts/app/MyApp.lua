
require("config")
require("framework.init")
require("framework.shortcodes")
require("framework.cc.init")
scheduler = require("framework.scheduler")
WoodScene = require("app.scenes.WoodScene")
WoodButton = require('app.ui.WoodButton')
WoodSquare = require('app.ui.WoodSquare')

local MyApp = class("MyApp", cc.mvc.AppBase)

function MyApp:ctor()
    MyApp.super.ctor(self)
end

function MyApp:run()
    CCFileUtils:sharedFileUtils():addSearchPath("res/")
    ez.init()

    for k, v in pairs{
        "bg",
        "click",
        "on",
        "off"
    } do
        audio.preloadMusic("sound/"..v..".mp3")
    end

    self:enterScene("SplashScene")
end

function MyApp:enterMenuScene()
    self:enterScene('MenuScene', nil, 'fade', 0.5, display.COLOR_BLACK);
end

function MyApp:pushWoodScene()

end

function MyApp:popWoodScene()

end

return MyApp
