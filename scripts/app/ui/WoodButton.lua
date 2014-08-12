local WoodButton = class('WoodButton', function()
    local imageNormal = display.newSprite('#btn.png')
    local imageSelected = display.newSprite('#btnActive.png')
    local item = MenuItemSpriteExtension:create(imageNormal, imageSelected)
    CCSpriteExtend.extend(item)
    return item
end)

-- create bubble button
-- params: title, listener
function WoodButton:ctor(params)
    params.sound = 'sound/click.mp3'

    local listener = params.listener
    local button = self

    params.listener = function(tag)
        if params.prepare then
            params.prepare()
        end

        button:getParent():setEnabled(false)
        jumpAnimate(button, function()
            button:getParent():setEnabled(true)
            listener(tag)
        end)
    end

    self:registerScriptTapHandler(function(tag)
        if params.sound then ez:playEffect(params.sound) end
        params.listener(tag)
    end)

    local x, y = params.x, params.y
    local tag = params.tag
    if x and y then self:setPosition(x, y) end
    if tag then self:setTag(tag) end

    if params.title then
        local pos = button:getContentSize()
        local label = ez:newLabel{
            text = params.title,
            align = ui.TEXT_ALIGN_CENTER,
            x = pos.width * 0.5,
            y = pos.height * 0.55
        }
        button:addChild(label)
        self.label = label

        button:setSelectedCallback(function()
            label:setPositionY(pos.height * 0.5)
        end);

        button:setUnselectedCallback(function()
            label:setPositionY(pos.height * 0.55)
        end)
    end
end

return WoodButton
