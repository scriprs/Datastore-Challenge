--> DataManager.luau <--

local DataManager = {}

--\\ Functions | Methods //--
DataManager.load = function(Player: Player, DataStore: DataStore)
	local key = `Data-{tostring(Player.UserId)}`
	local success, data = pcall(DataStore.GetAsync, DataStore, key)

	if success then
		local Folder = Instance.new("Folder")
		Folder.Name = "InternalData"

		local LoginCounter = Instance.new("NumberValue")
		LoginCounter.Name = "LoginCounter"
		LoginCounter.Value = if typeof(data) == "number" then data else 1

		LoginCounter.Parent = Folder
		Folder.Parent = Player

		LoginCounter.Value += 1
	else
		return warn("Error loading data")
	end

	print("loaded")
end

DataManager.save = function(Player: Player, DataStore: DataStore)
	local key =  `Data-{tostring(Player.UserId)}`
	local folder = Player:FindFirstChild("InternalData")

	if folder then
		local success, data
		
		for _, child in ipairs(folder:GetChildren()) do
			pcall(DataStore.SetAsync, DataStore, key, child.Value)
		end
	else
		warn("InternalData folder not found for player:", Player.Name)
	end

	print("saved")
end

DataManager.getData = function(Player: Player, Child: any?)
	local folder = Player:FindFirstChild("InternalData")
	
	if not Child then return folder end
	return folder[Child]
end

shared.GetData = DataManager.getData
return DataManager
