------------------------------------------------------------------------------------------
-- MaxUI 3.50 TukUI 17 - LEGION 7.0 -- version: 20-07-2016
------------------------------------------------------------------------------------------

--setting up TARGET FRAMES.

------------------------------------------------------------------------------------------
-- LOCALS/FUNCTIONS/...
------------------------------------------------------------------------------------------

local T, C, L = Tukui:unpack()
local Panels = T.Panels

local UnitFrames = T.UnitFrames
local Noop = function() end

local Size = C.ActionBars.NormalButtonSize
local Spacing = C.ActionBars.ButtonSpacing

UnitFrames.UpdateBuffsHeaderPosition = Noop
UnitFrames.UpdateDebuffsHeaderPosition = Noop
UnitFrames.UpdatePriestClassBars = Noop
UnitFrames.UpdateMageClassBars = Noop

------------------------------------------------------------------------------------------
-- TARGET FRAME
------------------------------------------------------------------------------------------

local function CreateUnits()
	local Target = UnitFrames.Units.Target
	
	if C["MaxUI Media"]["MaxUIUF"] == true then
		Target:Size(270, 70)
		Target:SetBackdrop(nil)
		Target.Shadow:Hide()
		if (C.UnitFrames.Portrait == true and C["MaxUI Media"]["portraitonhp"] == true) or C.UnitFrames.Portrait == false then 
			Target:Size(220, 70)
		end
		
		-- MELEE LAYOUT	
		if C["MaxUI Layout"]["Heallayout"] == false and C["MaxUI Layout"]["Meleelayout"] == true then
			Target:ClearAllPoints()
			Target:SetPoint("BOTTOMRIGHT", T.UnitFrames.Anchor, "TOPRIGHT", -10, 160)
			if C["MaxUI Layout"]["DPSlayout"] == true then
				Target:ClearAllPoints()
				Target:SetPoint("BOTTOMRIGHT", T.UnitFrames.Anchor, "TOPRIGHT", -10, 210)
			end
		end
	
		-- HEALING LAYOUT	
		if C["MaxUI Layout"]["Heallayout"] == true and C["MaxUI Layout"]["Meleelayout"] == false then
			Target:ClearAllPoints()
			Target:SetPoint("BOTTOMRIGHT", T.UnitFrames.Anchor, "TOPRIGHT", 160, 220)
			if C["MaxUI Layout"]["DPSlayout"] == true then
				Target:ClearAllPoints()
				Target:SetPoint("BOTTOMRIGHT", T.UnitFrames.Anchor, "TOPRIGHT", -28, 105)
			end
			if C["MaxUI Layout"]["SINGLECenterBar"] == true then
				Target:ClearAllPoints()
				Target:SetPoint("LEFT", UIParent, "CENTER", 194, -214)
			end
			if C["MaxUI Layout"]["DOUBLECenterBar"] == true then
				Target:ClearAllPoints()
				Target:SetPoint("LEFT", UIParent, "CENTER", 194, -214)
			end
			
			
		end
		
		-- SINGLE CENTER BAR LAYOUT
		if C["MaxUI Layout"]["SINGLECenterBar"] == true and C["MaxUI Layout"]["Meleelayout"] == true then
			Target:ClearAllPoints()
			Target:SetPoint("LEFT", UIParent, "CENTER", 72, -214)
		end

		-- DOUBLE CENTER BAR LAYOUT
		if C["MaxUI Layout"]["DOUBLECenterBar"] == true and C["MaxUI Layout"]["Meleelayout"] == true then
			Target:ClearAllPoints()
			Target:SetPoint("LEFT", UIParent, "CENTER", 132, -214)
		end
		
	end
end
hooksecurefunc(UnitFrames, "CreateUnits", CreateUnits)

