------------------------------------------------------------------------------------------
-- MaxUI 3.50 TukUI 17 - LEGION 7.0 -- version: 21-04-2017
------------------------------------------------------------------------------------------

--setting up REPUTATION and EXPERIENCE ARTIFACT BARS.

-- This should be easier, especially the tooltip.
-- showing xp bar all the time even at max level....

------------------------------------------------------------------------------------------
-- LOCALS/FUNCTIONS/...
------------------------------------------------------------------------------------------

local T, C, L = Tukui:unpack()
local Misc = T.Miscellaneous
local Reputation = Misc.Reputation
local Experience = Misc.Experience
local Panels = T.Panels
local Bars = 20
local thickness = 1
local FontSize = 14
local FontFlag = "OUTLINE"
local Font = T.GetFont(C["MaxUI Media"]["Font"])

Experience.NumBars = 2
Experience.RestedColor = {0/255, 144/255, 255/255}
Experience.XPColor = {163/255, 53/255, 238/255}
Experience.AFColor = {229/255, 204/255, 127/255}
Experience.HNColor = {222/255, 22/255, 22/255}

------------------------------------------------------------------------------------------
-- Basic anchor
------------------------------------------------------------------------------------------
local function Enable()
	local BottomLine = Panels.BottomLine
	local Panels = T.Panels
	local ActionBars = T.ActionBars

	-- BASIC/MELEE
	local REPXPline = CreateFrame("Frame", "REPXPline", UIParent)
	REPXPline:SetTemplate()
	REPXPline:Size((castbarline:GetWidth()), thickness)
	REPXPline:Point("BOTTOM", BottomLine, "TOP", 0, 40)
	REPXPline:SetFrameLevel(2)
	REPXPline:SetFrameStrata("BACKGROUND")
	REPXPline:SetAlpha(1)
	REPXPline:CreateShadow("Default")

	local XPtext = REPXPline:CreateFontString(nil, "OVERLAY")
	if C["MaxUI Media"]["Font"] == "Caps" then
		XPtext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\caps.ttf", FontSize, "OUTLINE")
	elseif C["MaxUI Media"]["Font"] == "Comic" then
		XPtext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\comic.ttf", FontSize, "OUTLINE")
	elseif C["MaxUI Media"]["Font"] == "MaxUI" then
		XPtext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\MaxUI.ttf", FontSize, "OUTLINE")
	else	
		XPtext:SetFont(C["Medias"].Font, FontSize, "OUTLINE")
	end
	XPtext:Point("LEFT", REPXPline, "LEFT", 6, 0)
	XPtext:SetText("Exp")
		
	local Reptext = REPXPline:CreateFontString(nil, "OVERLAY")
	if C["MaxUI Media"]["Font"] == "Caps" then
		Reptext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\caps.ttf", FontSize, "OUTLINE")
	elseif C["MaxUI Media"]["Font"] == "Comic" then
		Reptext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\comic.ttf", FontSize, "OUTLINE")
	elseif C["MaxUI Media"]["Font"] == "MaxUI" then
		Reptext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\MaxUI.ttf", FontSize, "OUTLINE")
	else	
		Reptext:SetFont(C["Medias"].Font, FontSize, "OUTLINE")
	end
	Reptext:Point("RIGHT", REPXPline, "RIGHT", -4, 0)
	Reptext:SetText("Rep")

	-- HEALING LAYOUT
	if C["MaxUI Layout"]["Heallayout"] == true and C["MaxUI Layout"]["Meleelayout"] == false then
	REPXPline:ClearAllPoints()
	REPXPline:Size(80, thickness)
	REPXPline:Point("LEFT", ABline02V, "BOTTOM", 0, -4)
	XPtext:SetAlpha(0)
	Reptext:SetAlpha(0)
	end

	-- CENTERED BAR LAYOUT
	if C["MaxUI Layout"]["SINGLECenterBar"] == true and C["MaxUI Layout"]["Meleelayout"] == true then
		--REPXPline:ClearAllPoints()
		--REPXPline:Point("BOTTOM", BottomLine, "TOP", 0, 136)
	end
	
	RegisterStateDriver(REPXPline, 'visibility', '[petbattle] hide; show') 

	-- Combat Fade options
	if C["MaxUI CombatFade"]["RepBar"] == true then
		RegisterStateDriver(REPXPline, "visibility", "[combat] hide; show")
	end
end	
hooksecurefunc(Panels, "Enable", Enable)

