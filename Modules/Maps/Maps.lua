------------------------------------------------------------------------------------------
-- MaxUI 3.50 TukUI 17 - LEGION 7.0 -- version: 21-04-2017
------------------------------------------------------------------------------------------

--setting up MINIMAP.

------------------------------------------------------------------------------------------
-- LOCALS/FUNCTIONS/...
------------------------------------------------------------------------------------------

local T, C, L = Tukui:unpack()

local Maps = T.Maps
local Minimap = T.Maps.Minimap
local Panels = T.Panels
local Noop = function() end
	
local Mail = MiniMapMailFrame
local MailBorder = MiniMapMailBorder
local MailIcon = MiniMapMailIcon
local class = RAID_CLASS_COLORS[select(2, UnitClass("player"))]

local FontSize = 14
local FontFlag = "OUTLINE"
--local Font = "MaxUI"

------------------------------------------------------------------------------------------
-- MINIMAP ADJUSTMENTS
------------------------------------------------------------------------------------------
local function Enable(self)
	local Data1 = Panels.MinimapDataTextOne
	local Data2 = Panels.MinimapDataTextTwo
	
	-- datapanels
	Data1:Hide()
	Data2:Hide()
	
	-- minimap
	Minimap:ClearAllPoints()
	Minimap:Size(170)
	Minimap:Point("TOPRIGHT", UIParent, "TOPRIGHT", -20, -30)
	
	-- map text and button	
	local HideMapButton = CreateFrame("Frame", "HideMapButton", ShowMinimap)
	HideMapButton:SetTemplate()
	HideMapButton:Size(40, 18)
	HideMapButton:Point("BOTTOMLEFT", Minimap, "BOTTOMLEFT", 0, 0)
	HideMapButton:SetFrameLevel(Minimap:GetFrameLevel()+2)
	HideMapButton:SetAlpha(0.0)

	local Maptext = Minimap:CreateFontString(nil, "OVERLAY")
	if C["MaxUI Media"]["Font"] == "Caps" then
		Maptext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\caps.ttf", FontSize, "OUTLINE")
	elseif C["MaxUI Media"]["Font"] == "Comic" then
		Maptext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\comic.ttf", FontSize, "OUTLINE")
	elseif C["MaxUI Media"]["Font"] == "MaxUI" then
		Maptext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\MaxUI.ttf", FontSize, "OUTLINE")
	else	
		Maptext:SetFont(C["Medias"].Font, FontSize, "OUTLINE")
	end
	Maptext:Point("BOTTOMLEFT", Minimap, "BOTTOMLEFT", 2, 2)
	Maptext:SetText("Map")

	HideMapButton:SetScript("OnEnter", function(self)
		Maptext:SetTextColor(class.r, class.g, class.b)
	end)

	HideMapButton:SetScript("OnLeave", function(self)
		Maptext:SetTextColor(1, 1, 1)
	end)
	
	-- show hide button
	local ShowMap = CreateFrame("Frame", "ShowMap", ShowMinimap)
	ShowMap:SetTemplate()
	ShowMap:Size(11, 10)
	ShowMap:Point("TOPRIGHT", UIParent, "TOPRIGHT", -3, -6)
	ShowMap:SetFrameLevel(15)
	ShowMap:SetFrameStrata("HIGH")
	ShowMap:SetAlpha(0)
	ShowMap:SetScript("OnEnter", function(self) self:SetAlpha(1) end)
	ShowMap:SetScript("OnLeave", function(self) self:SetAlpha(0) end)
	ShowMap:Hide()

	local Maptextopen = ShowMap:CreateFontString(nil, "OVERLAY")
	if C["MaxUI Media"]["Font"] == "Caps" then
		Maptextopen:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\caps.ttf", FontSize, "OUTLINE")
	elseif C["MaxUI Media"]["Font"] == "Comic" then
		Maptextopen:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\comic.ttf", FontSize, "OUTLINE")
	elseif C["MaxUI Media"]["Font"] == "MaxUI" then
		Maptextopen:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\MaxUI.ttf", FontSize, "OUTLINE")
	else	
		Maptextopen:SetFont(C["Medias"].Font, FontSize, "OUTLINE")
	end
	Maptextopen:Point("CENTER", ShowMap, "CENTER", 0, 0)
	Maptextopen:SetText("+")
	Maptextopen:Hide()

	if C["MaxUI Tools"]["Nomap"] == false then		
		Minimap:Hide()
		Maptextopen:Show()
		ShowMap:Show()
		TopVerticalRightline:Hide()
		TopHorizontalRightline:Hide()
	end
		
	HideMapButton:SetScript("OnMouseDown", function(self)
			Minimap:Hide()
			Maptextopen:Show()
			ShowMap:Show()
			HideMapButton:Hide()
			TopVerticalRightline:Hide()
			TopHorizontalRightline:Hide()
	end)

	ShowMap:SetScript("OnMouseDown", function(self)
			Minimap:Show()
			Maptextopen:Hide()
			ShowMap:Hide()
			HideMapButton:Show()
			TopVerticalRightline:Show()
			TopHorizontalRightline:Show()
	end)
		
		if C["MaxUI CombatFade"]["Map"] == true then
		RegisterStateDriver(Minimap, "visibility", "[combat] hide; show")
		end
	
