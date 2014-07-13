function __G__TRACKBACK__(errorMessage)
    print("----------------------------------------")
    print("LUA ERROR: " .. tostring(errorMessage) .. "\n")
    print(debug.traceback("", 2))
    print("----------------------------------------")
end

function showAnimate(sprite, bShow, onComplete)
    if bShow == nil then
        bShow = true
    end
    local scale = 0.1
    local easing = 'backIn'
    if bShow then
        sprite:setScale(0.1)
        scale = 1
        easing = 'backOut'
    else
        sprite:setScale(1)
    end
    sprite:setVisible(true)
    transition.execute(sprite, CCScaleTo:create(0.3, scale), {
        easing = easing,
        onComplete = function()
            if bShow == false then
                sprite:setVisible(false)
            end
            if onComplete then
                onComplete()
            end
        end
    })
end

function jumpAnimate(button, onComplete, zoom)
    ez:playEffect('sound/click.mp3')
    if zoom == nil then
        zoom = true
    end

    local function zoom1(offset, time, onComplete)
        local x, y = button:getPosition()
        local size = button:getContentSize()

        local scaleX = button:getScaleX() * (size.width + offset) / size.width
        local scaleY = button:getScaleY() * (size.height - offset) / size.height

        if zoom then
            transition.moveTo(button, {y = y - offset, time = time})
            transition.scaleTo(button, {
                scaleX     = scaleX,
                scaleY     = scaleY,
                time       = time,
                onComplete = onComplete,
            })
        else
            transition.moveTo(button, {y = y - offset, time = time, onComplete = onComplete})
        end
    end

    local function zoom2(offset, time, onComplete)
        local x, y = button:getPosition()
        local size = button:getContentSize()

        if zoom then
            transition.moveTo(button, {y = y + offset, time = time / 2})
            transition.scaleTo(button, {
                scaleX     = 1.0,
                scaleY     = 1.0,
                time       = time,
                onComplete = onComplete,
            })
        else
            transition.moveTo(button, {y = y + offset, time = time / 2, onComplete = onComplete})
        end
    end

    zoom1(40, 0.08, function()
        zoom2(40, 0.09, function()
            zoom1(20, 0.10, function()
                zoom2(20, 0.11, onComplete)
            end)
        end)
    end)
end

ez = {}
ez.COLOR_BROWN = ccc3(79, 57, 30)
ez.userDefault = CCUserDefault:sharedUserDefault()

function ez:init()
    ez.isBgMusicEnabled = ez.userDefault:getBoolForKey("bgMusic", true)
    ez.isEffectEnabled = ez.userDefault:getBoolForKey("effect", true)
end

function ez:getCurrentLevel()
    return ez.userDefault:getIntegerForKey('currentLevel', 1)
end

function ez:newLabel(t)
    t.font = t.font or 'HOPE'
    t.size = t.size or 45
    t.color = t.color or ez.COLOR_BROWN
    t.x = t.x or 0
    t.y = t.y or 0
    return ui.newTTFLabel(t)
end

function ez:playEffect(...)
    if ez.isEffectEnabled then
        audio.playEffect(...)
    end
end

function ez:playBackgroundMusic(...)
    if ez.isBgMusicEnabled then
        audio.playBackgroundMusic(...)
    end
end

function ez:getHeartCount()
    return ez.userDefault:getIntegerForKey('heartCount', 4)
end

function ez:setHeartCount(count)
    ez.userDefault:setIntegerForKey('heartCount', count)
end

function ez:getFormattedTime(second)
    local a = math.floor(second / 60)
    local b = second - a * 60
    if a < 10 then
        a = '0' .. a
    end
    if b < 10 then
        b = '0' .. b
    end
    return a .. ':' .. b
end

function ez:swap(array, i, j)
    local t = array[i]
    array[i] = array[j]
    array[j] = t
end

-- cannot be same
function ez:randomSequence(max)
    local bits = {}
    for i = 1, max do
        bits[i] = i
    end
    local it = max
    while it > 1 do
        local n = math.random(1, it)
        if n ~= it then
            ez:swap(bits, n, it)
        end
        it = it - 1
    end
    return bits
end

-- maybe same
function ez:randomNumber(max, count, min)
    local bits = {}
    if count == nil then
        count = max
    end
    if min == nil then
        min = 1
    end
    for i = 1, count do
        bits[i] = math.random(min, max)
    end
    return bits
end

require("app.MyApp").new():run()
