------------------------------------------------------------------------------------------
-- MaxUI 3.50 TukUI 17 - LEGION 7.0 -- version: 21-04-2017
------------------------------------------------------------------------------------------

--setting up GAME MENU DATATEXT.

------------------------------------------------------------------------------------------
-- VARIABLES
------------------------------------------------------------------------------------------

local T, C, L = unpack(Tukui) 

------------------------------------------------------------------------------------------
-- GAME MENU BAR
------------------------------------------------------------------------------------------

local Panels = T.Panels
local Movers = T["Movers"]
local class = RAID_CLASS_COLORS[select(2, UnitClass("player"))]

local size = 21
local spacing = 2
local numbuttons = 20

local thickness = 1
local FontSize = 14
local FontFlag = "OUTLINE"
local Font = T.GetFont(C["MaxUI Media"]["Font"])

local function Enable()

---------------------------------------------------------------
-- Button creation function
---------------------------------------------------------------

T.CreateBtn = function(name, parent, w, h, tt_txt) -- 1. Name, 2. Parent, 3. width, 4. height, 5. tooltip text, 6. text on button
	
	local b = CreateFrame("Button", name, parent, "SecureActionButtonTemplate")
	b:Width(w)
	b:Height(h)
	b:SetTemplate()
	
	local btext=b:CreateFontString(nil, "OVERLAY")
		if C["MaxUI Media"]["Font"]== "Caps" then
		btext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\caps.ttf", FontSize, FontFlag)
		elseif C["MaxUI Media"]["Font"] == "Comic" then
		btext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\comic.ttf", FontSize, FontFlag)
		elseif C["MaxUI Media"]["Font"] == "MaxUI" then
		btext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\MaxUI.ttf", FontSize, FontFlag)
		else	
		btext:SetFont(C["Medias"].Font, FontSize, FontFlag)
		end

	b.icon = b:CreateTexture(nil, "OVERLAY")
	b.icon:Size(size-2, size-2)
	b.icon:Point("CENTER", b, "CENTER", 0, 0)
	
	b:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(GameMenuBG, "ANCHOR_TOP", 0, 12)
		GameTooltip:AddLine(tt_txt, 1, 1, 1, 1, 1, 1)
		GameTooltip:Show()
	b:SetBackdropBorderColor(class.r, class.g, class.b)
	b.icon:SetVertexColor(class.r, class.g, class.b)
	end)
	
	b:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	b:SetBackdropBorderColor(unpack(C["General"]["BorderColor"]))
	b.icon:SetVertexColor(1, 1, 1)
	end)
	
	b:SetAttribute("type1", "macro")

	b:CreateOverlayTooltip()
	
end

---------------------------------------------------------------
-- Game Menu
---------------------------------------------------------------
local GameMenuBG = CreateFrame("Frame", "GameMenuBG", UIParent)
GameMenuBG:SetTemplate()
GameMenuBG:SetHeight(size + spacing*2)
GameMenuBG:SetWidth(size*numbuttons + spacing*(numbuttons+1) )
GameMenuBG:Point("BOTTOM", UIParent, "BOTTOM", 0, 3)
GameMenuBG:SetFrameLevel(1)
GameMenuBG:SetFrameStrata("TOOLTIP")
--GameMenuBG:SetAlpha(C["MaxUI Media"]["chatpanelalpha"])
GameMenuBG:Hide()
--Movers:RegisterFrame(GameMenuBG)

--Button 1 - Character Info
T.CreateBtn("GameMenuButton01", GameMenuBG, size, size, "Character Info")
GameMenuButton01:Point("TOPLEFT", GameMenuBG, "TOPLEFT", spacing, -spacing)
GameMenuButton01.icon:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\microbar\char.tga]])
GameMenuButton01:SetScript("OnMouseDown", function(self)
	ToggleCharacter("PaperDollFrame")
end)

--Button 2 - Spellbook
T.CreateBtn("GameMenuButton02", GameMenuBG, size, size, "Spellbook & Abililties")
GameMenuButton02:Point("LEFT", GameMenuButton01, "RIGHT", spacing, 0)
GameMenuButton02.icon:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\microbar\spell.tga]])
GameMenuButton02:SetScript("OnMouseDown", function(self)
	ToggleFrame(SpellBookFrame)
end)

--Button 3 - Talent
T.CreateBtn("GameMenuButton03", GameMenuBG, size, size, "Specialization & Talents")
GameMenuButton03:Point("LEFT", GameMenuButton02, "RIGHT", spacing, 0)
GameMenuButton03:SetAttribute("macrotext1", "/qs")
GameMenuButton03.icon:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\microbar\talent.tga]])
GameMenuButton03:SetScript("OnMouseDown", function(self)
	if (not PlayerTalentFrame) then
	TalentFrame_LoadUI()
	end
	ShowUIPanel(PlayerTalentFrame)
end)

