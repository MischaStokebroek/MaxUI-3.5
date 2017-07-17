------------------------------------------------------------------------------------------
-- MaxUI 3.50 TukUI 17 - LEGION 7.0 -- version: 20-07-2016
------------------------------------------------------------------------------------------

--setting up RAID UNIT FRAMES.

-- to do: set leader, masterlooter, resurrection icons

------------------------------------------------------------------------------------------
-- LOCALS/FUNCTIONS/...
------------------------------------------------------------------------------------------

T, C, L = Tukui:unpack()

local Color = RAID_CLASS_COLORS[select(2, UnitClass("player"))]
local UnitFrames = T.UnitFrames
local Noop = function() end

UnitFrames.UpdateBuffsHeaderPosition = Noop
UnitFrames.UpdateDebuffsHeaderPosition = Noop
UnitFrames.UpdatePriestClassBars = Noop
UnitFrames.UpdateMageClassBars = Noop

------------------------------------------------------------------------------------------
-- RaidFrames position and size
------------------------------------------------------------------------------------------

local function CreateUnits()
	local Raid = UnitFrames.Headers.Raid
	
	Raid:ClearAllPoints()
	Raid:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 20, -100)

	if C["MaxUI Media"]["MaxUIUF"] == true then
		-- MELEE LAYOUT
		if C["MaxUI Layout"]["Heallayout"] == false and C["MaxUI Layout"]["Meleelayout"] == true then
			Raid:ClearAllPoints()
			Raid:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 20, -100)
			if C["MaxUI Layout"]["DPSlayout"] == true then
				Raid:ClearAllPoints()
				Raid:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 20, -100)
			end
		end
			
		-- HEALING LAYOUT
		if C["MaxUI Layout"]["Heallayout"] == true and C["MaxUI Layout"]["Meleelayout"] == false then
			Raid:ClearAllPoints()
			Raid:SetPoint("BOTTOM", castbarline, "TOP", 0, 12)
			if C["MaxUI Layout"]["DPSlayout"] == true then
				Raid:ClearAllPoints()
				Raid:SetPoint("BOTTOMRIGHT", LEFTChatline, "TOPRIGHT", -70, 12)
			end	
			if C["MaxUI Layout"]["SINGLECenterBar"] == true then
				Raid:ClearAllPoints()
				Raid:SetPoint("TOP", castbarline, "BOTTOM", 0, -20)
			end
			if C["MaxUI Layout"]["DOUBLECenterBar"] == true then
				Raid:ClearAllPoints()
				Raid:SetPoint("TOP", castbarline, "BOTTOM", 0, -20)
			end
			
		end
	end
end
hooksecurefunc(UnitFrames, "CreateUnits", CreateUnits)

------------------------------------------------------------------------------------------
-- Raid frame MaxUI UF
------------------------------------------------------------------------------------------

