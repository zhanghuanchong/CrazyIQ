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

Levels[1] = {
    title = '幼儿园',
    questions = {
        {class = ClickRedBtnQuestion},
        {class = BallPrepareQuestion},
        {class = BallQuestion },
        {class = ClickOrderQuestion},
        {class = ColorOrderQuestion},
        {class = ColorTextQuestion},
        {class = ColorOrderRepeatQuestion},
        {class = ClickCharQuestion},
        {class = ClickSmallestBtnQuestion},
        {class = PuzzleQuestion},
        {class = MemoryQuestion},
        {class = RockScissorPaperQuestion},
        {class = MatchQuestion},
        {class = ColorNumberQuestion},
        {class = MemoryCloseQuestion},
        {class = ColorAreaQuestion}
    }
}
Levels[2] = {
    title = '小学'
}
Levels[3] = {
    title = '初中'
}
Levels[4] = {
    title = '高中'
}
Levels[5] = {
    title = '大学'
}
Levels[6] = {
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
}

return Levels