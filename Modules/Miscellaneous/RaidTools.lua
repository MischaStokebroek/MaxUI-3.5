------------------------------------------------------------------------------------------
-- MaxUI 3.50 TukUI 17 - LEGION 7.0 -- version: 21-04-2017
------------------------------------------------------------------------------------------

--setting up RAID TOOLS.

------------------------------------------------------------------------------------------
-- VARIABLES
------------------------------------------------------------------------------------------

local T, C, L = Tukui:unpack()
local Panels = T.Panels
local class = RAID_CLASS_COLORS[select(2, UnitClass("player"))]

local thickness = 1
local FontSize = 14
local FontFlag = "OUTLINE"
local Font = T.GetFont(C["MaxUI Media"]["Font"])

local function Enable()

------------------------------------------------------------------------------------------
-- Button creation function
------------------------------------------------------------------------------------------

T.CreateBtn = function(name, parent, w, h, tt_txt, txt) -- 1. Name, 2. Parent, 3. width, 4. height, 5. tooltip text, 6. text on button
	
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

	btext:SetText(txt)
	btext:SetTextColor(1, 1, 1)
	btext:SetPoint("CENTER", b, 'CENTER', 0, 0)
	btext:SetJustifyH("CENTER")	
	
	b:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(RIGHTChatline, "ANCHOR_TOP", 0, -20)
		GameTooltip:AddLine(tt_txt, 1, 1, 1, 1, 1, 1)
		GameTooltip:Show()
	btext:SetTextColor(class.r, class.g, class.b)
	b:SetBackdropBorderColor(class.r, class.g, class.b)
	end)
	
	b:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	btext:SetTextColor(1, 1, 1)
	b:SetBackdropBorderColor(unpack(C["General"]["BorderColor"]))
	end)
	
	b:SetAttribute("type1", "macro")
	
	b.icon = b:CreateTexture(nil, "OVERLAY")
	b.icon:Size(17, 17)
	b.icon:Point("CENTER", b, "CENTER", 0, 0)
	
	b:CreateOverlayTooltip()
end

------------------------------------------------------------------------------------------
-- RAID TOOLS
------------------------------------------------------------------------------------------

if C["MaxUI Tools"]["RaidTools"] == true then

-- raid tool background
local raidtoolbg = CreateFrame("Frame", "raidtoolbg", UIParent)
raidtoolbg:SetTemplate()
raidtoolbg:SetHeight(142)
raidtoolbg:SetWidth(390)
raidtoolbg:Point("TOP", RIGHTChatline, "BOTTOM", -5, -16)
raidtoolbg:SetFrameLevel(1)
raidtoolbg:SetFrameStrata("BACKGROUND")
raidtoolbg:SetAlpha(C["MaxUI Media"]["chatpanelalpha"])
	if C["MaxUI Media"]["Chatpanels"] == true then
		raidtoolbg:SetAlpha(0)
	end
