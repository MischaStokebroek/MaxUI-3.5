------------------------------------------------------------------------------------------
-- MaxUI 3.50 TukUI 17 - LEGION 7.0 -- version: 20-07-2016
------------------------------------------------------------------------------------------

--setting up WARLOCK.

------------------------------------------------------------------------------------------
-- LOCALS/FUNCTIONS/...
------------------------------------------------------------------------------------------

local T, C, L = Tukui:unpack()

local TukuiUnitFrames = T["UnitFrames"]
local Class = select(2, UnitClass("player"))
local Panels = T.Panels

if (Class ~= "WARLOCK") then
	return
end

local function Player(self)
	local Bar = self.SoulShards
	Bar:Size(198, 1)
	Bar:ClearAllPoints()
	if C["MaxUI Layout"]["ClassResourcesAB"] == true and C["MaxUI Layout"]["Heallayout"] == false then		
		Bar:Point("CENTER", castbarline, "CENTER", 0, 0)
		else	
		Bar:Point("BOTTOMLEFT", self, "TOPLEFT", 4, 8)
	end	
	
	for i = 1, 5 do
		Bar[i]:Height(12)
		Bar[i]:Width(30)
		Bar[i]:CreateBackdrop()

		if i == 1 then
			Bar[i]:SetPoint("LEFT", Bar, "LEFT", 8, 0)
		else
			Bar[i]:SetPoint("LEFT", Bar[i-1], "RIGHT", 8, 0)
		end
	end
		
	if (C.UnitFrames.TotemBar) then
		local TotemBar = self.Totems
		TotemBar:ClearAllPoints()
		TotemBar:Point("BOTTOMLEFT", self, "TOPLEFT", 0, 24)
	end
end
hooksecurefunc(TukuiUnitFrames, "Player", Player)