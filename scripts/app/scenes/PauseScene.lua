local PauseScene = class('PauseScene', function()
    return WoodScene.new()
end)

function PauseScene:ctor()
    local btnHome = WoodButton.new{
        title = "回到首页",
        listener = function()
            app:enterGameScene()
        end
    }
    if ez.gameScene:hasMoreLevel() == false then
        btnHome:setVisible(false)
    end
    local btnLevels = WoodButton.new{
        title = "选择关卡",
        listener = function()
            print("Share")
        end
    }
    local mainMenu = ui.newMenu{ btnHome, btnLevels }
    self:addChild(mainMenu, 2)
    mainMenu:setPosition(ccp(display.width * 1.5, display.height * 0.2))
    mainMenu:alignItemsVerticallyWithPadding(display.height * 0.04)
    self.mainMenu = mainMenu
end

function PauseScene:easeIn(node, delay)
    node:setPositionX(display.width * 1.5);
    transition.execute(node, CCMoveBy:create(0.6, ccp(-display.width, 0)), {
        delay = delay,
        easing = 'exponentialOut'
    })
end

function PauseScene:onEnter()
    for i,v in ipairs{
        self.mainMenu
    } do
        self:easeIn(v, i * 0.1)
    end

    local backMenu, backBtn = self:newBackMenu(function()
        ez.director:popScene()
    end)
    self:addChild(backMenu)
    self:showBackButton(backMenu, backBtn, true)
end

return PauseScene