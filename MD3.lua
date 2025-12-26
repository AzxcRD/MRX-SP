-- MD3.lua - Material Design 3 UI组件库
-- 保存到: https://raw.githubusercontent.com/你的用户名/仓库名/main/MD3.lua
-- 使用: local MD3 = loadstring(game:HttpGet("链接"))()

local MD3 = {}

-- 服务
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

-- 颜色系统
MD3.颜色 = {
    主色调 = Color3.fromRGB(103, 80, 164),
    主容器 = Color3.fromRGB(234, 221, 255),
    文字主色 = Color3.fromRGB(255, 255, 255),
    表面 = Color3.fromRGB(255, 255, 255, 0.9),
    表面变体 = Color3.fromRGB(230, 224, 233),
    轮廓 = Color3.fromRGB(121, 116, 126, 0.4),
    轮廓变体 = Color3.fromRGB(194, 189, 198),
    错误 = Color3.fromRGB(186, 26, 26),
    文字表面 = Color3.fromRGB(28, 27, 31),
    文字表面变体 = Color3.fromRGB(73, 69, 78)
}

-- 动画系统
MD3.动画 = {}

-- 缩放动画
function MD3.动画:缩放动画(实例, 缩放倍数, 持续时间, 回调)
    缩放倍数 = 缩放倍数 or 1.1
    持续时间 = 持续时间 or 0.2
    
    local 原大小 = 实例.Size
    local 动画 = TweenService:Create(实例, TweenInfo.new(持续时间, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = 原大小 * 缩放倍数
    })
    
    动画:Play()
    if 回调 then
        动画.Completed:Connect(回调)
    end
end

-- 位置动画
function MD3.动画:位置动画(实例, 目标位置, 持续时间, 缓动样式, 回调)
    持续时间 = 持续时间 or 0.3
    缓动样式 = 缓动样式 or Enum.EasingStyle.Quad
    
    local 动画 = TweenService:Create(实例, TweenInfo.new(持续时间, 缓动样式, Enum.EasingDirection.Out), {
        Position = 目标位置
    })
    
    动画:Play()
    if 回调 then
        动画.Completed:Connect(回调)
    end
end

-- 透明度动画
function MD3.动画:淡入动画(实例, 持续时间, 回调)
    持续时间 = 持续时间 or 0.3
    
    local 动画 = TweenService:Create(实例, TweenInfo.new(持续时间, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        BackgroundTransparency = 0.1
    })
    
    动画:Play()
    if 回调 then
        动画.Completed:Connect(回调)
    end
end

function MD3.动画:淡出动画(实例, 持续时间, 回调)
    持续时间 = 持续时间 or 0.3
    
    local 动画 = TweenService:Create(实例, TweenInfo.new(持续时间, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        BackgroundTransparency = 1
    })
    
    动画:Play()
    if 回调 then
        动画.Completed:Connect(回调)
    end
end

-- 颜色动画
function MD3.动画:颜色动画(实例, 目标颜色, 持续时间, 回调)
    持续时间 = 持续时间 or 0.3
    
    local 动画 = TweenService:Create(实例, TweenInfo.new(持续时间, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        BackgroundColor3 = 目标颜色
    })
    
    动画:Play()
    if 回调 then
        动画.Completed:Connect(回调)
    end
end

-- 水滴动画
function MD3.动画:水滴动画(按钮, 回调)
    local 原大小 = 按钮.Size
    local 动画信息 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    
    local 缩小动画 = TweenService:Create(按钮, 动画信息, {
        Size = 原大小 - UDim2.new(0, 4, 0, 4)
    })
    
    local 恢复动画 = TweenService:Create(按钮, 动画信息, {
        Size = 原大小
    })
    
    缩小动画:Play()
    缩小动画.Completed:Wait()
    恢复动画:Play()
    
    if 回调 then
        回调()
    end
end

-- 按钮点击动画
function MD3.动画:按钮点击动画(按钮, 回调)
    local 原大小 = 按钮.Size
    local 动画信息 = TweenInfo.new(0.1, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
    
    local 缩小动画 = TweenService:Create(按钮, 动画信息, {
        Size = 原大小 - UDim2.new(0, 6, 0, 6)
    })
    
    local 恢复动画 = TweenService:Create(按钮, 动画信息, {
        Size = 原大小
    })
    
    缩小动画:Play()
    缩小动画.Completed:Wait()
    恢复动画:Play()
    
    if 回调 then
        回调()
    end
end

-- 弹性动画
function MD3.动画:弹性动画(实例, 缩放倍率, 持续时间, 回调)
    缩放倍率 = 缩放倍率 or 1.1
    持续时间 = 持续时间 or 0.5
    
    local 动画 = TweenService:Create(实例, TweenInfo.new(持续时间, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = 实例.Size * 缩放倍率
    })
    
    动画:Play()
    if 回调 then
        动画.Completed:Connect(回调)
    end
end

-- 旋转动画
function MD3.动画:旋转动画(实例, 角度, 持续时间, 回调)
    持续时间 = 持续时间 or 0.3
    
    local 动画 = TweenService:Create(实例, TweenInfo.new(持续时间, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Rotation = 角度
    })
    
    动画:Play()
    if 回调 then
        动画.Completed:Connect(回调)
    end
end

-- 窗口组件
MD3.窗口 = {}

-- 创建主卡片窗口
function MD3.窗口:创建卡片(宽度, 高度, 父级)
    宽度 = 宽度 or 550
    高度 = 高度 or 400
    
    local 卡片 = Instance.new("Frame")
    卡片.Name = "MD3卡片"
    卡片.Size = UDim2.new(0, 宽度, 0, 高度)
    卡片.Position = UDim2.new(0.5, -宽度/2, 0.5, -高度/2)
    卡片.BackgroundColor3 = MD3.颜色.表面
    卡片.BackgroundTransparency = 0.1
    卡片.BorderSizePixel = 0
    卡片.ClipsDescendants = true
    卡片.Active = true
    卡片.Selectable = true
    
    local 圆角 = Instance.new("UICorner")
    圆角.CornerRadius = UDim.new(0, 20)
    圆角.Parent = 卡片
    
    local 边框 = Instance.new("UIStroke")
    边框.Color = Color3.fromRGB(0, 0, 0, 50)
    边框.Thickness = 1.5
    边框.Transparency = 0.3
    边框.Parent = 卡片
    
    local 渐变 = Instance.new("UIGradient")
    渐变.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(120, 150, 255)),
        ColorSequenceKeypoint.new(0.3, Color3.fromRGB(140, 170, 255)),
        ColorSequenceKeypoint.new(0.7, Color3.fromRGB(160, 190, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(180, 210, 255))
    })
    渐变.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.8),
        NumberSequenceKeypoint.new(0.3, 0.85),
        NumberSequenceKeypoint.new(0.7, 0.9),
        NumberSequenceKeypoint.new(1, 0.95)
    })
    渐变.Rotation = 135
    渐变.Parent = 卡片
    
    if 父级 then
        卡片.Parent = 父级
    end
    
    return 卡片