raidtoolbg:Hide()

	-- Raid Marker
	local Line01 = CreateFrame("Frame", "Line01", UIParent)
	Line01:SetTemplate()
	Line01:Size(380, thickness)
	Line01:Point("TOP", raidtoolbg, "TOP", 0, -26)
	Line01:SetFrameLevel(2)
	Line01:SetFrameStrata("BACKGROUND")
	Line01:SetAlpha(1)
	Line01:Hide()
	
		local Raidmarkertext = Line01:CreateFontString(nil, "OVERLAY")
		if C["MaxUI Media"]["Font"] == "Caps" then
			Raidmarkertext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\caps.ttf", FontSize, FontFlag)
		elseif C["MaxUI Media"]["Font"] == "Comic" then
			Raidmarkertext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\comic.ttf", FontSize, FontFlag)
		elseif C["MaxUI Media"]["Font"] == "MaxUI" then
			Raidmarkertext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\MaxUI.ttf", FontSize, FontFlag)
		else	
			Raidmarkertext:SetFont(C["Medias"].Font, FontSize, FontFlag)
		end
		Raidmarkertext:Point("LEFT", Line01, "LEFT", 4, 0)
		Raidmarkertext:SetText("Raid Marker:")
			
	-- worldmarkers
	local Line02 = CreateFrame("Frame", "Line02", UIParent)
	Line02:SetTemplate()
	Line02:Size(380, thickness)
	Line02:Point("TOP", raidtoolbg, "TOP", 0, -56)
	Line02:SetFrameLevel(2)
	Line02:SetFrameStrata("BACKGROUND")
	Line02:SetAlpha(1)
	Line02:Hide()

		local worldmarkerstext = Line02:CreateFontString(nil, "OVERLAY")
		if C["MaxUI Media"]["Font"] == "Caps" then
			worldmarkerstext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\caps.ttf", FontSize, FontFlag)
		elseif C["MaxUI Media"]["Font"] == "Comic" then
			worldmarkerstext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\comic.ttf", FontSize, FontFlag)
		elseif C["MaxUI Media"]["Font"] == "MaxUI" then
			worldmarkerstext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\MaxUI.ttf", FontSize, FontFlag)
		else	
			worldmarkerstext:SetFont(C["Medias"].Font, 14, "OUTLINE")
		end
		worldmarkerstext:Point("LEFT", Line02, "LEFT", 4, 0)
		worldmarkerstext:SetText("World Marker:")

	-- commands
	local Line03 = CreateFrame("Frame", "Line03", UIParent)
	Line03:SetTemplate()
	Line03:Size(380, thickness)
	Line03:Point("TOP", raidtoolbg, "TOP", 0, -86)
	Line03:SetFrameLevel(2)
	Line03:SetFrameStrata("BACKGROUND")
	Line03:SetAlpha(1)
	Line03:Hide()

		local commandstext = Line03:CreateFontString(nil, "OVERLAY")
		if C["MaxUI Media"]["Font"] == "Caps" then
			commandstext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\caps.ttf", FontSize, FontFlag)
		elseif C["MaxUI Media"]["Font"] == "Comic" then
			commandstext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\comic.ttf", FontSize, FontFlag)
		elseif C["MaxUI Media"]["Font"] == "MaxUI" then
			commandstext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\MaxUI.ttf", FontSize, FontFlag)
		else	
			commandstext:SetFont(C["Medias"].Font, FontSize, FontFlag)
		end
		commandstext:Point("LEFT", Line03, "LEFT", 4, 0)
		commandstext:SetText("Commands:")

	-- raidbuffs
	local Line04 = CreateFrame("Frame", "Line04", UIParent)
	Line04:SetTemplate()
	Line04:Size(380, thickness)
	Line04:Point("TOP", raidtoolbg, "TOP", 0, -116)
	Line04:SetFrameLevel(2)
	Line04:SetFrameStrata("BACKGROUND")
	Line04:SetAlpha(1)
	Line04:Hide()

		local Runedtext = Line04:CreateFontString(nil, "OVERLAY")
		if C["MaxUI Media"]["Font"] == "Caps" then
			Runedtext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\caps.ttf", FontSize, FontFlag)
		elseif C["MaxUI Media"]["Font"] == "Comic" then
			Runedtext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\comic.ttf", FontSize, FontFlag)
		elseif C["MaxUI Media"]["Font"] == "MaxUI" then
			Runedtext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\MaxUI.ttf", FontSize, FontFlag)
		else	
			Runedtext:SetFont(C["Medias"].Font, FontSize, FontFlag)
		end
		Runedtext:Point("LEFT", Line04, "LEFT", 4, 0)
		Runedtext:SetText("Rune used:")

		local Wellfedtext = Line04:CreateFontString(nil, "OVERLAY")
		if C["MaxUI Media"]["Font"] == "Caps" then
			Wellfedtext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\caps.ttf", FontSize, FontFlag)
		elseif C["MaxUI Media"]["Font"] == "Comic" then
			Wellfedtext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\comic.ttf", FontSize, FontFlag)
		elseif C["MaxUI Media"]["Font"] == "MaxUI" then
			Wellfedtext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\MaxUI.ttf", FontSize, FontFlag)
		else	
			Wellfedtext:SetFont(C["Medias"].Font, FontSize, FontFlag)
		end
		Wellfedtext:Point("CENTER", Line04, "CENTER", -14, 0)
		Wellfedtext:SetText("Food Buffed:")

		local flaskedtext = Line04:CreateFontString(nil, "OVERLAY")
		if C["MaxUI Media"]["Font"] == "Caps" then
			flaskedtext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\caps.ttf", FontSize, FontFlag)
		elseif C["MaxUI Media"]["Font"] == "Comic" then
			flaskedtext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\comic.ttf", FontSize, FontFlag)
		elseif C["MaxUI Media"]["Font"] == "MaxUI" then
			flaskedtext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\MaxUI.ttf", FontSize, FontFlag)
		else	
			flaskedtext:SetFont(C["Medias"].Font, FontSize, FontFlag)
		end
		flaskedtext:Point("RIGHT", Line04, "RIGHT", -32, 0)
		flaskedtext:SetText("Flask/Elixir:")
		
		
	-- show hide button
	local ShowHideRaid = CreateFrame("Button", "ShowHideRaid", RIGHTChatline)
	ShowHideRaid:SetTemplate()
	ShowHideRaid:Size((400/3), 20)
	ShowHideRaid:Point("CENTER", RIGHTChatline, "CENTER", 0, 0)
	ShowHideRaid:SetFrameLevel(2)
	ShowHideRaid:SetFrameStrata("BACKGROUND")
	ShowHideRaid:SetAlpha(0)

		local RaidToolsText = RIGHTChatline:CreateFontString(nil, "OVERLAY")
		if C["MaxUI Media"]["Font"] == "Caps" then
			RaidToolsText:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\caps.ttf", FontSize, FontFlag)
		elseif C["MaxUI Media"]["Font"] == "Comic" then
			RaidToolsText:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\comic.ttf", FontSize, FontFlag)
		elseif C["MaxUI Media"]["Font"] == "MaxUI" then
			RaidToolsText:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\MaxUI.ttf", FontSize, FontFlag)
		else	
			RaidToolsText:SetFont(C["Medias"].Font, FontSize, FontFlag)
		end
			RaidToolsText:Point("CENTER", RIGHTChatline, "CENTER", -4, 0)
		RaidToolsText:SetText("Raid Tools")
	
		RIGHTChatline.iconmiddle = RIGHTChatline:CreateTexture(nil, "OVERLAY")
		RIGHTChatline.iconmiddle:Size(17, 17)
		RIGHTChatline.iconmiddle:Point("CENTER", RIGHTChatline, "CENTER", 44, 0)
		RIGHTChatline.iconmiddle:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\markers\skull.blp]])
	
	ShowHideRaid:SetScript("OnEnter", function(self)
	RaidToolsText:SetTextColor(class.r, class.g, class.b)
	RIGHTChatline.iconmiddle:SetVertexColor(class.r, class.g, class.b)
	end)
	
	ShowHideRaid:SetScript("OnLeave", function(self)
	RaidToolsText:SetTextColor(1, 1, 1)
	RIGHTChatline.iconmiddle:SetVertexColor(1, 1, 1)
	end)
	
