local SimpleLib = {}
local currentTheme = "dark"

local themes = {
    dark = {
        background = Color3.fromRGB(35, 35, 35),
        header = Color3.fromRGB(25, 25, 25),
        button = Color3.fromRGB(55, 55, 55),
        text = Color3.new(1, 1, 1),
        close = Color3.fromRGB(45, 45, 45),
        closeText = Color3.fromRGB(255, 80, 80)
    },
    purple = {
        background = Color3.fromRGB(45, 0, 75),
        header = Color3.fromRGB(30, 0, 50),
        button = Color3.fromRGB(85, 0, 125),
        text = Color3.new(1, 1, 1),
        close = Color3.fromRGB(60, 0, 90),
        closeText = Color3.fromRGB(255, 150, 255)
    }
}

function SimpleLib:SetTheme(name)
    if themes[name] then
        currentTheme = name
    end
end

function SimpleLib:Create(title, button1Text, button1Callback, button2Text, button2Callback)
    local theme = themes[currentTheme]
    local player = game.Players.LocalPlayer
    local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
    gui.Name = "SimpleLibUI"

    local frame = Instance.new("Frame", gui)
    frame.Size = UDim2.new(0, 220, 0, 140)
    frame.Position = UDim2.new(0.5, -110, 0.5, -70)
    frame.BackgroundColor3 = theme.background
    frame.BorderSizePixel = 0
    frame.Active = true
    frame.Draggable = true

    local titleLabel = Instance.new("TextLabel", frame)
    titleLabel.Size = UDim2.new(1, 0, 0, 30)
    titleLabel.BackgroundColor3 = theme.header
    titleLabel.Text = title
    titleLabel.TextColor3 = theme.text
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextSize = 16
    titleLabel.BorderSizePixel = 0

    local closeButton = Instance.new("TextButton", frame)
    closeButton.Size = UDim2.new(0, 30, 0, 30)
    closeButton.Position = UDim2.new(1, -30, 0, 0)
    closeButton.BackgroundColor3 = theme.close
    closeButton.Text = "X"
    closeButton.TextColor3 = theme.closeText
    closeButton.Font = Enum.Font.GothamBold
    closeButton.TextSize = 16
    closeButton.BorderSizePixel = 0

    closeButton.MouseButton1Click:Connect(function()
        gui:Destroy()
    end)

    local button1 = Instance.new("TextButton", frame)
    button1.Size = UDim2.new(1, -20, 0, 40)
    button1.Position = UDim2.new(0, 10, 0, 40)
    button1.BackgroundColor3 = theme.button
    button1.TextColor3 = theme.text
    button1.Font = Enum.Font.Gotham
    button1.TextSize = 14
    button1.Text = button1Text
    button1.MouseButton1Click:Connect(function()
        pcall(button1Callback)
    end)

    local button2 = Instance.new("TextButton", frame)
    button2.Size = UDim2.new(1, -20, 0, 40)
    button2.Position = UDim2.new(0, 10, 0, 90)
    button2.BackgroundColor3 = theme.button
    button2.TextColor3 = theme.text
    button2.Font = Enum.Font.Gotham
    button2.TextSize = 14
    button2.Text = button2Text
    button2.MouseButton1Click:Connect(function()
        pcall(button2Callback)
    end)
end

return SimpleLib
