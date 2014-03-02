local BaseQuestion = require('.BaseQuestion.lua')

local ClickRedBtnQuestion = class('ClickRedBtnQuestion', function()
    return BaseQuestion.new()
end)

function ClickRedBtnQuestion:ctor()
    
end

function ClickRedBtnQuestion:onEnterTransitionFinish()

end

return ClickRedBtnQuestion