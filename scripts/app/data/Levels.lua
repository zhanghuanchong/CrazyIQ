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

Levels[1] = {
    title = '幼儿园',
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
Levels[2] = {
    title = '小学',
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
Levels[3] = {
    title = '初中',
    questions = {
        {
            class = MemoryCloseQuestion,
            score = 4,
            count = 8,
            timeout = 2
        },
        {
            class = ColorNumberQuestion,
            score = 4,
            count = 4,
            timeout = 8
        },
        {
            class = PuzzleQuestion,
            score = 6,
            grid = 16,
            picture = 'earth',
            timeout = 30
        },
        {
            class = ColorTextQuestion,
            score = 8,
            timeout = 3
        },
        {
            class = MemoryQuestion,
            score = 6,
            count = 9,
            timeout = 1
        },
        {
            class = RockScissorPaperQuestion,
            score = 6,
            timeout = 2
        },
        {
            class = MatchQuestion,
            score = 6,
            timeout = 15
        },
        {
            class = MatchQuestion,
            score = 4
        },
        {
            class = ColorAreaQuestion,
            score = 4
        }
    }
}
Levels[4] = {
    title = '高中',
    questions = {
        {
            class = ColorNumberQuestion,
            score = 4,
            count = 6,
            timeout = 10
        },
        {
            class = MemoryCloseQuestion,
            score = 4,
            count = 12,
            timeout = 1
        },
    }
}
Levels[5] = {
    title = '大学',
    questions = {
        {
            class = ColorTextQuestion,
            score = 8,
            timeout = 1
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