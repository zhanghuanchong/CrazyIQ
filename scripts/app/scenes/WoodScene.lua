local WoodScene = class('WoodScene', function()
    return display.newScene('WoodScene')
end)

function WoodScene:ctor()
    local layer = self:newWoodLayer()
    layer:setZOrder(-1)
    layer:addTo(self)
end

function WoodScene:newWoodLayer()
    local layer = display.newSprite('image/bgWood.jpg')
    layer:setPosition(ccp(display.cx, display.cy))
    return layer
end

function WoodScene:newBackMenu(listener)
    local backButton = WoodSquare.new{
        image = 'image/back.png',
        imageActive = 'image/backActive.png',
        x = 80,
        y = display.height - 80,
        listener = listener or function()
            app:popWoodScene()
        end
    }
    backButton:setScale(0.1)

    local backMenu = ui.newMenu{backButton}
    backMenu:setVisible(false)
    return backMenu, backButton
end

function WoodScene:showBackButton(backMenu, backButton, animation)
    backMenu:setVisible(true)
    if animation then
        transition.execute(backButton, CCScaleTo:create(0.5, 1), {
            easing = 'backOut'
        })
    else
        backButton:setScale(1)
    end
end

return WoodScene