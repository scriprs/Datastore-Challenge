--> DataManager.luau <--

local DataManager = {}

--\\ Functions | Methods //--
DataManager.load = function(Player: Player, DataStore: DataStore)
	local key = `Data-{tostring(Player.UserId)}`
end

DataManager.save = function(Player: Player, DataStore: DataStore)
	local key =  `Data-{tostring(Player.UserId)}`
end

DataManager.getData = function(Player: Player, Child: any?)
	
end

shared.GetData = DataManager.getData
return DataManager
