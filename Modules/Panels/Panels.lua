------------------------------------------------------------------------------------------
-- MaxUI 3.50 TukUI 17 - LEGION 7.0 -- version: 21-04-2017
------------------------------------------------------------------------------------------

-- setting up CUSTOM PANELS AND FRAMES.

------------------------------------------------------------------------------------------
-- LOCALS / FUNCTIONS / ...
------------------------------------------------------------------------------------------

local T, C, L = Tukui:unpack()
local Panels = T.Panels
local class = RAID_CLASS_COLORS[select(2, UnitClass("player"))]
local color = C["MaxUI Media"]["TestColor"]
local Minimap = T.Maps.Minimap

local thickness = 1

local FontSize = 14
local FontFlag = "OUTLINE"
--local Font = "MaxUI"

------------------------------------------------------------------------------------------
-- UNWANTED PARTS
------------------------------------------------------------------------------------------
local function Enable()
	local LeftVerticalLine = Panels.LeftVerticalLine
	local RightVerticalLine = Panels.RightVerticalLine
	local CubeLeft = Panels.CubeLeft
	local CubeRight = Panels.CubeRight

	LeftVerticalLine:Hide()
	RightVerticalLine:Hide()
	
	if CubeLeft and CubeRight then
		CubeLeft:Hide()
		CubeRight:Hide()
	end
end
hooksecurefunc(Panels, "Enable", Enable)