------------------------------------------------------------------------------------------
-- Raid Markers
------------------------------------------------------------------------------------------

-- Button 1 - White/Skull
T.CreateBtn("mbbutton01", Line01, 19, 19, "Set Raid Marker |cffFFFFFFSKULL|r", "")
mbbutton01:Point("LEFT", Line01, "LEFT", 110, 0)
mbbutton01:SetAttribute("macrotext1", "/tm 8")
	mbbutton01.icon:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\markers\skull.blp]])

-- Button 2 - Red/Cross
T.CreateBtn("mbbutton02", Line01, 19, 19, "Set Raid Marker |cffFF0000CROSS|r", "")
mbbutton02:Point("LEFT", mbbutton01, "RIGHT", 5, 0)
mbbutton02:SetAttribute("macrotext1", "/tm 7")
	mbbutton02.icon:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\markers\cross.blp]])

-- Button 3 - Blue/Square
T.CreateBtn("mbbutton03", Line01, 19, 19, "Set Raid Marker |cff0080FFSQUARE|r", "")
mbbutton03:Point("LEFT", mbbutton02, "RIGHT", 5, 0)
mbbutton03:SetAttribute("macrotext1", "/tm 6")
	mbbutton03.icon:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\markers\square.blp]])

-- Button 4 - Grey/Moon
T.CreateBtn("mbbutton04", Line01, 19, 19, "Set Raid Marker |cffCCCCFFMOON|r", "")
mbbutton04:Point("LEFT", mbbutton03, "RIGHT", 5, 0)
mbbutton04:SetAttribute("macrotext1", "/tm 5")
	mbbutton04.icon:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\markers\moon.blp]])

-- Button 5 - Green/Triangle
T.CreateBtn("mbbutton05", Line01, 19, 19, "Set Raid Marker |cff33FF33TRIANGLE|r", "")
mbbutton05:Point("LEFT", mbbutton04, "RIGHT", 5, 0)
mbbutton05:SetAttribute("macrotext1", "/tm 4")
	mbbutton05.icon:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\markers\triangle.blp]])

-- Button 6 - Purple/Diamond
T.CreateBtn("mbbutton06", Line01, 19, 19, "Set Raid Marker |cffFF00FFDIAMOND|r", "")
mbbutton06:Point("LEFT", mbbutton05, "RIGHT", 5, 0)
mbbutton06:SetAttribute("macrotext1", "/tm 3")
	mbbutton06.icon:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\markers\diamond.blp]])

-- Button 7 - Orange/Circle
T.CreateBtn("mbbutton07", Line01, 19, 19, "Set Raid Marker |cffFF8000CIRCLE|r", "")
mbbutton07:Point("LEFT", mbbutton06, "RIGHT", 5, 0)
mbbutton07:SetAttribute("macrotext1", "/tm 2")
	mbbutton07.icon:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\markers\circle.blp]])

-- Button 8 - Yellow Star
T.CreateBtn("mbbutton08", Line01, 19, 19, "Set Raid Marker |cffFFFF00STAR|r", "")
mbbutton08:Point("LEFT", mbbutton07, "RIGHT", 5, 0)
mbbutton08:SetAttribute("macrotext1", "/tm 1")
	mbbutton08.icon:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\markers\star.blp]])
	
-- Button Clear Raid Marker
T.CreateBtn("clearraidmarker", Line01, 70, 19, "Clear Target Marker", "Clear")
clearraidmarker:Point("LEFT", mbbutton08, "RIGHT", 5, 0)
clearraidmarker:SetAttribute("macrotext1", "/tm 0")

