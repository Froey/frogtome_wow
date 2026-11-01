local _, Frogtome = ...
if not Frogtome.Core then
	Frogtome.Core = {}
end
Frogtome.Core.Inventory = {}

local API = Frogtome.Core.API
local Context = Frogtome.Version.Context
local Inventory = Frogtome.Core.Inventory

----------------------------------------
-- Local Configurables and Attributes --
----------------------------------------

Inventory.CONTEXT_MODULE = "Frogtome.Core.Inventory"

-------------------------
-- Core Data Functions --
-------------------------

-- Returns the size of the current character's container at the specified index.
Context:SetDependencies(
	Inventory.CONTEXT_MODULE,
	"GetContainerSize",
	{ Context.RETAIL_ID, Context.BCC_ID, Context.FOREVER_ID }, 
	{ "GetCharacterContainerSize" }
)
function Inventory:GetContainerSize(index)
	if not Context:CheckDependencies(Inventory.CONTEXT_MODULE, "GetContainerSize") then
		return 0
	end
	
	if index < 0 then
		return nil
	end
	if index > 5 then
		return nil
	end
	
	return API.GetCharacterContainerSize(index)
end

-- Returns the remaining space in the current character's container at the specified index.
Context:SetDependencies(
	Inventory.CONTEXT_MODULE,
	"GetContainerRemainingSpace",
	{ Context.RETAIL_ID, Context.BCC_ID, Context.FOREVER_ID }, 
	{ "GetCharacterContainerAvailableSpace" }
)
function Inventory:GetContainerRemainingSpace(index)
	if not Context:CheckDependencies(Inventory.CONTEXT_MODULE, "GetContainerRemainingSpace") then
		return 0
	end
	
	if index < 0 then
		return nil
	end
	if index > 5 then
		return nil
	end
	
	return API.GetCharacterContainerAvailableSpace(index)
end

----------------------------------
-- Specific Container Functions --
----------------------------------

-- Returns the size of the current character's backpack.
function Inventory:GetBackpackSize()
	-- Index 0 denotes the backpack
	return Inventory:GetContainerSize(0)
end

-- Returns the size of the current character's bag at the specified index.
function Inventory:GetBagSize(index)
	if index < 1 then
		return nil
	end
	if index > 4 then
		return nil
	end
	
	return Inventory:GetContainerSize(index)
end

-- Returns the size of the current character's reagent bag.
function Inventory:GetReagentBagSize()
	-- Index 5 denotes the reagent bag
	return Inventory:GetContainerSize(5)
end

-- Returns the total size of the current character's inventory, optionally including the reagent bag.
function Inventory:GetInventorySize(includeReagentBag)
	local inventorySize = Inventory:GetBackpackSize()
	
	for index = 1, 4 do
		inventorySize = inventorySize + Inventory:GetBagSize(index)
	end
	
	if includeReagentBag then
		inventorySize = inventorySize + Inventory:GetReagentBagSize()
	end
	
	return inventorySize
end

-- Returns the remaining space in the current character's backpack.
function Inventory:GetBackpackRemainingSpace()
	-- Index 0 denotes the backpack
	return Inventory:GetContainerRemainingSpace(0)
end

-- Returns the remaining space in the current character's bag at the specified index.
function Inventory:GetBagRemainingSpace(index)
	if index < 0 then
		return nil
	end
	if index > 5 then
		return nil
	end
	
	return Inventory:GetContainerRemainingSpace(index)
end

-- Returns the size of the current character's reagent bag.
function Inventory:GetReagentBagRemainingSpace()
	-- Index 5 denotes the reagent bag
	return Inventory:GetContainerRemainingSpace(5)
end

-- Returns the total remaining space of the current character's inventory, optionally including the reagent bag.
function Inventory:GetInventoryRemainingSpace(includeReagentBag)
	local inventoryRemaining = Inventory:GetBackpackRemainingSpace()
	
	for index = 1, 4 do
		inventoryRemaining = inventoryRemaining + Inventory:GetBagRemainingSpace(index)
	end
	
	if includeReagentBag then
		inventoryRemaining = inventoryRemaining + Inventory:GetReagentBagRemainingSpace()
	end
	
	return inventoryRemaining
end

-- Returns the filled space in the current character's backpack.
function Inventory:GetBackpackFilledSpace()
	return Inventory:GetBackpackSize() - Inventory:GetBackpackRemainingSpace()
end

-- Returns the filled space in the current character's bag at the specified index.
function Inventory:GetBagFilledSpace(index)
	return Inventory:GetBagSize(index) - Inventory:GetBagRemainingSpace(index)
end

-- Returns the size of the current character's reagent bag.
function Inventory:GetReagentBagFilledSpace()
	return Inventory:GetReagentBagSize() - Inventory:GetReagentBagRemainingSpace()
end

-- Returns the total remaining space of the current character's inventory, optionally including the reagent bag.
function Inventory:GetInventoryFilledSpace(includeReagentBag)
	return Inventory:GetInventorySize(includeReagentBag) - Inventory:GetInventoryRemainingSpace(includeReagentBag)
end
