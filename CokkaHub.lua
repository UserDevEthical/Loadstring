repeat task.wait() until game:IsLoaded()
local TablePlace = {7449423635,2753915549,4442272183}
if table.find(TablePlace,game.PlaceId) then 
    loadstring(game:HttpGet("https://raw.githubusercontent.com/UserDevEthical/Loadstring/main/BF-New.lua"))()
else
    game.Players.LocalPlayer:Kick("not Support")
end