local function Raid(self)
	local Panel = self.Panel
	local Health = self.Health
	local Power = self.Power
	local Name = self.Name
	local LFDRole = self.LFDRole
	local ReadyCheck = self.ReadyCheck
	local Highlight = self.Highlight
	local Panel = self.Panel
	local RaidIcon = self.RaidIcon
	local thickness = 1

	if C["MaxUI Media"]["MaxUIUF"] == true then
	
		-- vertical anchor line
		local RaidVertAnchorLine = CreateFrame("Frame", "RaidVertAnchorLine", self)
		RaidVertAnchorLine:SetTemplate()
		RaidVertAnchorLine:Size(thickness, 26)
		RaidVertAnchorLine:Point("TOP", self, "TOP", 0, -22)
		RaidVertAnchorLine:SetFrameLevel(2)
		RaidVertAnchorLine:SetFrameStrata("BACKGROUND")
		RaidVertAnchorLine:SetAlpha(1)
		RaidVertAnchorLine:CreateShadow("Default")

		-- HP line
		local RaidHPLine = CreateFrame("Frame", "RaidHPLine", RaidVertAnchorLine)
		RaidHPLine:SetTemplate()
		RaidHPLine:Size(92, thickness)
		RaidHPLine:Point("TOP", RaidVertAnchorLine, "TOP", 0, 0)
		RaidHPLine:SetFrameLevel(2)
		RaidHPLine:SetFrameStrata("BACKGROUND")
		RaidHPLine:SetAlpha(1)
		RaidHPLine:CreateShadow("Default")

		-- infopanel
		Panel:SetAlpha(0)
		self:SetBackdrop(nil)
		self:SetAlpha(0.4)
		self:Size(84, 44)
		self.Shadow:Hide()
		
		-- health
		Health:ClearAllPoints()
		Health:SetPoint("CENTER", RaidHPLine, "CENTER", -0, 0)
		Health:CreateBackdrop("Default")
		Health:SetHeight(32)
		Health:SetWidth(80)
		Health:SetFrameLevel(3)
		Health.Backdrop:SetFrameLevel(3)
		Health.Backdrop:CreateShadow("Default")

		if C.UnitFrames.DarkTheme == true then
			Health.Background:SetTexture(HealthTexture)
			Health.Background:SetVertexColor(.6, .2, .2, 1)
		end
		
		if C.Raid.ShowHealthText then
			Health.Value:ClearAllPoints()
			Health.Value:SetPoint("TOP", Health, "TOP", 0, -2)
			Health.Value:SetParent(Health)
		end

		-- Power	
		Power:ClearAllPoints()
		Power:SetPoint("CENTER", Health, "BOTTOM", 0, 0)
		Power:CreateBackdrop("Default")
		Power:Height(6)
		Power:Width(50)
		Power.Background:SetTexture(.1, .1, .1, .2)
		Power:SetFrameLevel(5)
		Power.Backdrop:CreateShadow("Default")
		Power.Backdrop:SetFrameLevel(5)
		Power:SetStatusBarTexture(T.GetTexture(C.UnitFrames.PowerTexture))
		
		Power.Background = Power:CreateTexture(nil, "BORDER")
		Power.Background:SetTexture(.1, .1, .1, .2)
		
		-- Name	
		Name:ClearAllPoints()
		Name:SetPoint("CENTER", Health, "CENTER", 0, 0)
		Name:SetParent(Health)
		Name:SetFont(C["Medias"].Font, 11, "OUTLINE")
		
		-- green highlight	
		if (C.Raid.Highlight) then
		Highlight:ClearAllPoints()
		Highlight:Point("TOPLEFT", Health, "TOPLEFT", -2, 2)
		Highlight:Size(84, 36)
		end

		-- Roll Icon	
		LFDRole:Size(18)
		LFDRole:ClearAllPoints()
		LFDRole:SetPoint("TOP", Health, 0, 10)
		LFDRole:SetParent(Health)
		
		-- Ready check V	
		ReadyCheck:ClearAllPoints()
		ReadyCheck:Size(24)
		ReadyCheck:SetPoint("CENTER", Health, 0, 0)
		
		-- dark theme	
		if C.UnitFrames.DarkTheme then
			self:HookScript("OnEnter", function(self)
				local Color = RAID_CLASS_COLORS[select(2, UnitClass(self.unit))]
				if (not Color) then return end
				Health.Backdrop:SetBackdropBorderColor(Color.r, Color.g, Color.b)
				Power.Backdrop:SetBackdropBorderColor(Color.r, Color.g, Color.b)
			end)

			self:HookScript("OnLeave", function(self)
				Health.Backdrop:SetBackdropBorderColor(.15, .15, .15)
				Power.Backdrop:SetBackdropBorderColor(.15, .15, .15)
			end)
		end
		
		-- raidicon
		RaidIcon:ClearAllPoints()
		RaidIcon:Point("TOP", self, 10, 0)

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
hooksecurefunc(UnitFrames, "Raid", Raid)