------------------------------------------------------------------------------------------
-- Showing XP bar and Artifact/HonorBar all the time 
------------------------------------------------------------------------------------------
function Experience:Update(event, owner)
	if (event == "UNIT_INVENTORY_CHANGED" and owner ~= "player") then
		return
	end

	local ShowArtifact = HasArtifactEquipped()
	local PlayerLevel = UnitLevel("player")

	local Current, Max = self:GetExperience()
	local Rested = GetXPExhaustion()
	local IsRested = GetRestState()

	for i = 1, self.NumBars do
		local Bar = self["XPBar"..i]
		local RestedBar = self["RestedBar"..i]
		local r, g, b
		
		Bar.BarType = "XP"
		
		if (i == 1 and PlayerLevel == MAX_PLAYER_LEVEL) then
			Current, Max = self:GetExperience()
			Bar.BarType = "XP"
			
		elseif (i == 2) then
			if ShowArtifact then
				Current, Max = self:GetArtifact()
				Bar.BarType = "ARTIFACT"
			else
				Current, Max = self:GetHonor()
				Bar.BarType = "HONOR"
			end
		end
		
		local BarType = Bar.BarType
		
		Bar:SetMinMaxValues(0, Max)
		Bar:SetValue(Current)

		if (BarType == "XP" and IsRested == 1 and Rested) then
			RestedBar:Show()
			RestedBar:SetMinMaxValues(0, Max)
			RestedBar:SetValue(Rested + Current)
		else
			RestedBar:Hide()
		end
		
		if BarType == "XP" then
			r, g, b = unpack(self.XPColor)
		elseif BarType == "ARTIFACT" then
			r, g, b = unpack(self.AFColor)
		else
			r, g, b = unpack(self.HNColor)
		end
		Bar:SetStatusBarColor(r, g, b)
	end
end

------------------------------------------------------------------------------------------
-- Experience Bar.
------------------------------------------------------------------------------------------
function Create(self)
	local XPBar = self.XPBar1
	local RestedBar = self.RestedBar1

	-- BASIC LAYOUT (TANK / DPS)
	XPBar:ClearAllPoints()
	XPBar:SetPoint("LEFT", REPXPline, "LEFT", 44, 0)
	XPBar:Size(castbarline:GetWidth()/3-36, 6)
	XPBar:SetOrientation'HORIZONTAL'
	XPBar:SetParent(REPXPline)
	XPBar:SetFrameLevel(10)
	XPBar:SetStatusBarTexture(T.GetTexture(C.UnitFrames.HealthTexture))
	
	RestedBar:SetFrameLevel(11)
	RestedBar:SetStatusBarTexture(T.GetTexture(C.UnitFrames.HealthTexture))
	RestedBar:SetAlpha(0.3)
		
	-- HEALING LAYOUT
	if C["MaxUI Layout"]["Heallayout"] == true and C["MaxUI Layout"]["Meleelayout"] == false then
		XPBar:ClearAllPoints()
		XPBar:SetPoint("TOP", ABline02V, "BOTTOM", 0, 0)
		XPBar:Size(90, 6)
		XPBar:SetParent(ABline02V)
		XPBar:SetFrameLevel(10)	
	end
	
	if C["MaxUI CombatFade"]["RepBar"] == true then
		RegisterStateDriver(XPBar, "visibility", "[combat] hide; show")
		RegisterStateDriver(RestedBar, "visibility", "[combat] hide; show")
	end
end
hooksecurefunc(Experience, "Create", Create)

------------------------------------------------------------------------------------------
-- Honor / Artifact Bar.
------------------------------------------------------------------------------------------
function Create(self)
	local HonorArtifactXPBar = self.XPBar2
	--local RestedBar = self.RestedBar2

	-- BASIC LAYOUT (TANK / DPS)
	HonorArtifactXPBar:ClearAllPoints()
	HonorArtifactXPBar:SetPoint("CENTER", REPXPline, "CENTER", 0, 0)
	HonorArtifactXPBar:Size(castbarline:GetWidth()/3-35, 6)
	HonorArtifactXPBar:SetOrientation'HORIZONTAL'
	HonorArtifactXPBar:SetParent(REPXPline)
	HonorArtifactXPBar:SetFrameLevel(10)
	HonorArtifactXPBar:SetStatusBarTexture(T.GetTexture(C.UnitFrames.HealthTexture))
	
	-- HEALING LAYOUT
	if C["MaxUI Layout"]["Heallayout"] == true and C["MaxUI Layout"]["Meleelayout"] == false then
		HonorArtifactXPBar:ClearAllPoints()
		HonorArtifactXPBar:SetPoint("TOP", ABline03V, "BOTTOM", 0, 0)
		HonorArtifactXPBar:Size(90, 6)
		HonorArtifactXPBar:SetParent(ABline02V)
		HonorArtifactXPBar:SetFrameLevel(10)	
	end
	
	if C["MaxUI CombatFade"]["RepBar"] == true then
		RegisterStateDriver(HonorArtifactXPBar, "visibility", "[combat] hide; show")
	end
end
hooksecurefunc(Experience, "Create", Create)

