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
-- Target of Focus frame
------------------------------------------------------------------------------------------
local function CreateUnits()
	local focustarget = UnitFrames.Units.FocusTarget
	local Focus = UnitFrames.Units.Focus

	if C["MaxUI Media"]["MaxUIUF"] == true then
		focustarget:Size(160, 60)
		focustarget:ClearAllPoints()
		focustarget:Point("LEFT", Focus, "RIGHT", 10, 0)
		focustarget:SetBackdrop(nil)
		focustarget.Shadow:Hide()
	end
end
hooksecurefunc(UnitFrames, "CreateUnits", CreateUnits)

------------------------------------------------------------------------------------------
-- Target of Focus frame - MAXUI UF Style
------------------------------------------------------------------------------------------
local function FocusTarget(self)
	local Health = self.Health
	local Power = self.Power
	local Castbar = self.Castbar
	local Buffs = self.Buffs
	local Debuffs = self.Debuffs
	local Name = self.Name
	local RaidIcon = self.RaidIcon
	local Font = T.GetFont(C["MaxUI Media"]["Font"])
	local thickness = 1

	if C["MaxUI Media"]["MaxUIUF"] == true then

		-- vertical anchor line
		local FTVertAnchorLine = CreateFrame("Frame", "FTVertAnchorLine", self)
		FTVertAnchorLine:SetTemplate()
		FTVertAnchorLine:Size(thickness, 28)
		FTVertAnchorLine:Point("RIGHT", self, "LEFT", 0, 0)
		FTVertAnchorLine:SetFrameLevel(2)
		FTVertAnchorLine:SetFrameStrata("BACKGROUND")
		FTVertAnchorLine:SetAlpha(1)
		FTVertAnchorLine:CreateShadow("Default")

		-- HP line
		local FTHPLine = CreateFrame("Frame", "FTHPLine", FTVertAnchorLine)
		FTHPLine:SetTemplate()
		FTHPLine:Size(160, thickness)
		FTHPLine:Point("TOPLEFT", FTVertAnchorLine, "TOPLEFT", 0, 0)
		FTHPLine:SetFrameLevel(2)
		FTHPLine:SetFrameStrata("BACKGROUND")
		FTHPLine:SetAlpha(1)
		FTHPLine:CreateShadow("Default")
	
		-- power line
		local FTPowerLine = CreateFrame("Frame", "FTPowerLine", FTVertAnchorLine)
		FTPowerLine:SetTemplate()
		FTPowerLine:Size(150, thickness)
		FTPowerLine:Point("BOTTOMLEFT", FTVertAnchorLine, "BOTTOMLEFT", 0, 0)
		FTPowerLine:SetFrameLevel(2)
		FTPowerLine:SetFrameStrata("BACKGROUND")
		FTPowerLine:SetAlpha(1)
		FTPowerLine:CreateShadow("Default")

		-- health
		Health:ClearAllPoints()
		Health:CreateBackdrop("Transparent")
		Health:SetHeight(20)
		Health:SetWidth(140)
		Health:SetPoint("LEFT", FTHPLine, "LEFT", 8, 0)

		Health:SetFrameLevel(3)
		Health.Backdrop:SetFrameLevel(3)
		Health.Backdrop:CreateShadow("Default")
	
		Health.Value:ClearAllPoints()
		Health.Value:SetPoint("LEFT", Health, "LEFT", 2, 0)
		--Health.Value:SetFont(T["Medias"]["UnitFramesFont"], 14, "OUTLINE")
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
		Power:SetPoint("LEFT", FTPowerLine, "LEFT", 8, 0)
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
		Power.Value:SetPoint("LEFT", Power, "LEFT", 4, 0)

		-- name focus target
		Name:ClearAllPoints()
		Name:Point("BOTTOMLEFT", Health, "TOPLEFT", 0, 5)
		
		-- castbar	
		if C.UnitFrames.CastBar == true then
			Castbar:CreateBackdrop("Default")
			Castbar:SetBackdrop(nil)
			Castbar:SetStatusBarTexture(T.GetTexture(C.UnitFrames.HealthTexture))
			Castbar.Backdrop:CreateShadow("Default")
	
			if C.UnitFrames.CastBarIcon == true then
				Castbar:Size(Power:GetWidth(), Power:GetHeight())
				Castbar:ClearAllPoints()
				Castbar:SetPoint("TOPLEFT", Power, "TOPLEFT", 0, 0)
				Castbar.Button:Size(12)
				Castbar.Button:SetBackdrop(nil)
				Castbar.Button:CreateBackdrop("Default")
				Castbar.Button:ClearAllPoints()
				Castbar.Button:SetPoint("LEFT", Castbar, "RIGHT", 8, 0)
				Castbar.Button:CreateShadow("Default")
			else
				Castbar:Size(Power:GetWidth(), Power:GetHeight())
				Castbar:ClearAllPoints()
				Castbar:SetPoint("TOPLEFT", Power, "TOPLEFT", 0, 0)
			end
	
			Castbar.Time:ClearAllPoints()
			Castbar.Time:SetPoint("RIGHT", Castbar, "RIGHT", -4, 0)
	
			Castbar.Text:ClearAllPoints()
			Castbar.Text:SetTextColor(0.84, 0.75, 0.65)
			Castbar.Text:SetWidth(250)
			Castbar.Text:SetJustifyH("LEFT")
			if C["MaxUI Layout"]["DPSlayout"] == true then
				Castbar.Text:SetPoint("LEFT", Castbar, "RIGHT", 24, 0)
			else
				Castbar.Text:SetPoint("TOPLEFT", Castbar, "BOTTOMLEFT", 0, -4)
			end
		end
		
		-- buffs and debuffs
		if (C.UnitFrames.FocusAuras) then
			Buffs:Hide()
		
			Debuffs:Width(200)
			Debuffs:Height(8)
			Debuffs:ClearAllPoints()
			Debuffs:SetPoint("LEFT", Health, "RIGHT", 20, 0)
			
			Debuffs.size = 22
			Debuffs.spacing = 3
			Debuffs.num = 3
			Debuffs.initialAnchor = "LEFT"
			Debuffs["growth-x"] = "RIGHT"
		end
	
		-- raid icon
		RaidIcon:ClearAllPoints()
		RaidIcon:Size(24)
		RaidIcon:Point("LEFT", Power, "RIGHT", 6, 0)	

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
hooksecurefunc(UnitFrames, "FocusTarget", FocusTarget)