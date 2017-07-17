------------------------------------------------------------------------------------------
-- MaxUI 3.50 TukUI 17 - LEGION 7.0 -- version: 17-12-2016
------------------------------------------------------------------------------------------

--setting up TARGET OF TARGET FRAME.

------------------------------------------------------------------------------------------
-- LOCALS/FUNCTIONS/...
------------------------------------------------------------------------------------------

local T, C, L = Tukui:unpack()

local UnitFrames = T.UnitFrames
local Noop = function() end

------------------------------------------------------------------------------------------
-- Target Of Target
------------------------------------------------------------------------------------------
local function CreateUnits()
	local ToT = UnitFrames.Units.TargetOfTarget
	ToT:ClearAllPoints()
	ToT:SetPoint("BOTTOM", T.UnitFrames.Anchor, "TOP", 0, 160)

	if C["MaxUI Media"]["MaxUIUF"] == true then
		ToT:Size(170, 50)
		ToT:SetBackdrop(nil)
		ToT.Shadow:Hide()
	
		-- MELEE LAYOUT	
		if C["MaxUI Layout"]["Heallayout"] == false and C["MaxUI Layout"]["Meleelayout"] == true then
			ToT:ClearAllPoints()
			ToT:SetPoint("BOTTOM", T.UnitFrames.Anchor, "TOP", 0, 160)
			if C["MaxUI Layout"]["DPSlayout"] == true then
				ToT:ClearAllPoints()
				ToT:SetPoint("BOTTOM", T.UnitFrames.Anchor, "TOP", 0, 210)
			end
		end

		-- HEALING LAYOUT	
		if C["MaxUI Layout"]["Heallayout"] == true and C["MaxUI Layout"]["Meleelayout"] == false then
			ToT:ClearAllPoints()
			ToT:SetPoint("BOTTOMRIGHT", T.UnitFrames.Anchor, "TOPRIGHT", 120, 134)
			if C["MaxUI Layout"]["DPSlayout"] == true then
				ToT:ClearAllPoints()
				ToT:SetPoint("BOTTOM", T.UnitFrames.Anchor, "TOP", 0, 105)
			end
			if C["MaxUI Layout"]["SINGLECenterBar"] == true then
				ToT:ClearAllPoints()
				ToT:SetPoint("BOTTOMRIGHT", T.UnitFrames.Anchor, "TOPRIGHT", 220, 240)
				if C.UnitFrames.Portrait == true and C["MaxUI Layout"]["portraitonhp"] == false then
					ToT:ClearAllPoints()
					ToT:SetPoint("BOTTOMRIGHT", T.UnitFrames.Anchor, "TOPRIGHT", 282, 240)
				end
			end	
			if C["MaxUI Layout"]["DOUBLECenterBar"] == true then
				ToT:ClearAllPoints()
				ToT:SetPoint("BOTTOMRIGHT", T.UnitFrames.Anchor, "TOPRIGHT", 220, 240)
				if C.UnitFrames.Portrait == true and C["MaxUI Layout"]["portraitonhp"] == false then
					ToT:ClearAllPoints()
					ToT:SetPoint("BOTTOMRIGHT", T.UnitFrames.Anchor, "TOPRIGHT", 282, 240)
				end
			end
		end
		
		-- DPS CENTER BAR LAYOUT
		if C["MaxUI Layout"]["SINGLECenterBar"] == true and C["MaxUI Layout"]["Meleelayout"] == true then
			ToT:ClearAllPoints()
			ToT:SetPoint("BOTTOMRIGHT", T.UnitFrames.Anchor, "TOPRIGHT", 98, 241)
			if C.UnitFrames.Portrait then
				ToT:ClearAllPoints()
				ToT:SetPoint("BOTTOMRIGHT", T.UnitFrames.Anchor, "TOPRIGHT", 160, 241)
			end
			if (C.UnitFrames.Portrait == true and C["MaxUI Media"]["portraitonhp"] == true) then
				ToT:ClearAllPoints()
				ToT:SetPoint("BOTTOMRIGHT", T.UnitFrames.Anchor, "TOPRIGHT", 98, 241)
			end
		end
		
		-- DOUBLE CENTER BAR LAYOUT
		if C["MaxUI Layout"]["DOUBLECenterBar"] == true and C["MaxUI Layout"]["Meleelayout"] == true then
			ToT:ClearAllPoints()
			ToT:SetPoint("BOTTOMRIGHT", T.UnitFrames.Anchor, "TOPRIGHT", 158, 240)
			if C.UnitFrames.Portrait then
				ToT:ClearAllPoints()
				ToT:SetPoint("BOTTOMRIGHT", T.UnitFrames.Anchor, "TOPRIGHT", 220, 240)
			end
			if (C.UnitFrames.Portrait == true and C["MaxUI Media"]["portraitonhp"] == true) then
				ToT:ClearAllPoints()
				ToT:SetPoint("BOTTOMRIGHT", T.UnitFrames.Anchor, "TOPRIGHT", 158, 240)
			end
		end
	end
end
hooksecurefunc(UnitFrames, "CreateUnits", CreateUnits)