---------------------------------------------------------------
-- World Markers / flares
---------------------------------------------------------------

-- Button 1 - White/Skull
T.CreateBtn("wbbutton01", Line02, 19, 19, "Set World Marker |cffFFFFFFSKULL|r", "")
wbbutton01:Point("LEFT", Line02, "LEFT", 110, 0)
wbbutton01:SetAttribute("macrotext1", "/wm 8")
	wbbutton01.icon:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\flares\white.tga]])

-- Button 2 - Red/Cross
T.CreateBtn("wbbutton02", Line02, 19, 19, "Set World Marker |cffFF0000CROSS|r", "")
wbbutton02:Point("LEFT", wbbutton01, "RIGHT", 5, 0)
wbbutton02:SetAttribute("macrotext1", "/wm 4")
	wbbutton02.icon:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\flares\red.tga]])

-- Button 3 - blue/square
T.CreateBtn("wbbutton03", Line02, 19, 19, "Set World Marker |cff0080FFSQUARE|r", "")
wbbutton03:Point("LEFT", wbbutton02, "RIGHT", 5, 0)
wbbutton03:SetAttribute("macrotext1", "/wm 1")
	wbbutton03.icon:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\flares\blue.tga]])

-- Button 4 - gray/moon
T.CreateBtn("wbbutton04", Line02, 19, 19, "Set World Marker |cffCCCCFFMOON|r", "")
wbbutton04:Point("LEFT", wbbutton03, "RIGHT", 5, 0)
wbbutton04:SetAttribute("macrotext1", "/wm 7")
	wbbutton04.icon:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\flares\grey.tga]])

-- Button 5 - green/triangle
T.CreateBtn("wbbutton05", Line02, 19, 19, "Set World Marker |cff33FF33TRIANGLE|r", "")
wbbutton05:Point("LEFT", wbbutton04, "RIGHT", 5, 0)
wbbutton05:SetAttribute("macrotext1", "/wm 2")
	wbbutton05.icon:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\flares\green.tga]])

-- Button 6 - purple/diamond
T.CreateBtn("wbbutton06", Line02, 19, 19, "Set World Marker |cffFF00FFDIAMOND|r", "")
wbbutton06:Point("LEFT", wbbutton05, "RIGHT", 5, 0)
wbbutton06:SetAttribute("macrotext1", "/wm 3")
	wbbutton06.icon:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\flares\purple.tga]])

-- Button 7 - orange/circle
T.CreateBtn("wbbutton07", Line02, 19, 19, "Set World Marker |cffFF8000CIRCLE|r", "")
wbbutton07:Point("LEFT", wbbutton06, "RIGHT", 5, 0)
wbbutton07:SetAttribute("macrotext1", "/wm 6")
	wbbutton07.icon:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\flares\orange.tga]])

-- Button 8 - yellow/star
T.CreateBtn("wbbutton08", Line02, 19, 19, "Set World Marker |cffFFFF00STAR|r", "")
wbbutton08:Point("LEFT", wbbutton07, "RIGHT", 5, 0)
wbbutton08:SetAttribute("macrotext1", "/wm 5")
	wbbutton08.icon:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\flares\yellow.tga]])

-- Button clearworldmarkers
T.CreateBtn("clearworldmarkers", Line02, 70, 19, "Clear World Markers", "Clear")
clearworldmarkers:Point("LEFT", wbbutton08, "RIGHT", 5, 0)
clearworldmarkers:SetAttribute("macrotext1", "/cwm 0")

---------------------------------------------------------------
-- Raid Commands
---------------------------------------------------------------

-- Button Readycheck
T.CreateBtn("rcbutton", Line03, 62, 19, "Start a readycheck", "")
rcbutton:Point("LEFT", Line03, "LEFT", 110, 0)
rcbutton:SetAttribute("macrotext1", "/readycheck")
	rcbutton.icon:Size(34, 17)
	rcbutton.icon:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\Textures\readycheck.tga]])

-- Button Set Main Tank
T.CreateBtn("maintankbutton", Line03, 62, 19, "Set Main Tank", "")
maintankbutton:Point("LEFT", rcbutton, "RIGHT", 5, 0)
maintankbutton:SetAttribute("macrotext1", "/mt")
	maintankbutton.icon:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\Textures\tank2.tga]])

-- Button Set Main Assist
T.CreateBtn("mainassistbutton", Line03, 62, 19, "Set Main Assist", "")
mainassistbutton:Point("LEFT", maintankbutton, "RIGHT", 5, 0)
mainassistbutton:SetAttribute("macrotext1", "/ma")
	mainassistbutton.icon:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\Textures\mainassist.tga]])