end
hooksecurefunc(Minimap, "Enable", Enable)

------------------------------------------------------------------------------------------
-- MINIMAP ICON COLLECTOR (SQUARE MINIMAP ICONS) - thanks to Azilroka
------------------------------------------------------------------------------------------

-- can this be shorter? I only want the bar to collect the buttons.

-- prevent  real addon to run
DisableAddOn('SquareMinimapButtons')

local strsub, strlen, strfind, ceil = strsub, strlen, strfind, ceil
local tinsert, pairs, unpack = tinsert, pairs, unpack

-- bar panel
local SquareMinimapButtonBar = CreateFrame('Frame', 'SquareMinimapButtonBar', Minimap)
SquareMinimapButtonBar:SetPoint('TOPRIGHT', Minimap, 'BOTTOMRIGHT', 2, -6)
SquareMinimapButtonBar:SetFrameStrata('LOW')
SquareMinimapButtonBar:Width(Minimap:GetWidth())
	-- fake icon for tracking button
	SquareMinimapButtonBar.icon = SquareMinimapButtonBar:CreateTexture(nil, "OVERLAY")
	SquareMinimapButtonBar.icon:Size(22, 22)
	SquareMinimapButtonBar.icon:Point("CENTER", MiniMapTrackingButton, "CENTER", 0, 0)
	SquareMinimapButtonBar.icon:SetTexture('Interface\\Minimap\\Tracking\\None')
		
-- options (enhanced config)
SquareMinimapButtonOptions = {
	['BarMouseOver'] = false,
	['BarEnabled'] = true,
	['IconSize'] = 22,
	['MoveBlizzard'] = true,
	['ButtonsPerRow'] = 6,
	['ButtonSpacing'] = 2
}

local BorderColor
local TexCoords = { .1, .9, .1, .9 }

-- mouseover function
function SquareMinimapButtonBar:OnEnter()
	UIFrameFadeIn(SquareMinimapButtonBar, 0.2, SquareMinimapButtonBar:GetAlpha(), 1)
	if self:GetName() ~= 'SquareMinimapButtonBar' then
		self:SetBackdropBorderColor(class.r, class.g, class.b)
	end
end

function SquareMinimapButtonBar:OnLeave()
	if SquareMinimapButtonOptions['BarMouseOver'] then
		UIFrameFadeOut(SquareMinimapButtonBar, 0.2, SquareMinimapButtonBar:GetAlpha(), 0)
	end
	if self:GetName() ~= 'SquareMinimapButtonBar' then
		self:SetBackdropBorderColor(unpack(BorderColor))
	end
end

-- skinned buttons
local SkinnedMinimapButtons = {}

local ignoreButtons = {
	'GameTimeFrame',
	'HelpOpenTicketButton',
	'MiniMapVoiceChatFrame',
	'TimeManagerClockButton',
}

local GenericIgnores = {
	'Archy',
	'GatherMatePin',
	'GatherNote',
	'GuildInstance',
	'HandyNotesPin',
	'MinimMap',
	'Spy_MapNoteList_mini',
	'ZGVMarker',
	'poiMinimap',
}

local PartialIgnores = {
	'Node',
	'Note',
	'Pin',
	'POI',
}

local WhiteList = {
	'LibDBIcon',
}

