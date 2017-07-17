------------------------------------------------------------------------------------------
-- MaxUI 3.50 TukUI 17 - LEGION 7.0 -- version: 20-07-2016
------------------------------------------------------------------------------------------

--setting up PALADIN.

------------------------------------------------------------------------------------------
-- LOCALS/FUNCTIONS/...
------------------------------------------------------------------------------------------

local T, C, L = Tukui:unpack()

local TukuiUnitFrames = T["UnitFrames"]
local Class = select(2, UnitClass("player"))

if (Class ~= "PALADIN") then
	return
end

local function Player(self)
	local HPBar = self.HolyPower
	local Portrait = self.Portrait
		
	HPBar:Size(200, 1)
	HPBar:ClearAllPoints()
	if C["MaxUI Layout"]["ClassResourcesAB"] == true and C["MaxUI Layout"]["Heallayout"] == false then		
		HPBar:Point("CENTER", castbarline, "CENTER", 0, 0)
	else	
		HPBar:Point("BOTTOMLEFT", self, "TOPLEFT", 3, 8)
	end	

	for i = 1, 5 do
		HPBar[i]:Height(12)
		HPBar[i]:CreateBackdrop()
		if i == 1 then
			HPBar[i]:Width(30)
			HPBar[i]:Point("LEFT", HPBar, "LEFT", 9, 0)
		else
			HPBar[i]:Width(30)
			HPBar[i]:Point("LEFT", HPBar[i-1], "RIGHT", 8, 0)
		end
	end

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