------------------------------------------------------------------------------------------
-- TARGET FRAME - MAXUI UF STYLE
------------------------------------------------------------------------------------------
local function Target(self)
	local Panel = self.Panel
	local Health = self.Health
	local Power = self.Power
	local Castbar = self.Castbar
	local Name = self.Name
	local Buffs = self.Buffs
	local Debuffs = self.Debuffs
	local Portrait = self.Portrait
	local CombatFeedbackText = self.CombatFeedbackText
	local ComboPoints = self.ComboPointsBar
	local WeakenedSoul = self.WeakenedSoul
	local AltPower = self.AltPowerBar
	local RaidIcon = self.RaidIcon
	local thickness = 1

	if C["MaxUI Media"]["MaxUIUF"] == true then
	
		-- vertical anchor line
		local TVertAnchorLine = CreateFrame("Frame", "TVertAnchorLine", self)
		TVertAnchorLine:SetTemplate()
		TVertAnchorLine:Size(thickness, 54)
		TVertAnchorLine:Point("BOTTOMRIGHT", self, "BOTTOMLEFT", 60, 0)
		TVertAnchorLine:SetFrameLevel(2)
		TVertAnchorLine:SetFrameStrata("BACKGROUND")
		TVertAnchorLine:SetAlpha(1)
		TVertAnchorLine:CreateShadow("Default")

		if (C.UnitFrames.Portrait == true and C["MaxUI Media"]["portraitonhp"] == true) or C.UnitFrames.Portrait == false then 
			TVertAnchorLine:Point("BOTTOMRIGHT", self, "BOTTOMLEFT", 0, 0)
		end

		-- HP line
		local THPLine = CreateFrame("Frame", "THPLine", TVertAnchorLine)
		THPLine:SetTemplate()
		THPLine:Size(240, thickness)
		THPLine:Point("TOPLEFT", TVertAnchorLine, "TOPLEFT", 0, 0)
		THPLine:SetFrameLevel(2)
		THPLine:SetFrameStrata("BACKGROUND")
		THPLine:SetAlpha(1)
		THPLine:CreateShadow("Default")
			
		local THPtext = THPLine:CreateFontString(nil, "OVERLAY")
		if C["MaxUI Media"]["Font"] == "Caps" then
			THPtext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\caps.ttf", 12, "OUTLINE")
		elseif C["MaxUI Media"]["Font"] == "Comic" then
			THPtext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\comic.ttf", 12, "OUTLINE")
		elseif C["MaxUI Media"]["Font"] == "MaxUI" then
			THPtext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\MaxUI.ttf", 12, "OUTLINE")
		else	
			THPtext:SetFont(C["Medias"].Font, 12, "OUTLINE")
		end
		THPtext:Point("RIGHT", THPLine, "RIGHT", -0, 0)
		THPtext:SetText("HP")

		-- power line
		local TPowerLine = CreateFrame("Frame", "TPowerLine", TVertAnchorLine)
		TPowerLine:SetTemplate()
		TPowerLine:Size(210, thickness)
		TPowerLine:Point("LEFT", TVertAnchorLine, "LEFT", 0, 0)
		TPowerLine:SetFrameLevel(2)
		TPowerLine:SetFrameStrata("BACKGROUND")
		TPowerLine:SetAlpha(1)
		TPowerLine:CreateShadow("Default")

		local TPowertext = TPowerLine:CreateFontString(nil, "OVERLAY")
		if C["MaxUI Media"]["Font"] == "Caps" then
			TPowertext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\caps.ttf", 12, "OUTLINE")
		elseif C["MaxUI Media"]["Font"] == "Comic" then
			TPowertext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\comic.ttf", 12, "OUTLINE")
		elseif C["MaxUI Media"]["Font"] == "MaxUI" then
			TPowertext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\MaxUI.ttf", 12, "OUTLINE")
		else	
			TPowertext:SetFont(C["Medias"].Font, 12, "OUTLINE")
		end
		TPowertext:Point("RIGHT", TPowerLine, "RIGHT", -0, 0)
		TPowertext:SetText("MP")
			
		-- info line
		local TInfoLine = CreateFrame("Frame", "TInfoLine", TVertAnchorLine)
		TInfoLine:SetTemplate()
		TInfoLine:Size(180, thickness)
		TInfoLine:Point("BOTTOMLEFT", TVertAnchorLine, "BOTTOMLEFT", 0, 0)
		TInfoLine:SetFrameLevel(2)
		TInfoLine:SetFrameStrata("BACKGROUND")
		TInfoLine:SetAlpha(1)
		TInfoLine:CreateShadow("Default")
		
		--healthbar
		Health:ClearAllPoints()
		Health:SetPoint("LEFT", THPLine, "LEFT", 8, 0)
		Health:CreateBackdrop("Transparent")
		Health:SetHeight(20)
		Health:SetWidth(200)
		Health:SetFrameLevel(3)
		Health.Backdrop:SetFrameLevel(3)
		Health.Backdrop:CreateShadow("Default")
		Health.Value:ClearAllPoints()
		Health.Value:SetPoint("LEFT", Health, "LEFT", 4, -1)

		-- Power bar
		Power:ClearAllPoints()
		Power:SetPoint("LEFT", TPowerLine, "LEFT", 8, 0)
		Power:CreateBackdrop("Default")
		Power.Backdrop:CreateShadow("Default")
		Power.Backdrop:SetFrameLevel(3)
		Power:Height(12)
		Power:Width(170)
		Power:SetFrameLevel(3)
		Power:SetFrameStrata("BACKGROUND")
		Power.Background:SetTexture(.1, .1, .1, .2)
		Power.Value:ClearAllPoints()
		Power.Value:SetParent(Power)
		Power.Value:SetPoint("LEFT", Power, "LEFT", 0, -1)
		Power.Value:SetFont(C["Medias"].Font, 11, "OUTLINE")
		
		-- AltPower (boss)
		AltPower:ClearAllPoints()
		AltPower:SetPoint("BOTTOM", Health, "TOP", 0, 8)
		AltPower:CreateBackdrop("Default")
		AltPower:SetHeight(12)
		AltPower:SetWidth(200)
		AltPower:SetFrameLevel(3)
	
		-- portrait frame
		if C.UnitFrames.Portrait then
			local Tpotraitframe = CreateFrame("Frame", "Tpotraitframe", TVertAnchorLine)
			Tpotraitframe:SetTemplate()
			Tpotraitframe:Size(54)
			Tpotraitframe:Point("TOPRIGHT", TVertAnchorLine, "TOPLEFT", -4, 0)
			Tpotraitframe:SetFrameLevel(2)
			Tpotraitframe:SetFrameStrata("BACKGROUND")
			Tpotraitframe:CreateShadow("Default")
			
			Portrait:ClearAllPoints()
			Portrait:SetPoint("CENTER", Tpotraitframe, "CENTER", 0, 0)
			Portrait:SetFrameLevel(3)
			Portrait:Size(50, 50)
			Portrait:SetAlpha(1)
			Portrait:CreateOverlay()
			
			if C["MaxUI Media"]["portraitonhp"] == true then
				Tpotraitframe:Hide()
				Portrait:ClearAllPoints()
				Portrait:SetPoint("CENTER", Health, "CENTER", 0, 1)
				Portrait:Size(200, 19)
				Portrait.Backdrop:SetBackdrop(nil)
				Portrait:SetAlpha(0.5)
			end
		end

		-- panel / info stats
		Panel:ClearAllPoints()
		Panel:SetPoint("TOPLEFT", TVertAnchorLine, "BOTTOMLEFT", -58, -8)
		Panel:SetAlpha(0.0)

		-- reanchor castbar target
		if C.UnitFrames.CastBar == true then
			Castbar:ClearAllPoints()
			Castbar:SetPoint("LEFT", Power, "LEFT", 0, 0)
			Castbar:Size(170, 12)
			Castbar:CreateBackdrop("Default")
			Castbar.Background:SetTexture(0,0,0,0)
			Castbar:SetStatusBarTexture(T.GetTexture(C.UnitFrames.HealthTexture))
			Castbar.Backdrop:CreateShadow("Default")
				
			Castbar.Button:Size(16)
			Castbar.Button:ClearAllPoints()
			Castbar.Button:SetPoint("LEFT", Castbar, "RIGHT", 10, 0)
			Castbar.Button:CreateShadow("Default")
			
			Castbar.Text:ClearAllPoints()
			Castbar.Text:Point("BOTTOMLEFT", Castbar, "TOPLEFT", -4, -56)
			Castbar.Text:SetTextColor(0.84, 0.75, 0.65)
			Castbar.Text:SetWidth(250)
			Castbar.Text:SetJustifyH("LEFT")
			
			Castbar.Time:ClearAllPoints()
			Castbar.Time:Point("RIGHT", Castbar, "RIGHT", -4, 0)
			Castbar.Time:SetTextColor(0.84, 0.75, 0.65)
			Castbar.Time:SetJustifyH("RIGHT")

			-- Melee Layout, unlinked
			if C.UnitFrames.UnlinkCastBar == true and C["MaxUI Layout"]["Heallayout"] == false and C["MaxUI Layout"]["Meleelayout"] == true then
				Castbar:ClearAllPoints()
				Castbar:Size(230, 12)

				if C["MaxUI Layout"]["ClassResourcesAB"] == true then		
					Castbar:Point("LEFT", castbarline, "CENTER", 104, 0)
				else
					Castbar:Point("LEFT", castbarline, "CENTER", 4, 0)
				end
		
				Castbar.Icon:ClearAllPoints()
				Castbar.Icon:SetPoint("LEFT", Castbar, "RIGHT", 8, 0)
				Castbar.Icon:SetSize(Castbar:GetHeight(), Castbar:GetHeight())
				
				Castbar.Button:ClearAllPoints()
				Castbar.Button:SetPoint("LEFT", Castbar, "RIGHT", 6, 0)
				Castbar.Button:CreateShadow("Default")
				
				Castbar.Text:ClearAllPoints()
				Castbar.Text:Point("BOTTOMLEFT", Castbar, "TOPLEFT", 0, 4)
				Castbar.Text:SetTextColor(0.84, 0.75, 0.65)
				Castbar.Text:SetWidth(250)
				Castbar.Text:SetJustifyH("LEFT")
			end
		
			-- Healing layout Unlinked
			if C.UnitFrames.UnlinkCastBar == true and C["MaxUI Layout"]["Heallayout"] == true and C["MaxUI Layout"]["Meleelayout"] == false then
				Castbar:ClearAllPoints()
				Castbar:SetPoint("LEFT", Power, "LEFT", 0, 0)
				Castbar:Size(170, 12)
				
				Castbar.Icon:ClearAllPoints()
				Castbar.Icon:SetPoint("LEFT", Castbar, "RIGHT", 10, 0)
				Castbar.Icon:SetSize(Castbar:GetHeight(), Castbar:GetHeight())
					
				Castbar.Button:ClearAllPoints()
				Castbar.Button:SetPoint("LEFT", Castbar, "RIGHT", 8, 0)
				Castbar.Button:CreateShadow("Default")
				
				Castbar.Text:ClearAllPoints()
				Castbar.Text:Point("BOTTOMLEFT", Castbar, "TOPLEFT", -4, -56)
				Castbar.Text:SetTextColor(0.84, 0.75, 0.65)
				Castbar.Text:SetWidth(250)
				Castbar.Text:SetJustifyH("LEFT")
			end
		end
	
		-- name level and addition info
		local Targetname = Health:CreateFontString(nil, "OVERLAY")
		Targetname:Point("LEFT", TInfoLine, "LEFT", 4, 4)
		Targetname:SetAlpha(1)
		Targetname:SetJustifyH("RIGHT")
		if C["MaxUI Media"]["Font"] == "Caps" then
			Targetname:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\caps.ttf", 20, "OUTLINE")
		elseif C["MaxUI Media"]["Font"] == "Comic" then
			Targetname:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\comic.ttf", 20, "OUTLINE")
		elseif C["MaxUI Media"]["Font"] == "MaxUI" then
			Targetname:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\MaxUI.ttf", 20, "OUTLINE")
		else	
			Targetname:SetFont(C["Medias"].Font, 20, "OUTLINE")
		end
		self:Tag(Targetname, "[Tukui:GetNameColor][Tukui:NameMedium] [Tukui:DiffColor][level] [classification]") 

		-- highlighting unit
		self:HookScript("OnEnter", function(self)
			Health.Backdrop:SetBackdropBorderColor(Health:GetStatusBarColor())
			Power.Backdrop:SetBackdropBorderColor(Power:GetStatusBarColor())
			if C.UnitFrames.Portrait then
				Tpotraitframe:SetBackdropBorderColor(Health:GetStatusBarColor())
			end	
		end)

		self:HookScript("OnLeave", function(self)
			Health.Backdrop:SetBackdropBorderColor(unpack(C["General"]["BorderColor"]))
			Power.Backdrop:SetBackdropBorderColor(unpack(C["General"]["BorderColor"]))
			if C.UnitFrames.Portrait then
				Tpotraitframe:SetBackdropBorderColor(unpack(C["General"]["BorderColor"]))
			end
		end)
	
		-- raid icon
		RaidIcon:ClearAllPoints()
		RaidIcon:Size(32)
		RaidIcon:Point("LEFT", Targetname, "RIGHT", 5, 0)

		-- combat feedback text
		--CombatFeedbackText:ClearAllPoints()
		--CombatFeedbackText:Point("CENTER", 30, -1)
		
		-- Buffs and debuffs
		Buffs:ClearAllPoints()
		Buffs:SetPoint("BOTTOMLEFT", Health, "TOPLEFT", -2, 24)
		
		Buffs:SetHeight(27.9)
		Buffs:SetWidth(250)
		Buffs.size = 22
		Buffs.num = 8
		Buffs.numRow = 1
		Buffs.spacing = 3
		
		Debuffs:ClearAllPoints()
		Debuffs:SetPoint("BOTTOMRIGHT", Health, "TOPRIGHT", 2, 53)
		Debuffs:SetParent(Health)
		
		Debuffs:SetHeight(27.9)
		Debuffs:SetWidth(240)
		Debuffs.size = 29.1
		Debuffs.num = 31
		Debuffs.spacing = 3

		-- combobar on target
		if (C.UnitFrames.ComboBar) then
			ComboPoints:Size(190, 1)
			ComboPoints:ClearAllPoints()
			ComboPoints:SetPoint("BOTTOM", Health, "TOP", 0, 12)
			ComboPoints:SetFrameLevel(15)
			
			for i = 1, 8 do
				ComboPoints[i]:CreateBackdrop("Default")
			
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
		end
	end
end
hooksecurefunc(UnitFrames, "Target", Target)