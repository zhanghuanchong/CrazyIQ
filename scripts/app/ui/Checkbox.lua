local Checkbox = class('Checkbox', function()
    return display.newNode()
end)

function Checkbox:ctor(param)
    self.unchecked = display.newSprite("image/checkbox_unchecked.png")
    self:addChild(self.unchecked)

    self.checked = display.newSprite("image/checkbox_checked.png")

    param = param or {}
    if param.touchable then
        self:setTouchEnabled(true)
        self.unchecked:setTouchEnabled(true)
        self.unchecked:addTouchEventListener(function()
            self.unchecked:removeFromParent()
            self:addChild(self.checked)
            if param.onChecked then
                param.onChecked()
            end
        end)

        self.checked:setTouchEnabled(true)
        self.checked:addTouchEventListener(function()
            self.checked:removeFromParent()
            self:addChild(self.unchecked)
            if param.onUnchecked then
                param.onUnchecked()
            end
        end)
    end
end

function Checkbox:setChecked(bChecked)
    if bChecked then
        self.unchecked:removeFromParent()
        self:addChild(self.checked)
    else
        self.checked:removeFromParent()
        self:addChild(self.unchecked)
    end
end

function Checkbox:isChecked()
    return self.checked:getParent() ~= nil
end

return Checkbox