end

-- 左侧导航栏
function MD3.窗口:创建左侧面板(父级, 宽度)
    宽度 = 宽度 or 100
    
    local 面板 = Instance.new("Frame")
    面板.Name = "左侧面板"
    面板.Size = UDim2.new(0, 宽度, 1, 0)
    面板.BackgroundColor3 = MD3.颜色.主容器
    面板.BackgroundTransparency = 0.2
    面板.BorderSizePixel = 0
    面板.Parent = 父级
    
    return 面板
end

-- 右侧内容区
function MD3.窗口:创建右侧面板(父级, 左侧宽度)
    左侧宽度 = 左侧宽度 or 100
    
    local 面板 = Instance.new("Frame")
    面板.Name = "右侧面板"
    面板.Size = UDim2.new(1, -左侧宽度, 1, 0)
    面板.Position = UDim2.new(0, 左侧宽度, 0, 0)
    面板.BackgroundTransparency = 1
    面板.ClipsDescendants = true
    面板.Parent = 父级
    
    return 面板
end

-- 标题栏
function MD3.窗口:创建标题栏(父级, 标题文字)
    local 标题栏 = Instance.new("Frame")
    标题栏.Name = "标题栏"
    标题栏.Size = UDim2.new(1, 0, 0, 40)
    标题栏.BackgroundTransparency = 1
    标题栏.Parent = 父级
    
    local 拖拽区 = Instance.new("TextButton")
    拖拽区.Name = "拖拽按钮"
    拖拽区.Size = UDim2.new(1, 0, 1, 0)
    拖拽区.BackgroundTransparency = 1
    拖拽区.Text = ""
    拖拽区.AutoButtonColor = false
    拖拽区.Parent = 标题栏
    
    if 标题文字 then
        local 标题标签 = Instance.new("TextLabel")
        标题标签.Name = "标题标签"
        标题标签.Size = UDim2.new(0, 100, 1, 0)
        标题标签.Position = UDim2.new(0, 15, 0, 0)
        标题标签.BackgroundTransparency = 1
        标题标签.Text = 标题文字
        标题标签.TextColor3 = MD3.颜色.文字表面
        标题标签.TextSize = 20
        标题标签.Font = Enum.Font.GothamSemibold
        标题标签.TextXAlignment = Enum.TextXAlignment.Left
        标题标签.Parent = 标题栏
    end
    
    return 标题栏, 拖拽区
end

-- 控制按钮
function MD3.窗口:创建控制按钮(父级)
    local 按钮容器 = Instance.new("Frame")
    按钮容器.Name = "控制按钮"
    按钮容器.Size = UDim2.new(0, 80, 0, 30)
    按钮容器.Position = UDim2.new(1, -85, 0, 5)
    按钮容器.BackgroundTransparency = 1
    按钮容器.Parent = 父级
    
    local 最小化按钮 = Instance.new("TextButton")
    最小化按钮.Name = "最小化按钮"
    最小化按钮.Size = UDim2.new(0, 30, 0, 30)
    最小化按钮.Position = UDim2.new(0, 0, 0, 0)
    最小化按钮.BackgroundTransparency = 1
    最小化按钮.Text = "−"
    最小化按钮.TextColor3 = MD3.颜色.文字表面
    最小化按钮.TextSize = 24
    最小化按钮.Font = Enum.Font.GothamBold
    最小化按钮.AutoButtonColor = false
    最小化按钮.Parent = 按钮容器
    
    local 关闭按钮 = Instance.new("TextButton")
    关闭按钮.Name = "关闭按钮"
    关闭按钮.Size = UDim2.new(0, 30, 0, 30)
    关闭按钮.Position = UDim2.new(0, 40, 0, 0)
    关闭按钮.BackgroundTransparency = 1
    关闭按钮.Text = "×"
    关闭按钮.TextColor3 = MD3.颜色.文字表面
    关闭按钮.TextSize = 24
    关闭按钮.Font = Enum.Font.GothamBold
    关闭按钮.AutoButtonColor = false
    关闭按钮.Parent = 按钮容器
    
    -- 悬停效果
    关闭按钮.MouseEnter:Connect(function()
        MD3.动画:颜色动画(关闭按钮, MD3.颜色.错误, 0.2)
    end)
    
    关闭按钮.MouseLeave:Connect(function()
        MD3.动画:颜色动画(关闭按钮, MD3.颜色.文字表面, 0.2)
    end)
    
    最小化按钮.MouseEnter:Connect(function()
        MD3.动画:颜色动画(最小化按钮, MD3.颜色.主色调, 0.2)
    end)
    
    最小化按钮.MouseLeave:Connect(function()
        MD3.动画:颜色动画(最小化按钮, MD3.颜色.文字表面, 0.2)
    end)
    
    return 按钮容器, 最小化按钮, 关闭按钮