------------------------------------------------------------------------------------------
-- Reputation Bar.
------------------------------------------------------------------------------------------
function Create(self)
	local RepBar1 = self.RepBar1
	local RepBar2 = self.RepBar2

	-- BASIC LAYOUT (TANK / DPS)
	RepBar1:Size(castbarline:GetWidth()/3-36, 6)
	RepBar1:SetOrientation'HORIZONTAL'
	RepBar1:ClearAllPoints()
	RepBar1:SetPoint("RIGHT", REPXPline, "RIGHT", -44, 0)
	RepBar1.Backdrop:SetTemplate("Default")
	RepBar1.Backdrop:CreateShadow("Default")
	RepBar1:SetStatusBarTexture(T.GetTexture(C.UnitFrames.HealthTexture))
	RepBar1:SetParent(REPXPline)
	RepBar1:SetFrameLevel(10)
	
	RepBar2:Kill()

	-- HEALING LAYOUT
	if C["MaxUI Layout"]["Heallayout"] == true and C["MaxUI Layout"]["Meleelayout"] == false then
		RepBar1:ClearAllPoints()
		RepBar1:SetPoint("TOP", ABline04V, "BOTTOM", -50, 0)
		RepBar1:Size(ABline01:GetWidth()/2-23, 6)
		RepBar1:SetParent(ABline04V)
		RepBar1:SetFrameLevel(10)
	end	
	
	if C["MaxUI CombatFade"]["RepBar"] == true then
		RegisterStateDriver(RepBar1, "visibility", "[combat] hide; show")
	end
end
hooksecurefunc(Reputation, "Create", Create)

------------------------------------------------------------------------------------------
-- Tooltips 
------------------------------------------------------------------------------------------

-- EXPERIENCE BAR / HONOR & ARTIFACT BAR
function Experience:SetTooltip()
	local BarType = self.BarType
	local Current, Max

	if (self == Experience.XPBar1) then
		GameTooltip:SetOwner(self, "ANCHOR_TOP", 0, 8)
	else
		GameTooltip:SetOwner(self, "ANCHOR_TOP", 0, 8)
	end

	if BarType == "XP" then
		local Rested = GetXPExhaustion()
		local IsRested = GetRestState()
		
		Current, Max = Experience:GetExperience()
		
		if Max == 0 then
			return
		end
		
		GameTooltip:AddLine(string.format("|cffA335EE"..XP..": %d / %d (%d%% - %d/%d)|r", Current, Max, Current / Max * 100, Bars - (Bars * (Max - Current) / Max), Bars))
		
		if (IsRested == 1 and Rested) then
			GameTooltip:AddLine(string.format("|cff0090FF"..TUTORIAL_TITLE26..": +%d (%d%%)|r", Rested, Rested / Max * 100))
		end
		
	elseif BarType == "ARTIFACT" then
		Current, Max = Experience:GetArtifact()
		
		if Max == 0 then
			return
		end
		
		GameTooltip:AddLine(string.format("|cffe6cc80"..ARTIFACT_POWER..": %d / %d (%d%% - %d/%d)|r", Current, Max, Current / Max * 100, Bars - (Bars * (Max - Current) / Max), Bars))
	else
		local Level = UnitHonorLevel("player")
		local LevelMax = GetMaxPlayerHonorLevel()
		local Prestige = UnitPrestige("player")
		
		Current, Max = Experience:GetHonor()
		
		if Max == 0 then
			GameTooltip:AddLine(PVP_HONOR_PRESTIGE_AVAILABLE)
			GameTooltip:AddLine(PVP_HONOR_XP_BAR_CANNOT_PRESTIGE_HERE) 
		else
			GameTooltip:AddLine(string.format("|cffee2222"..HONOR..": %d / %d (%d%% - %d/%d)|r", Current, Max, Current / Max * 100, Bars - (Bars * (Max - Current) / Max), Bars))
			GameTooltip:AddLine(string.format("|cffcccccc"..RANK..": %d / %d|r", Level, LevelMax))
			GameTooltip:AddLine(string.format("|cffcccccc"..PVP_PRESTIGE_RANK_UP_TITLE..": %d|r", Prestige))
		end
	end
	GameTooltip:Show()
end


-- REPUTATION BAR
function Reputation:SetTooltip()
	if (not GetWatchedFactionInfo()) then
		return
	end
	
	local Name, ID, Min, Max, Value = GetWatchedFactionInfo()
	
	if (self == Reputation.RepBar1) then
		GameTooltip:SetOwner(self, "ANCHOR_TOP", 0, 8)
	else
		GameTooltip:SetOwner(self, "ANCHOR_TOP", 0, 8)
	end
	
	GameTooltip:AddLine(string.format("%s (%s)", Name, _G["FACTION_STANDING_LABEL" .. ID]))
	if (Min ~= Max) and (Min > 0) then
		GameTooltip:AddLine(string.format("%d / %d (%d%%)", Value - Min, Max - Min, (Value - Min) / (Max - Min) * 100))
	end
	GameTooltip:Show()
end
