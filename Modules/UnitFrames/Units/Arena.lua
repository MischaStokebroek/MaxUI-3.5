------------------------------------------------------------------------------------------
-- MaxUI 3 T16 - WoD 6.0 -- version 07-05-2016
------------------------------------------------------------------------------------------

-- setting up ARENA FRAMES.

------------------------------------------------------------------------------------------
-- LOCALS/FUNCTIONS/...
------------------------------------------------------------------------------------------

local T, C, L = Tukui:unpack()

local UnitFrames = T.UnitFrames
local Noop = function() end

UnitFrames.UpdateBuffsHeaderPosition = Noop
UnitFrames.UpdateDebuffsHeaderPosition = Noop
UnitFrames.UpdatePriestClassBars = Noop
UnitFrames.UpdateMageClassBars = Noop

------------------------------------------------------------------------------------------
-- Arena frames (self)
------------------------------------------------------------------------------------------

local function CreateUnits()
	local Arena = UnitFrames.Units.Arena

	if (C.UnitFrames.Arena) then
		for i = 1, 5 do
			if (i == 1) then
				Arena[i]:ClearAllPoints()
				Arena[i]:SetPoint("BOTTOMRIGHT", RIGHTChatline, "TOP", -60, 280)
			else	
				Arena[i]:SetPoint("BOTTOM", Arena[i-1], "TOP", 0, 49)              
			end
		end
	end
	
	if C["MaxUI Media"]["MaxUIUF"] == true then
		if (C.UnitFrames.Arena) then
			for i = 1, 5 do
				if (i == 1) then
					Arena[i]:ClearAllPoints()
					Arena[i]:SetPoint("BOTTOMRIGHT", RIGHTChatline, "TOP", -60, 280)
				else	
					Arena[i]:SetPoint("BOTTOM", Arena[i-1], "TOP", 0, 49)              
				end
			Arena[i]:SetBackdrop(nil)
			Arena[i]:Height(44)
			Arena[i].Shadow:Hide()
			end
		end
	end
end
hooksecurefunc(UnitFrames, "CreateUnits", CreateUnits)

------------------------------------------------------------------------------------------
-- Arena frames (bars)
------------------------------------------------------------------------------------------
local function Arena(self)
	local Health = self.Health
	local Power = self.Power
	local Castbar = self.Castbar
	local Debuffs = self.Debuffs
	local SpecIcon = self.PVPSpecIcon
	local Trinket = self.Trinket
	local Name = self.Name
	local Panel = self.Panel
	local RaidIcon = self.RaidIcon
	local thickness = 1

	if C["MaxUI Media"]["MaxUIUF"] == true then
		-- vertical anchor line
		local AVertAnchorLine = CreateFrame("Frame", "AVertAnchorLine", self)
		AVertAnchorLine:SetTemplate()
		AVertAnchorLine:Size(thickness, 28)
		AVertAnchorLine:Point("RIGHT", self, "LEFT", 0, 0)
		AVertAnchorLine:SetFrameLevel(2)
		AVertAnchorLine:SetFrameStrata("BACKGROUND")
		AVertAnchorLine:SetAlpha(1)
		AVertAnchorLine:CreateShadow("Default")

		-- HP line
		local AHPLine = CreateFrame("Frame", "AHPLine", AVertAnchorLine)
		AHPLine:SetTemplate()
		AHPLine:Size(200, thickness)
		AHPLine:Point("TOPLEFT", AVertAnchorLine, "TOPLEFT", 0, 0)
		AHPLine:SetFrameLevel(2)
		AHPLine:SetFrameStrata("BACKGROUND")
		AHPLine:SetAlpha(1)
		AHPLine:CreateShadow("Default")
		
		-- power line
		local APowerLine = CreateFrame("Frame", "APowerLine", AVertAnchorLine)
		APowerLine:SetTemplate()
		APowerLine:Size(190, thickness)
		APowerLine:Point("BOTTOMLEFT", AVertAnchorLine, "BOTTOMLEFT", 0, 0)
		APowerLine:SetFrameLevel(2)
		APowerLine:SetFrameStrata("BACKGROUND")
		APowerLine:SetAlpha(1)
		APowerLine:CreateShadow("Default")

		-- health
		Health:ClearAllPoints()
		Health:CreateBackdrop("Transparent")
		Health:SetHeight(20)
		Health:SetWidth(170)
		Health:SetPoint("LEFT", AHPLine, "LEFT", 8, 0)

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
		Power:SetPoint("LEFT", APowerLine, "LEFT", 8, 0)
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

		-- highlighting unit
		self:HookScript("OnEnter", function(self)
			Health.Backdrop:SetBackdropBorderColor(Health:GetStatusBarColor())
			Power.Backdrop:SetBackdropBorderColor(Power:GetStatusBarColor())
		end)

		self:HookScript("OnLeave", function(self)
			Health.Backdrop:SetBackdropBorderColor(unpack(C["General"]["BorderColor"]))
			Power.Backdrop:SetBackdropBorderColor(unpack(C["General"]["BorderColor"]))
		end)
		
		-- raid icon
		RaidIcon:ClearAllPoints()
		RaidIcon:Size(20)
		RaidIcon:Point("TOP", Health, 0, 24)	
		
		-- spec icon (to be done)	
		SpecIcon:Size(24)
		SpecIcon:ClearAllPoints()
		SpecIcon:SetPoint("BOTTOMRIGHT", Health, "TOPRIGHT", 0, 8)
		SpecIcon:CreateShadow("Default")
		
		-- trinket (to be done)	
		Trinket:Size(24)
		Trinket:ClearAllPoints()
		Trinket:SetPoint("LEFT", Power, "RIGHT",5, 0)
		Trinket:CreateShadow("Default")

		-- buffs and debuffs
		if (C.UnitFrames.ArenaAuras) then
			Debuffs:Width(200)
			Debuffs:Height(28)
			Debuffs:ClearAllPoints()
			Debuffs:SetPoint("RIGHT", AVertAnchorLine, "LEFT", -4, 0)
			
			Debuffs.size = 28
			Debuffs.spacing = 3
			Debuffs.num = 3
			Debuffs.initialAnchor = "RIGHT"
			Debuffs["growth-x"] = "LEFT"
		end
	end
end
hooksecurefunc(UnitFrames, "Arena", Arena)