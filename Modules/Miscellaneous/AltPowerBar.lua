------------------------------------------------------------------------------------------
-- MaxUI 3.50 TukUI 17 - LEGION 7.0 -- version: 21-04-2017
------------------------------------------------------------------------------------------

-- setting up ALTERNATIVE POWER.

------------------------------------------------------------------------------------------
-- LOCALS/FUNCTIONS/...
------------------------------------------------------------------------------------------

local T, C, L = Tukui:unpack()

local Misc = T.Miscellaneous
local AltPower = Misc.AltPowerBar
local Panels = T.Panels

------------------------------------------------------------------------------------------
-- ALTERNATIVE POWER ADJUSTMENTS - above actionbars
------------------------------------------------------------------------------------------

local function Create(self)
	local Status = self.Status
		
	self:SetFrameLevel(castbarline:GetFrameLevel() + 2)
	self:SetFrameStrata("HIGH")
	self:SetParent(castbarline)

	-- MELEE LAYOUT	
	if C["MaxUI Layout"]["Heallayout"] == false and C["MaxUI Layout"]["Meleelayout"] == true then
		self:ClearAllPoints()
		self:Size(300, 12)
		self:SetPoint("CENTER", REPXPline, "CENTER", 0, -20)
	end

	-- HEALING LAYOUT	
	if C["MaxUI Layout"]["Heallayout"] == true and C["MaxUI Layout"]["Meleelayout"] == false then
		self:ClearAllPoints()
		self:Size(200, 12)
		self:Point("TOP", ABline05V, "BOTTOM", 52, 3)
		self:SetFrameLevel(15)
	end
	Status:CreateBackdrop("Default")
	Status:SetStatusBarTexture(T.GetTexture(C.UnitFrames.HealthTexture))
	self.Status:SetInside(self)
end
hooksecurefunc(AltPower, "Create", Create)