local Checkbox = class('Checkbox', function()
    return display.newNode()
end)

function Checkbox:ctor(param)
    self.unchecked = display.newSprite("#checkbox_unchecked.png")
    self:addChild(self.unchecked)

    self.checked = display.newSprite("#checkbox_checked.png")
    self:addChild(self.checked)
    self.checked:setVisible(false)

    param = param or {}
    if param.touchable then
        self:setTouchEnabled(true)
        self.unchecked:setTouchEnabled(true)
        self.unchecked:addTouchEventListener(function()
            self.unchecked:setVisible(false)
            self.checked:setVisible(true)
            if param.onChecked then
                param.onChecked()
            end
        end)

        self.checked:setTouchEnabled(true)
        self.checked:addTouchEventListener(function()
            self.checked:setVisible(false)
            self.unchecked:setVisible(true)
            if param.onUnchecked then
                param.onUnchecked()
            end
        end)
    end
end

function Checkbox:setChecked(bChecked)
    if bChecked then
        self.unchecked:setVisible(false)
        self.checked:setVisible(true)
    else
        self.checked:setVisible(false)
        self.unchecked:setVisible(true)
    end
end

function Checkbox:isChecked()
    return self.checked:isVisible()
end

return Checkbox