end

-- 分隔线
function MD3.窗口:创建分隔线(父级, 位置偏移)
    位置偏移 = 位置偏移 or 40
    
    local 分隔线 = Instance.new("Frame")
    分隔线.Name = "分隔线"
    分隔线.Size = UDim2.new(1, 0, 0, 1)
    分隔线.Position = UDim2.new(0, 0, 0, 位置偏移)
    分隔线.BackgroundColor3 = MD3.颜色.轮廓
    分隔线.BackgroundTransparency = 0.4
    分隔线.BorderSizePixel = 0
    分隔线.Parent = 父级
    
    return 分隔线
end

-- 页面容器
function MD3.窗口:创建页面容器(父级, 位置偏移)
    位置偏移 = 位置偏移 or 41
    
    local 容器 = Instance.new("Frame")
    容器.Name = "页面容器"
    容器.Size = UDim2.new(1, 0, 1, -位置偏移)
    容器.Position = UDim2.new(0, 0, 0, 位置偏移)
    容器.BackgroundTransparency = 1
    容器.ClipsDescendants = true
    容器.Parent = 父级
    
    return 容器
end

-- 导航组件
MD3.导航 = {}

-- 创建头像
function MD3.导航:创建头像(父级, 用户ID, 大小)
    大小 = 大小 or UDim2.new(0, 80, 0, 80)
    用户ID = 用户ID or Players.LocalPlayer.UserId
    
    local 头像框 = Instance.new("Frame")
    头像框.Name = "头像框"
    头像框.Size = 大小
    头像框.Position = UDim2.new(0.5, -大小.X.Offset/2, 0, 20)
    头像框.BackgroundColor3 = MD3.颜色.主色调
    头像框.BackgroundTransparency = 0.2
    头像框.BorderSizePixel = 0
    头像框.Parent = 父级
    
    local 圆角 = Instance.new("UICorner")
    圆角.CornerRadius = UDim.new(0, 12)
    圆角.Parent = 头像框
    
    local 头像图片 = Instance.new("ImageLabel")
    头像图片.Name = "头像图片"
    头像图片.Size = UDim2.new(1, 0, 1, 0)
    头像图片.BackgroundTransparency = 1
    头像图片.Image = "rbxthumb://type=AvatarHeadShot&id=" .. 用户ID .. "&w=420&h=420"
    头像图片.Parent = 头像框
    
    local 图片圆角 = Instance.new("UICorner")
    图片圆角.CornerRadius = UDim.new(0, 12)
    图片圆角.Parent = 头像图片
    
    return 头像框
end

-- 信息标签
function MD3.导航:创建信息标签(父级, 标签, 值)
    local 容器 = Instance.new("Frame")
    容器.Name = 标签 .. "容器"
    容器.Size = UDim2.new(1, 0, 0, 30)
    容器.BackgroundTransparency = 1
    容器.Parent = 父级
    
    local 标签文字 = Instance.new("TextLabel")
    标签文字.Name = "标签文字"
    标签文字.Size = UDim2.new(0.5, 0, 1, 0)
    标签文字.Position = UDim2.new(0, 10, 0, 0)
    标签文字.BackgroundTransparency = 1
    标签文字.Text = 标签
    标签文字.TextColor3 = MD3.颜色.文字表面
    标签文字.TextSize = 16
    标签文字.Font = Enum.Font.Gotham
    标签文字.TextXAlignment = Enum.TextXAlignment.Left
    标签文字.Parent = 容器
    
    local 值文字 = Instance.new("TextLabel")
    值文字.Name = "值文字"
    值文字.Size = UDim2.new(0.5, 0, 1, 0)
    值文字.Position = UDim2.new(0.5, 0, 0, 0)
    值文字.BackgroundTransparency = 1
    值文字.Text = 值
    值文字.TextColor3 = MD3.颜色.文字表面变体
    值文字.TextSize = 16
    值文字.Font = Enum.Font.Gotham
    值文字.TextXAlignment = Enum.TextXAlignment.Left
    值文字.Parent = 容器
    
    return 容器, 值文字
end