local AcceptedFrames = {
	'BagSync_MinimapButton',
	'VendomaticButtonFrame',
	'MiniMapMailFrame',
	'MiniMapTrackingButton',
}

local AddButtonsToBar = {
	'SmartBuff_MiniMapButton',
	'QueueStatusMinimapButton',
	'MiniMapMailFrame',
}

-- creating buttons for bar
function SquareMinimapButtonBar:SkinMinimapButton(Button)
	if (not Button or Button.isSkinned) then return end

	local Name = Button:GetName()
	if not Name then return end

	if Button:IsObjectType('Button') then
		local ValidIcon = false

		for i = 1, #WhiteList do
			if strsub(Name, 1, strlen(WhiteList[i])) == WhiteList[i] then ValidIcon = true break end
		end

		if not ValidIcon then
			for i = 1, #ignoreButtons do
				if Name == ignoreButtons[i] then return end
			end

			for i = 1, #GenericIgnores do
				if strsub(Name, 1, strlen(GenericIgnores[i])) == GenericIgnores[i] then return end
			end

			for i = 1, #PartialIgnores do
				if strfind(Name, PartialIgnores[i]) ~= nil then return end
			end
		end
		
		if not Name == 'GarrisonLandingPageMinimapButton' then
		Button:SetPushedTexture(nil)
		Button:SetHighlightTexture(nil)
		Button:SetDisabledTexture(nil)
		end
	end
	for i = 1, Button:GetNumRegions() do
		local Region = select(i, Button:GetRegions())
		if Region:GetObjectType() == 'Texture' then
			local Texture = Region:GetTexture()

			if Texture and (strfind(Texture, 'Border') or strfind(Texture, 'Background') or strfind(Texture, 'AlphaMask')) then
				Region:SetTexture(nil)
				if Name == 'MiniMapTrackingButton' then
					Region:SetTexture('Interface\\Minimap\\Tracking\\None')
					Region:ClearAllPoints()
					Region:SetInside()
				end
			else
				if Name == 'BagSync_MinimapButton' then Region:SetTexture('Interface\\AddOns\\BagSync\\media\\icon') end
				if Name == 'DBMMinimapButton' then Region:SetTexture('Interface\\Icons\\INV_Helmet_87') end
				if Name == 'MiniMapMailFrame' then
					Region:ClearAllPoints()
					Region:SetPoint('CENTER', Button)
				end
				if not (Name == 'MiniMapMailFrame' or Name == 'SmartBuff_MiniMapButton') then
					Region:ClearAllPoints()
					Region:SetInside()
					Region:SetTexCoord(unpack(TexCoords))
					Button:HookScript('OnLeave', function(self) Region:SetTexCoord(unpack(TexCoords)) end)
				end
				Region:SetDrawLayer('ARTWORK')
				Region.SetPoint = function() return end
			end
		end
	end

	Button:SetFrameLevel(Minimap:GetFrameLevel() + 5)
	Button:Size(SquareMinimapButtonOptions['IconSize'])

	if Name == 'GarrisonLandingPageMinimapButton' then
		Button:SetScale(1)
	end
	if Name == 'SmartBuff_MiniMapButton' then
		Button:SetNormalTexture("Interface\\Icons\\Spell_Nature_Purge")
		Button:GetNormalTexture():SetTexCoord(unpack(TexCoords))
		Button.SetNormalTexture = function() end
		Button:SetDisabledTexture("Interface\\Icons\\Spell_Nature_Purge")
		Button:GetDisabledTexture():SetTexCoord(unpack(TexCoords))
		Button.SetDisabledTexture = function() end
	elseif Name == 'VendomaticButtonFrame' then
		VendomaticButton:StripTextures()
		VendomaticButton:SetInside()
		VendomaticButtonIcon:SetTexture('Interface\\Icons\\INV_Misc_Rabbit_2')
		VendomaticButtonIcon:SetTexCoord(unpack(TexCoords))
	end
	
	if Name == 'QueueStatusMinimapButton' then
		QueueStatusMinimapButton:HookScript('OnUpdate', function(self)
			QueueStatusMinimapButtonIcon:SetFrameLevel(QueueStatusMinimapButton:GetFrameLevel() + 1)
		end)
		local Frame = CreateFrame('Frame', 'QueueDummyFrame', self)
		Frame:SetTemplate()
		Frame.Icon = Frame:CreateTexture(nil, 'ARTWORK')
		Frame.Icon:SetInside()
		Frame.Icon:SetTexture([[Interface\LFGFrame\LFG-Eye]])
		Frame.Icon:SetTexCoord(0, 64 / 512, 0, 64 / 256)
		Frame:SetScript('OnMouseDown', function()
			if PVEFrame:IsShown() then
				HideUIPanel(PVEFrame)
			else
				ShowUIPanel(PVEFrame)
				GroupFinderFrame_ShowGroupFrame()
			end
		end)
		self:HookScript('OnUpdate', function()
			if SquareMinimapButtonOptions['MoveBlizzard'] then
				QueueDummyFrame:Show()
			else
				QueueDummyFrame:Hide()
			end
		end)
		QueueStatusMinimapButton:HookScript('OnShow', function()
			if SquareMinimapButtonOptions['MoveBlizzard'] then
				QueueDummyFrame:Show()
			else
				QueueDummyFrame:Hide()
			end
		end)
		Frame:HookScript('OnEnter', self.OnEnter)
		Frame:HookScript('OnLeave', self.OnLeave)
		Frame:SetScript('OnUpdate', function(self)
			if QueueStatusMinimapButton:IsShown() then
				self:EnableMouse(false)
			else
				self:EnableMouse(true)
			end
			self:Size(SquareMinimapButtonOptions['IconSize'])
			self:SetFrameStrata(QueueStatusMinimapButton:GetFrameStrata())
			self:SetFrameLevel(QueueStatusMinimapButton:GetFrameLevel())
			self:SetPoint(QueueStatusMinimapButton:GetPoint())
		end)
		
	elseif Name == 'MiniMapMailFrame' then
		local Frame = CreateFrame('Frame', 'MailDummyFrame', self)
		Frame:Size(SquareMinimapButtonOptions['IconSize'])
		Frame:SetTemplate()
		Frame.Icon = Frame:CreateTexture(nil, 'ARTWORK')
		Frame.Icon:SetPoint('CENTER')
		Frame.Icon:Size(18)
		Frame.Icon:SetTexture(MiniMapMailIcon:GetTexture())
		Frame:HookScript('OnEnter', self.OnEnter)
		Frame:HookScript('OnLeave', self.OnLeave)
		Frame:SetScript('OnUpdate', function(self)
			if SquareMinimapButtonOptions['MoveBlizzard'] then
				self:Show()
				self:SetPoint(MiniMapMailFrame:GetPoint())
			else
				self:Hide()
			end
		end)
		MiniMapMailFrame:HookScript('OnShow', function(self) MiniMapMailIcon:SetVertexColor(0, 1, 0) end)
		MiniMapMailFrame:HookScript('OnHide', function(self) MiniMapMailIcon:SetVertexColor(1, 1, 1) end)
	else
		Button:SetTemplate()
		Button:SetBackdropColor(0, 0, 0, 0)
	end

	Button.isSkinned = true
	tinsert(SkinnedMinimapButtons, Button)