--------------------------------------------------
-- Group Role ICONS instead of color
--------------------------------------------------

local function SetGridGroupRole(self)
	local LFDRole = self.LFDRole
	local Role = UnitGroupRolesAssigned(self.unit)
	local Health = self.Health

	if Role == "TANK" then
		if C["MaxUI Media"]["MaxUIrollicons"] == true then
		LFDRole:SetTexture("Interface\\AddOns\\TukuiMaxUI\\Medias\\Textures\\tank2.tga")
		LFDRole:Show()
		LFDRole:SetPoint("TOP", Health, -10, 8)
		else
		LFDRole:SetTexture("Interface\\AddOns\\TukuiMaxUI\\Medias\\Textures\\tank.tga")
		LFDRole:Show()
		LFDRole:SetPoint("TOP", Health, -10, 8)
		end
		
	elseif Role == "HEALER" then
		if C["MaxUI Media"]["MaxUIrollicons"] == true then
		LFDRole:SetTexture("Interface\\AddOns\\TukuiMaxUI\\Medias\\Textures\\healer3.tga")
		LFDRole:Show()
		LFDRole:SetPoint("TOP", Health, -10, 8)
		else
		LFDRole:SetTexture("Interface\\AddOns\\TukuiMaxUI\\Medias\\Textures\\healer.tga")
		LFDRole:Show()
		LFDRole:SetPoint("TOP", Health, -10, 8)
		end

	elseif Role == "DAMAGER" then
		if C["MaxUI Media"]["MaxUIrollicons"] == true then
		LFDRole:SetTexture("Interface\\AddOns\\TukuiMaxUI\\Medias\\Textures\\dps2.tga")
		LFDRole:Show()
		LFDRole:SetPoint("TOP", Health, -10, 8)
		else
		LFDRole:SetTexture("Interface\\AddOns\\TukuiMaxUI\\Medias\\Textures\\dps.tga")
		LFDRole:Show()
		LFDRole:SetPoint("TOP", Health, -10, 8)
		end
	else
		LFDRole:Hide()
	end
end
hooksecurefunc(T.UnitFrames, "SetGridGroupRole", SetGridGroupRole)

--------------------------------------------------
-- Raid frame attributes
--------------------------------------------------
local TukuiUnitFrames = T.UnitFrames