--Button 4 - Achievements
T.CreateBtn("GameMenuButton04", GameMenuBG, size, size, "Achievements")
GameMenuButton04:Point("LEFT", GameMenuButton03, "RIGHT", spacing, 0)
GameMenuButton04.icon:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\microbar\ach.tga]])
GameMenuButton04:SetScript("OnMouseDown", function(self)
	ToggleAchievementFrame()
end)

--Button 5 - Mounts
T.CreateBtn("GameMenuButton05", GameMenuBG, size, size, "Collection Journal: Mounts")
GameMenuButton05:Point("LEFT", GameMenuButton04, "RIGHT", spacing, 0)
GameMenuButton05.icon:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\microbar\pet.tga]])
GameMenuButton05:SetScript("OnMouseDown", function(self)
	ToggleCollectionsJournal(1)
end)

--Button 6 - Pets
T.CreateBtn("GameMenuButton06", GameMenuBG, size, size, "Collection Journal: Pets")
GameMenuButton06:Point("LEFT", GameMenuButton05, "RIGHT", spacing, 0)
GameMenuButton06.icon:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\microbar\pet.tga]])
GameMenuButton06:SetScript("OnMouseDown", function(self)
	ToggleCollectionsJournal(2)
end)

--Button 7 - Toy Box
T.CreateBtn("GameMenuButton07", GameMenuBG, size, size, "Collection Journal: Toy Box")
GameMenuButton07:Point("LEFT", GameMenuButton06, "RIGHT", spacing, 0)
GameMenuButton07.icon:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\microbar\pet.tga]])
GameMenuButton07:SetScript("OnMouseDown", function(self)
	ToggleCollectionsJournal(3)
end)

--Button 8 - Heirlooms
T.CreateBtn("GameMenuButton08", GameMenuBG, size, size, "Collection Journal: Heirlooms")
GameMenuButton08:Point("LEFT", GameMenuButton07, "RIGHT", spacing, 0)
GameMenuButton08.icon:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\microbar\pet.tga]])
GameMenuButton08:SetScript("OnMouseDown", function(self)
	ToggleCollectionsJournal(4)
end)

--Button 9 - Dressing room
T.CreateBtn("GameMenuButton09", GameMenuBG, size, size, "Collection Journal: Transmogrification")
GameMenuButton09:Point("LEFT", GameMenuButton08, "RIGHT", spacing, 0)
GameMenuButton09.icon:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\microbar\pet.tga]])
GameMenuButton09:SetScript("OnMouseDown", function(self)
	ToggleCollectionsJournal(5)
end)

--Button 10 - Social
T.CreateBtn("GameMenuButton10", GameMenuBG, size, size, "Social")
GameMenuButton10:Point("LEFT", GameMenuButton09, "RIGHT", spacing, 0)
GameMenuButton10.icon:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\microbar\social.tga]])
GameMenuButton10:SetScript("OnMouseDown", function(self)
	ToggleFriendsFrame(1)
end)

--Button 11 - PVE LF group tool
T.CreateBtn("GameMenuButton11", GameMenuBG, size, size, "PVE LF Tool")
GameMenuButton11:Point("LEFT", GameMenuButton10, "RIGHT", spacing, 0)
GameMenuButton11.icon:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\microbar\pvp.tga]])
GameMenuButton11:SetScript("OnMouseDown", function(self)
	PVEFrame_ToggleFrame()
end)

--Button 12 - PVP LF tool
T.CreateBtn("GameMenuButton12", GameMenuBG, size, size, "PVP LF Tool")
GameMenuButton12:Point("LEFT", GameMenuButton11, "RIGHT", spacing, 0)
GameMenuButton12.icon:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\microbar\pvp.tga]])
GameMenuButton12:SetScript("OnMouseDown", function(self)
	PVPFrame_ToggleFrame()
end)

--Button 13 - Guild
T.CreateBtn("GameMenuButton13", GameMenuBG, size, size, "Guild")
GameMenuButton13:Point("LEFT", GameMenuButton12, "RIGHT", spacing, 0)
GameMenuButton13.icon:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\microbar\guild.tga]])
GameMenuButton13:SetScript("OnMouseDown", function(self)
	if IsInGuild() then
		if (not GuildFrame) then
		GuildFrame_LoadUI()
		end
		GuildFrame_Toggle()
	else
		if (not LookingForGuildFrame) then
		LookingForGuildFrame_LoadUI()
		end
		LookingForGuildFrame_Toggle()
	end
end)

