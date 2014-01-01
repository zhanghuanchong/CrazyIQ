local WoodScene = class('WoodScene', function()
    return display.newScene('WoodScene')
end)

function WoodScene:ctor()
    local layer = display.newSprite('image/bgWood.jpg')
    layer:setPosition(ccp(display.cx, display.cy))
    layer:setZOrder(-1)
    layer:addTo(self)

    self.backButton = ui.newImageMenuItem{
        image = 'image/back.png',
        imageSelected = 'image/backActive.png',
        x = 80,
        y = display.height - 80,
        listener = function()
            app:popWoodScene()
        end
    }
    self.backButton:setScale(0.1)

    self.backMenu = ui.newMenu{self.backButton}
    self.backMenu:setVisible(false)
    self:addChild(self.backMenu)
end

function WoodScene:showBackButton(animation)
    self.backMenu:setVisible(true)
    if animation then
        transition.execute(self.backButton, CCScaleTo:create(0.3, 1), {
            easing = 'backOut'
        })
    else
        self.backButton:setScale(1)
    end
end

return WoodScene