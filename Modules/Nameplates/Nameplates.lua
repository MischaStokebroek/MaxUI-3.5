------------------------------------------------------------------------------------------
-- MaxUI 3.50 TukUI 17 - LEGION 7.0 -- version: 21-04-2017
------------------------------------------------------------------------------------------

--setting up NAMEPLATES.

------------------------------------------------------------------------------------------
-- LOCALS/FUNCTIONS/...
------------------------------------------------------------------------------------------

local T, C, L = Tukui:unpack()

local Plates = T["NamePlates"]
local thickness = 1
------------------------------------------------------------------------------------------
-- ...
------------------------------------------------------------------------------------------

local function SetupPlate(self)
	local HealthBar = self.healthBar
	local CastBar = self.castBar
	local CastBarIcon = self.castBar.Icon
	local RaidIcon = self.RaidIcon

	HealthBar:CreateBackdrop("Transparent")
	CastBar:CreateBackdrop("Transparent")
	
	-- raid icon
	--RaidIcon:ClearAllPoints()
	--RaidIcon:Size(44)
	--RaidIcon:Point("BOTTOM", HealthBar, "TOP", 0, 8)	
end


hooksecurefunc(Plates, "SetupPlate", SetupPlate)
