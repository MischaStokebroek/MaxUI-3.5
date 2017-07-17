------------------------------------------------------------------------------------------
-- MaxUI 3.50 TukUI 17 - LEGION 7.0 -- version: 20-07-2016
------------------------------------------------------------------------------------------

--setting up PLAYER FRAMES.
-- NOTE : Please Fix me - TotemBar Position, when Arcane Bar is Shown!

------------------------------------------------------------------------------------------
-- LOCALS/FUNCTIONS/...
------------------------------------------------------------------------------------------

local T, C, L = Tukui:unpack()

local TukuiUnitFrames = T["UnitFrames"]
local Class = select(2, UnitClass("player"))

if (Class ~= "MAGE") then
	return
end

local function Player(self)
	local ArcaneChargeBar = self.ArcaneChargeBar
	
	ArcaneChargeBar:Size(150, 1)
	ArcaneChargeBar:ClearAllPoints()
	
		if C["MaxUI Layout"]["ClassResourcesAB"] == true and C["MaxUI Layout"]["Heallayout"] == false then		
			ArcaneChargeBar:Point("CENTER", castbarline, "CENTER", 0, 0)
		else
			ArcaneChargeBar:Point("BOTTOM", self, "TOP", 0, 1)
		end

	for i = 1, 4 do
		ArcaneChargeBar[i]:Height(12)
		ArcaneChargeBar[i]:CreateBackdrop("Default")

		if i == 1 then
			ArcaneChargeBar[i]:Width((30))
			ArcaneChargeBar[i]:Point("LEFT", ArcaneChargeBar, "LEFT", 0, 0)
		else
			ArcaneChargeBar[i]:Width((30))
			ArcaneChargeBar[i]:Point("LEFT", ArcaneChargeBar[i-1], "RIGHT", 10, 0)
		end
	end
	ArcaneChargeBar:SetScript("OnShow", TukuiUnitFrames.MoveTotemBar)
	ArcaneChargeBar:SetScript("OnHide", TukuiUnitFrames.MoveTotemBar)

	if (C.UnitFrames.TotemBar) then
		local TotemBar = self.Totems
		TotemBar:ClearAllPoints()
		TotemBar:Point("BOTTOMLEFT", self, "TOPLEFT", 0, 24)
		
		for i = 1, MAX_TOTEMS do
			TotemBar[i]:CreateBackdrop("Default")
			TotemBar[i].Icon:SetTexture(nil)
			TotemBar[i].Icon:SetDesaturated(false)

		end
	end
end
hooksecurefunc(TukuiUnitFrames, "Player", Player)