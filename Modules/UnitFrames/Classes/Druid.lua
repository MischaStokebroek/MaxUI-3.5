------------------------------------------------------------------------------------------
-- MaxUI 3.50 TukUI 17 - LEGION 7.0 -- version: 20-07-2016
------------------------------------------------------------------------------------------

--setting up DRUID.

------------------------------------------------------------------------------------------
-- LOCALS/FUNCTIONS/...
------------------------------------------------------------------------------------------

local T, C, L = Tukui:unpack()

local TukuiUnitFrames = T["UnitFrames"]
local Class = select(2, UnitClass("player"))
local Panels = T.Panels

if (Class ~= "DRUID") then
	return
end

local function Player(self)
	local Portrait = self.Portrait
	
	if (C.UnitFrames.TotemBar) then
		local TotemBar = self.Totems
		
		TotemBar:ClearAllPoints()
		--TotemBar:Point("BOTTOM", Portrait, "TOP", 10, 0)
		
		for i = 1, MAX_TOTEMS do
			--TotemBar[i]:SetOrientation'VERTICAL'
			TotemBar[i]:CreateBackdrop("Default")
			TotemBar[i]:Width(50)
			TotemBar[i]:Point("BOTTOM", Portrait, "TOP", 0, 10)
		end
	end
end
hooksecurefunc(TukuiUnitFrames, "Player", Player)
