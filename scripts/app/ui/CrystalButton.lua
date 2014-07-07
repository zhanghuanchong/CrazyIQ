local CrystalButton = class('CrystalButton', function()
    return display.newNode()
end)

-- params: color, title, titleColor, scale, prepare, listener, x, y
function CrystalButton:ctor(params)
    local fileName = "#crystal_"
    if params.mini then
        fileName = '#crystal_mini_'
    end

    self.bg = display.newSprite(fileName .. params.color .. '.png')
    self:addChild(self.bg)

    self:setScale(params.scale)

    params.sound = 'sound/click.mp3'

    self:setTouchEnabled(true)
    self:addTouchEventListener(function(event, touch)
        if event == 'began' then
            if params.sound then
                ez:playEffect(params.sound)
            end
            if params.prepare then
                params.prepare()
            end

            jumpAnimate(self.bg, function()
                if params.listener then
                    params.listener()
                end
            end)
            jumpAnimate(self.label)
        end
        return true
    end)

    local x, y = params.x, params.y
    if x and y then self:setPosition(x, y) end

    if params.title then
        local pos = self:getContentSize()
        local label = ez:newLabel{
            text = params.title,
            align = ui.TEXT_ALIGN_CENTER,
            size = params.titleSize or 200,
            color = params.titleColor or display.COLOR_BLACK,
            x = pos.width * 0.5,
            y = pos.height * 0.55
        }
        self:addChild(label)
        self.label = label
    end
end

function CrystalButton:setTitleVisible(v)
    self.label:setVisible(v)
end

return CrystalButton
