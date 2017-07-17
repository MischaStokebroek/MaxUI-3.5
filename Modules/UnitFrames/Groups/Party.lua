------------------------------------------------------------------------------------------
-- MaxUI 3.50 TukUI 17 - LEGION 7.0 -- version: 20-07-2016
------------------------------------------------------------------------------------------

--setting up PARTY FRAMES.

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
-- Party Frames -- position and size
------------------------------------------------------------------------------------------
local function CreateUnits()
	local Party = UnitFrames.Headers.Party
	
	if (C.Party.Enable) then
		Party:ClearAllPoints()
		Party:Point("TOPLEFT", UIParent, "TOPLEFT", 30, -(T.ScreenHeight / 5))
	end
		
end
hooksecurefunc(UnitFrames, "CreateUnits", CreateUnits)

------------------------------------------------------------------------------------------
-- Party Frames -- MaxUI UF
------------------------------------------------------------------------------------------

local function Party(self)
	local Health = self.Health
	local Power = self.Power
	local Portrait = self.Portrait
	local WeakenedSoul = self.WeakenedSoul
	local Buffs = self.Buffs
	local Debuffs = self.Debuffs
	local Name = self.Name
	local Leader = self.leader
	local MasterLooter = self.MasterLooter
	local RaidIcon = self.RaidIcon
	local PhaseIcon = self.PhaseIcon
	local thickness = 1
	local ReadyCheck = self.ReadyCheck

	if C["MaxUI Media"]["MaxUIUF"] == true then
		-- panel and self
		self:Size(270, 70)
		self:ClearAllPoints()
		self:SetBackdrop(nil)

		-- portrait	
		if C.Party.Portrait then
			local Partyportraitframe = CreateFrame("Frame", "Partyportraitframe", self)
			Partyportraitframe:SetTemplate()
			Partyportraitframe:Size(54)
			Partyportraitframe:Point("LEFT", self, "LEFT", 0, -8)
			Partyportraitframe:SetFrameLevel(2)
			Partyportraitframe:SetFrameStrata("BACKGROUND")
			Partyportraitframe:CreateShadow("Default")

			Portrait:ClearAllPoints()
			Portrait:SetPoint("CENTER", Partyportraitframe, "CENTER", 0, 0)
			Portrait:SetFrameLevel(3)
			Portrait:Size(50, 50)
			Portrait:CreateOverlay()
		end
		
		-- vertical anchor line
		local PartyVertAnchorLine = CreateFrame("Frame", "PartyVertAnchorLine", self)
		PartyVertAnchorLine:SetTemplate()
		PartyVertAnchorLine:Size(thickness, 54)
		PartyVertAnchorLine:Point("BOTTOMRIGHT", self, "BOTTOMLEFT", 60, 0)
		PartyVertAnchorLine:SetFrameLevel(2)
		PartyVertAnchorLine:SetFrameStrata("BACKGROUND")
		PartyVertAnchorLine:SetAlpha(1)
		PartyVertAnchorLine:CreateShadow("Default")

		-- HP line
		local PartyHPLine = CreateFrame("Frame", "PartyHPLine", PartyVertAnchorLine)
		PartyHPLine:SetTemplate()
		PartyHPLine:Size(240, thickness)
		PartyHPLine:Point("TOPLEFT", PartyVertAnchorLine, "TOPLEFT", 0, 0)
		PartyHPLine:SetFrameLevel(2)
		PartyHPLine:SetFrameStrata("BACKGROUND")
		PartyHPLine:SetAlpha(1)
		PartyHPLine:CreateShadow("Default")

		-- power line
		local PartyPowerLine = CreateFrame("Frame", "PartyPowerLine", PartyVertAnchorLine)
		PartyPowerLine:SetTemplate()
		PartyPowerLine:Size(210, thickness)
		PartyPowerLine:Point("LEFT", PartyVertAnchorLine, "LEFT", 0, 0)
		PartyPowerLine:SetFrameLevel(2)
		PartyPowerLine:SetFrameStrata("BACKGROUND")
		PartyPowerLine:SetAlpha(1)
		PartyPowerLine:CreateShadow("Default")

		-- info line
		local PartyInfoLine = CreateFrame("Frame", "PartyInfoLine", PartyVertAnchorLine)
		PartyInfoLine:SetTemplate()
		PartyInfoLine:Size(180, thickness)
		PartyInfoLine:Point("BOTTOMLEFT", PartyVertAnchorLine, "BOTTOMLEFT", 0, 0)
		PartyInfoLine:SetFrameLevel(2)
		PartyInfoLine:SetFrameStrata("BACKGROUND")
		PartyInfoLine:SetAlpha(1)
		PartyInfoLine:CreateShadow("Default")

		-- Name
		Name:ClearAllPoints()
		Name:Point("LEFT", PartyInfoLine, "LEFT", 4, 4)
		Name:SetAlpha(1)
		Name:SetJustifyH("RIGHT")
		if C["MaxUI Media"]["Font"] == "Caps" then
			Name:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\caps.ttf", 20, "OUTLINE")
		elseif C["MaxUI Media"]["Font"] == "Comic" then
			Name:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\comic.ttf", 20, "OUTLINE")
		elseif C["MaxUI Media"]["Font"] == "MaxUI" then
			Name:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\MaxUI.ttf", 20, "OUTLINE")
		else	
			Name:SetFont(C["Medias"].Font, 20, "OUTLINE")
		end
		self:Tag(Name, "[Tukui:GetNameColor][Tukui:NameLong] |cffFFFFFF[level]|r[Tukui:Role]")
		
		-- HPpercentage tag
		local HPpercentage = Health:CreateFontString(nil, "OVERLAY")
		HPpercentage:Point("LEFT", Health, "RIGHT", 8, 0)
		HPpercentage:SetAlpha(1)
		HPpercentage:SetJustifyH("LEFT")
		--HPpercentage:SetFont(C["Medias"]["UnitFramesFont"], 14, "OUTLINE")
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

		-- healthbar
		Health:ClearAllPoints()
		Health:SetPoint("LEFT", PartyHPLine, "LEFT", 8, 0)
		Health:CreateBackdrop("Transparent")
		Health:SetHeight(20)
		Health:SetWidth(200)
		Health:SetFrameLevel(5)
		Health.Backdrop:SetFrameLevel(5)
		Health.Backdrop:CreateShadow("Default")
		Health.Value:ClearAllPoints()
		Health.Value:SetPoint("LEFT", Health, "LEFT", 4, -1)
		if C["MaxUI Media"]["Font"] == "Caps" then
			Health.Value:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\caps.ttf", 14, "OUTLINE")
		elseif C["MaxUI Media"]["Font"] == "Comic" then
			Health.Value:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\comic.ttf", 14, "OUTLINE")
		elseif C["MaxUI Media"]["Font"] == "MaxUI" then
			Health.Value:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\MaxUI.ttf", 14, "OUTLINE")
		else	
			Health.Value:SetFont(C["Medias"].Font, 14, "OUTLINE")
		end

		-- Power bar
		Power:ClearAllPoints()
		Power:SetPoint("LEFT", PartyPowerLine, "LEFT", 8, 0)
		Power:CreateBackdrop("Default")
		Power.Backdrop:CreateShadow("Default")
		Power:Height(12)
		Power:Width(170)
		Power:SetFrameLevel(5)
		Power:SetFrameStrata("BACKGROUND")
		Power.Background:SetTexture(.1, .1, .1, .2)
		Power.Backdrop:SetFrameLevel(5)

		-- Dark theme
		if C.UnitFrames.DarkTheme == true then
			Health.Background:SetTexture(HealthTexture)
			Health.Background:SetVertexColor(.6, .2, .2, 1)
		end

		-- highlighting unit
		self:HookScript("OnEnter", function(self)
			Health.Backdrop:SetBackdropBorderColor(Health:GetStatusBarColor())
			Power.Backdrop:SetBackdropBorderColor(Power:GetStatusBarColor())
		end)

		self:HookScript("OnLeave", function(self)
			Health.Backdrop:SetBackdropBorderColor(unpack(C["General"]["BorderColor"]))
			Power.Backdrop:SetBackdropBorderColor(unpack(C["General"]["BorderColor"]))
		end)
		
		-- Buffs and debuffs
		Buffs:ClearAllPoints()
		Buffs:SetPoint("BOTTOMLEFT", Health, "TOPLEFT", -2, 5)
		
		Buffs:SetHeight(24.5)
		Buffs:SetWidth(240)
		Buffs.size = 24.5
		Buffs.num = 8
		Buffs.numRow = 1
		Buffs.spacing = 3
		
		Debuffs:ClearAllPoints()
		Debuffs:SetPoint("LEFT", Health, "RIGHT", 50, 0)
		Debuffs:SetParent(Health)
		
		Debuffs:SetHeight(36)
		Debuffs:SetWidth(240)
		Debuffs.size = 36
		Debuffs.num = 3
		Debuffs.spacing = 3

		-- icons
		RaidIcon:ClearAllPoints()
		RaidIcon:SetSize(16, 16)
		RaidIcon:SetPoint("RIGHT", Name, 16, 0)
		
		--Leader:ClearAllPoints()
		--Leader:Size(16, 16)
		--Leader:SetPoint("LEFT", Health, "LEFT", 4, 0)
		
		--MasterLooter:ClearAllPoints()
		--MasterLooter:SetSize(16, 16)
		--MasterLooter:SetPoint("TOPRIGHT", Health, "TOPLEFT", -4.5, -20)
		
		--ReadyCheck:ClearAllPoints()
		--ReadyCheck:SetPoint("CENTER", Health, "CENTER")
		--ReadyCheck:SetSize(16, 16)
		
		--PhaseIcon:ClearAllPoints()
		--PhaseIcon:SetSize(24, 24)
		--PhaseIcon:SetPoint("TOPRIGHT", self, 7, 24)	
	end
end
hooksecurefunc(UnitFrames, "Party", Party)