------------------------------------------------------------------------------------------
-- PANELS/FRAMES
------------------------------------------------------------------------------------------
local function Enable()

	-- TOP PANELS/FRAMES
	local Topline = CreateFrame("Frame", "Topline", UIParent)
	Topline:SetTemplate()
	Topline:Size(200, thickness)
	Topline:Point("TOPLEFT", UIParent, "TOPLEFT", 6, -14)
	Topline:Point("TOPRIGHT", UIParent, "TOPRIGHT", -6, -14)
	Topline:SetFrameLevel(2)
	Topline:SetFrameStrata("BACKGROUND")
	Topline:SetAlpha(1)
	Topline:CreateShadow("Default")

	local TopVerticalRightline = CreateFrame("Frame", "TopVerticalRightline", Topline)
	TopVerticalRightline:SetTemplate()
	TopVerticalRightline:Point("TOPRIGHT", Topline, "TOPRIGHT", 0, 0)
	TopVerticalRightline:Size(thickness, 208)
	TopVerticalRightline:SetFrameLevel(2)
	TopVerticalRightline:SetFrameStrata("BACKGROUND")
	TopVerticalRightline:SetAlpha(1)
	TopVerticalRightline:CreateShadow("Default")
	TopVerticalRightline:SetParent(Topline)
	
	local TopHorizontalRightline = CreateFrame("Frame", "TopHorizontalRightline", Topline)
	TopHorizontalRightline:SetTemplate()
	TopHorizontalRightline:Point("BOTTOMRIGHT", TopVerticalRightline, "BOTTOMRIGHT", 0, 0)
	TopHorizontalRightline:Size(180, thickness)
	TopHorizontalRightline:SetFrameLevel(2)
	TopHorizontalRightline:SetFrameStrata("BACKGROUND")
	TopHorizontalRightline:SetAlpha(1)
	TopHorizontalRightline:CreateShadow("Default")
	TopHorizontalRightline:SetParent(Topline)
	
	if C["MaxUI Tools"]["Topline"] == true then	
		Topline:Show()
	else
		Topline:Hide()
	end
	
	-- BOTTOM PANELS/FRAMES
	local BottomLine = Panels.BottomLine
	
	-- BOTTOMLINE ADJUSTMENTS
	BottomLine:ClearAllPoints()
	BottomLine:SetTemplate()
	BottomLine:Height(thickness)
	BottomLine:Point("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 6, 14)
	BottomLine:Point("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -6, 14)
	BottomLine:SetFrameLevel(2)
	BottomLine:SetFrameStrata("BACKGROUND")
	BottomLine:SetAlpha(1)
	BottomLine:CreateShadow("Default")

	local BottomLineAlt = CreateFrame("Frame", "BottomLineAlt", UIParent)
	BottomLineAlt:ClearAllPoints()
	BottomLineAlt:SetTemplate()
	BottomLineAlt:Point("BOTTOM", UIParent, "BOTTOM", 0, 14)
	BottomLineAlt:Size(300, thickness)
	BottomLineAlt:SetFrameLevel(2)
	BottomLineAlt:SetFrameStrata("BACKGROUND")
	BottomLineAlt:SetAlpha(1)
	BottomLineAlt:CreateShadow("Default")
	
	if C["MaxUI Tools"]["Bottomline"] == true then
		BottomLine:Show()
		BottomLineAlt:Hide()
	else
		BottomLine:Hide()
		BottomLineAlt:Show()
	end	

	-- LEFT CHAT

	-- Left Chat Toolline
	local LEFTChatline = CreateFrame("Frame", "LEFTChatline", UIParent)
	LEFTChatline:SetTemplate()
	LEFTChatline:SetParent(BottomLine)
	LEFTChatline:Size(400, thickness)
	LEFTChatline:Point("BOTTOMLEFT", BottomLine, "TOPLEFT", 0, 170)
	LEFTChatline:SetFrameLevel(2)
	LEFTChatline:SetFrameStrata("BACKGROUND")
	LEFTChatline:SetAlpha(1)
	LEFTChatline:CreateShadow("Default")

	-- LEFT VERTICAL Line
	local LEFTVerticalline = CreateFrame("Frame", "LEFTVerticalline", UIParent)
	LEFTVerticalline:SetTemplate()
	LEFTVerticalline:SetParent(BottomLine)
	LEFTVerticalline:Size(thickness, thickness)
	LEFTVerticalline:Point("BOTTOMLEFT", BottomLine, "BOTTOMLEFT", 0, 0)
	LEFTVerticalline:Point("TOPLEFT", LEFTChatline, "TOPLEFT", 0, 0)
	LEFTVerticalline:SetFrameLevel(2)
	LEFTVerticalline:SetFrameStrata("BACKGROUND")
	LEFTVerticalline:SetAlpha(1)
	LEFTVerticalline:CreateShadow("Default")
	
	-- show hide button CHAT
	local ShowHideChat = CreateFrame("Frame", "ShowHideChat", LEFTChatline)
	ShowHideChat:SetTemplate()
	ShowHideChat:Size((400/3), 20)
	ShowHideChat:Point("LEFT", LEFTChatline, "LEFT", 0, 0)
	ShowHideChat:SetFrameLevel(2)
	ShowHideChat:SetFrameStrata("BACKGROUND")
	ShowHideChat:SetAlpha(0.0)
	
	LEFTChatline.icon = LEFTChatline:CreateTexture(nil, "OVERLAY")
	LEFTChatline.icon:Size(17, 17)
	LEFTChatline.icon:Point("LEFT", LEFTChatline, "LEFT", 60, 0)
	LEFTChatline.icon:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\menuicons\chat.tga]])

	
	local LEFTChatlinetext = LEFTChatline:CreateFontString(nil, "OVERLAY")
	if C["MaxUI Media"]["Font"] == "Caps" then
		LEFTChatlinetext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\caps.ttf", FontSize, "OUTLINE")
	elseif C["MaxUI Media"]["Font"] == "Comic" then
		LEFTChatlinetext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\comic.ttf", FontSize, "OUTLINE")
	elseif C["MaxUI Media"]["Font"] == "MaxUI" then
		LEFTChatlinetext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\MaxUI.ttf", FontSize, "OUTLINE")
	else	
		LEFTChatlinetext:SetFont(C["Medias"].Font, FontSize, "OUTLINE")
	end
	LEFTChatlinetext:Point("LEFT", LEFTChatline, "LEFT", 20, 0)
	LEFTChatlinetext:SetText("Chat")		
		
	ShowHideChat:SetScript("OnMouseDown", function(self, Button)
		if (Button == "LeftButton") then
			ToggleFrame(ChatMenu)
		end
	end)
		
	ShowHideChat:SetScript("OnEnter", function(self)
		LEFTChatlinetext:SetTextColor(class.r, class.g, class.b)
		LEFTChatline.icon:SetVertexColor(class.r, class.g, class.b)
	end)
	
	ShowHideChat:SetScript("OnLeave", function(self)
		LEFTChatlinetext:SetTextColor(1, 1, 1)
		LEFTChatline.icon:SetVertexColor(1, 1, 1)
	end)
		
	-- show hide button LEFT BOTTOM CORNER
	local ShowHideLeftTools = CreateFrame("Frame", "ShowHideLeftTools", ShowHideLeftTools)
	ShowHideLeftTools:SetTemplate()
	ShowHideLeftTools:Size(11, 10)
	ShowHideLeftTools:Point("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 3, 6)
	ShowHideLeftTools:SetFrameLevel(15)
	ShowHideLeftTools:SetFrameStrata("HIGH")
	ShowHideLeftTools:SetAlpha(0)
	ShowHideLeftTools:SetScript("OnEnter", function(self) self:SetAlpha(1) end)
	ShowHideLeftTools:SetScript("OnLeave", function(self) self:SetAlpha(0) end)

	local LeftToolsOpen = ShowHideLeftTools:CreateFontString(nil, "OVERLAY")
	if C["MaxUI Media"]["Font"] == "Caps" then
		LeftToolsOpen:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\caps.ttf", FontSize, "OUTLINE")
	elseif C["MaxUI Media"]["Font"] == "Comic" then
		LeftToolsOpen:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\comic.ttf", FontSize, "OUTLINE")
	elseif C["MaxUI Media"]["Font"] == "MaxUI" then
		LeftToolsOpen:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\MaxUI.ttf", FontSize, "OUTLINE")
	else	
		LeftToolsOpen:SetFont(C["Medias"].Font, FontSize, "OUTLINE")
	end
	LeftToolsOpen:Point("CENTER", ShowHideLeftTools, "CENTER", 0, 0)
	LeftToolsOpen:SetText("+")

	local LeftToolsClose = ShowHideLeftTools:CreateFontString(nil, "OVERLAY")
	if C["MaxUI Media"]["Font"] == "Caps" then
		LeftToolsClose:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\caps.ttf", FontSize, "OUTLINE")
	elseif C["MaxUI Media"]["Font"] == "Comic" then
		LeftToolsClose:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\comic.ttf", FontSize, "OUTLINE")
	elseif C["MaxUI Media"]["Font"] == "MaxUI" then
		LeftToolsClose:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\MaxUI.ttf", FontSize, "OUTLINE")
	else	
		LeftToolsClose:SetFont(C["Medias"].Font, FontSize, "OUTLINE")
	end
	LeftToolsClose:Point("CENTER", ShowHideLeftTools, "CENTER", 0, 0)
	LeftToolsClose:SetText("-")

	-- show/hide functions		
	ShowHideLeftTools:SetScript("OnMouseDown", function(self)
		if LEFTChatline:IsShown() then
			LEFTChatline:Hide()
			LEFTVerticalline:Hide()
			LeftToolsClose:Hide()
			LeftToolsOpen:Show()
		else
			LEFTChatline:Show()
			LEFTVerticalline:Show()
			LeftToolsClose:Show()
			LeftToolsOpen:Hide()
		end
	end)

	-- RIGHT CHAT

	-- RIGHT Chat Toolline		
	local RIGHTChatline = CreateFrame("Frame", "RIGHTChatline", UIParent)
	RIGHTChatline:SetTemplate()
	RIGHTChatline:SetParent(BottomLine)
	RIGHTChatline:Size(400, thickness)
	RIGHTChatline:Point("BOTTOMRIGHT", BottomLine, "TOPRIGHT", 0, 170)
	RIGHTChatline:SetFrameLevel(2)
	RIGHTChatline:SetFrameStrata("BACKGROUND")
	RIGHTChatline:SetAlpha(1)
	RIGHTChatline:CreateShadow("Default")

	-- RIGHT VERTICAL Line
	local RIGHTVerticalline = CreateFrame("Frame", "RIGHTVerticalline", UIParent)
	RIGHTVerticalline:SetTemplate()
	RIGHTVerticalline:SetParent(BottomLine)
	RIGHTVerticalline:Size(thickness, thickness)
	RIGHTVerticalline:Point("BOTTOMRIGHT", BottomLine, "BOTTOMRIGHT", 0, 0)
	RIGHTVerticalline:Point("TOPRIGHT", RIGHTChatline, "TOPRIGHT", 0, 0)
	RIGHTVerticalline:SetFrameLevel(2)
	RIGHTVerticalline:SetFrameStrata("BACKGROUND")
	RIGHTVerticalline:SetAlpha(1)
	RIGHTVerticalline:CreateShadow("Default")

	-- show hide button RIGHT 
	local ShowHideRightTools = CreateFrame("Frame", "ShowHideRightTools", ShowHideRightTools)
	ShowHideRightTools:SetTemplate()
	ShowHideRightTools:Size(11, 10)
	ShowHideRightTools:Point("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -3, 6)
	ShowHideRightTools:SetFrameLevel(15)
	ShowHideRightTools:SetFrameStrata("HIGH")
	ShowHideRightTools:SetAlpha(0)
	ShowHideRightTools:SetScript("OnEnter", function(self) self:SetAlpha(1) end)
	ShowHideRightTools:SetScript("OnLeave", function(self) self:SetAlpha(0) end)
	
	local RightToolsOpen = ShowHideRightTools:CreateFontString(nil, "OVERLAY")
	if C["MaxUI Media"]["Font"] == "Caps" then
		RightToolsOpen:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\caps.ttf", FontSize, "OUTLINE")
	elseif C["MaxUI Media"]["Font"] == "Comic" then
		RightToolsOpen:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\comic.ttf", FontSize, "OUTLINE")
	elseif C["MaxUI Media"]["Font"] == "MaxUI" then
		RightToolsOpen:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\MaxUI.ttf", FontSize, "OUTLINE")
	else	
		RightToolsOpen:SetFont(C["Medias"].Font, FontSize, "OUTLINE")
	end
	RightToolsOpen:Point("CENTER", ShowHideRightTools, "CENTER", 0, 0)
	RightToolsOpen:SetText("+")

	local RightToolsClose = ShowHideRightTools:CreateFontString(nil, "OVERLAY")
	if C["MaxUI Media"]["Font"] == "Caps" then
		RightToolsClose:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\caps.ttf", FontSize, "OUTLINE")
	elseif C["MaxUI Media"]["Font"] == "Comic" then
		RightToolsClose:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\comic.ttf", FontSize, "OUTLINE")
	elseif C["MaxUI Media"]["Font"] == "MaxUI" then
		RightToolsClose:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\MaxUI.ttf", FontSize, "OUTLINE")
	else	
		RightToolsClose:SetFont(C["Medias"].Font, FontSize, "OUTLINE")
	end
	RightToolsClose:Point("CENTER", ShowHideRightTools, "CENTER", 0, 0)
	RightToolsClose:SetText("-")

	-- show/hide functions		
	ShowHideRightTools:SetScript("OnMouseDown", function(self)
		if RIGHTChatline:IsShown() then
			RIGHTChatline:Hide()
			RIGHTVerticalline:Hide()
			RightToolsClose:Hide()
			RightToolsOpen:Show()
			toolsbg:Hide()
			Line01tools:Hide()
			Line02tools:Hide()
			Line03tools:Hide()
			raidtoolbg:Hide()
			Line01:Hide()
			Line02:Hide()
			Line03:Hide()
			Line04:Hide()
		else
			RIGHTChatline:Show()
			RIGHTVerticalline:Show()
			RightToolsClose:Show()
			RightToolsOpen:Hide()
		end
	end)

	-- CONFIG MAXUI OPTION

	if C["MaxUI Tools"]["chattools"] == true then
		LEFTChatline:Show()
		LEFTVerticalline:Show()
		LeftToolsClose:Show()
		LeftToolsOpen:Hide()
		RIGHTChatline:Show()
		RIGHTVerticalline:Show()
		RightToolsClose:Show()
		RightToolsOpen:Hide()
	else	
		LEFTChatline:Hide()
		LEFTVerticalline:Hide()
		LeftToolsClose:Hide()
		--LeftToolsOpen:Hide()
		RIGHTChatline:Hide()
		RIGHTVerticalline:Hide()
		RightToolsClose:Hide()
		--RightToolsOpen:Hide()
	end 

	-- CASTBAR ADJUSTMENTS

	-- CASTBAR LINE	
	local castbarline = CreateFrame("Frame", "castbarline", UIParent)
	castbarline:SetTemplate()
	castbarline:Size(482, thickness)
	castbarline:Point("BOTTOM", BottomLine, "TOP", 0, 170)
	castbarline:SetFrameLevel(2)
	castbarline:SetFrameStrata("BACKGROUND")
	castbarline:SetAlpha(1.0)
	castbarline:CreateShadow("Default")	
	
	-- HEALING LAYOUT CASTBAR
	if C["MaxUI Layout"]["Heallayout"] == true and C["MaxUI Layout"]["Meleelayout"] == false then
		castbarline:ClearAllPoints()
		castbarline:Point("BOTTOM", UIParent, "BOTTOM", 0, 84)
		castbarline:Size(403, thickness)
		castbarline:SetFrameLevel(2)
		
		if C["MaxUI Layout"]["SINGLECenterBar"] == true then
			castbarline:ClearAllPoints()
			castbarline:Point("BOTTOM", UIParent, "BOTTOM", 0, 291)
			castbarline:Width(364)
			--castbarline:SetAlpha(0.1)
		end
		if C["MaxUI Layout"]["DOUBLECenterBar"] == true then
		castbarline:ClearAllPoints()
		castbarline:Point("BOTTOM", UIParent, "BOTTOM", 0, 291)
		castbarline:Width(364)
		castbarline:SetAlpha(0)
		end
	end

	-- CENTERED BAR LAYOUT
	if C["MaxUI Layout"]["SINGLECenterBar"] == true and C["MaxUI Layout"]["Meleelayout"] == true then
		castbarline:ClearAllPoints()
		castbarline:Point("BOTTOM", BottomLine, "TOP", 0, 236)
	end

	-- PROTECTION CENTER BAR LAYOUT
	if C["MaxUI Layout"]["DOUBLECenterBar"] == true and C["MaxUI Layout"]["Meleelayout"] == true then
		castbarline:ClearAllPoints()
		castbarline:Point("BOTTOM", BottomLine, "TOP", 0, 232)
	end
	
RegisterStateDriver(castbarline, 'visibility', '[petbattle] hide; show')
	
		if C["MaxUI CombatFade"]["Topline"] == true then
		RegisterStateDriver(Topline, "visibility", "[combat] hide; show")
		RegisterStateDriver(TopVerticalRightline, "visibility", "[combat] hide; show")
		RegisterStateDriver(TopHorizontalRightline, "visibility", "[combat] hide; show")
		end
		
		if C["MaxUI CombatFade"]["BottomLine"] == true then
		RegisterStateDriver(BottomLineAlt, "visibility", "[combat] hide; show")
		RegisterStateDriver(BottomLine, "visibility", "[combat] hide; show")
		end
		
end 

hooksecurefunc(Panels, "Enable", Enable)