------------------------------------------------------------------------------------------
-- MaxUI 3.50 TukUI 17 - LEGION 7.0 -- version: 20-07-2016
------------------------------------------------------------------------------------------

--setting up BOSS FRAMES.

-- to do alternative power bar on boss frames

------------------------------------------------------------------------------------------
-- LOCALS/FUNCTIONS/...
------------------------------------------------------------------------------------------

local T, C, L = Tukui:unpack()

local UnitFrames = T.UnitFrames
local Noop = function() end

------------------------------------------------------------------------------------------
-- Boss frames - position and size
------------------------------------------------------------------------------------------


local function CreateUnits()
	local Boss = UnitFrames.Units.Boss
	
	for i = 1, 5 do
		if (i == 1) then
			Boss[i]:ClearAllPoints()
			Boss[i]:SetPoint("BOTTOMRIGHT", RIGHTChatline, "TOP", -60, 280)
		else
			Boss[i]:SetPoint("BOTTOM", Boss[i-1], "TOP", 0, 49)             
		end
	end
	
	if C["MaxUI Media"]["MaxUIUF"] == true then
	
		for i = 1, 5 do
			if (i == 1) then
				Boss[i]:ClearAllPoints()
				Boss[i]:SetPoint("BOTTOMRIGHT", RIGHTChatline, "TOP", -60, 280)
			else
				Boss[i]:SetPoint("BOTTOM", Boss[i-1], "TOP", 0, 49)             
			end
			Boss[i]:SetBackdrop(nil)
			Boss[i]:Height(44)
			Boss[i].Shadow:Hide()
		end
	end
end
hooksecurefunc(UnitFrames, "CreateUnits", CreateUnits)