-- Pull Timer
T.CreateBtn("pulltimer", Line03, 62, 19, "Start a DBM pull timer", "Pull")
pulltimer:Point("LEFT", mainassistbutton, "RIGHT", 5, 0)
pulltimer:SetAttribute("macrotext1", "/dbm pull 10")
	

------------------------------------------------------------------------------------------
-- RAIDBUFFTRACKER - Spell list ALL
------------------------------------------------------------------------------------------
	Spell1Buff = { --Stats
		115921,				-- Legacy of the Emperor
		116781,				-- Legacy of the White Tiger
		20217,				-- Blessing of Kings
		159988,				-- Bark of the Wild (Hunterpet)
		160017,				-- Blessing of Kongs (Hunterpet)
		90363,				-- Embrace of the Shale Spider (Hunterpet)
		160077,				-- Strength of the Earth (Hunterpet)
		1126, 				-- Mark of the Wild  (DEFAULT)
	}
	
	Spell2Buff = { -- Stamina
		166928,				-- Blood Pact
		469,				-- Commanding Shout
		50256,				-- Invigorating Roar (Hunterpet)
		160014,				-- Sturdiness (Hunterpet)
		160003,				-- Savage Vigor (Hunterpet)
		90364,				-- Qiraji Fortitude (Hunterpet)
		21562,				-- Power Word: Fortitude  (DEFAULT)
	}

	Spell4Buff = { -- Haste
		49868,				-- Mind Quickening
		113742,				-- Swiftblade's Cunning
		116956,				-- Grace of Air
		128432,				-- Crackling Howl (Hunterpet)
		160003,				-- Savage Vigor (Hunterpet)
		135678,				-- Energizing Spores (Hunterpet)
		160074,				-- Speed of the Swarm (Hunterpet)
		55510,				-- Unholy Aura (DEFAULT)

	}

	Spell5Buff = { 			-- Critical Strike
		1459,				-- Arcane Brilliance
		24932,				-- Leader of the Pack
		24604,				-- Wolf - Furious Howl
		61316,				-- Dalaran Brilliance
		90309,				-- Devilsaur - Terrifying Roar
		90363,				-- Shale Spider - Embrace of the Shale Spider
		126309,				-- Waterstrider - Still Water
		126373,				-- Quilen - Fearless Roar
		160052,				-- Raptor - Strength of the Pack
		116781,				-- Legacy of the White Tiger  (DEFAULT)
	}

	Spell6Buff = { 			-- Mastery
		155522,				-- Power of the Grave
		24907,				-- Moonkin Aura
		116956,				-- Grace of Air
		93435,				-- Roar of Courage (Hunterpet)
		160039,				-- Keen Senses (Hunterpet)
		128997,				-- Spirit Beast Blessing (Hunterpet)
		160073,				-- Plainswalking (Hunterpet)
		19740,				-- Blessing of Might  (DEFAULT)
	}
	
	Spell7Buff	 = { 		-- Multistrike
		24844,				-- Wind Serpent - Breath of the Winds
		34889,				-- Dragonhawk - Spry Attacks
		49868,				-- Mind Quickening
		50519,				-- Bat - Sonic Focus
		57386,				-- Clefthoof - Wild Strength
		58604,				-- Core Hound - Double Bite
		109773,				-- Dark Intent
		113742,				-- Swiftblade's Cunning
		166916,				-- Windflurry  (DEFAULT)
	}

	Spell8Buff	 = { 		-- Versatility 
		1126,				-- Mark of the Wild
		35290,				-- Boar - Indomitable
		50518,				-- Ravager - Chitinous Armor
		55610,				-- Unholy Aura
		57386,				-- Clefthoof - Wild Strength
		159735,				-- Bird of Prey - Tenacity
		160045,				-- Porcupine - Defensive Quills
		160077,				-- Worm - Strength of the Earth
		167188,				-- Inspiring Presence
		173035,				-- Stag - Grace
		167187,				-- Sanctity Aura  (DEFAULT)
	}
	
------------------------------------------------------------------------------------------
-- Spell list CASTERS
------------------------------------------------------------------------------------------
	Spell3aBuff = { 		-- Spell Power
		61316,				-- Dalaran Brilliance
		109773,				-- Dark Intent
		128433,				-- Serpent's Cunning (Hunterpet)
		90364,				-- Qiraji Fortitude (Hunterpet)
		126309,				-- Still Water (Hunterpet)
		1459,				-- Arcane Brilliance  (DEFAULT)
	}

------------------------------------------------------------------------------------------
-- Spell list NON-CASTERS
------------------------------------------------------------------------------------------
	Spell3bBuff = { 		-- Attack Power
		57330,				-- Horn of Winter
		19506,				-- Trueshot Aura
		6673,				-- Battle Shout (Set as default template)
	}
	
