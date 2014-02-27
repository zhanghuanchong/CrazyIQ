local GameScene = class('GameScene', function()
    return WoodScene.new()
end)

function GameScene:ctor()
    self.tipPaper = display.newSprite("#paper_" .. math.random(5) .. '.png')
    self:addChild(self.tipPaper)
    self.tipPaper:setPosition(ccp(display.cx, display.height - self.tipPaper:getContentSize().height / 2))
end

function GameScene:onEnter()
end

return GameScene