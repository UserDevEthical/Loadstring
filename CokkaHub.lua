repeat task.wait() until game:IsLoaded()
local TablePlace = {7449423635,2753915549,4442272183}
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Warning!", -- Required
	Text = "I don't sell Cokka Hub, be careful when buying from someone or you will lose money:)", -- Required
	Icon = "rbxassetid://9709149431", -- Optional
	Duration = 5
})
if table.find(TablePlace,game.PlaceId) then
    _G.Game = "BF"
    loadstring(game:HttpGet("https://raw.githubusercontent.com/UserDevEthical/Loadstring/main/BF-New.lua"))()
else
    game.Players.LocalPlayer:Kick("not Support")
end
