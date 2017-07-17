------------------------------------------------------------------------------------------
-- MaxUI 3.50 TukUI 17 - LEGION 7.0 -- version: 20-07-2016
------------------------------------------------------------------------------------------

--setting up PLAYER FRAMES.

------------------------------------------------------------------------------------------
-- LOCALS/FUNCTIONS/...
------------------------------------------------------------------------------------------

local T, C, L = Tukui:unpack()
local Panels = T.Panels

local UnitFrames = T.UnitFrames
local Noop = function() end

local Size = C.ActionBars.NormalButtonSize
local PetSize = C.ActionBars.PetButtonSize
local Spacing = C.ActionBars.ButtonSpacing
local class = RAID_CLASS_COLORS[select(2, UnitClass("player"))]
local HealthTexture = T.GetTexture(C.UnitFrames.HealthTexture)

UnitFrames.UpdateBuffsHeaderPosition = Noop
UnitFrames.UpdateDebuffsHeaderPosition = Noop
UnitFrames.UpdatePriestClassBars = Noop
UnitFrames.UpdateMageClassBars = Noop

------------------------------------------------------------------------------------------
-- PLAYER FRAME
------------------------------------------------------------------------------------------
local function CreateUnits()
	local Player = UnitFrames.Units.Player

	Player:ClearAllPoints()
	Player:SetPoint("BOTTOMLEFT", T.UnitFrames.Anchor, "TOPLEFT", 10, 160)

	if C["MaxUI Media"]["MaxUIUF"] == true then
		Player:Size(270, 70)
		Player:SetBackdrop(nil)
		Player.Shadow:Hide()
		
		if (C.UnitFrames.Portrait == true and C["MaxUI Media"]["portraitonhp"] == true) or C.UnitFrames.Portrait == false then 
			Player:Size(220, 70)
		end

		-- MELEE LAYOUT
		if C["MaxUI Layout"]["Heallayout"] == false and C["MaxUI Layout"]["Meleelayout"] == true then
			Player:ClearAllPoints()
			Player:SetPoint("BOTTOMLEFT", T.UnitFrames.Anchor, "TOPLEFT", 10, 160)
			if C["MaxUI Layout"]["DPSlayout"] == true then
				Player:ClearAllPoints()
				Player:SetPoint("BOTTOMLEFT", T.UnitFrames.Anchor, "TOPLEFT", 10, 210)
			end
		end
		
		-- HEALING LAYOUT
		if C["MaxUI Layout"]["Heallayout"] == true and C["MaxUI Layout"]["Meleelayout"] == false then
			Player:ClearAllPoints()
			Player:SetPoint("BOTTOMLEFT", T.UnitFrames.Anchor, "TOPLEFT", -160, 220)
			if C["MaxUI Layout"]["DPSlayout"] == true then
				Player:ClearAllPoints()
				Player:SetPoint("BOTTOMLEFT", T.UnitFrames.Anchor, "TOPLEFT", 28, 105)
			end
			if C["MaxUI Layout"]["SINGLECenterBar"] == true then
				Player:ClearAllPoints()
				Player:SetPoint("RIGHT", UIParent, "CENTER", -194, -214)
			end
			if C["MaxUI Layout"]["DOUBLECenterBar"] == true then
				Player:ClearAllPoints()
				Player:SetPoint("RIGHT", UIParent, "CENTER", -194, -214)
			end
		end

		-- SINGLE CENTER BAR LAYOUT
		if C["MaxUI Layout"]["SINGLECenterBar"] == true and C["MaxUI Layout"]["Meleelayout"] == true then
			Player:ClearAllPoints()
			Player:SetPoint("RIGHT", UIParent, "CENTER", -72, -214)
		end

		-- DOUBLE CENTER BAR LAYOUT
		if C["MaxUI Layout"]["DOUBLECenterBar"] == true and C["MaxUI Layout"]["Meleelayout"] == true then
			Player:ClearAllPoints()
			Player:SetPoint("RIGHT", UIParent, "CENTER", -132, -214)
		end
	end
end
hooksecurefunc(UnitFrames, "CreateUnits", CreateUnits)