--Button 14 - Raid
T.CreateBtn("GameMenuButton14", GameMenuBG, size, size, "Raid")
GameMenuButton14:Point("LEFT", GameMenuButton13, "RIGHT", spacing, 0)
GameMenuButton14.icon:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\microbar\social.tga]])
GameMenuButton14:SetScript("OnMouseDown", function(self)
	ToggleFriendsFrame(4)
end)

--Button 15 - Customer Support
T.CreateBtn("GameMenuButton15", GameMenuBG, size, size, "Customer Support")
GameMenuButton15:Point("LEFT", GameMenuButton14, "RIGHT", spacing, 0)
GameMenuButton15.icon:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\microbar\help.tga]])
GameMenuButton15:SetScript("OnMouseDown", function(self)
	ToggleHelpFrame()
end)

--Button 16 - Event Calendar
T.CreateBtn("GameMenuButton16", GameMenuBG, size, size, "Event Calendar")
GameMenuButton16:Point("LEFT", GameMenuButton15, "RIGHT", spacing, 0)
GameMenuButton16.icon:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\menuicons\calendar.tga]])
GameMenuButton16:SetScript("OnMouseDown", function(self)
	if (not CalendarFrame) then
	LoadAddOn("Blizzard_Calendar")
	end
	Calendar_Toggle()
end)

--Button 17 - Dungeon Journal
T.CreateBtn("GameMenuButton17", GameMenuBG, size, size, "Dungeon Journal")
GameMenuButton17:Point("LEFT", GameMenuButton16, "RIGHT", spacing, 0)
GameMenuButton17.icon:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\microbar\journal.tga]])
GameMenuButton17:SetScript("OnMouseDown", function(self)
	ToggleEncounterJournal()
end)

--Button 18 - Garrison Report
T.CreateBtn("GameMenuButton18", GameMenuBG, size, size, "Garrison Report")
GameMenuButton18:Point("LEFT", GameMenuButton17, "RIGHT", spacing, 0)
GameMenuButton18.icon:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\microbar\garrison.tga]])
GameMenuButton18.icon:Size(size-6, size-6)
GameMenuButton18:SetScript("OnMouseDown", function(self)
	GarrisonLandingPageMinimapButton_OnClick()
end)

--Button 19 - Compose a Tweet
T.CreateBtn("GameMenuButton19", GameMenuBG, size, size, "Compose a Tweet")
GameMenuButton19:Point("LEFT", GameMenuButton18, "RIGHT", spacing, 0)
GameMenuButton19.icon:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\microbar\chat.tga]])
GameMenuButton19:SetScript("OnMouseDown", function(self)
		if not SocialPostFrame then
		LoadAddOn("Blizzard_SocialUI")
		end
		local IsTwitterEnabled = C_Social.IsSocialEnabled()
		if IsTwitterEnabled then
		Social_SetShown(true)
		else
		T.Print(SOCIAL_TWITTER_TWEET_NOT_LINKED)
		end
end)

--Button 20 - Hide Game Menu
T.CreateBtn("GameMenuButton20", GameMenuBG, size, size, "Close Game Menu", "")
GameMenuButton20:Point("LEFT", GameMenuButton19, "RIGHT", spacing, 0)
GameMenuButton20:SetAttribute("macrotext1", "/")
GameMenuButton20.icon:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\microbar\menu.tga]])
GameMenuButton20:SetScript("OnMouseDown", function(self)
GameMenuBG:Hide()
end)
RegisterStateDriver(GameMenuBG, "visibility", "[combat] hide; nil")
end

hooksecurefunc(Panels, "Enable", Enable)

------------------------------------------------------------------------------------------
-- GAME MENU DATATEXT
------------------------------------------------------------------------------------------
local DataText = T["DataTexts"]
local Misc = T["Miscellaneous"]
local class = RAID_CLASS_COLORS[select(2, UnitClass("player"))]

local Update = function(self)
	self.Text:SetText("Game Menu")
	
	self:SetScript("OnEnter", function(self)
	self.Text:SetTextColor(class.r, class.g, class.b)
	end)
	
	self:SetScript("OnLeave", function(self)
	self.Text:SetTextColor(1, 1, 1)
	end)
	
end

local Enable = function(self)
	self:SetScript("OnMouseUp", function()
		if C["MaxUI Tools"]["GameMenu"] == true then
		GameMenuBG:Show()
		else
		EasyMenu(Misc.MicroMenu.Buttons, Misc.MicroMenu, "cursor", 0, 0, "MENU", 4)
		end	
	end)
	
	self:Update()
end

local Disable = function(self)
	self:SetScript("OnMouseUp", nil)
end

DataText:Register("Game Menu", Enable, Disable, Update)
