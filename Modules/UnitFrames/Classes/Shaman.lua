	------------------------------------------------------------------------------------------
-- MaxUI 3.50 TukUI 17 - LEGION 7.0 -- version: 20-07-2016
------------------------------------------------------------------------------------------

--setting up PLAYER FRAMES.

------------------------------------------------------------------------------------------
-- LOCALS/FUNCTIONS/...
------------------------------------------------------------------------------------------

local T, C, L = Tukui:unpack()

local TukuiUnitFrames = T["UnitFrames"]
local Class = select(2, UnitClass("player"))
local Panels = T.Panels

if (Class ~= "SHAMAN") then
	return
end

local function Player(self)
	if (C.UnitFrames.TotemBar) then
		local TotemBar = self.Totems
		TotemBar:ClearAllPoints()
		TotemBar:Point("BOTTOMLEFT", self, "TOPLEFT", 0, 24)
		
		for i = 1, MAX_TOTEMS do
			TotemBar[i]:CreateBackdrop("Default")
		end
	end
end
hooksecurefunc(TukuiUnitFrames, "Player", Player)