-- 创建导航栏
function MD3.导航:创建导航栏(父级, 导航项, 点击回调)
    local 导航容器 = Instance.new("Frame")
    导航容器.Name = "导航容器"
    导航容器.Size = UDim2.new(1, 0, 1, -220)
    导航容器.Position = UDim2.new(0, 0, 0, 220)
    导航容器.BackgroundTransparency = 1
    导航容器.Parent = 父级
    
    local 滚动框 = Instance.new("ScrollingFrame")
    滚动框.Name = "导航滚动"
    滚动框.Size = UDim2.new(1, 0, 1, 0)
    滚动框.BackgroundTransparency = 1
    滚动框.BorderSizePixel = 0
    滚动框.ScrollBarThickness = 6
    滚动框.ScrollBarImageColor3 = Color3.fromRGB(200, 200, 200, 100)
    滚动框.ScrollingDirection = Enum.ScrollingDirection.Y
    滚动框.AutomaticCanvasSize = Enum.AutomaticSize.Y
    滚动框.CanvasSize = UDim2.new(0, 0, 0, 0)
    滚动框.Parent = 导航容器
    
    local 布局 = Instance.new("UIListLayout")
    布局.Padding = UDim.new(0, 8)
    布局.SortOrder = Enum.SortOrder.LayoutOrder
    布局.Parent = 滚动框
    
    local 导航按钮 = {}
    local 当前激活项 = nil
    
    for i, 项数据 in ipairs(导航项) do
        local 项容器 = Instance.new("Frame")
        项容器.Name = 项数据.名称 .. "导航项"
        项容器.Size = UDim2.new(1, -20, 0, 50)
        项容器.Position = UDim2.new(0, 10, 0, 0)
        项容器.BackgroundTransparency = 1
        项容器.LayoutOrder = i
        项容器.Parent = 滚动框
        
        local 按钮 = Instance.new("TextButton")
        按钮.Name = 项数据.名称 .. "按钮"
        按钮.Size = UDim2.new(1, 0, 1, 0)
        按钮.BackgroundTransparency = 1
        按钮.Text = ""
        按钮.AutoButtonColor = false
        按钮.Parent = 项容器
        
        local 指示器容器 = Instance.new("Frame")
        指示器容器.Name = "指示器容器"
        指示器容器.Size = UDim2.new(0, 4, 0.7, 0)
        指示器容器.Position = UDim2.new(0, 0, 0.15, 0)
        指示器容器.BackgroundTransparency = 1
        指示器容器.Parent = 项容器
        
        local 指示器 = Instance.new("Frame")
        指示器.Name = "指示器"
        指示器.Size = UDim2.new(0, 0, 0, 3)
        指示器.Position = UDim2.new(0, 0, 0, 0)
        指示器.BackgroundColor3 = MD3.颜色.主色调
        指示器.BackgroundTransparency = 0.8
        指示器.BorderSizePixel = 0
        
        local 指示器圆角 = Instance.new("UICorner")
        指示器圆角.CornerRadius = UDim.new(1, 0)
        指示器圆角.Parent = 指示器
        
        指示器.Parent = 指示器容器
        
        local 按钮内容 = Instance.new("Frame")
        按钮内容.Name = "按钮内容"
        按钮内容.Size = UDim2.new(1, -10, 1, 0)
        按钮内容.Position = UDim2.new(0, 10, 0, 0)
        按钮内容.BackgroundTransparency = 1
        按钮内容.Parent = 项容器
        
        local 内容圆角 = Instance.new("UICorner")
        内容圆角.CornerRadius = UDim.new(0, 12)
        内容圆角.Parent = 按钮内容
        
        local 按钮图标 = Instance.new("TextLabel")
        按钮图标.Name = "图标"
        按钮图标.Size = UDim2.new(0, 30, 1, 0)
        按钮图标.Position = UDim2.new(0, 10, 0, 0)
        按钮图标.BackgroundTransparency = 1
        按钮图标.Text = 项数据.图标 or "⚙️"
        按钮图标.TextColor3 = MD3.颜色.文字主色
        按钮图标.TextSize = 20
        按钮图标.Font = Enum.Font.Gotham
        按钮图标.TextXAlignment = Enum.TextXAlignment.Left
        按钮图标.TextTransparency = 0.5
        按钮图标.Parent = 按钮内容
        
        local 按钮文字 = Instance.new("TextLabel")
        按钮文字.Name = "文字"
        按钮文字.Size = UDim2.new(1, -50, 1, 0)
        按钮文字.Position = UDim2.new(0, 50, 0, 0)
        按钮文字.BackgroundTransparency = 1
        按钮文字.Text = 项数据.文字
        按钮文字.TextColor3 = MD3.颜色.文字主色
        按钮文字.TextSize = 16
        按钮文字.Font = Enum.Font.GothamSemibold
        按钮文字.TextXAlignment = Enum.TextXAlignment.Left
        按钮文字.TextTransparency = 0.5
        按钮文字.Parent = 按钮内容
        
        local 悬停背景 = Instance.new("Frame")
        悬停背景.Name = "悬停背景"
        悬停背景.Size = UDim2.new(1, 0, 1, 0)
        悬停背景.BackgroundColor3 = MD3.颜色.文字主色
        悬停背景.BackgroundTransparency = 0.9
        悬停背景.BorderSizePixel = 0
        悬停背景.Visible = false
        悬停背景.Parent = 按钮内容
        
        local 悬停圆角 = Instance.new("UICorner")
        悬停圆角.CornerRadius = UDim.new(0, 12)
        悬停圆角.Parent = 悬停背景
        
        local function 激活项()
            for 项名, 项数据 in pairs(导航按钮) do
                local 是否激活 = (项名 == 项数据.名称)
                
                local 指示器动画 = TweenService:Create(项数据.指示器, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    Size = 是否激活 and UDim2.new(1, 0, 0, 3) or UDim2.new(0, 0, 0, 3)
                })
                指示器动画:Play()
                
                local 图标动画 = TweenService:Create(项数据.图标, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    TextTransparency = 是否激活 and 0 or 0.5
                })
                图标动画:Play()
                
                local 文字动画 = TweenService:Create(项数据.文字, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    TextTransparency = 是否激活 and 0 or 0.5
                })
                文字动画:Play()
                
                if 是否激活 then
                    项数据.悬停背景.Visible = true
                    local 背景动画 = TweenService:Create(项数据.悬停背景, TweenInfo.new(0.3), {
                        BackgroundTransparency = 0.7
                    })
                    背景动画:Play()
                else
                    if 项数据.悬停背景.Visible then
                        local 背景动画 = TweenService:Create(项数据.悬停背景, TweenInfo.new(0.2), {
                            BackgroundTransparency = 0.9
                        })
                        背景动画:Play()
                        背景动画.Completed:Wait()
                        项数据.悬停背景.Visible = false
                    end
                end
            end
            
            当前激活项 = 项数据.名称
            
            if 点击回调 then
                点击回调(项数据.名称, 项数据)
            end
        end
        
        按钮.MouseButton1Click:Connect(function()
            激活项()
        end)
        
        按钮.MouseEnter:Connect(function()
            if not 导航按钮[项数据.名称] or not 导航按钮[项数据.名称].激活 then
                悬停背景.Visible = true
                MD3.动画:淡入动画(悬停背景, 0.2)
                
                local 图标动画 = TweenService:Create(按钮图标, TweenInfo.new(0.2), {
                    TextTransparency = 0.2
                })
                图标动画:Play()
                
                local 文字动画 = TweenService:Create(按钮文字, TweenInfo.new(0.2), {
                    TextTransparency = 0.2
                })
                文字动画:Play()
            end
        end)
        
        按钮.MouseLeave:Connect(function()
            if not 导航按钮[项数据.名称] or not 导航按钮[项数据.名称].激活 then
                MD3.动画:淡出动画(悬停背景, 0.2)
                
                wait(0.1)
                悬停背景.Visible = false
                
                local 图标动画 = TweenService:Create(按钮图标, TweenInfo.new(0.2), {
                    TextTransparency = 0.5
                })
                图标动画:Play()
                
                local 文字动画 = TweenService:Create(按钮文字, TweenInfo.new(0.2), {
                    TextTransparency = 0.5
                })
                文字动画:Play()
            end
        end)
        
        导航按钮[项数据.名称] = {
            容器 = 项容器,
            按钮 = 按钮,
            指示器 = 指示器,
            图标 = 按钮图标,
            文字 = 按钮文字,
            悬停背景 = 悬停背景,
            激活 = false,
            激活函数 = 激活项
        }
    end
    
    if 导航项[1] then
        导航按钮[导航项[1].名称].激活函数()
    end
    
    return 导航容器, 导航按钮
