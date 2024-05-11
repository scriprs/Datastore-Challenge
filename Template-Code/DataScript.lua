
--> DataScript.luau <--

--\\ Services //--

--\\ Variables //--
local dataManager = require(script.DataManager)

--\\ Connections //--
game.Players.PlayerAdded:Connect(function(player: Player)
	task.spawn(dataManager.load, player, DataStore)
end)

game.Players.PlayerRemoving:Connect(function(player: Player)
  
end)