------------------------------------------------------------------------------------------
-- BOSS Frames -- MaxUI UF
------------------------------------------------------------------------------------------
local function Boss(self)
	local Health = self.Health
	local Power = self.Power
	local Castbar = self.Castbar
	local Buffs = self.Buffs
	local Debuffs = self.Debuffs
	local AltPower = self.AltPowerBar
	local Name = self.Name
	local RaidIcon = self.RaidIcon
	local thickness = 1

	if C["MaxUI Media"]["MaxUIUF"] == true then
	
		-- vertical anchor line
		local BVertAnchorLine = CreateFrame("Frame", "BVertAnchorLine", self)
		BVertAnchorLine:SetTemplate()
		BVertAnchorLine:Size(thickness, 28)
		BVertAnchorLine:Point("RIGHT", self, "LEFT", 0, 0)
		BVertAnchorLine:SetFrameLevel(2)
		BVertAnchorLine:SetFrameStrata("BACKGROUND")
		BVertAnchorLine:SetAlpha(1)
		BVertAnchorLine:CreateShadow("Default")

		-- HP line
		local BHPLine = CreateFrame("Frame", "BHPLine", BVertAnchorLine)
		BHPLine:SetTemplate()
		BHPLine:Size(200, thickness)
		BHPLine:Point("TOPLEFT", BVertAnchorLine, "TOPLEFT", 0, 0)
		BHPLine:SetFrameLevel(2)
		BHPLine:SetFrameStrata("BACKGROUND")
		BHPLine:SetAlpha(1)
		BHPLine:CreateShadow("Default")
	
		-- power line
		local BPowerLine = CreateFrame("Frame", "BPowerLine", BVertAnchorLine)
		BPowerLine:SetTemplate()
		BPowerLine:Size(190, thickness)
		BPowerLine:Point("BOTTOMLEFT", BVertAnchorLine, "BOTTOMLEFT", 0, 0)
		BPowerLine:SetFrameLevel(2)
		BPowerLine:SetFrameStrata("BACKGROUND")
		BPowerLine:SetAlpha(1)
		BPowerLine:CreateShadow("Default")

		-- health
		Health:ClearAllPoints()
		Health:CreateBackdrop("Transparent")
		Health:SetHeight(20)
		Health:SetWidth(170)
		Health:SetPoint("LEFT", BHPLine, "LEFT", 8, 0)

		Health:SetFrameLevel(3)
		Health.Backdrop:SetFrameLevel(3)
		Health.Backdrop:CreateShadow("Default")
		
		Health.Value:ClearAllPoints()
		Health.Value:SetPoint("LEFT", Health, "LEFT", 2, 0)
		if C["MaxUI Media"]["Font"] == "Caps" then
			Health.Value:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\caps.ttf", 14, "OUTLINE")
		elseif C["MaxUI Media"]["Font"] == "Comic" then
			Health.Value:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\comic.ttf", 14, "OUTLINE")
		elseif C["MaxUI Media"]["Font"] == "MaxUI" then
			Health.Value:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\MaxUI.ttf", 14, "OUTLINE")
		else	
			Health.Value:SetFont(C["Medias"].Font, 14, "OUTLINE")
		end
	
		if C.UnitFrames.DarkTheme == true then
			Health.Background:SetVertexColor(.6, .2, .2, 1)
		end

		-- HPpercentage tag
		local HPpercentage = Health:CreateFontString(nil, "OVERLAY")
		HPpercentage:Point("LEFT", Health, "RIGHT", 8, 0)
		HPpercentage:SetAlpha(1)
		HPpercentage:SetJustifyH("LEFT")
		if C["MaxUI Media"]["Font"] == "Caps" then
			HPpercentage:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\caps.ttf", 14, "OUTLINE")
		elseif C["MaxUI Media"]["Font"] == "Comic" then
			HPpercentage:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\comic.ttf", 14, "OUTLINE")
		elseif C["MaxUI Media"]["Font"] == "MaxUI" then
			HPpercentage:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\MaxUI.ttf", 14, "OUTLINE")
		else	
			HPpercentage:SetFont(C["Medias"].Font, 14, "OUTLINE")
		end
		self:Tag(HPpercentage, "[perhp]%")

		-- power
		Power:ClearAllPoints()
		Power:SetPoint("LEFT", BPowerLine, "LEFT", 8, 0)
		Power:CreateBackdrop("Default")
		Power:Height(12)
		Power:Width(160)
		Power:SetFrameLevel(3)
		Power:SetFrameStrata("BACKGROUND")
		Power.Background:SetTexture(.1, .1, .1, .2)
		Power.Backdrop:CreateShadow("Default")
		Power.Backdrop:SetFrameLevel(3)

		Power.Value:ClearAllPoints()
		Power.Value:SetParent(Health)
		Power.Value:SetPoint("LEFT", Power, "LEFT", 4, 0)

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
			Castbar.Text:SetPoint("LEFT", Castbar, "LEFT", 4, 0)
		end

		-- Name
		Name:ClearAllPoints()
		Name:Point("BOTTOMLEFT", Health, "TOPLEFT", 0, 5)

		-- buffs and debuffs
		if (C.UnitFrames.FocusAuras) then
			Buffs:Width(200)
			Buffs:Height(20)
			Buffs:ClearAllPoints()
			Buffs:SetPoint("LEFT", Power, "RIGHT",20, 0)
			
			Buffs.size = 22
			Buffs.spacing = 3
			Buffs.num = 3
			Buffs.initialAnchor = "LEFT"
			Buffs["growth-x"] = "RIGHT"
			
			Debuffs:Width(200)
			Debuffs:Height(8)
			Debuffs:ClearAllPoints()
			Debuffs:SetPoint("RIGHT", BVertAnchorLine, "LEFT", -8, 0)
			
			Debuffs.size = 28
			Debuffs.spacing = 3
			Debuffs.num = 3
			Debuffs.initialAnchor = "RIGHT"
			Debuffs["growth-x"] = "LEFT"
		end
	
		-- AltPower
		AltPower:Width(160)
		AltPower:Height(4)
		AltPower:ClearAllPoints()
		AltPower:SetPoint("TOP", Power, "BOTTOM", 0, -8)
		AltPower:SetFrameLevel(5)
		AltPower:SetFrameStrata("HIGH")
		AltPower:CreateBackdrop("Transparent")
		AltPower:CreateShadow()
	
		-- raid icon
		RaidIcon:ClearAllPoints()
		RaidIcon:Size(20)
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
	end
end
hooksecurefunc(UnitFrames, "Boss", Boss)