end

-- 页面组件
MD3.页面 = {}

-- 创建页面
function MD3.页面:创建页面(父级, 名称, 显示名称)
    local 页面 = Instance.new("ScrollingFrame")
    页面.Name = 名称 .. "页面"
    页面.Size = UDim2.new(1, 0, 1, 0)
    页面.BackgroundTransparency = 1
    页面.BorderSizePixel = 0
    页面.ScrollBarThickness = 6
    页面.ScrollBarImageColor3 = Color3.fromRGB(200, 200, 200, 100)
    页面.ScrollingDirection = Enum.ScrollingDirection.Y
    页面.AutomaticCanvasSize = Enum.AutomaticSize.Y
    页面.CanvasSize = UDim2.new(0, 0, 0, 0)
    页面.Visible = false
    页面.Parent = 父级
    
    local 内容容器 = Instance.new("Frame")
    内容容器.Name = "内容容器"
    内容容器.Size = UDim2.new(1, 0, 1, 0)
    内容容器.BackgroundTransparency = 1
    内容容器.Parent = 页面
    
    local 布局 = Instance.new("UIListLayout")
    布局.Padding = UDim.new(0, 12)
    布局.SortOrder = Enum.SortOrder.LayoutOrder
    布局.Parent = 内容容器
    
    return 页面, 内容容器
end

-- 控件组件
MD3.控件 = {}

