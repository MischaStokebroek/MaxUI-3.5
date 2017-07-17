------------------------------------------------------------------------------------------
-- MaxUI 3.50 TukUI 17 - LEGION 7.0 -- version: 20-07-2016
------------------------------------------------------------------------------------------

--setting up PRIEST.

-- NOTE: Please Fix me - TotemBar Position, when Shadow Orbs Bar is Shown!

------------------------------------------------------------------------------------------
-- LOCALS/FUNCTIONS/...
------------------------------------------------------------------------------------------

local T, C, L = Tukui:unpack()

local TukuiUnitFrames = T["UnitFrames"]
local Class = select(2, UnitClass("player"))
local Panels = T.Panels

if (Class ~= "PRIEST") then
	return
end

local function Player(self)
	local Portrait = self.Portrait
	if (C.UnitFrames.TotemBar) then
		local TotemBar = self.Totems
		TotemBar:ClearAllPoints()
		
		for i = 1, MAX_TOTEMS do
			TotemBar[i]:CreateBackdrop("Default")
			TotemBar[i]:Width(50)
			TotemBar[i]:Point("BOTTOM", Portrait, "TOP", 0, 10)
		end
	end	
end
hooksecurefunc(TukuiUnitFrames, "Player", Player)