function TukuiUnitFrames:GetRaidFramesAttributes()

	if C["MaxUI Media"]["MaxUIUF"] == true then
		-- HEALING LAYOUT
		if C["MaxUI Layout"]["Heallayout"] == true then
		local Properties = C.Party.Enable and "custom [@raid6,exists] show;hide" or "solo,party,raid"
		return
			"TukuiRaid", 
			nil, 
			Properties,
			"oUF-initialConfigFunction", [[
				local header = self:GetParent()
				self:SetWidth(header:GetAttribute("initial-width"))
				self:SetHeight(header:GetAttribute("initial-height"))
			]],
			"initial-width", T.Scale(88),
			"initial-height", T.Scale(50),
			"showParty", true,
			"showRaid", true,
			"showPlayer", true,
			"showSolo", true,
			"xoffset", T.Scale(3),
			"yOffset", T.Scale(4),
			"point", "LEFT",
			"groupFilter", "1,2,3,4,5,6,7,8",
			"groupingOrder", "1,2,3,4,5,6,7,8",
			"groupBy", C["Raid"].GroupBy.Value,
			"maxColumns", math.ceil(40/5),
			"unitsPerColumn", C["Raid"].MaxUnitPerColumn,
			"columnSpacing", T.Scale(0),
			"columnAnchorPoint", "TOP"
			
		elseif (C["MaxUI Layout"]["SINGLECenterBar"] == true and C["MaxUI Layout"]["Heallayout"] == true) then
		local Properties = C.Party.Enable and "custom [@raid6,exists] show;hide" or "solo,party,raid"
		return
			"TukuiRaid", 
			nil, 
			Properties,
			"oUF-initialConfigFunction", [[
				local header = self:GetParent()
				self:SetWidth(header:GetAttribute("initial-width"))
				self:SetHeight(header:GetAttribute("initial-height"))
			]],
			"initial-width", T.Scale(88),
			"initial-height", T.Scale(50),
			"showParty", true,
			"showRaid", true,
			"showPlayer", true,
			"showSolo", true,
			"xoffset", T.Scale(3),
			"yOffset", T.Scale(4),
			"point", "LEFT",
			"groupFilter", "1,2,3,4,5,6,7,8",
			"groupingOrder", "1,2,3,4,5,6,7,8",
			"groupBy", C["Raid"].GroupBy.Value,
			"maxColumns", math.ceil(40/5),
			"unitsPerColumn", C["Raid"].MaxUnitPerColumn,
			"columnSpacing", T.Scale(0),
			"columnAnchorPoint", "BOTTOM"
		
		elseif (C["MaxUI Layout"]["DOUBLECenterBar"] == true and C["MaxUI Layout"]["Heallayout"] == true) then
		local Properties = C.Party.Enable and "custom [@raid6,exists] show;hide" or "solo,party,raid"
		return
			"TukuiRaid", 
			nil, 
			Properties,
			"oUF-initialConfigFunction", [[
				local header = self:GetParent()
				self:SetWidth(header:GetAttribute("initial-width"))
				self:SetHeight(header:GetAttribute("initial-height"))
			]],
			"initial-width", T.Scale(88),
			"initial-height", T.Scale(50),
			"showParty", true,
			"showRaid", true,
			"showPlayer", true,
			"showSolo", true,
			"xoffset", T.Scale(3),
			"yOffset", T.Scale(4),
			"point", "LEFT",
			"groupFilter", "1,2,3,4,5,6,7,8",
			"groupingOrder", "1,2,3,4,5,6,7,8",
			"groupBy", C["Raid"].GroupBy.Value,
			"maxColumns", math.ceil(40/5),
			"unitsPerColumn", C["Raid"].MaxUnitPerColumn,
			"columnSpacing", T.Scale(0),
			"columnAnchorPoint", "BOTTOM"
else
		-- BASIC LAYOUT
		local Properties = C.Party.Enable and "custom [@raid6,exists] show;hide" or "solo,party,raid"
		return
			"TukuiRaid", 
			nil, 
			Properties,
			"oUF-initialConfigFunction", [[
				local header = self:GetParent()
				self:SetWidth(header:GetAttribute("initial-width"))
				self:SetHeight(header:GetAttribute("initial-height"))
			]],
			"initial-width", T.Scale(66),
			"initial-height", T.Scale(50),
			"showParty", true,
			"showRaid", true,
			"showPlayer", true,
			"showSolo", true,
			"xoffset", T.Scale(4),
			"yOffset", T.Scale(0),
			"point", "TOP",
			"groupFilter", "1,2,3,4,5,6,7,8",
			"groupingOrder", "1,2,3,4,5,6,7,8",
			"groupBy", C["Raid"].GroupBy.Value,
			"maxColumns", math.ceil(40/5),
			"unitsPerColumn", C["Raid"].MaxUnitPerColumn,
			"columnSpacing", T.Scale(4),
			"columnAnchorPoint", "LEFT"
		end

	else

		-- non MaxUI unitframes setup
		local Properties = C.Party.Enable and "custom [@raid6,exists] show;hide" or "solo,party,raid"
		return
			"TukuiRaid", 
			nil, 
			Properties,
			"oUF-initialConfigFunction", [[
				local header = self:GetParent()
				self:SetWidth(header:GetAttribute("initial-width"))
				self:SetHeight(header:GetAttribute("initial-height"))
			]],
			"initial-width", T.Scale(66),
			"initial-height", T.Scale(50),
			"showParty", true,
			"showRaid", true,
			"showPlayer", true,
			"showSolo", true,
			"xoffset", T.Scale(4),
			"yOffset", T.Scale(-4),
			"point", "TOP",
			"groupFilter", "1,2,3,4,5,6,7,8",
			"groupingOrder", "1,2,3,4,5,6,7,8",
			"groupBy", C["Raid"].GroupBy.Value,
			"maxColumns", math.ceil(40/5),
			"unitsPerColumn", C["Raid"].MaxUnitPerColumn,
			"columnSpacing", T.Scale(4),
			"columnAnchorPoint", "LEFT"
	end
