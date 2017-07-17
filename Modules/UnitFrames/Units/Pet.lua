------------------------------------------------------------------------------------------
-- MaxUI 3.50 TukUI 17 - LEGION 7.0 -- version: 17-12-2016
------------------------------------------------------------------------------------------

--setting up PET FRAMES.

-- to do: link pat actionbar to pet frame, still no way to connect them.....

------------------------------------------------------------------------------------------
-- LOCALS/FUNCTIONS/...
------------------------------------------------------------------------------------------

local T, C, L = Tukui:unpack()

local Pet = T["UnitFrames"].Units.Pet
local Panels = T.Panels
local UnitFrames = T.UnitFrames
local Noop = function() end

------------------------------------------------------------------------------------------
-- Pet Frame
------------------------------------------------------------------------------------------

local function CreateUnits()
	local Pet = UnitFrames.Units.Pet
	Pet:ClearAllPoints()
	Pet:SetPoint("LEFT", LEFTChatline, "RIGHT", 20, -15)
	
	if C["MaxUI Media"]["MaxUIUF"] == true then
		Pet:ClearAllPoints()
		Pet:SetPoint("LEFT", LEFTChatline, "RIGHT", 20, -15)
		Pet:Size(170, 50)
		Pet:SetBackdrop(nil)
		Pet.Shadow:Hide()

		-- HEAL LAYOUT
		if C["MaxUI Layout"]["Heallayout"] == true and C["MaxUI Layout"]["Meleelayout"] == false then
			Pet:ClearAllPoints()
			Pet:SetPoint("BOTTOMLEFT", T.UnitFrames.Anchor, "TOPLEFT", -130, 140)
			if C["MaxUI Layout"]["SINGLECenterBar"] == true then
				Pet:ClearAllPoints()
			Pet:SetPoint("BOTTOMLEFT", T.UnitFrames.Anchor, "TOPLEFT", -284, 214)
			end	
		end
		
		-- DPS CENTER BAR LAYOUT
		if C["MaxUI Layout"]["DPSCenterBar"] == true and C["MaxUI Layout"]["Meleelayout"] == true then
			Pet:ClearAllPoints()
			Pet:SetPoint("BOTTOMLEFT", T.UnitFrames.Anchor, "TOPLEFT", -180, 224)
		end
		
	end
end
hooksecurefunc(UnitFrames, "CreateUnits", CreateUnits)

------------------------------------------------------------------------------------------
-- Pet Frame
------------------------------------------------------------------------------------------
-- setfont
 