------------------------------------------------------------------------------------------
-- Food, Flask/Elixir, Augemented Runes 
------------------------------------------------------------------------------------------
	Spell9Buff	 = { 		-- Flask or elixir
							
							-- Level 90 flasks
		105617,				-- Alchemist's Flask (75525) Agility, Strength, or Intellect
		105689,				-- Flask of Spring Blossoms (76084)
		105691,				-- Flask of the Warm Sun (76085)
		105693,				-- Flask of Falling Leaves (76086)
		105694,				-- Flask of the Earth (76087)
		105696,				-- Flask of Winter's Bite (76088)
		127230,				-- Crystal of Insanity (86569)

							-- Level 100 flasks
		156079,     		-- Greater Draenic Intellect Flask (109155)
		156070,				-- Draenic Intellect Flask (109147)
		156064,				-- Greater Draenic Agility Flask (109153)
		156071,				-- Draenic Strength Flask (109148)
		156073,				-- Draenic Agility Flask (109145)
		156077,				-- Draenic Stamina Flask (109152)
		156080,				-- Greater Draenic Strength Flask (109156)
		156084,				-- Greater Draenic Stamina Flask (109160)
		176151,    			-- Crystal of Insanity (127230)
		
							-- Level 110 Flasks
		188034,				-- flask of the countless armies (1300 str)					
		188035,				-- flask of the thousand Scars (1950 Sta)					
		188033,				-- flask of the Seventh Demon (1300 agi)					
		188031,				-- flask of the Whispered Pact (1300 int)					
							
		-- battle elixirs
		105682,				-- Mad Hozen Elixir (76076)  Battle
		105683,				-- Elixir of Weaponry (76077)  Battle
		105684,				-- Elixir of the Rapids (76078)  Battle
		105685,				-- Elixir of Peace (76079)  Battle
		105686,				-- Elixir of Perfection (76080)  Battle
		105688,				-- Monk's Elixir (76083)  Battle
		-- guardian elixirs
		105681,				-- Mantid Elixir (76075)  Guardian
		105687,				-- Elixir of Mirrors (76081)  Guardian
		
		105694,				-- Flask of the Earth (76087) (DEFAULT)

	}
	
	Spell10Buff	 = { 		-- Food
		-- Level 90
		146804,		-- Fluffy Silkfeather Omelet (101750)
		104272,		-- Black Pepper Ribs and Shrimp (74646)
		104271,		-- Eternal Blossom Fish (74645)
		104267,		-- Charbroiled Tiger Steak (74642)
		
		146805,		-- Seasoned Pomfruit Slices (101746)
		104275,		-- Sea Mist Rice Noodles (74648)
		104274,		-- Valley Stir Fry (74647)
		104273,		-- Sauteed Carrots (74643)
		
		146806,		-- Spiced Blossom Soup (101748)
		104277,		-- Mogu Fish Stew (74650)
		104276,		-- Braised Turtle (74649)
		104264,		-- Swirling Mist Soup (74644)
		
		146807,		-- Farmer's Delight (101747)
		104280,		-- Steamed Crab Surprise (74653)
		104279,		-- Fire Spirit Salmon (74652)
		104278,		-- Shrimp Dumplings (74651)
		
		104283,		-- Chun Tian Spring Rolls (74656)
		146808,		-- Stuffed Lushrooms (101749)
		104282,		-- Twin Fish Platter (74655)
		104281,		-- Wildfowl Roast (74654)
		111840,		-- Half a Lovely Apple (79320)
		
		124219,		-- Pearl Milk Tea (81414)
		146809,		-- Mango Ice (101745)
		124219,		-- Hot Papaya Milk (105721)
		124219,		-- Dented Can of Kaja'Cola (98127)
		124219,		-- Grilled Dinosaur Haunch (94535)
		124213,		-- Roasted Barley Tea (81406)
		131828,		-- Mah's Warm Yak-Tail Stew (90457)
		
		125113,		-- Spicy Salmon (86073)
		125106,		-- Wildfowl Ginseng Soup (86070)
		124221,		-- Peanut Pork Chops (105723)
		124221,		-- Skewered Peanut Chicken (81413)
		124221,		-- Mechanopeep Foie Gras (98126)
		124221,		-- Spicy Mushan Noodles (104342)
		124215,		-- Boiled Silkworm Pupa (81405)
		
		125115,		-- Spicy Vegetable Chips (86074)
		125108,		-- Rice Pudding (86069)
		124216,		-- Red Bean Bun (81408)
		124210,		-- Pounded Rice Cake (81400)
		
		124220,		-- Blanched Needle Mushrooms (81412)
		124220,		-- Shaved Zangar Truffles (98125)
		124220,		-- Crazy Snake Noodles (104340)
		124220,		-- Rice-Wine Mushrooms (105717)
		124214,		-- Dried Needle Mushrooms (81404)
		
		125071,		-- Peach Pie (81411)
		125071,		-- Candied Apple (105720)
		125071,		-- Bloodberry Tart (98124)
		125071,		-- Harmonious River Noodles (104339)
		125070,		-- Dried Peaches (81403)
		
		124218,		-- Brew-Curried Whitefish (105719)
		124218,		-- Green Curry Fish (81410)
		124218,		-- Lucky Mushroom Noodles (104344)
		124218,		-- Whale Shark Caviar (98123)
		124212,		-- Toasted Fish Jerky (81402)
		
		124217,		-- Steaming Goat Noodles (104341)
		124217,		-- Camembert du Clefthoof (98122)
		124216,		-- Nutty Brew-Bun (105722)
		124217,		-- Tangy Yogurt (81409)
		124216,		-- Golden Dragon Noodles (104343)
		124217,		-- Fried Cheese Dumplings (105724)
		124211,		-- Yak Cheese Curds (81401)
		
		--[104958] = "31 STAT",		-- Pandaren Banquet (74919)
		--[105193] = "31 STAT",		-- Great Pandaren Banquet (75016)
		--[126492] = "28 STAT",		-- Banquet of the Grill (87226)
		--[126494] = "28 STAT",		-- Great Banquet of the Grill (87228)
		--[126495] = "28 STAT",		-- Banquet of the Wok (87230)
		--[126496] = "28 STAT",		-- Great Banquet of the Wok (87232)
		--[126497] = "28 STAT",		-- Banquet of the Pot (87234)
		--[126498] = "28 STAT",		-- Great Banquet of the Pot (87236)
		--[126499] = "28 STAT",		-- Banquet of the Steamer (87238)
		--[126500] = "28 STAT",		-- Great Banquet of the Steamer (87240)
		--[126501] = "28 STAT",		-- Banquet of the Oven (87242)
		--[126502] = "28 STAT",		-- Great Banquet of the Oven (87244)
		--[126503] = "28 STAT",		-- Banquet of the Brew (87246)
		--[126504] = "28 STAT",		-- Great Banquet of the Brew (87248)
		--[145166] = "28 STAT",		-- Noodle Cart Kit (101630)
		--[145169] = "31 STAT",		-- Deluxe Noodle Cart Kit (101661)
		--[127882] = "31 STAT",		-- Squirmy Delight (88388)
		
		-- Level 100
		174077,		-- Perfect Fuzzy Pear (118274)
		160897,		-- Sleeper Surprise (111452)
		160793,		-- Fuzzy Pear (118268)
		160793,		-- Braised Riverbeast (111436)
		160793,		-- Fat Sleeper Cakes (111444)
		
		160893,		-- Frosty Stew (111450)
		174079,		-- Perfect O'ruk Orange (118273)
		160726,		-- Pan-Seared Talbuk (111434)
		160726,		-- O'ruk Orange (118270)
		160726,		-- Sturgeon Stew (111442)
		
		160883,		-- Hearty Elekk Steak (111431)
		160600,		-- Steamed Scorpion (111439)
		
		160889,		-- Blackrock Barbecue (111449)
		174062,		-- Perfect Nagrand Cherry (118275)
		160724,		-- Blackrock Ham (111433)
		160724,		-- Giant Nagrand Cherry (118272)
		160724,		-- Grilled Gulper (111441)
		
		160900,		-- Calamari Crepes (111453)
		174080,		-- Perfect Greenskin Apple (118276)
		160832,		-- Greenskin Apple (118269)
		160832,		-- Rylak Crepes (111437)
		160832,		-- Fiery Calamari (111445)
		
		160902,		-- Gorgrond Chowder (111454)
		177931,		-- Pre-Mixed Pot of Noodles (120168)
		174078,		-- Perfect Ironpeel Plantain (118277)
		160839,		-- Ironpeel Plantain (118271)
		160839,		-- Clefthoof Sausages (111438)
		160839,		-- Skulker Chowder (111446)		
		
		174551,		-- Fish Roe (118416)
		174707,		-- Legion Chili (118428)
		175215,		-- Savage Feast (118576)
		160740,		-- Feast of Blood (111457)
		160914,		-- Feast of the Waters (111458)
		178398,		-- Lukewarm Yak Roast Broth (120293)
		
		-- LEVEL 110
		-- 225 stats
		201223,		-- Critical
		201330,		-- Haste
		201332,		-- Mastery
		201336,		-- Versatility
		201334,		-- Pepper
		
		-- 300 stats
		225597,		-- Critical Leybeque Ribs
		225598,		-- Haste Suramar Surf And Turf
		225599,		-- Mastery Barracuda Mrglgagh
		225600,		-- Versatility Koi-Scented Stormray
		225601,		-- Pepper
		
		-- 375 stats
		225602,		-- Critical
		225603,		-- Haste
		225604,		-- Mastery
		225605,		-- Versatility
		225606,		-- Pepper
	}
	
	Spell11Buff = { -- Augment Rune
		175439, 		-- Stout (50 str)
		175456,			--	Hyper (50 agi)
		175457,			-- Focus (50 int)
		224001,			-- Defiled Augumentation (325 primary stat)
	}

	
