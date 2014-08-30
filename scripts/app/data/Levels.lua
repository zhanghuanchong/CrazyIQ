local ClickRedBtnQuestion = import("app.ui.questions.ClickRedBtnQuestion")
local BallPrepareQuestion = import("app.ui.questions.BallPrepareQuestion")
local BallQuestion = import("app.ui.questions.BallQuestion")
local ClickOrderQuestion = import("app.ui.questions.ClickOrderQuestion")
local ColorOrderQuestion = import("app.ui.questions.ColorOrderQuestion")
local ColorTextQuestion = import("app.ui.questions.ColorTextQuestion")
local ColorOrderRepeatQuestion = import("app.ui.questions.ColorOrderRepeatQuestion")
local ClickCharQuestion = import("app.ui.questions.ClickCharQuestion")
local ClickSmallestBtnQuestion = import("app.ui.questions.ClickSmallestBtnQuestion")
local PuzzleQuestion = import("app.ui.questions.PuzzleQuestion")
local MemoryQuestion = import("app.ui.questions.MemoryQuestion")
local RockScissorPaperQuestion = import("app.ui.questions.RockScissorPaperQuestion")
local MatchQuestion = import("app.ui.questions.MatchQuestion")
local ColorNumberQuestion = import("app.ui.questions.ColorNumberQuestion")
local MemoryCloseQuestion = import("app.ui.questions.MemoryCloseQuestion")
local ColorAreaQuestion = import("app.ui.questions.ColorAreaQuestion")
local MathQuestion = import("app.ui.questions.MathQuestion")

local Levels = {}

function Levels:levelScore(i)
    local score = 0
    for j = 1, #Levels[i].questions do
        local q = Levels[i].questions[j]
        score = score + q.score
    end
    return score
end

function Levels:baseScore(index)
    local score = 0
    for i = 1, index - 1 do
        score = score + self:levelScore(i)
    end
    return score
end

-- Score: 48
Levels[1] = {
    title = '幼儿园',
    gameOverTip = {
        text = 'No zuo, no die！',
        clear = true
    },
    upgradeTip = '涨姿势了！',
    questions = {
        {
            class = ClickRedBtnQuestion,
            score = 8
        },
        {
            class = BallPrepareQuestion,
            score = 0
        },
        {
            class = BallQuestion,
            score = 8
        },
        {
            class = ClickOrderQuestion,
            score = 8
        },
        {
            class = ColorOrderQuestion,
            score = 8
        },
        {
            class = ColorTextQuestion,
            score = 8,
            timeout = 5
        },
        {
            class = ColorOrderRepeatQuestion,
            score = 8
        }
    }
}

-- Score: 36
Levels[2] = {
    title = '小学',
    gameOverTip = '药不能停！！',
    upgradeTip = {
        text = 'Nubility！',
        clear = true
    },
    questions = {
        {
            class = MatchQuestion,
            score = 6,
            timeout = 30
        },
        {
            class = ClickCharQuestion,
            score = 6
        },
        {
            class = ClickSmallestBtnQuestion,
            score = 6
        },
        {
            class = PuzzleQuestion,
            score = 6,
            grid = 9,
            picture = 'icon',
            timeout = 20
        },
        {
            class = MemoryQuestion,
            score = 6,
            count = 6,
            timeout = 2
        },
        {
            class = RockScissorPaperQuestion,
            score = 6,
            timeout = 4
        },
    }
}

-- Score: 24
Levels[3] = {
    title = '初中',
    gameOverTip = '何弃疗？！',
    upgradeTip = '我宣你，我要为你生孩子！',
    questions = {
        {
            class = MathQuestion,
            score = 4,
            timeout = 5,
            count = 3
        },
        {
            class = ColorNumberQuestion,
            score = 4,
            count = 4,
            timeout = 8,
            times = 1
        },
        {
            class = MemoryCloseQuestion,
            score = 4,
            count = 8,
            timeout = 2
        },
        {
            class = ColorTextQuestion,
            score = 4,
            timeout = 3
        },
        {
            class = PuzzleQuestion,
            score = 2,
            grid = 16,
            picture = 'earth',
            timeout = 30
        },
        {
            class = ColorAreaQuestion,
            score = 4,
            timeout = 6,
            count = 15
        },
    }
}

-- Score: 12
Levels[4] = {
    title = '高中',
    gameOverTip = '真为你的智商抓急！！',
    upgradeTip = '我和我的小伙伴儿都惊呆了！',
    questions = {
        {
            class = MatchQuestion,
            score = 2,
            timeout = 15
        },
        {
            class = ColorNumberQuestion,
            score = 2,
            count = 6,
            timeout = 10,
            times = 2
        },
        {
            class = RockScissorPaperQuestion,
            score = 2,
            timeout = 2
        },
        {
            class = MemoryQuestion,
            score = 2,
            count = 9,
            timeout = 1
        },
        {
            class = PuzzleQuestion,
            score = 2,
            grid = 25,
            picture = 'football',
            timeout = 45
        },
    }
}

-- Score: 6
Levels[5] = {
    title = '大学',
    gameOverTip = '且行且珍惜！',
    upgradeTip = '你这么屌，你家人造吗？',
    questions = {
        {
            class = MemoryCloseQuestion,
            score = 1,
            count = 12,
            timeout = 1
        },
        {
            class = MathQuestion,
            score = 2,
            timeout = 4,
            count = 5
        },
        {
            class = ColorTextQuestion,
            score = 1,
            timeout = 1
        },
        {
            class = ColorNumberQuestion,
            score = 1,
            count = 6,
            timeout = 8,
            times = 3
        },
        {
            class = ColorAreaQuestion,
            score = 1,
            timeout = 3,
            count = 20
        },
    }
}
--[[Levels[6] = {
    title = '研究生'
}
Levels[7] = {
    title = '博士'
}
Levels[8] = {
    title = '博士后'
}
Levels[9] = {
    title = '院士'
}]]

return Levels