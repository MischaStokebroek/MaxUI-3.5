------------------------------------------------------------------------------------------
-- MaxUI 3.50 TukUI 17 - LEGION 7.0 -- version: 23-12-2016
------------------------------------------------------------------------------------------

--setting up INVENTORY FILTERS.

------------------------------------------------------------------------------------------
-- LOCALS/FUNCTIONS/...
------------------------------------------------------------------------------------------

local T, C, L = Tukui:unpack()
local Inventory = T.Inventory
local Bags = Inventory.Bags

------------------------------------------------------------------------------------------
-- CONTAINERS
------------------------------------------------------------------------------------------

local function CreateContainer(self, storagetype, ...)
local Container = self[storagetype]

	Container:CreateShadow("Default")
	Container:SetTemplate("Transparent")
	Container:SetFrameLevel(10)
	--Container:SetFrameStrata("HIGH")
	
	-- bag anchor (right)
	if (storagetype == "Bag") then
		Container:ClearAllPoints()
		Container:SetPoint("BOTTOMRIGHT", RIGHTChatline, "TOPRIGHT", -15, 10)
		Container:CreateOverlayTooltip()
	end
	
	-- bank anchor (left)
	if (storagetype == "Bank") then
		Container:ClearAllPoints()
		Container:SetPoint("BOTTOMLEFT", LEFTChatline, "LEFT", 15, 10)
		Container:CreateOverlayTooltip()
	end
end
hooksecurefunc(Bags, "CreateContainer", CreateContainer)

-- reagent bank anchor
local function CreateReagentContainer(self)
local Reagent = self.Reagent
	
	Reagent:SetTemplate("Transparent")
	Reagent:CreateShadow("Default")
	Reagent:ClearAllPoints()
	Reagent:SetPoint("BOTTOMLEFT", LEFTChatline, "LEFT", 15, 10)
	Reagent:CreateOverlayTooltip()
end
hooksecurefunc(Bags, "CreateReagentContainer", CreateReagentContainer)