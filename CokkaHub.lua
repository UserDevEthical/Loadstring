repeat task.wait() until game:IsLoaded()
local TablePlace = {7449423635,2753915549,4442272183, 126884695634066}
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Read!", -- Required
	Text = "Loading... - Next: Updating (in 1-5 days): Fast Attack like AK47, GAG Game (New!) ", -- Required
	Icon = "rbxassetid://9709149431", -- Optional
	Duration = 15
})
if table.find(TablePlace,game.PlaceId) then
    getgenv().Game = "BF"
    loadstring(game:HttpGet("https://raw.githubusercontent.com/UserDevEthical/Loadstring/main/BF-New.lua"))()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/UserDevEthical/other/refs/heads/main/secure_call.lua"))()
else
    game.Players.LocalPlayer:Kick("not Support")
end