-- 创建MD3开关
function MD3.控件:创建开关(父级, 标签, 初始状态, 回调)
    local 开关框 = Instance.new("Frame")
    开关框.Name = 标签 .. "开关框"
    开关框.Size = UDim2.new(1, 0, 0, 50)
    开关框.BackgroundTransparency = 1
    开关框.LayoutOrder = #父级:GetChildren()
    开关框.Parent = 父级
    
    local 开关容器 = Instance.new("Frame")
    开关容器.Name = "开关容器"
    开关容器.Size = UDim2.new(1, 0, 1, 0)
    开关容器.BackgroundTransparency = 1
    开关容器.Parent = 开关框
    
    local 轨道 = Instance.new("Frame")
    轨道.Name = "轨道"
    轨道.Size = UDim2.new(0, 52, 0, 32)
    轨道.Position = UDim2.new(0, 0, 0.5, -16)
    轨道.BackgroundColor3 = 初始状态 and MD3.颜色.主色调 or Color3.fromRGB(121, 116, 126, 0.3)
    轨道.BorderSizePixel = 0
    
    local 轨道圆角 = Instance.new("UICorner")
    轨道圆角.CornerRadius = UDim.new(1, 0)
    轨道圆角.Parent = 轨道
    
    local 手柄 = Instance.new("Frame")
    手柄.Name = "手柄"
    手柄.Size = UDim2.new(0, 24, 0, 24)
    手柄.Position = 初始状态 and UDim2.new(0, 24, 0.5, -12) or UDim2.new(0, 4, 0.5, -12)
    手柄.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    手柄.BorderSizePixel = 0
    
    local 手柄圆角 = Instance.new("UICorner")
    手柄圆角.CornerRadius = UDim.new(1, 0)
    手柄圆角.Parent = 手柄
    
    local 按钮 = Instance.new("TextButton")
    按钮.Name = "开关按钮"
    按钮.Size = UDim2.new(0, 52, 0, 32)
    按钮.Position = UDim2.new(0, 0, 0.5, -16)
    按钮.BackgroundTransparency = 1
    按钮.Text = ""
    按钮.AutoButtonColor = false
    按钮.Parent = 开关容器
    
    local 标签文字 = Instance.new("TextLabel")
    标签文字.Name = "开关标签"
    标签文字.Size = UDim2.new(1, -60, 1, 0)
    标签文字.Position = UDim2.new(0, 60, 0, 0)
    标签文字.BackgroundTransparency = 1
    标签文字.Text = 标签
    标签文字.TextColor3 = MD3.颜色.文字表面
    标签文字.TextSize = 16
    标签文字.Font = Enum.Font.Gotham
    标签文字.TextXAlignment = Enum.TextXAlignment.Left
    标签文字.TextYAlignment = Enum.TextYAlignment.Center
    标签文字.Parent = 开关容器
    
    轨道.Parent = 开关容器
    手柄.Parent = 开关容器
    
    local 状态 = 初始状态
    
    local function 动画开关(新状态)
        状态 = 新状态
        
        if 新状态 then
            MD3.动画:颜色动画(轨道, MD3.颜色.主色调, 0.2)
            MD3.动画:位置动画(手柄, UDim2.new(0, 24, 0.5, -12), 0.2, Enum.EasingStyle.Back)
        else
            MD3.动画:颜色动画(轨道, Color3.fromRGB(121, 116, 126, 0.3), 0.2)
            MD3.动画:位置动画(手柄, UDim2.new(0, 4, 0.5, -12), 0.2, Enum.EasingStyle.Back)
        end
        
        if 回调 then
            回调(新状态)
        end
    end
    
    按钮.MouseButton1Click:Connect(function()
        动画开关(not 状态)
    end)
    
    按钮.MouseEnter:Connect(function()
        MD3.动画:缩放动画(手柄, 1.1, 0.2)
    end)
    
    按钮.MouseLeave:Connect(function()
        MD3.动画:缩放动画(手柄, 1.0, 0.2)
    end)
    
    return 开关框
end

-- 创建MD3滑块
function MD3.控件:创建滑块(父级, 标签, 最小值, 最大值, 默认值, 回调)
    local 滑块框 = Instance.new("Frame")
    滑块框.Name = 标签 .. "滑块框"
    滑块框.Size = UDim2.new(1, 0, 0, 70)
    滑块框.BackgroundTransparency = 1
    滑块框.LayoutOrder = #父级:GetChildren()
    滑块框.Parent = 父级
    
    local 滑块容器 = Instance.new("Frame")
    滑块容器.Name = "滑块容器"
    滑块容器.Size = UDim2.new(1, 0, 1, 0)
    滑块容器.BackgroundTransparency = 1
    滑块容器.Parent = 滑块框
    
    local 标签文字 = Instance.new("TextLabel")
    标签文字.Name = "滑块标签"
    标签文字.Size = UDim2.new(1, 0, 0, 20)
    标签文字.Position = UDim2.new(0, 0, 0, 0)
    标签文字.BackgroundTransparency = 1
    标签文字.Text = 标签
    标签文字.TextColor3 = MD3.颜色.文字表面
    标签文字.TextSize = 16
    标签文字.Font = Enum.Font.Gotham
    标签文字.TextXAlignment = Enum.TextXAlignment.Left
    标签文字.Parent = 滑块容器
    
    local 轨道 = Instance.new("Frame")
    轨道.Name = "轨道"
    轨道.Size = UDim2.new(1, 0, 0, 8)
    轨道.Position = UDim2.new(0, 0, 0, 30)
    轨道.BackgroundColor3 = Color3.fromRGB(121, 116, 126, 0.3)
    轨道.BorderSizePixel = 0
    
    local 轨道圆角 = Instance.new("UICorner")
    轨道圆角.CornerRadius = UDim.new(1, 0)
    轨道圆角.Parent = 轨道
    
    local 活动轨道 = Instance.new("Frame")
    活动轨道.Name = "活动轨道"
    活动轨道.Size = UDim2.new(0, 0, 1, 0)
    活动轨道.BackgroundColor3 = MD3.颜色.主色调
    活动轨道.BorderSizePixel = 0
    
    local 活动轨道圆角 = Instance.new("UICorner")
    活动轨道圆角.CornerRadius = UDim.new(1, 0)
    活动轨道圆角.Parent = 活动轨道
    
    local 手柄 = Instance.new("Frame")
    手柄.Name = "手柄"
    手柄.Size = UDim2.new(0, 20, 0, 20)
    手柄.Position = UDim2.new(0, -10, 0.5, -10)
    手柄.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    手柄.BorderSizePixel = 0
    
    local 手柄圆角 = Instance.new("UICorner")
    手柄圆角.CornerRadius = UDim.new(1, 0)
    手柄圆角.Parent = 手柄
    
    local 值标签 = Instance.new("TextLabel")
    值标签.Name = "值标签"
    值标签.Size = UDim2.new(0, 40, 0, 20)
    值标签.Position = UDim2.new(1, -40, 0, 0)
    值标签.BackgroundTransparency = 1
    值标签.Text = tostring(默认值)
    值标签.TextColor3 = MD3.颜色.文字表面变体
    值标签.TextSize = 14
    值标签.Font = Enum.Font.Gotham
    值标签.TextXAlignment = Enum.TextXAlignment.Right
    值标签.Parent = 滑块容器
    
    活动轨道.Parent = 轨道
    手柄.Parent = 轨道
    轨道.Parent = 滑块容器
    
    local 值 = math.clamp(默认值, 最小值, 最大值)
    local 范围 = 最大值 - 最小值
    local 百分比 = (值 - 最小值) / 范围
    
    local function 更新滑块(位置X)
        local 绝对大小 = 轨道.AbsoluteSize.X
        local 相对X = math.clamp(位置X, 0, 绝对大小)
        local 新百分比 = 相对X / 绝对大小
        local 新值 = 最小值 + (范围 * 新百分比)
        新值 = math.floor(新值 * 10) / 10
        
        活动轨道.Size = UDim2.new(新百分比, 0, 1, 0)
        手柄.Position = UDim2.new(新百分比, -10, 0.5, -10)
        值标签.Text = tostring(新值)
        
        if 回调 then
            回调(新值)
        end
        
        return 新值
    end
    
    更新滑块(轨道.AbsoluteSize.X * 百分比)
    
    local 正在拖动 = false
    轨道.InputBegan:Connect(function(输入)
        if 输入.UserInputType == Enum.UserInputType.MouseButton1 then
            正在拖动 = true
            MD3.动画:缩放动画(手柄, 1.2, 0.1)
        end
    end)
    
    UserInputService.InputChanged:Connect(function(输入)
        if 正在拖动 and 输入.UserInputType == Enum.UserInputType.MouseMovement then
            local 鼠标位置 = UserInputService:GetMouseLocation()
            local 轨道位置 = 轨道.AbsolutePosition
            值 = 更新滑块(鼠标位置.X - 轨道位置.X)
        end
    end)
    
    UserInputService.InputEnded:Connect(function(输入)
        if 输入.UserInputType == Enum.UserInputType.MouseButton1 then
            正在拖动 = false
            MD3.动画:缩放动画(手柄, 1.0, 0.1)
        end
    end)
    
    return 滑块框
