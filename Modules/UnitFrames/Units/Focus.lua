------------------------------------------------------------------------------------------
-- MaxUI 3.50 TukUI 17 - LEGION 7.0 -- version: 17-12-2016
------------------------------------------------------------------------------------------

--setting up FOCUS FRAMES.

------------------------------------------------------------------------------------------
-- LOCALS/FUNCTIONS/...
------------------------------------------------------------------------------------------

local T, C, L = Tukui:unpack()

local UnitFrames = T.UnitFrames
local Noop = function() end

------------------------------------------------------------------------------------------
-- Focus frame
------------------------------------------------------------------------------------------
local function CreateUnits()
	local Focus = UnitFrames.Units.Focus
	
	if C["MaxUI Media"]["MaxUIUF"] == true then
		Focus:Size(160, 60)
		Focus:SetBackdrop(nil)
		Focus.Shadow:Hide()

		-- MELEE LAYOUT
		if C["MaxUI Layout"]["Heallayout"] == false and C["MaxUI Layout"]["Meleelayout"] == true then
			Focus:ClearAllPoints()
			Focus:SetPoint("BOTTOMLEFT", T.UnitFrames.Anchor, "TOPLEFT", -30, 360)
			if C["MaxUI Layout"]["DPSlayout"] == true then
				Focus:ClearAllPoints()
				Focus:SetPoint("BOTTOMRIGHT", castbarline, "TOP", -5, 20)
			end
		end

		-- HEALING LAYOUT	
		if C["MaxUI Layout"]["Heallayout"] == true and C["MaxUI Layout"]["Meleelayout"] == false then
			Focus:ClearAllPoints()
			Focus:SetPoint("BOTTOMRIGHT", castbarline, "TOP", -5, 240)
			if C["MaxUI Layout"]["DPSlayout"] == true then
				Focus:ClearAllPoints()
				Focus:SetPoint("BOTTOMRIGHT", castbarline, "TOP", -5, 10)
			end
		end
		
		-- DPS CENTER BAR LAYOUT
		if C["MaxUI Layout"]["DPSCenterBar"] == true and C["MaxUI Layout"]["Meleelayout"] == true then
			Focus:ClearAllPoints()
			Focus:SetPoint("BOTTOMLEFT", T.UnitFrames.Anchor, "BOTTOMLEFT", -100, 366)
		end
		
		-- PROTECTION CENTER BAR LAYOUT
		if C["MaxUI Layout"]["DOUBLECenterBar"] == true and C["MaxUI Layout"]["Meleelayout"] == true then
			Focus:ClearAllPoints()
			Focus:SetPoint("RIGHT", UIParent, "CENTER", -4, -360)
		end
		
	end
end
hooksecurefunc(UnitFrames, "CreateUnits", CreateUnits)

