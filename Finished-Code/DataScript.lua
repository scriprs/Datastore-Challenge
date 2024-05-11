--> DataScript.luau <--

--\\ Services //--
local DSS = game:GetService("DataStoreService")

--\\ Variables //--
local DataStore = DSS:GetDataStore("Test")
local dataManager = require(script.DataManager)

--\\ Connections //--
game.Players.PlayerAdded:Connect(function(player: Player)
	task.spawn(dataManager.load, player, DataStore)
	
	task.delay(3, function()
		local LoginCounter = shared.GetData(player, "LoginCounter")
		print(LoginCounter.Value)
	end)
end)

game.Players.PlayerRemoving:Connect(function(player: Player)
	task.spawn(dataManager.save, player, DataStore)
end)
