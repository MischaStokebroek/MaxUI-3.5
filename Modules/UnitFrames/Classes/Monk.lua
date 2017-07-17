------------------------------------------------------------------------------------------
-- MaxUI 3.50 TukUI 17 - LEGION 7.0 -- version: 20-07-2016
------------------------------------------------------------------------------------------

--setting up MONK.

------------------------------------------------------------------------------------------
-- LOCALS/FUNCTIONS/...
------------------------------------------------------------------------------------------

local T, C, L = Tukui:unpack()
local TukuiUnitFrames = T["UnitFrames"]
local Class = select(2, UnitClass("player"))
local Panels = T.Panels

if (Class ~= "MONK") then
	return
end

local function Player(self)
	local Harmony = self.HarmonyBar
	local Portrait = self.Portrait
		Harmony:Size(200, 1)
		Harmony:Hide()
		Harmony:SetBackdrop(nil)
		Harmony:ClearAllPoints()
		
		if C["MaxUI Layout"]["ClassResourcesAB"] == true and C["MaxUI Layout"]["Heallayout"] == false then		
			Harmony:Point("CENTER", castbarline, "CENTER", 0, 0)
		else
			Harmony:Point("BOTTOMLEFT", self, "TOPLEFT", 3, 8)
		end	
	
	for i = 1, 6 do
		Harmony[i]:Height(12)
		Harmony[i]:CreateBackdrop()
	
		if i == 1 then
			Harmony[i]:Width(24)
			Harmony[i]:SetPoint("LEFT", Harmony, "LEFT", 9, 0)
			Harmony[i].Ascension = Harmony[i]:GetWidth()
			Harmony[i].NoTalent = 28
		else
			Harmony[i]:Width(24)
			Harmony[i]:SetPoint("LEFT", Harmony[i-1], "RIGHT", 10, 0)
			Harmony[i].Ascension = Harmony[i]:GetWidth()
			Harmony[i].NoTalent = 28
		end
	end
	
	Harmony:SetScript("OnShow", function(self)
		TukuiUnitFrames.UpdateShadow(self, 12)
	end)

	Harmony:SetScript("OnHide", function(self)
		TukuiUnitFrames.UpdateShadow(self, 4)
	end)
	
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