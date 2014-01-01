
require("config")
require("framework.init")
require("framework.shortcodes")
require("framework.cc.init")
scheduler = require("framework.scheduler")
WoodScene = require("app.scenes.WoodScene")

local MyApp = class("MyApp", cc.mvc.AppBase)

function MyApp:ctor()
    MyApp.super.ctor(self)
end

function MyApp:run()
    CCFileUtils:sharedFileUtils():addSearchPath("res/")
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