end

-- 拖拽系统
function MD3.窗口:设置拖拽(窗口实例, 拖拽区域, 缩放系数)
    缩放系数 = 缩放系数 or 1.05
    local 正在拖拽 = false
    local 拖拽起点, 起始位置
    local 原大小 = 窗口实例.Size:Copy()
    local 正在缩放 = false
    
    拖拽区域.InputBegan:Connect(function(输入)
        if 输入.UserInputType == Enum.UserInputType.MouseButton1 and not 正在缩放 then
            正在拖拽 = true
            拖拽起点 = UserInputService:GetMouseLocation()
            起始位置 = Vector2.new(窗口实例.AbsolutePosition.X, 窗口实例.AbsolutePosition.Y)
            窗口实例.ZIndex = 1000
            
            正在缩放 = true
            MD3.动画:缩放动画(窗口实例, 缩放系数, 0.2, function()
                正在缩放 = false
            end)
        end
    end)
    
    UserInputService.InputChanged:Connect(function(输入)
        if 正在拖拽 and 输入.UserInputType == Enum.UserInputType.MouseMovement and not 正在缩放 then
            local 鼠标位置 = UserInputService:GetMouseLocation()
            local 偏移 = 鼠标位置 - 拖拽起点
            local 新位置 = 起始位置 + 偏移
            
            local 屏幕大小 = Workspace.CurrentCamera.ViewportSize
            local 窗口大小 = 窗口实例.AbsoluteSize
            新位置 = Vector2.new(
                math.clamp(新位置.X, 0, 屏幕大小.X - 窗口大小.X),
                math.clamp(新位置.Y, 0, 屏幕大小.Y - 窗口大小.Y)
            )
            
            窗口实例.Position = UDim2.new(0, 新位置.X, 0, 新位置.Y)
        end
    end)
    
    UserInputService.InputEnded:Connect(function(输入)
        if 输入.UserInputType == Enum.UserInputType.MouseButton1 and 正在拖拽 then
            正在拖拽 = false
            窗口实例.ZIndex = 1
            
            if not 正在缩放 then
                正在缩放 = true
                MD3.动画:缩放动画(窗口实例, 1.0, 0.2, function()
                    正在缩放 = false
                end)
            end
        end
    end)
end

-- 窗口入场动画
function MD3.窗口:入场动画(窗口实例, 最终大小)
    最终大小 = 最终大小 or 窗口实例.Size
    
    local 原大小 = 窗口实例.Size
    窗口实例.Size = UDim2.new(0, 0, 0, 0)
    窗口实例.BackgroundTransparency = 1
    窗口实例.AnchorPoint = Vector2.new(0.5, 0.5)
    窗口实例.Position = UDim2.new(0.5, 0, 0.5, 0)
    
    local 动画1 = TweenService:Create(窗口实例, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = 最终大小 + UDim2.new(0, 50, 0, 50),
        BackgroundTransparency = 0.1
    })
    
    local 动画2 = TweenService:Create(窗口实例, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = 最终大小
    })
    
    动画1:Play()
    动画1.Completed:Wait()
    动画2:Play()
end

-- 窗口关闭动画
function MD3.窗口:关闭动画(窗口实例, 回调)
    local 动画 = TweenService:Create(窗口实例, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
        Size = UDim2.new(0, 0, 0, 0),
        BackgroundTransparency = 1
    })
    
    动画:Play()
    动画.Completed:Wait()
    
    if 回调 then
        回调()
    end
end

-- 窗口最小化动画
function MD3.窗口:最小化动画(窗口实例, 原大小, 是否最小化)
    local 动画信息 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    
    if 是否最小化 then
        local 动画 = TweenService:Create(窗口实例, 动画信息, {
            Size = UDim2.new(0, 220, 0, 40)
        })
        动画:Play()
    else
        local 动画 = TweenService:Create(窗口实例, 动画信息, {
            Size = 原大小
        })
        动画:Play()
    end