------------------------------------------------------------------------------------------
-- PLAYER FRAME -- MaxUI UF STYLE
------------------------------------------------------------------------------------------
local function Player(self)
	local Panel = self.Panel
	local Health = self.Health
	local Power = self.Power
	local AdditionalPower = self.AdditionalPower
	local Status = self.Status
	local CastBar = self.Castbar
	local Portrait = self.Portrait
	local CombatFeedbackText = self.CombatFeedbackText
	local RaidIcon = self.RaidIcon
	local thickness = 1
	local Combat = self.Combat
	local MasterLooter = self.MasterLooter
	local Leader = self.Leader
	local TotemBar = self.Totems
	local class = RAID_CLASS_COLORS[select(2, UnitClass("player"))]
	local ComboPoints = self.ComboPointsBar
	local DarkTheme = C["UnitFrames"].DarkTheme
	
	if C["MaxUI Media"]["MaxUIUF"] == true then

		-- vertical anchor line
		local VertAnchorLine = CreateFrame("Frame", "VertAnchorLine", self)
		VertAnchorLine:SetTemplate()
		VertAnchorLine:Size(thickness, 54)
		VertAnchorLine:Point("BOTTOMLEFT", self, "BOTTOMRIGHT", -60, 0)
		VertAnchorLine:SetFrameLevel(2)
		VertAnchorLine:SetFrameStrata("BACKGROUND")
		VertAnchorLine:SetAlpha(1)
		VertAnchorLine:CreateShadow("Default")

		if (C.UnitFrames.Portrait == true and C["MaxUI Media"]["portraitonhp"] == true) or C.UnitFrames.Portrait == false then 
			VertAnchorLine:Point("BOTTOMLEFT", self, "BOTTOMRIGHT", 0, 0)
		end
		
		-- HP line
		local HPLine = CreateFrame("Frame", "HPLine", VertAnchorLine)
		HPLine:SetTemplate()
		HPLine:Size(240, thickness)
		HPLine:Point("TOPRIGHT", VertAnchorLine, "TOPRIGHT", 0, 0)
		HPLine:SetFrameLevel(2)
		HPLine:SetFrameStrata("BACKGROUND")
		HPLine:SetAlpha(1)
		HPLine:CreateShadow("Default")
		
		local HPtext = HPLine:CreateFontString(nil, "OVERLAY")
		if C["MaxUI Media"]["Font"] == "Caps" then
			HPtext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\caps.ttf", 12, "OUTLINE")
		elseif C["MaxUI Media"]["Font"] == "Comic" then
			HPtext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\comic.ttf", 12, "OUTLINE")
		elseif C["MaxUI Media"]["Font"] == "MaxUI" then
			HPtext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\MaxUI.ttf", 12, "OUTLINE")
		else	
			HPtext:SetFont(C["Medias"].Font, 14, "OUTLINE")
		end
		HPtext:Point("LEFT", HPLine, "LEFT", 2, 0)
		HPtext:SetText("HP")

		-- power line
		local PowerLine = CreateFrame("Frame", "PowerLine", VertAnchorLine)
		PowerLine:SetTemplate()
		PowerLine:Size(210, thickness)
		PowerLine:Point("RIGHT", VertAnchorLine, "RIGHT", 0, 0)
		PowerLine:SetFrameLevel(2)
		PowerLine:SetFrameStrata("BACKGROUND")
		PowerLine:SetAlpha(1)
		PowerLine:CreateShadow("Default")

		local Powertext = PowerLine:CreateFontString(nil, "OVERLAY")
		if C["MaxUI Media"]["Font"] == "Caps" then
			Powertext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\caps.ttf", 12, "OUTLINE")
		elseif C["MaxUI Media"]["Font"] == "Comic" then
			Powertext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\comic.ttf", 12, "OUTLINE")
		elseif C["MaxUI Media"]["Font"] == "MaxUI" then
			Powertext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\MaxUI.ttf", 12, "OUTLINE")
		else	
			Powertext:SetFont(C["Medias"].Font, 14, "OUTLINE")
		end
		Powertext:Point("LEFT", PowerLine, "LEFT", 2, 0)
		Powertext:SetText("MP")
	
		-- info line
		local InfoLine = CreateFrame("Frame", "InfoLine", VertAnchorLine)
		InfoLine:SetTemplate()
		InfoLine:Size(180, thickness)
		InfoLine:Point("BOTTOMRIGHT", VertAnchorLine, "BOTTOMRIGHT", 0, 0)
		InfoLine:SetFrameLevel(2)
		InfoLine:SetFrameStrata("BACKGROUND")
		InfoLine:SetAlpha(1)
		InfoLine:CreateShadow("Default")
	
		--healthbar
		Health:ClearAllPoints()
		Health:SetPoint("RIGHT", HPLine, "RIGHT", -8, 0)
		Health:CreateBackdrop("Transparent")
		Health:SetHeight(20)
		Health:SetWidth(200)
		Health:SetFrameLevel(3)
		Health.Backdrop:SetFrameLevel(3)
		Health.Backdrop:CreateShadow("Default")
		Health.Value:ClearAllPoints()
		Health.Value:SetPoint("RIGHT", Health, "RIGHT", 0, -1)
		
		if DarkTheme then
			Health.colorTapping = false
			Health.colorDisconnected = false
			Health.colorClass = false
			Health:SetStatusBarColor(0.2, 0.2, 0.2, 1)
			Health.Background:SetVertexColor(1, 0, 0, 1)
		else
			Health.colorTapping = true
			Health.colorDisconnected = true
			Health.colorClass = true
			Health.colorReaction = true
		end
		
		-- Power bar
		Power:ClearAllPoints()
		Power:SetPoint("RIGHT", PowerLine, "RIGHT", -8, 0)
		Power:CreateBackdrop("Default")
		Power.Backdrop:CreateShadow("Default")
		Power:Height(12)
		Power:Width(170)
		Power:SetFrameLevel(3)
		Power:SetFrameStrata("BACKGROUND")
		Power.Background:SetTexture(.1, .1, .1, .2)
		Power.Backdrop:SetFrameLevel(3)
		Power.Value:ClearAllPoints()
		Power.Value:SetParent(Power)
		Power.Value:SetPoint("RIGHT", Power, "RIGHT", 0, 0)
		Power.Value:SetFont(C["Medias"].Font, 11, "OUTLINE")
		
		--additional powers
		AdditionalPower:ClearAllPoints()
		AdditionalPower:SetPoint("BOTTOM", Health, "TOP", 0, 8)
		AdditionalPower:Size(200, 9)
		AdditionalPower:CreateBackdrop("Default")
		AdditionalPower:CreateShadow("Default")
	
		-- portrait frame
		if C.UnitFrames.Portrait then
			local potraitframe = CreateFrame("Frame", "potraitframe", VertAnchorLine)
			potraitframe:SetTemplate()
			potraitframe:Size(54)
			potraitframe:Point("TOPLEFT", VertAnchorLine, "TOPRIGHT", 4, 0)
			potraitframe:SetFrameLevel(2)
			potraitframe:SetFrameStrata("BACKGROUND")
			potraitframe:CreateShadow("Default")

			Portrait:ClearAllPoints()
			Portrait:SetPoint("CENTER", potraitframe, "CENTER", 0, 0)
			Portrait:SetFrameLevel(3)
			Portrait:Size(50, 50)
			Portrait:SetAlpha(1)
			Portrait:CreateOverlay()
		
			if C["MaxUI Media"]["portraitonhp"] == true then
				potraitframe:Hide()
				Portrait:ClearAllPoints()
				Portrait:SetPoint("CENTER", Health, "CENTER", 0, 1)
				Portrait:Size(200, 19)
				Portrait.Backdrop:SetBackdrop(nil)
				Portrait:SetAlpha(.5)
			end
		end
		
		-- panel / info stats
		Panel:ClearAllPoints()
		Panel:SetPoint("TOPRIGHT", VertAnchorLine, "BOTTOMRIGHT", 58, -10)
		Panel:SetAlpha(0.0)
	
		-- reanchor castbar player.
		if C.UnitFrames.CastBar == true then
			CastBar:ClearAllPoints()
			CastBar:Size(170,12)
			CastBar:Point("RIGHT", Power, "RIGHT", 0, 0)
			CastBar:CreateBackdrop("Default")
			CastBar.Background:SetTexture(0,0,0,0)
			CastBar:SetStatusBarTexture(T.GetTexture(C.UnitFrames.HealthTexture))
			CastBar.Backdrop:CreateShadow("Default")

			CastBar.Button:Size(16)
			CastBar.Button:ClearAllPoints()
			CastBar.Button:SetPoint("RIGHT", CastBar, "LEFT", -10, 0)
			CastBar.Button:CreateShadow("Default")
			
			CastBar.Text:ClearAllPoints()
			CastBar.Text:Point("TOPRIGHT", CastBar, "BOTTOMRIGHT", 0, -30)
			CastBar.Text:SetTextColor(0.84, 0.75, 0.65)
			CastBar.Text:SetWidth(250)
			CastBar.Text:SetJustifyH("RIGHT")
			
			CastBar.Time:ClearAllPoints()
			CastBar.Time:Point("RIGHT", CastBar, "RIGHT", -4, 0)
			CastBar.Time:SetTextColor(0.84, 0.75, 0.65)
			CastBar.Time:SetJustifyH("RIGHT")
		
			-- Melee Layout, unlinked
			if C.UnitFrames.UnlinkCastBar == true and C["MaxUI Layout"]["Heallayout"] == false and C["MaxUI Layout"]["Meleelayout"] == true then
				
				CastBar:ClearAllPoints()
				CastBar:Size(230,12)
				
					if C["MaxUI Layout"]["ClassResourcesAB"] == true then		
					CastBar:Point("RIGHT", castbarline, "CENTER", -104, 0)
					else
					CastBar:Point("RIGHT", castbarline, "CENTER", -4, 0)
					end
					
				CastBar.Icon:ClearAllPoints()
				CastBar.Icon:SetPoint("RIGHT", CastBar, "LEFT", -8, 0)
				CastBar.Icon:SetSize(CastBar:GetHeight(), CastBar:GetHeight())
						
				CastBar.Button:ClearAllPoints()
				CastBar.Button:SetPoint("RIGHT", CastBar, "LEFT", -6, 0)
				CastBar.Button:CreateShadow("Default")
				
				CastBar.Text:ClearAllPoints()
				CastBar.Text:Point("BOTTOMRIGHT", CastBar, "TOPRIGHT", 0, 4)
				CastBar.Text:SetTextColor(0.84, 0.75, 0.65)
				CastBar.Text:SetWidth(250)
				CastBar.Text:SetJustifyH("RIGHT")
			end
		
			-- Healing layout Unlinked 	
			if C.UnitFrames.UnlinkCastBar == true and C["MaxUI Layout"]["Heallayout"] == true and C["MaxUI Layout"]["Meleelayout"] == false then
				CastBar:ClearAllPoints()
				CastBar:Size(344,12)
				CastBar:Point("CENTER", castbarline, "CENTER", 10, 0)
				
				CastBar.Icon:ClearAllPoints()
				CastBar.Icon:SetPoint("RIGHT", CastBar, "LEFT", -8, 0)
				CastBar.Icon:SetSize(CastBar:GetHeight(), CastBar:GetHeight())
					
				CastBar.Button:ClearAllPoints()
				CastBar.Button:SetPoint("RIGHT", CastBar, "LEFT", -6, 0)
				CastBar.Button:CreateShadow("Default")
				
				CastBar.Text:ClearAllPoints()
				CastBar.Text:Point("LEFT", CastBar, "LEFT", 4, 0)
				CastBar.Text:SetTextColor(0.84, 0.75, 0.65)
				CastBar.Text:SetWidth(250)
				CastBar.Text:SetJustifyH("LEFT")
			
				if C["MaxUI Layout"]["DOUBLECenterBar"] == true then			
					CastBar:ClearAllPoints()
					CastBar:Size(334, 12)
					CastBar:Point("CENTER", castbarline, "CENTER", 10, 68)
				end	
			end
		end
	
		-- name level and addition info
		local Playername = InfoLine:CreateFontString(nil, "OVERLAY")
		Playername:Point("RIGHT", InfoLine, "RIGHT", 0, 4)
		Playername:SetAlpha(1)
		Playername:SetJustifyH("RIGHT")
		if C["MaxUI Media"]["Font"] == "Caps" then
			Playername:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\caps.ttf", 20, "OUTLINE")
		elseif C["MaxUI Media"]["Font"] == "Comic" then
			Playername:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\comic.ttf", 20, "OUTLINE")
		elseif C["MaxUI Media"]["Font"] == "MaxUI" then
			Playername:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\MaxUI.ttf", 20, "OUTLINE")
		else	
			Playername:SetFont(C["Medias"].Font, 20, "OUTLINE")
		end
		self:Tag(Playername, "[Tukui:GetNameColor][Tukui:NameLong] |cffFFFFFF[level]|r [shortclassification]")

		-- raid icon
		RaidIcon:ClearAllPoints()
		RaidIcon:Size(32)
		RaidIcon:Point("RIGHT", Playername, "LEFT", -5, 0)
				
		-- highlighting unit
		self:HookScript("OnEnter", function(self)
			Health.Backdrop:SetBackdropBorderColor(Health:GetStatusBarColor())
			Power.Backdrop:SetBackdropBorderColor(Power:GetStatusBarColor())
			if C.UnitFrames.Portrait then
				potraitframe:SetBackdropBorderColor(Health:GetStatusBarColor())
			end	
		end)

		self:HookScript("OnLeave", function(self)
			Health.Backdrop:SetBackdropBorderColor(unpack(C["General"]["BorderColor"]))
			Power.Backdrop:SetBackdropBorderColor(unpack(C["General"]["BorderColor"]))
			if C.UnitFrames.Portrait then
				potraitframe:SetBackdropBorderColor(unpack(C["General"]["BorderColor"]))
			end
		end)

		-- Combo Bar on Player
		if (C.UnitFrames.ComboBar) == true then

			ComboPoints:Size(190, 1)
			ComboPoints:ClearAllPoints()
			ComboPoints:SetFrameLevel(15)
			
			if C["MaxUI Layout"]["ClassResourcesAB"] == true and C["MaxUI Layout"]["Heallayout"] == false then		
				ComboPoints:SetPoint("CENTER", castbarline, "CENTER", 0, 0)
			else
				ComboPoints:SetPoint("BOTTOM", Health, "TOP", 0, 12)
			end
			
			for i = 1, 8 do
				ComboPoints[i]:CreateBackdrop("Default")
				ComboPoints[i]:Height(12)

				if i == 1 then
					ComboPoints[i]:Point("LEFT", ComboPoints, "LEFT", 6, 0)
					ComboPoints[i]:Width(140 / 8 + 2)

					ComboPoints[i].Anticipation = ComboPoints[i]:GetWidth()
					ComboPoints[i].Deeper = 140 / 6
					ComboPoints[i].None = 140 / 5
				else
					ComboPoints[i]:Point("LEFT", ComboPoints[i-1], "RIGHT", 10, 0)
					ComboPoints[i]:Width(140 / 8 - 1)
					
					ComboPoints[i].Anticipation = ComboPoints[i]:GetWidth()
					ComboPoints[i].Deeper = 140 / 6 - 1
					ComboPoints[i].None = 140 / 5 - 1
				end
			end
		
			ComboPoints:SetScript("OnShow", function(self)
				UnitFrames.UpdateShadow(self, 12)
				UnitFrames.UpdateBuffsHeaderPosition(self, 14)
			end)

			ComboPoints:SetScript("OnHide", function(self)
				UnitFrames.UpdateShadow(self, 4)
				UnitFrames.UpdateBuffsHeaderPosition(self, 4)
			end)
			self.ComboPointsBar = ComboPoints
		end

-- isnt working correctly
		-- icons on player frame
		Status:ClearAllPoints()
		Status:Point("CENTER", Health, "CENTER", 0, 0)
		Status:SetTextColor(0.69, 0.31, 0.31)
		Status:Show()
			
		Combat:ClearAllPoints()
		Combat:Point("LEFT", Health, "LEFT", 4, 0)
		Combat:Size(24)
		Combat:SetFrameLevel(4)	
		
		self.Combat = Combat
		self.Status = Status
		self.Leader = Leader
	end
end
hooksecurefunc(UnitFrames, "Player", Player)