end

SquareMinimapButtonBar:RegisterEvent('PLAYER_ENTERING_WORLD')
SquareMinimapButtonBar:RegisterEvent('PLAYER_LOGIN')

-- grabbing buttons and anchoring
function SquareMinimapButtonBar:GrabMinimapButtons()
	for i = 1, Minimap:GetNumChildren() do
		local object = select(i, Minimap:GetChildren())
		if object then
			if object:IsObjectType('Button') and object:GetName() then
				self:SkinMinimapButton(object)
			end
			for _, frame in pairs(AcceptedFrames) do
				if object:IsObjectType('Frame') and object:GetName() == frame then
					self:SkinMinimapButton(object)
				end
			end
		end
	end
end

--update
function SquareMinimapButtonBar:Update()
	MiniMapTrackingButton:Hide()
	if not SquareMinimapButtonOptions['BarEnabled'] then return end

	local AnchorX, AnchorY, MaxX = 0, 1, SquareMinimapButtonOptions['ButtonsPerRow']
	local ButtonsPerRow = SquareMinimapButtonOptions['ButtonsPerRow']
	local NumColumns = ceil(#SkinnedMinimapButtons / ButtonsPerRow)
	local Spacing, Mult = 4, 1
	local Size = SquareMinimapButtonOptions['IconSize']
	local ActualButtons, Maxed = 0

	if NumColumns == 1 and ButtonsPerRow > #SkinnedMinimapButtons then
		ButtonsPerRow = #SkinnedMinimapButtons
	end

	for Key, Frame in pairs(SkinnedMinimapButtons) do
		local Name = Frame:GetName()
		local Exception = false
		for _, Button in pairs(AddButtonsToBar) do
			if Name == Button then
				Exception = true
				if Name == 'SmartBuff_MiniMapButton' then
					SMARTBUFF_MinimapButton_CheckPos = function() end
					SMARTBUFF_MinimapButton_OnUpdate = function() end
				end
				if not SquareMinimapButtonOptions['MoveBlizzard'] and (Name == 'QueueStatusMinimapButton' or Name == 'MiniMapMailFrame') then
					Exception = false
				end
			end
		end
		if SquareMinimapButtonOptions['MoveBlizzard'] and Name == 'MiniMapTrackingButton' then MiniMapTrackingButton:Show() end
		if Frame:IsVisible() and not (Name == 'QueueStatusMinimapButton' or Name == 'MiniMapMailFrame') or Exception then
			AnchorX = AnchorX + 1
			ActualButtons = ActualButtons + 1
			if AnchorX > MaxX then
				AnchorY = AnchorY + 1
				AnchorX = 1
				Maxed = true
			end

			local yOffset = - Spacing - ((Size + Spacing) * (AnchorY - 1))
			local xOffset = Spacing + ((Size + Spacing) * (AnchorX - 1))
			Frame:SetTemplate()
			Frame:SetBackdropColor(0, 0, 0, 0)
			Frame:SetParent(SquareMinimapButtonBar)
			Frame:ClearAllPoints()
			Frame:SetPoint('TOPLEFT', SquareMinimapButtonBar, 'TOPLEFT', xOffset, yOffset)
			Frame:SetSize(SquareMinimapButtonOptions['IconSize'], SquareMinimapButtonOptions['IconSize'])
			Frame:SetFrameStrata('LOW')
			Frame:SetFrameLevel(self:GetFrameLevel() + 2)
			Frame:RegisterForDrag('LeftButton')
			Frame:SetScript('OnDragStart', nil)
			Frame:SetScript('OnDragStop', nil)
			Frame:HookScript('OnEnter', self.OnEnter)
			Frame:HookScript('OnLeave', self.OnLeave)
			if Maxed then ActualButtons = ButtonsPerRow end
			local BarWidth = (Spacing + ((Size * (ActualButtons * Mult)) + ((Spacing * (ActualButtons - 1)) * Mult) + (Spacing * Mult)))
			local BarHeight = (Spacing + ((Size * (AnchorY * Mult)) + ((Spacing * (AnchorY - 1)) * Mult) + (Spacing * Mult)))
			self:SetSize(BarWidth, BarHeight)

		end
	end
	self:Show()
	self:OnEnter()
	self:OnLeave()
end

SquareMinimapButtonBar:SetScript('OnEvent', function(self, event, addon)
	if event == 'PLAYER_LOGIN' then
		QueueStatusMinimapButton:SetParent(Minimap)
		MiniMapTrackingButton:SetParent(Minimap)

		self:SetTemplate('Transparent', true)

		Minimap:SetMaskTexture("Interface\\ChatFrame\\ChatFrameBackground")

		BorderColor = { self:GetBackdropBorderColor() }

		self:SetScript('OnEnter', self.OnEnter)
		self:SetScript('OnLeave', self.OnLeave)

		EP = LibStub('LibElvUIPlugin-1.0', true)
		if EP then
			EP:RegisterPlugin(AddOnName, self.GetOptions)
		else
			self:GetOptions()
		end

		self:RegisterEvent('ADDON_LOADED')
	else
		self:GrabMinimapButtons()
		self:Update()
		self:OnLeave()
	end
end)

local Time = 0
SquareMinimapButtonBar:SetScript('OnUpdate', function(self, elasped)
	Time = Time + elasped
	if Time > 5 then
		self:GrabMinimapButtons()
		self:Update()
		self:OnLeave()
		self:SetScript('OnUpdate', nil)
	end
end)