------------------------------------------------------------------------------------------
-- RAIDBUFFTRACKER - frames and setting spells
------------------------------------------------------------------------------------------

local function OnAuraChange(self, event, arg1, unit)
	if event == "UNIT_AURA" and arg1 ~= "player" then 
		return
	end
	
	-- spellframe 9
	for i, Spell9Buff in pairs(Spell9Buff) do
		local spellname = select(1, GetSpellInfo(Spell9Buff))
		if UnitAura("player", spellname) then
			Spell9Frame.t:SetAlpha(1)
			Spell9Frame.t:SetTexture(select(3, GetSpellInfo(Spell9Buff)))
			Spell9Frame.id = Spell9Buff
			break
		else
			Spell9Frame.t:SetAlpha(0.3)
			Spell9Frame.t:SetTexture(select(3, GetSpellInfo(Spell9Buff)))
		end
		Spell9Frame.id = Spell9Buff
	end	

	-- button 10
	for i, Spell10Buff in pairs(Spell10Buff) do
		local spellname = select(1, GetSpellInfo(Spell10Buff))
		if UnitAura("player", spellname) then
			Spell10Frame.t:SetAlpha(1)
			Spell10Frame.t:SetTexture(select(3, GetSpellInfo(Spell10Buff)))
			Spell10Frame.id = Spell10Buff
			break
		else
			Spell10Frame.t:SetAlpha(0.3)
			Spell10Frame.t:SetTexture(select(3, GetSpellInfo(Spell10Buff)))
		end
		Spell10Frame.id = Spell10Buff
	end	

	-- spellframe 11
	for i, Spell11Buff in pairs(Spell11Buff) do
		local spellname = select(1, GetSpellInfo(Spell11Buff))
		if UnitAura("player", spellname) then
			Spell11Frame.t:SetAlpha(1)
			Spell11Frame.t:SetTexture(select(3, GetSpellInfo(Spell11Buff)))
			Spell11Frame.id = Spell11Buff
			break
		else
			Spell11Frame.t:SetAlpha(0.3)
			Spell11Frame.t:SetTexture(select(3, GetSpellInfo(Spell11Buff)))
		end
		Spell11Frame.id = Spell11Buff
	end	
	
