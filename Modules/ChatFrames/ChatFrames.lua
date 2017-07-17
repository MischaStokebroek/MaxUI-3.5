------------------------------------------------------------------------------------------
-- MaxUI 3.50 TukUI 17 - LEGION 7.0 -- version: 21-04-2017
------------------------------------------------------------------------------------------

--setting up CHAT.

------------------------------------------------------------------------------------------
-- LOCALS
------------------------------------------------------------------------------------------

local T, C, L = Tukui:unpack()
local Panels = T.Panels
local Chat = T.Chat
local Noop = function() end

------------------------------------------------------------------------------------------
-- moving and adjusting chatpanels to the corners
------------------------------------------------------------------------------------------
local function Enable()
	local DataTextLeft = Panels.DataTextLeft
	local DataTextRight = Panels.DataTextRight
	local TabsBGRight = Panels.TabsBGRight
	local TabsBGLeft = Panels.TabsBGLeft
	local LeftChatBG = Panels.LeftChatBG
	local RightChatBG = Panels.RightChatBG
	local BottomLine = Panels.BottomLine
	
	-- CHAT LEFT
	LeftChatBG:SetParent(UIParent)
	LeftChatBG:SetTemplate()
	LeftChatBG:SetHeight(142)
	LeftChatBG:SetWidth(390)
	LeftChatBG:Point("BOTTOM", DataTextLeft, "TOP", 0, 2)
	LeftChatBG:SetFrameLevel(1)
	LeftChatBG:SetFrameStrata("BACKGROUND")
	LeftChatBG:SetAlpha(C["MaxUI Media"]["chatpanelalpha"])

	DataTextLeft:ClearAllPoints()
	DataTextLeft:Width(390)
	DataTextLeft:SetPoint("Left", BottomLine, "Left", 10, -1)
	DataTextLeft:Hide()

	TabsBGLeft:ClearAllPoints()
	TabsBGLeft:Width(390)
	TabsBGLeft:SetPoint("TOP", LeftChatBG, "TOP", 0, -2)
	TabsBGLeft:Hide()
	
	-- class art as texture	
	if C["MaxUI Media"]["ClassTexture"] == true then 
		LeftChatBG.Logoclass = LeftChatBG:CreateTexture(nil, "OVERLAY")
		LeftChatBG.Logoclass:Size(142, 142)
		LeftChatBG.Logoclass:Point("CENTER", LeftChatBG, "CENTER", 0, 0)
	end
	
	-- MaxUI as texture	
	if C["MaxUI Media"]["MaxUIlogoChat"] == true and C["MaxUI Media"]["ClassTexture"] == false then 
		LeftChatBG.LogoMaxUI = LeftChatBG:CreateTexture(nil, "OVERLAY")
		LeftChatBG.LogoMaxUI:Size(388, 140)
		LeftChatBG.LogoMaxUI:Point("CENTER", LeftChatBG, "CENTER", 0, 0)
		LeftChatBG.LogoMaxUI:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\Textures\maxui_logo.tga]])
		LeftChatBG.LogoMaxUI:SetAlpha(C["MaxUI Media"]["chatpanelalpha"])
	end

	-- CHAT RIGHT
	RightChatBG:SetParent(UIParent)
	RightChatBG:SetTemplate()
	RightChatBG:SetHeight(142)
	RightChatBG:SetWidth(390)
	RightChatBG:Point("BOTTOM", DataTextRight, "TOP", 0, 2)
	RightChatBG:SetFrameLevel(1)
	RightChatBG:SetFrameStrata("BACKGROUND")
	RightChatBG:SetAlpha(C["MaxUI Media"]["chatpanelalpha"])

	DataTextRight:ClearAllPoints()
	DataTextRight:Width(390)
	DataTextRight:SetPoint("RIGHT", BottomLine, "RIGHT", -10, -1)
	DataTextRight:Hide()

	TabsBGRight:ClearAllPoints()
	TabsBGRight:Width(390)
	TabsBGRight:SetPoint("TOP", RightChatBG, "TOP", 0, -2)
	TabsBGRight:Hide()

	-- class art as texture	
	if C["MaxUI Media"]["ClassTexture"] == true then 
		RightChatBG.Logoclass = RightChatBG:CreateTexture(nil, "OVERLAY")
		RightChatBG.Logoclass:Size(142, 142)
		RightChatBG.Logoclass:Point("CENTER", RightChatBG, "CENTER", 0, 0)
	end

	-- MaxUI as texture	
	if C["MaxUI Media"]["MaxUIlogoChat"] == true and C["MaxUI Media"]["ClassTexture"] == false then 
		RightChatBG.LogoMaxUI = RightChatBG:CreateTexture(nil, "OVERLAY")
		RightChatBG.LogoMaxUI:Size(388, 140)
		RightChatBG.LogoMaxUI:SetAlpha(C["MaxUI Media"]["chatpanelalpha"])
		RightChatBG.LogoMaxUI:Point("CENTER", RightChatBG, "CENTER", 0, 0)
		RightChatBG.LogoMaxUI:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\Textures\maxui_logo.tga]])
	end

	-- CHAT CLASS TEXTURE BG
	if C["MaxUI Media"]["ClassTexture"] == true then 
		if select(2, UnitClass('player')) == "DRUID" then
			LeftChatBG.Logoclass:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\ClassIcons\DRUID.tga]])
			RightChatBG.Logoclass:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\ClassIcons\DRUID.tga]])
		end
		
		if select(2, UnitClass('player')) == "MONK" then
			LeftChatBG.Logoclass:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\ClassIcons\MONK.tga]])
			RightChatBG.Logoclass:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\ClassIcons\MONK.tga]])
		end
		
		if select(2, UnitClass('player')) == "ROGUE" then
			LeftChatBG.Logoclass:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\ClassIcons\ROGUE.tga]])
			RightChatBG.Logoclass:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\ClassIcons\ROGUE.tga]])
		end
		
		if select(2, UnitClass('player')) == "MAGE" then
			LeftChatBG.Logoclass:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\ClassIcons\MAGE.tga]])
			RightChatBG.Logoclass:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\ClassIcons\MAGE.tga]])
		end
		
		if select(2, UnitClass('player')) == "PRIEST" then
			LeftChatBG.Logoclass:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\ClassIcons\PRIEST.tga]])
			RightChatBG.Logoclass:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\ClassIcons\PRIEST.tga]])
		end
		
		if select(2, UnitClass('player')) == "WARLOCK" then
			LeftChatBG.Logoclass:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\ClassIcons\WARLOCK.tga]])
			RightChatBG.Logoclass:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\ClassIcons\WARLOCK.tga]])
		end
		
		if select(2, UnitClass('player')) == "SHAMAN" then
			LeftChatBG.Logoclass:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\ClassIcons\SHAMAN.tga]])
			RightChatBG.Logoclass:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\ClassIcons\SHAMAN.tga]])
		end
		
		if select(2, UnitClass('player')) == "HUNTER" then
			LeftChatBG.Logoclass:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\ClassIcons\HUNTER.tga]])
			RightChatBG.Logoclass:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\ClassIcons\HUNTER.tga]])
		end
		
		if select(2, UnitClass('player')) == "DEATHKNIGHT" then
			LeftChatBG.Logoclass:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\ClassIcons\DEATHKNIGHT.tga]])
			RightChatBG.Logoclass:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\ClassIcons\DEATHKNIGHT.tga]])
		end
		
		if select(2, UnitClass('player')) == "WARRIOR" then
			LeftChatBG.Logoclass:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\ClassIcons\WARRIOR.tga]])
			RightChatBG.Logoclass:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\ClassIcons\WARRIOR.tga]])
		end
	
		if select(2, UnitClass('player')) == "PALADIN" then
			LeftChatBG.Logoclass:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\ClassIcons\PALADIN.tga]])
			RightChatBG.Logoclass:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\ClassIcons\PALADIN.tga]])
		end

		if select(2, UnitClass('player')) == "DEMONHUNTER" then
			LeftChatBG.Logoclass:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\ClassIcons\DEMONHUNTER.tga]])
			RightChatBG.Logoclass:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\ClassIcons\DEMONHUNTER.tga]])
		end
	end

	-- CHAT PANELS VISIBILITY OPTION
	if C["MaxUI Media"]["Chatpanels"] == true then
		LeftChatBG:Show()
		RightChatBG:Show()
	else	
		LeftChatBG:Hide()
		RightChatBG:Hide()
	end

	
	if C["MaxUI CombatFade"]["ChatBG"] == true and C["MaxUI Media"]["Chatpanels"] == true then
	RegisterStateDriver(LeftChatBG, "visibility", "[combat] hide; show")
	RegisterStateDriver(RightChatBG, "visibility", "[combat] hide; show")
	end
	
end

hooksecurefunc(Panels, "Enable", Enable)

------------------------------------------------------------------------------------------
-- BNet toast frame anchoring
------------------------------------------------------------------------------------------
local function SkinToastFrame(self)
	local Toast = BNToastFrame
	local DataTextLeft = T.Panels.DataTextLeft

	Toast:HookScript("OnShow", function()
		Toast:ClearAllPoints()
		Toast:SetPoint("BOTTOMLEFT", DataTextLeft, "TOPLEFT", 0, 170)
	end)	
end

hooksecurefunc(Chat, "SkinToastFrame", SkinToastFrame)