end

-- 主函数：创建完整悬浮窗
function MD3:创建悬浮窗(配置)
    配置 = 配置 or {}
    local 标题 = 配置.标题 or "时迁脚本"
    local 宽度 = 配置.宽度 or 550
    local 高度 = 配置.高度 or 400
    
    -- 创建ScreenGui
    local 界面 = Instance.new("ScreenGui")
    界面.Name = "MD3界面"
    界面.ResetOnSpawn = false
    界面.IgnoreGuiInset = true
    界面.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    界面.DisplayOrder = 999
    
    -- 创建主窗口
    local 主卡片 = MD3.窗口:创建卡片(宽度, 高度, 界面)
    
    -- 左侧导航栏
    local 左侧面板 = MD3.窗口:创建左侧面板(主卡片, 100)
    
    -- 右侧内容区
    local 右侧面板 = MD3.窗口:创建右侧面板(主卡片, 100)
    
    -- 标题栏
    local 标题栏, 拖拽区 = MD3.窗口:创建标题栏(右侧面板, 标题)
    
    -- 控制按钮
    local 控制按钮, 最小化按钮, 关闭按钮 = MD3.窗口:创建控制按钮(标题栏)
    
    -- 分隔线
    local 分隔线 = MD3.窗口:创建分隔线(右侧面板, 40)
    
    -- 页面容器
    local 页面容器 = MD3.窗口:创建页面容器(右侧面板, 41)
    
    -- 用户信息容器
    local 用户信息容器 = Instance.new("Frame")
    用户信息容器.Name = "用户信息容器"
    用户信息容器.Size = UDim2.new(1, 0, 0, 60)
    用户信息容器.Position = UDim2.new(0, 0, 0, 110)
    用户信息容器.BackgroundTransparency = 1
    用户信息容器.Parent = 右侧面板
    
    -- 用户名标签
    local 用户名标签 = Instance.new("TextLabel")
    用户名标签.Name = "用户名标签"
    用户名标签.Size = UDim2.new(0.5, 0, 1, 0)
    用户名标签.Position = UDim2.new(0, 10, 0, 0)
    用户名标签.BackgroundTransparency = 1
    用户名标签.Text = "用户昵称: " .. Players.LocalPlayer.Name
    用户名标签.TextColor3 = MD3.颜色.文字表面
    用户名标签.TextSize = 16
    用户名标签.Font = Enum.Font.Gotham
    用户名标签.TextXAlignment = Enum.TextXAlignment.Left
    用户名标签.Parent = 用户信息容器
    
    -- 服务器ID标签
    local 服务器ID标签 = Instance.new("TextLabel")
    服务器ID标签.Name = "服务器ID标签"
    服务器ID标签.Size = UDim2.new(0.5, 0, 1, 0)
    服务器ID标签.Position = UDim2.new(0, 10, 0, 30)
    服务器ID标签.BackgroundTransparency = 1
    服务器ID标签.Text = "服务器ID: " .. tostring(game.JobId)
    服务器ID标签.TextColor3 = MD3.颜色.文字表面变体
    服务器ID标签.TextSize = 16
    服务器ID标签.Font = Enum.Font.Gotham
    服务器ID标签.TextXAlignment = Enum.TextXAlignment.Left
    服务器ID标签.Parent = 用户信息容器
    
    -- 设置拖拽
    MD3.窗口:设置拖拽(主卡片, 拖拽区, 1.05)
    
    -- 按钮事件
    关闭按钮.MouseButton1Click:Connect(function()
        MD3.动画:按钮点击动画(关闭按钮, function()
            MD3.窗口:关闭动画(主卡片, function()
                界面:Destroy()
            end)
        end)
    end)
    
    local 是否最小化 = false
    local 原大小 = 主卡片.Size:Copy()
    
    最小化按钮.MouseButton1Click:Connect(function()
        MD3.动画:按钮点击动画(最小化按钮, function()
            是否最小化 = not 是否最小化
            if 是否最小化 then
                MD3.窗口:最小化动画(主卡片, 原大小, true)
                最小化按钮.Text = "+"
                右侧面板.Visible = false
                左侧面板.Visible = false
            else
                MD3.窗口:最小化动画(主卡片, 原大小, false)
                最小化按钮.Text = "−"
                右侧面板.Visible = true
                左侧面板.Visible = true
            end
        end)
    end)
    
    -- 热键
    UserInputService.InputBegan:Connect(function(输入, 已处理)
        if 已处理 then return end
        
        if 输入.KeyCode == Enum.KeyCode.H then
            主卡片.Visible = not 主卡片.Visible
        end
    end)
    
    -- 窗口对象
    local 窗口对象 = {
        界面 = 界面,
        主卡片 = 主卡片,
        左侧面板 = 左侧面板,
        右侧面板 = 右侧面板,
        标题栏 = 标题栏,
        拖拽区 = 拖拽区,
        控制按钮 = 控制按钮,
        最小化按钮 = 最小化按钮,
        关闭按钮 = 关闭按钮,
        页面容器 = 页面容器,
        用户信息容器 = 用户信息容器
    }
    
    function 窗口对象:显示()
        界面.Parent = game:GetService("CoreGui")
        MD3.窗口:入场动画(主卡片, UDim2.new(0, 宽度, 0, 高度))
    end
    
    function 窗口对象:隐藏()
        主卡片.Visible = false
    end
    
    function 窗口对象:关闭()
        MD3.窗口:关闭动画(主卡片, function()
            界面:Destroy()
        end)
    end
    
    return 窗口对象
end

-- 导出MD3库
return MD3