local function Pet(self)
	local Health = self.Health
	local Name = self.Name
	local Panel = self.Panel
	local Power = self.Power
	local thickness = 1
	local RaidIcon = self.RaidIcon

	if C["MaxUI Media"]["MaxUIUF"] == true then

		-- vertical anchor line
		local PetVertAnchorLine = CreateFrame("Frame", "PetVertAnchorLine", self)
		PetVertAnchorLine:SetTemplate()
		PetVertAnchorLine:Size(thickness, 28)
		PetVertAnchorLine:Point("TOP", self, "TOP", 0, -10)
		PetVertAnchorLine:SetFrameLevel(2)
		PetVertAnchorLine:SetFrameStrata("BACKGROUND")
		PetVertAnchorLine:SetAlpha(1)
		PetVertAnchorLine:CreateShadow("Default")

		-- HP line
		local PetHPLine = CreateFrame("Frame", "PetHPLine", PetVertAnchorLine)
		PetHPLine:SetTemplate()
		PetHPLine:Size(180, thickness)
		PetHPLine:Point("TOP", PetVertAnchorLine, "TOP", 0, 0)
		PetHPLine:SetFrameLevel(2)
		PetHPLine:SetFrameStrata("BACKGROUND")
		PetHPLine:SetAlpha(1)
		PetHPLine:CreateShadow("Default")
	
		-- power line
		local PetPowerLine = CreateFrame("Frame", "PetPowerLine", PetVertAnchorLine)
		PetPowerLine:SetTemplate()
		PetPowerLine:Size(160, thickness)
		PetPowerLine:Point("BOTTOM", PetVertAnchorLine, "BOTTOM", 0, 0)
		PetPowerLine:SetFrameLevel(2)
		PetPowerLine:SetFrameStrata("BACKGROUND")
		PetPowerLine:SetAlpha(1)
		PetPowerLine:CreateShadow("Default")
	
		-- health
		Health:ClearAllPoints()
		Health:SetPoint("CENTER", PetHPLine, "CENTER", -0, 0)
		Health:CreateBackdrop("Transparent")
		Health:SetHeight(20)
		Health:SetWidth(160)
		Health:SetFrameLevel(3)
		Health.Backdrop:SetFrameLevel(3)
		Health.Backdrop:CreateShadow("Default")

		if C.UnitFrames.DarkTheme == true then
			Health.Background:SetTexture(HealthTexture)
			Health.Background:SetVertexColor(.6, .2, .2, 1)
		end

		-- power
		Power:ClearAllPoints()
		Power:Height(12)
		Power:Width(140)
		Power:SetPoint("CENTER", PetPowerLine, "CENTER", 0, 0)
		Power:SetFrameLevel(3)
		Power:SetStatusBarTexture(T.GetTexture(C.UnitFrames.PowerTexture))
		Power:CreateBackdrop("Default")
		Power.Backdrop:CreateShadow("Default")
		Power.Backdrop:SetFrameLevel(3)

		Power.Background = Power:CreateTexture(nil, "BORDER")
		Power.Background:SetAllPoints()
		Power.Background:SetTexture(.1, .1, .1, .2)
		Power.Background.multiplier = 0.3
	
		Power.Value = Power:CreateFontString(nil, "OVERLAY")
		Power.Value:SetAlpha(1)
		if C["MaxUI Media"]["Font"] == "Caps" then
			Power.Value:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\caps.ttf", 12, "OUTLINE")
		elseif C["MaxUI Media"]["Font"] == "Comic" then
			Power.Value:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\comic.ttf", 12, "OUTLINE")
		elseif C["MaxUI Media"]["Font"] == "MaxUI" then
			Power.Value:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\MaxUI.ttf", 12, "OUTLINE")
		else	
			Power.Value:SetFont(C["Medias"].Font, 12, "OUTLINE")
		end
	
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

		-- raid icon
		RaidIcon:ClearAllPoints()
		RaidIcon:Size(20)
		RaidIcon:Point("TOP", Health, 0, 24)
		
		-- infopanel
		Panel:SetAlpha(0)
	
		-- Name Pet
		Name:SetParent(Health)
		Name:ClearAllPoints()
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
		self:Tag(Name, "[Tukui:GetNameColor][Tukui:NameMedium] [Tukui:DiffColor]")
	
		-- highlighting unit
		self:HookScript("OnEnter", function(self)
			Health.Backdrop:SetBackdropBorderColor(Health:GetStatusBarColor())
			Power.Backdrop:SetBackdropBorderColor(Power:GetStatusBarColor())
		end)

		self:HookScript("OnLeave", function(self)
			Health.Backdrop:SetBackdropBorderColor(unpack(C["General"]["BorderColor"]))
			Power.Backdrop:SetBackdropBorderColor(unpack(C["General"]["BorderColor"]))
		end)
	
		if C["MaxUI Layout"]["Heallayout"] == true and C["MaxUI Layout"]["Meleelayout"] == false then
			PetVertAnchorLine:Point("LEFT", self, "RIGHT", 0, 0)
			PetHPLine:Point("TOPRIGHT", PetVertAnchorLine, "TOPRIGHT", 0, 0)
			PetPowerLine:Point("BOTTOMRIGHT", PetVertAnchorLine, "BOTTOMRIGHT", 0, 0)
		end
	end
end
hooksecurefunc(UnitFrames, "Pet", Pet)

------------------------------------------------------------------------------------------
-- Pet actionbar
------------------------------------------------------------------------------------------
local ActionBars = T.ActionBars
local NUM_PET_ACTION_SLOTS = NUM_PET_ACTION_SLOTS

hooksecurefunc(ActionBars, 'CreatePetBar', function()
	local PBar = T.Panels.PetActionBar
	local Pet = UnitFrames.Units.Pet
	local Size = C.ActionBars.NormalButtonSize
	local PetSize = C.ActionBars.PetButtonSize
	local Spacing = C.ActionBars.ButtonSpacing

	PBar:ClearAllPoints()
	PBar:SetFrameLevel(4)
	PBar:SetFrameStrata("BACKGROUND")
	PBar:SetHeight((PetSize * 2) + (Spacing * 3))
	PBar:SetWidth((PetSize * 5) + (Spacing * 6))
	PBar:Point("LEFT", LEFTChatline, "RIGHT", 31, -74)
	PBar.Backdrop:SetAlpha(C["MaxUI Media"]["chatpanelalpha"])
	
	if C["MaxUI Layout"]["Heallayout"] == true and C["MaxUI Layout"]["Meleelayout"] == false then
		PBar:Point("LEFT", UIParent, "LEFT", 290, -320)
	end
	
	for i = 1, NUM_PET_ACTION_SLOTS do
		local Button = _G["PetActionButton"..i]
		Button:ClearAllPoints()
		Button:SetParent(PBar)
		Button:Size(PetSize)
		Button:Show()
		Button:SetFrameLevel(5)
		Button:SetFrameStrata("BACKGROUND")

		if (i == 1) then
			Button:SetPoint("TOPLEFT", Spacing, -Spacing)
		elseif i == 6 then
			Button:SetPoint("BOTTOMLEFT", Spacing, Spacing)
		else
			Button:SetPoint("LEFT", _G["PetActionButton"..(i - 1)], "RIGHT", Spacing, 0)
		end	

		PBar:SetAttribute("addchild", Button)
		PBar["Button"..i] = Button
	end
end)