------------------------------------------------------------------------------------------
-- Target Of Target - MAXUI UF STYLE
------------------------------------------------------------------------------------------
local function TargetOfTarget(self)
	local Panel = self.Panel
	local Health = self.Health
	local Name = self.Name
	local Panel = self.Panel
	local RaidIcon = self.RaidIcon
	local thickness = 1

	if C["MaxUI Media"]["MaxUIUF"] == true then
	
		-- vertical anchor line
		local TOTVertAnchorLine = CreateFrame("Frame", "TOTVertAnchorLine", self)
		TOTVertAnchorLine:SetTemplate()
		TOTVertAnchorLine:Size(thickness, 28)
		TOTVertAnchorLine:Point("TOP", self, "TOP", 0, -12)
		TOTVertAnchorLine:SetFrameLevel(2)
		TOTVertAnchorLine:SetFrameStrata("BACKGROUND")
		TOTVertAnchorLine:SetAlpha(1)
		TOTVertAnchorLine:CreateShadow("Default")

		-- HP line
		local TOTHPLine = CreateFrame("Frame", "HPLine", TOTVertAnchorLine)
		TOTHPLine:SetTemplate()
		TOTHPLine:Size(180, thickness)
		TOTHPLine:Point("TOP", TOTVertAnchorLine, "TOP", 0, 0)
		TOTHPLine:SetFrameLevel(2)
		TOTHPLine:SetFrameStrata("BACKGROUND")
		TOTHPLine:SetAlpha(1)
		TOTHPLine:CreateShadow("Default")
	
		-- power line
		local TOTPowerLine = CreateFrame("Frame", "TOTPowerLine", TOTVertAnchorLine)
		TOTPowerLine:SetTemplate()
		TOTPowerLine:Size(160, thickness)
		TOTPowerLine:Point("BOTTOM", TOTVertAnchorLine, "BOTTOM", 0, 0)
		TOTPowerLine:SetFrameLevel(2)
		TOTPowerLine:SetFrameStrata("BACKGROUND")
		TOTPowerLine:SetAlpha(1)
		TOTPowerLine:CreateShadow("Default")

		-- health
		Health:ClearAllPoints()
		Health:SetPoint("CENTER", TOTHPLine, "CENTER", -0, 0)
		Health:CreateBackdrop("Transparent")
		Health:SetHeight(20)
		Health:SetWidth(160)
		Health:SetFrameLevel(3)
		Health.Backdrop:SetFrameLevel(3)
		Health.Backdrop:CreateShadow("Default")

		-- power
		local Power = CreateFrame("StatusBar", nil, self)
		Power:Height(12)
		Power:Width(140)
		Power:SetPoint("CENTER", TOTPowerLine, "CENTER", 0, 0)
		Power:SetFrameLevel(3)
		Power:SetStatusBarTexture(T.GetTexture(C.UnitFrames.PowerTexture))
		Power:CreateBackdrop("Default")
		Power.Backdrop:CreateShadow("Default")
		Power.Backdrop:SetFrameLevel(3)
	
		Power.Background = Power:CreateTexture(nil, "BORDER")
		Power.Background:SetTexture(.1, .1, .1, .2)
		
		Power.Value = Power:CreateFontString(nil, "OVERLAY")
		Power.Value:SetAlpha(0)
		Power.Value:SetFontObject(T.GetFont(C.UnitFrames.Font))
	
		-- Dark theme
		if (C.UnitFrames.DarkTheme) then
			Power.colorClass = true
		else
			Power.colorPower = true
		end
		
		-- smooth bars
		if (C.UnitFrames.Smooth) then
			Power.Smooth = true
		end
	
		Power.frequentUpdates = true
		Power.PostUpdate = UnitFrames.PostUpdatePower
		
		self.Power = Power
		
		-- infopanel
		Panel:SetAlpha(0)
		Name:SetParent(Health)
		Name:SetPoint("CENTER", Health, "CENTER", 0, 0)
		if C["MaxUI Media"]["Font"] == "Caps" then
			Name:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\caps.ttf", 14, "OUTLINE")
		elseif C["MaxUI Media"]["Font"] == "Comic" then
			Name:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\comic.ttf", 14, "OUTLINE")
		elseif C["MaxUI Media"]["Font"] == "MaxUI" then
			Name:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\MaxUI.ttf", 14, "OUTLINE")
		else	
			Name:SetFont(C["Medias"].Font, 14, "OUTLINE")
		end
	
		-- raid icon
		RaidIcon:ClearAllPoints()
		RaidIcon:Size(24)
		RaidIcon:Point("TOP", Health, 0, 24)
		
		-- highlighting unit
		self:HookScript("OnEnter", function(self)
			Health.Backdrop:SetBackdropBorderColor(Health:GetStatusBarColor())
			Power.Backdrop:SetBackdropBorderColor(Power:GetStatusBarColor())
		end)

		self:HookScript("OnLeave", function(self)
			Health.Backdrop:SetBackdropBorderColor(unpack(C["General"]["BorderColor"]))
			Power.Backdrop:SetBackdropBorderColor(unpack(C["General"]["BorderColor"]))
		end)

		if C["MaxUI Layout"]["Heallayout"] == true and C["MaxUI Layout"]["DPSlayout"] == false or 
		C["MaxUI Layout"]["DOUBLECenterBar"] == true and C["MaxUI Layout"]["Meleelayout"] == true or
		C["MaxUI Layout"]["SINGLECenterBar"] == true and C["MaxUI Layout"]["Meleelayout"] == true 
		then
			TOTVertAnchorLine:Point("RIGHT", self, "LEFT", 0, 0)
			TOTHPLine:Point("TOPLEFT", TOTVertAnchorLine, "TOPLEFT", 0, 0)
			TOTPowerLine:Point("BOTTOMLEFT", TOTVertAnchorLine, "BOTTOMLEFT", 0, 0)
		end
	end
end
hooksecurefunc(UnitFrames, "TargetOfTarget", TargetOfTarget)