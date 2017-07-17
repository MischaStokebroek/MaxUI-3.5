------------------------------------------------------------------------------------------
-- MaxUI 3.50 TukUI 17 - LEGION 7.0 -- version: 20-07-2016
------------------------------------------------------------------------------------------

--setting up DEATHKNIGHT.

------------------------------------------------------------------------------------------
-- LOCALS/FUNCTIONS/...
------------------------------------------------------------------------------------------

local T, C, L = Tukui:unpack()

local TukuiUnitFrames = T["UnitFrames"]
local Class = select(2, UnitClass("player"))
local Panels = T.Panels

if (Class ~= "DEATHKNIGHT") then
	return
end

local function Player(self)
	local RunesBar = self.Runes
	local TotemBar = self.Totems
	local Panel = self.Panel
	local Health = self.Health
	local Power = self.Power
	local Portrait = self.Portrait

		RunesBar:Size(200, 1)
		RunesBar:ClearAllPoints()
		
		if C["MaxUI Layout"]["ClassResourcesAB"] == true and C["MaxUI Layout"]["Heallayout"] == false then		
			RunesBar:Point("CENTER", castbarline, "CENTER", 0, 0)
		else
			RunesBar:Point("BOTTOMLEFT", self, "TOPLEFT", 3, 8)
		end	
	
	for i = 1, 6 do
		RunesBar[i]:Height(12)
		RunesBar[i]:CreateBackdrop()

		if i == 1 then
			RunesBar[i]:Width(24)
			RunesBar[i]:Point("LEFT", RunesBar, "LEFT", 8, 0)
		else
			RunesBar[i]:Width(24)
			RunesBar[i]:Point("LEFT", RunesBar[i-1], "RIGHT", 8, 0)
		end
	end
end
hooksecurefunc(TukuiUnitFrames, "Player", Player)