------------------------------------------------------------------------------------------
-- Focus frame - MAXUI UF
------------------------------------------------------------------------------------------
local function Focus(self)
	local Health = self.Health
	local Power = self.Power
	local Castbar = self.Castbar
	local Buffs = self.Buffs
	local Debuffs = self.Debuffs
	local Name = self.Name
	local RaidIcon = self.RaidIcon
	local thickness = 1
	
	if C["MaxUI Media"]["MaxUIUF"] == true then
		
		-- vertical anchor line
		local FVertAnchorLine = CreateFrame("Frame", "FVertAnchorLine", self)
		FVertAnchorLine:SetTemplate()
		FVertAnchorLine:Size(thickness, 28)
		FVertAnchorLine:Point("LEFT", self, "RIGHT", 0, 0)
		FVertAnchorLine:SetFrameLevel(2)
		FVertAnchorLine:SetFrameStrata("BACKGROUND")
		FVertAnchorLine:SetAlpha(1)
		FVertAnchorLine:CreateShadow("Default")

		-- HP line
		local FHPLine = CreateFrame("Frame", "FHPLine", FVertAnchorLine)
		FHPLine:SetTemplate()
		FHPLine:Size(160, thickness)
		FHPLine:Point("TOPRIGHT", FVertAnchorLine, "TOPRIGHT", 0, 0)
		FHPLine:SetFrameLevel(2)
		FHPLine:SetFrameStrata("BACKGROUND")
		FHPLine:SetAlpha(1)
		FHPLine:CreateShadow("Default")
		
		-- power line
		local FPowerLine = CreateFrame("Frame", "FPowerLine", FVertAnchorLine)
		FPowerLine:SetTemplate()
		FPowerLine:Size(150, thickness)
		FPowerLine:Point("BOTTOMRIGHT", FVertAnchorLine, "BOTTOMRIGHT", 0, 0)
		FPowerLine:SetFrameLevel(2)
		FPowerLine:SetFrameStrata("BACKGROUND")
		FPowerLine:SetAlpha(1)
		FPowerLine:CreateShadow("Default")

		-- health
		Health:ClearAllPoints()
		Health:CreateBackdrop("Transparent")
		Health:SetHeight(20)
		Health:SetWidth(140)
		Health:SetPoint("RIGHT", FHPLine, "RIGHT", -8, 0)

		Health:SetFrameLevel(3)
		Health.Backdrop:SetFrameLevel(3)
		Health.Backdrop:CreateShadow("Default")
		
		Health.Value:ClearAllPoints()
		Health.Value:SetPoint("RIGHT", Health, "RIGHT", -2, 0)
		--Health.Value:SetFont(C["Medias"]["UnitFramesFont"], 14, "OUTLINE")
		if C["MaxUI Media"]["Font"] == "Caps" then
			Health.Value:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\caps.ttf", 14, "OUTLINE")
		elseif C["MaxUI Media"]["Font"] == "Comic" then
			Health.Value:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\comic.ttf", 14, "OUTLINE")
		elseif C["MaxUI Media"]["Font"] == "MaxUI" then
			Health.Value:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\MaxUI.ttf", 14, "OUTLINE")
		else	
			Health.Value:SetFont(C["Medias"].Font, 14, "OUTLINE")
		end
		
		-- Dark theme
		if C.UnitFrames.DarkTheme == true then
			Health.Background:SetVertexColor(.6, .2, .2, 1)
		end

		-- power
		Power:ClearAllPoints()
		Power:SetPoint("RIGHT", FPowerLine, "RIGHT", -8, 0)
		Power:CreateBackdrop("Default")
		Power:Height(12)
		Power:Width(130)
		Power:SetFrameLevel(3)
		Power:SetFrameStrata("BACKGROUND")
		Power.Background:SetTexture(.1, .1, .1, .2)
		Power.Backdrop:CreateShadow("Default")
		Power.Backdrop:SetFrameLevel(3)

		Power.Value:ClearAllPoints()
		Power.Value:SetParent(Health)
		Power.Value:SetPoint("RIGHT", Power, "RIGHT", -4, 0)

		-- name focus
		Name:ClearAllPoints()
		Name:Point("BOTTOMRIGHT", Health, "TOPRIGHT", 4, 5)
		
		-- castbar
		if C.UnitFrames.CastBar == true then
			Castbar:CreateBackdrop("Default")
			Castbar:SetBackdrop(nil)
			Castbar:SetStatusBarTexture(T.GetTexture(C.UnitFrames.HealthTexture))
			Castbar.Backdrop:CreateShadow("Default")
			
			if C.UnitFrames.CastBarIcon == true then
				Castbar:Size(Power:GetWidth(), Power:GetHeight())
				Castbar:ClearAllPoints()
				Castbar:SetPoint("TOPRIGHT", Power, "TOPRIGHT", 0, 0)
				Castbar.Button:Size(12)
				Castbar.Button:SetBackdrop(nil)
				Castbar.Button:CreateBackdrop("Default")
				Castbar.Button:ClearAllPoints()
				Castbar.Button:SetPoint("RIGHT", Castbar, "LEFT", -8, 0)
				Castbar.Button:CreateShadow("Default")
			else
				Castbar:Size(Power:GetWidth(), Power:GetHeight())
				Castbar:ClearAllPoints()
				Castbar:SetPoint("RIGHT", Power, "RIGHT", -8, 0)
			end
			
			Castbar.Time:ClearAllPoints()
			Castbar.Time:SetPoint("RIGHT", Castbar, "RIGHT", -4, 0)
			
			Castbar.Text:ClearAllPoints()
			Castbar.Text:SetTextColor(0.84, 0.75, 0.65)
			Castbar.Text:SetWidth(250)
			Castbar.Text:SetJustifyH("RIGHT")
			if C["MaxUI Layout"]["DPSlayout"] == true then
				Castbar.Text:SetPoint("RIGHT", Castbar, "LEFT", -24, 0)
			else
				Castbar.Text:SetPoint("TOPRIGHT", Castbar, "BOTTOMRIGHT", 0, -4)
			end
		end

		-- buffs and debuffs
		if (C.UnitFrames.FocusAuras) then
			Buffs:Hide()
			
			Debuffs:Width(200)
			Debuffs:Height(8)
			Debuffs:ClearAllPoints()
			Debuffs:SetPoint("RIGHT", Health, "LEFT", -20, 0)
			Debuffs.size = 22
			Debuffs.spacing = 3
			Debuffs.num = 3
			Debuffs.initialAnchor = "RIGHT"
			Debuffs["growth-x"] = "LEFT"
		end
		
		-- raid icon
		RaidIcon:ClearAllPoints()
		RaidIcon:Size(24)
		RaidIcon:Point("RIGHT", Power, "LEFT", -6, 0)	

		-- highlighting unit
		self:HookScript("OnEnter", function(self)
			Health.Backdrop:SetBackdropBorderColor(Health:GetStatusBarColor())
			Power.Backdrop:SetBackdropBorderColor(Power:GetStatusBarColor())
		end)

		self:HookScript("OnLeave", function(self)
			Health.Backdrop:SetBackdropBorderColor(unpack(C["General"]["BorderColor"]))
			Power.Backdrop:SetBackdropBorderColor(unpack(C["General"]["BorderColor"]))
		end)
	end
end
hooksecurefunc(UnitFrames, "Focus", Focus)