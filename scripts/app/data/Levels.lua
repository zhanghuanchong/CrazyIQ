local ClickRedBtnQuestion = import("app.ui.questions.ClickRedBtnQuestion")
local BallPrepareQuestion = import("app.ui.questions.BallPrepareQuestion")
local BallQuestion = import("app.ui.questions.BallQuestion")

local Levels = {}

Levels[1] = {
    title = '幼儿园',
    questions = {
        {class = ClickRedBtnQuestion},
        {class = BallPrepareQuestion},
        {class = BallQuestion}
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