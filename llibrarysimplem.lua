local SimpleLib,currentTheme={},'dark'
local themes={
  dark={background=Color3.fromRGB(35,35,35),header=Color3.fromRGB(25,25,25),button=Color3.fromRGB(55,55,55),text=Color3.new(1,1,1),close=Color3.fromRGB(45,45,45),closeText=Color3.fromRGB(255,80,80)},
  purple={background=Color3.fromRGB(45,0,75),header=Color3.fromRGB(30,0,50),button=Color3.fromRGB(85,0,125),text=Color3.new(1,1,1),close=Color3.fromRGB(60,0,90),closeText=Color3.fromRGB(255,150,255)}
}
local function n(c,p)return Instance.new(c,p)end
function SimpleLib:SetTheme(t)if themes[t]then currentTheme=t end end
function SimpleLib:Create(t,b1,f1,b2,f2)local th=themes[currentTheme]local pl=game.Players.LocalPlayer
local g=n("ScreenGui",pl:WaitForChild("PlayerGui"))g.Name="SimpleLibUI"
local f=n("Frame",g)f.Size=UDim2.new(0,220,0,140)f.Position=UDim2.new(0.5,-110,0.5,-70)f.BackgroundColor3=th.background f.BorderSizePixel=0 f.Active=true f.Draggable=true
local tl=n("TextLabel",f)tl.Size=UDim2.new(1,0,0,30)tl.BackgroundColor3=th.header tl.Text=t tl.TextColor3=th.text tl.Font=Enum.Font.GothamBold tl.TextSize=16 tl.BorderSizePixel=0
local cl=n("Text".."Button",f)cl.Size=UDim2.new(0,30,0,30)cl.Position=UDim2.new(1,-30,0,0)cl.BackgroundColor3=th.close cl.Text="X" cl.TextColor3=th.closeText cl.Font=Enum.Font.GothamBold cl.TextSize=16 cl.BorderSizePixel=0
cl.MouseButton1Click:Connect(function()g:Destroy()end)
local b1b=n("Text".."Button",f)b1b.Size=UDim2.new(1,-20,0,40)b1b.Position=UDim2.new(0,10,0,40)b1b.BackgroundColor3=th.button b1b.TextColor3=th.text b1b.Font=Enum.Font.Gotham b1b.TextSize=14 b1b.Text=b1 b1b.MouseButton1Click:Connect(function()pcall(f1)end)
local b2b=n("Text".."Button",f)b2b.Size=UDim2.new(1,-20,0,40)b2b.Position=UDim2.new(0,10,0,90)b2b.BackgroundColor3=th.button b2b.TextColor3=th.text b2b.Font=Enum.Font.Gotham b2b.TextSize=14 b2b.Text=b2 b2b.MouseButton1Click:Connect(function()pcall(f2)end)
end
return SimpleLib