end

------------------------------------------------------------------------------------------
-- RAIDBUFFTRACKER - Anchor creation
------------------------------------------------------------------------------------------
Line04:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
Line04:RegisterEvent("UNIT_AURA", "player")
Line04:RegisterEvent("PLAYER_ENTERING_WORLD")
Line04:SetScript("OnEvent", OnAuraChange)

------------------------------------------------------------------------------------------
-- RAIDBUFFTRACKER - Function to create buttons including simple tooltip
------------------------------------------------------------------------------------------

local function CreateButton(name, relativeTo, firstbutton, tt_txt)
	local button = CreateFrame("Button", name, Line04)
	button:SetTemplate('Default')
	button:Size(19)
	if firstbutton == true then
		button:Point("RIGHT", relativeTo, "RIGHT", -8, 0)
	else
		button:Point("RIGHT", relativeTo, "LEFT", -108, 0)
	end
		
	button.t = button:CreateTexture(name..".t", "OVERLAY")
	button.t:SetTexCoord(.08, .92, .08, .92)
	button.t:Point("TOPLEFT", 2, -2)
	button.t:Point("BOTTOMRIGHT", -2, 2)
	
	button:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(Line01, "ANCHOR_TOP", 0, 20)
	GameTooltip:AddLine(tt_txt, 1, 1, 1, 1, 1, 1)
	GameTooltip:Show()
	button:SetBackdropBorderColor(class.r, class.g, class.b)
	end)
	
	button:SetScript("OnLeave", function(self)
	GameTooltip:Hide()
	button:SetBackdropBorderColor()
	end)
		
	return button
end

do
--Create Buttons
CreateButton("Spell9Frame", Line04, true, "Flask / Elixir")
CreateButton("Spell10Frame", Spell9Frame, false, "Food")
CreateButton("Spell11Frame", Spell10Frame, false, "Augmented Rune")

end	

-- SHOW HIDE FUNCTIONALITY 
	ShowHideRaid:SetScript("OnMouseDown", function(self)
		
		if raidtoolbg:IsShown() then
			--raid tools tab
			raidtoolbg:Hide()
			Line01:Hide()
			Line02:Hide()
			Line03:Hide()
			Line04:Hide()
			--tools tab
			--toolsbg:Hide()
			--Line01tools:Hide()
			--Line02tools:Hide()
			--Line03tools:Hide()
			--Meters tab
		else
			--raid tools tab
			raidtoolbg:Show()
			Line01:Show()
			Line02:Show()
			Line03:Show()
			Line04:Show()
			--raid tools tab
			toolsbg:Hide()
			Line01tools:Hide()
			Line02tools:Hide()
			Line03tools:Hide()
		end
	end)
end

end

hooksecurefunc(Panels, "Enable", Enable)