end

--------------------------------------------------
-- Raid PET frame attributes
--------------------------------------------------
function TukuiUnitFrames:GetPetRaidFramesAttributes()

	if C["MaxUI Media"]["MaxUIUF"] == true then
		-- HEALING LAYOUT
		if C["MaxUI Layout"]["Heallayout"] == true and C["MaxUI Layout"]["Meleelayout"] == false then
		local Properties = C.Party.Enable and "custom [@raid6,exists] show;hide" or "solo,party,raid"
		return
			"TukuiRaidPet", 
			"SecureGroupPetHeaderTemplate", 
			Properties,
			"showParty", false,
			"showRaid", C["Raid"].ShowPets,
			"showSolo", false,
			"maxColumns", math.ceil(40/5),
			"point", "TOP",
			"unitsPerColumn", C["Raid"].MaxUnitPerColumn,
			"columnSpacing", T.Scale(4),
			"columnAnchorPoint", "LEFT",
			"yOffset", T.Scale(0),
			"xOffset", T.Scale(4),
			"initial-width", T.Scale(88),
			"initial-height", T.Scale(50),
			"oUF-initialConfigFunction", [[
				local header = self:GetParent()
				self:SetWidth(header:GetAttribute("initial-width"))
				self:SetHeight(header:GetAttribute("initial-height"))
			]]
		else
		-- BASIC LAYOUT
		local Properties = C.Party.Enable and "custom [@raid6,exists] show;hide" or "solo,party,raid"
		return
			"TukuiRaidPet", 
			"SecureGroupPetHeaderTemplate", 
			Properties,
			"showParty", false,
			"showRaid", C["Raid"].ShowPets,
			"showSolo", false,
			"maxColumns", math.ceil(40/5),
			"point", "TOP",
			"unitsPerColumn", C["Raid"].MaxUnitPerColumn,
			"columnSpacing", T.Scale(4),
			"columnAnchorPoint", "LEFT",
			"yOffset", T.Scale(0),
			"xOffset", T.Scale(4),
			"initial-width", T.Scale(66),
			"initial-height", T.Scale(50),
			"oUF-initialConfigFunction", [[
				local header = self:GetParent()
				self:SetWidth(header:GetAttribute("initial-width"))
				self:SetHeight(header:GetAttribute("initial-height"))
			]]

		end

	else
		-- non MaxUI unitframes setup
		local Properties = C.Party.Enable and "custom [@raid6,exists] show;hide" or "solo,party,raid"
		return
			"TukuiRaidPet", 
			"SecureGroupPetHeaderTemplate", 
			Properties,
			"showParty", false,
			"showRaid", C["Raid"].ShowPets,
			"showSolo", false,
			"maxColumns", math.ceil(40/5),
			"point", "TOP",
			"unitsPerColumn", C["Raid"].MaxUnitPerColumn,
			"columnSpacing", T.Scale(4),
			"columnAnchorPoint", "LEFT",
			"yOffset", T.Scale(-4),
			"xOffset", T.Scale(4),
			"initial-width", T.Scale(66),
			"initial-height", T.Scale(50),
			"oUF-initialConfigFunction", [[
				local header = self:GetParent()
				self:SetWidth(header:GetAttribute("initial-width"))
				self:SetHeight(header:GetAttribute("initial-height"))
			]]
	end
end