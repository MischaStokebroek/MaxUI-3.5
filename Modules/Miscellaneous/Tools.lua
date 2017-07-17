------------------------------------------------------------------------------------------
-- MaxUI 3.50 TukUI 17 - LEGION 7.0 -- version: 23-12-2016
------------------------------------------------------------------------------------------

--setting up TOOLS.

------------------------------------------------------------------------------------------
-- LOCALS, ...
------------------------------------------------------------------------------------------

local T, C, L = Tukui:unpack()
local Panels = T.Panels
local class = RAID_CLASS_COLORS[select(2, UnitClass("player"))]

local thickness = 1
local FontSize = 14
local FontFlag = "OUTLINE"
local Font = T.GetFont(C["MaxUI Media"]["Font"])


------------------------------------------------------------------------------------------
-- UI TOOLS MODULE
------------------------------------------------------------------------------------------

local function Enable()

		---------------------------------------------------------------
		-- Button creation function
		---------------------------------------------------------------
		local CreateBtn = function(name, parent, w, h, tt_txt, txt) -- 1. Name, 2. Parent, 3. width, 4. height, 5. tooltip text, 6. text on button
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
			
			b.icon = b:CreateTexture(nil, "OVERLAY")
			b.icon:Size(17, 17)
			b.icon:Point("CENTER", b, "CENTER", 0, 0)
			
			b:SetScript("OnEnter", function(self)
				GameTooltip:SetOwner(RIGHTChatline, "ANCHOR_TOP", 0, -20)
				GameTooltip:AddLine(tt_txt, 1, 1, 1, 1, 1, 1)
				GameTooltip:Show()
				btext:SetTextColor(class.r, class.g, class.b)
				b:SetBackdropBorderColor(class.r, class.g, class.b)
				b.icon:SetVertexColor(class.r, class.g, class.b)
			end)
			
			b:SetScript("OnLeave", function(self)
				GameTooltip:Hide()
				btext:SetTextColor(1, 1, 1)
				b:SetBackdropBorderColor(unpack(C["General"]["BorderColor"]))
				b.icon:SetVertexColor(1, 1, 1)
			end)
			
			b:SetAttribute("type1", "macro")
			b:CreateOverlayTooltip()
		end

	if C["MaxUI Tools"]["Tools"] == true then
	
		---------------------------------------------------------------
		-- TOOLS
		---------------------------------------------------------------
		-- Tools background
		local toolsbg = CreateFrame("Frame", "toolsbg", UIParent)
		toolsbg:SetTemplate()
		toolsbg:SetHeight(142)
		toolsbg:SetWidth(390)
		toolsbg:Point("TOP", RIGHTChatline, "BOTTOM", -5, -16)
		toolsbg:SetFrameLevel(1)
		toolsbg:SetFrameStrata("BACKGROUND")
		toolsbg:SetAlpha(C["MaxUI Media"]["chatpanelalpha"])
		if C["MaxUI Media"]["Chatpanels"] == true then
			toolsbg:SetAlpha(0)
		end
		toolsbg:Hide()

		-- Tools Tukui
		local Line01tools = CreateFrame("Frame", "Line01tools", UIParent)
		Line01tools:SetTemplate()
		Line01tools:Size(380, thickness)
		Line01tools:Point("TOP", toolsbg, "TOP", 0, -40)
		Line01tools:SetFrameLevel(2)
		Line01tools:SetFrameStrata("BACKGROUND")
		Line01tools:SetAlpha(1)
		Line01tools:Hide()
		
		local tukuitoolstext = Line01tools:CreateFontString(nil, "OVERLAY")
		if C["MaxUI Media"]["Font"] == "Caps" then
			tukuitoolstext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\caps.ttf", FontSize, FontFlag)
		elseif C["MaxUI Media"]["Font"] == "Comic" then
			tukuitoolstext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\comic.ttf", FontSize, FontFlag)
		elseif C["MaxUI Media"]["Font"] == "MaxUI" then
			tukuitoolstext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\MaxUI.ttf", FontSize, FontFlag)
		else	
			tukuitoolstext:SetFont(C["Medias"].Font, FontSize, FontFlag)
		end
		tukuitoolstext:Point("LEFT", Line01tools, "LEFT", 4, 0)
		tukuitoolstext:SetText("TukUI:")
				
		-- WoW Utilities
		local Line02tools = CreateFrame("Frame", "Line02tools", UIParent)
		Line02tools:SetTemplate()
		Line02tools:Size(380, thickness)
		Line02tools:Point("TOP", toolsbg, "TOP", 0, -70)
		Line02tools:SetFrameLevel(2)
		Line02tools:SetFrameStrata("BACKGROUND")
		Line02tools:SetAlpha(1)
		Line02tools:Hide()

		local WoWtools = Line02tools:CreateFontString(nil, "OVERLAY")
		if C["MaxUI Media"]["Font"] == "Caps" then
			WoWtools:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\caps.ttf", FontSize, FontFlag)
		elseif C["MaxUI Media"]["Font"] == "Comic" then
			WoWtools:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\comic.ttf", FontSize, FontFlag)
		elseif C["MaxUI Media"]["Font"] == "MaxUI" then
			WoWtools:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\MaxUI.ttf", FontSize, FontFlag)
		else	
			WoWtools:SetFont(C["Medias"].Font, FontSize, FontFlag)
		end
		WoWtools:Point("LEFT", Line02tools, "LEFT", 4, 0)
		WoWtools:SetText("WoW Tools:")

		-- Addons
		local Line03tools = CreateFrame("Frame", "Line03tools", UIParent)
		Line03tools:SetTemplate()
		Line03tools:Size(380, thickness)
		Line03tools:Point("TOP", toolsbg, "TOP", 0, -100)
		Line03tools:SetFrameLevel(2)
		Line03tools:SetFrameStrata("BACKGROUND")
		Line03tools:SetAlpha(1)
		Line03tools:Hide()

		local addonstools = Line03tools:CreateFontString(nil, "OVERLAY")
		if C["MaxUI Media"]["Font"] == "Caps" then
			addonstools:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\caps.ttf", FontSize, FontFlag)
		elseif C["MaxUI Media"]["Font"] == "Comic" then
			addonstools:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\comic.ttf", FontSize, FontFlag)
		elseif C["MaxUI Media"]["Font"] == "MaxUI" then
			addonstools:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\MaxUI.ttf", FontSize, FontFlag)
		else	
			addonstools:SetFont(C["Medias"].Font, FontSize, FontFlag)
		end
		addonstools:Point("LEFT", Line03tools, "LEFT", 4, 0)
		addonstools:SetText("AddOns:")
		
		-- show hide button
		local ShowHideTools = CreateFrame("Frame", "ShowHideTools", RIGHTChatline)
		ShowHideTools:SetTemplate()
		ShowHideTools:Size((400/3), 20)
		ShowHideTools:Point("RIGHT", RIGHTChatline, "RIGHT", 0, 0)
		ShowHideTools:SetFrameLevel(2)
		ShowHideTools:SetFrameStrata("BACKGROUND")
		ShowHideTools:SetAlpha(0)
		
		local ToolsText = RIGHTChatline:CreateFontString(nil, "OVERLAY")
		if C["MaxUI Media"]["Font"] == "Caps" then
			ToolsText:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\caps.ttf", FontSize, FontFlag)
		elseif C["MaxUI Media"]["Font"] == "Comic" then
			ToolsText:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\comic.ttf", FontSize, FontFlag)
		elseif C["MaxUI Media"]["Font"] == "MaxUI" then
			ToolsText:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\MaxUI.ttf", FontSize, FontFlag)
		else	
			ToolsText:SetFont(C["Medias"].Font, FontSize, FontFlag)
		end
		ToolsText:Point("RIGHT", RIGHTChatline, "RIGHT", -28, 0)
		ToolsText:SetText("UI Tools")
		
		RIGHTChatline.iconright = RIGHTChatline:CreateTexture(nil, "OVERLAY")
		RIGHTChatline.iconright:Size(17, 17)
		RIGHTChatline.iconright:Point("RIGHT", RIGHTChatline, "RIGHT", -12, 0)
		RIGHTChatline.iconright:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\menuicons\acp.tga]])
		
		ShowHideTools:SetScript("OnEnter", function(self)
			ToolsText:SetTextColor(class.r, class.g, class.b)
			RIGHTChatline.iconright:SetVertexColor(class.r, class.g, class.b)
		end)
		
		ShowHideTools:SetScript("OnLeave", function(self)
			ToolsText:SetTextColor(1, 1, 1)
			RIGHTChatline.iconright:SetVertexColor(1, 1, 1)	
		end)
	
		------------------------------------------------------------------------------------------
		-- Tukui Tools
		------------------------------------------------------------------------------------------
		--Button 1 - Tukui config
		CreateBtn("optionbutton01", Line01tools, 43, 19, "Toggle Tukui Configuration Interface", "")
		optionbutton01:Point("LEFT", Line01tools, "LEFT", 100, 0)
		optionbutton01:SetAttribute("macrotext1", "/tukui c")
		optionbutton01.icon:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\menuicons\config.tga]])

		--Button 2 - Tukui move ui
		CreateBtn("optionbutton02", Line01tools, 43, 19, "Toggle Tukui Move function", "")
		optionbutton02:Point("LEFT", optionbutton01, "RIGHT", 5, 0)
		optionbutton02:SetAttribute("macrotext1", "/tukui move")
		optionbutton02.icon:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\menuicons\move.tga]])

		--Button 3 - Tukui Datatext toggle
		CreateBtn("optionbutton03", Line01tools, 43, 19, "Toggle Tukui Datatext Mode", "")
		optionbutton03:Point("LEFT", optionbutton02, "RIGHT", 5, 0)
		optionbutton03:SetAttribute("macrotext1", "/tukui dt")
		optionbutton03.icon:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\menuicons\datatext.tga]])

		--Button 4 - Reload
		CreateBtn("optionbutton04", Line01tools, 43, 19,  "Reload Interface", "")
		optionbutton04:Point("LEFT", optionbutton03, "RIGHT", 5, 0)
		optionbutton04:SetAttribute("macrotext1", "/rl")
		optionbutton04.icon:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\menuicons\reload.tga]])

		--Button 5 - show maxui menu
		CreateBtn("optionbutton05", Line01tools, 43, 19, "Open MaxUI startmenu", "")
		optionbutton05:Point("LEFT", optionbutton04, "RIGHT", 5, 0)
		optionbutton05:SetAttribute("macrotext1", "")
		optionbutton05:SetScript("OnMouseDown", function(self)
			startupmenu:Show()
		end)
		optionbutton05.icon:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\menuicons\maxui.tga]])

		------------------------------------------------------------------------------------------
		-- WoW Tools
		------------------------------------------------------------------------------------------
		--Button 6 - Macro
		CreateBtn("optionbutton06", Line02tools, 43, 19, "Toggle Macro Module", "")
		optionbutton06:Point("LEFT", Line02tools, "LEFT", 100, 0)
		optionbutton06:SetAttribute("macrotext1", "/macro")
		optionbutton06.icon:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\menuicons\macro.tga]])
			
		--Button 7 - logout
		CreateBtn("optionbutton07", Line02tools, 43, 19, "Logout", "")
		optionbutton07:Point("LEFT", optionbutton06, "RIGHT", 5, 0)
		optionbutton07:SetAttribute("macrotext1", "/logout")
		optionbutton07.icon:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\menuicons\logout.tga]])

		--Button 8 - exit game
		CreateBtn("optionbutton08", Line02tools, 43, 19, "Exit Game", "")
		optionbutton08:Point("LEFT", optionbutton07, "RIGHT", 5, 0)
		optionbutton08:SetAttribute("macrotext1", "/quit")
		optionbutton08.icon:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\menuicons\exit.tga]])

		--Button 9 - 
		CreateBtn("optionbutton09", Line02tools, 43, 19, "", "")
		optionbutton09:Point("LEFT", optionbutton08, "RIGHT", 5, 0)
		optionbutton09:SetAttribute("macrotext1", "/")
		--optionbutton09.icon:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\menuicons\option.tga]])

		--Button 10 - 
		CreateBtn("optionbutton10", Line02tools, 43, 19, "", "")
		optionbutton10:Point("LEFT", optionbutton09, "RIGHT", 5, 0)
		optionbutton10:SetAttribute("macrotext1", "")
		--optionbutton10.icon:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\menuicons\option.tga]])

		------------------------------------------------------------------------------------------
		-- Addons 
		------------------------------------------------------------------------------------------
		--Button 11 - Addon control panel (addon)
		CreateBtn("optionbutton11", Line03tools, 43, 19, "Toggle Addon Control Panel", "") -- Tooltip description, A = shown letter on button
		optionbutton11:Point("LEFT", Line03tools, "LEFT", 100, 0)
		optionbutton11:SetAttribute("macrotext1", "/acp") -- /acp is slashcommand for ACP
		optionbutton11.icon:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\menuicons\acp.tga]])

		--Button 12 - Weak Aura's
		CreateBtn("optionbutton12", Line03tools, 43, 19, "Toggle Weak Aura's", "") -- Tooltip description, W = shown letter on button
		optionbutton12:Point("LEFT", optionbutton11, "RIGHT", 5, 0)
		optionbutton12:SetAttribute("macrotext1", "/wa") -- /wa is slashcommand for addon
		optionbutton12.icon:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\menuicons\infobars.tga]])

		--Button 13 - BossMods
		CreateBtn("optionbutton13", Line03tools, 43, 19, "Toggle Deadly Boss Mods", "") -- Tooltip description, B = shown letter on button
		optionbutton13:Point("LEFT", optionbutton12, "RIGHT", 5, 0)
		optionbutton13:SetAttribute("macrotext1", "/dbm") -- /al is slashcommand for addon
		optionbutton13.icon:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\menuicons\bossmod.tga]])

		--Button 14 - XCT
		CreateBtn("optionbutton14", Line03tools, 43, 19, "Toggle XCT+ config", "") -- Tooltip description, X = shown letter on button
		optionbutton14:Point("LEFT", optionbutton13, "RIGHT", 5, 0)
		optionbutton14:SetAttribute("macrotext1", "/xct") -- /xct is slashcommand for addon
		optionbutton14.icon:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\menuicons\damage.tga]])

		--Button 15 - Skada
		CreateBtn("optionbutton15", Line03tools, 43, 19, "Toggle Skada config Interface", "") -- Tooltip description, S = shown letter on button
		optionbutton15:Point("LEFT", optionbutton14, "RIGHT", 5, 0)
		optionbutton15:SetAttribute("macrotext1", "/skada config") -- /skada config is slashcommand for addon
		optionbutton15.icon:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\menuicons\damagemeter.tga]])

		-- SHOW HIDE FUNCTIONALITY 
		ShowHideTools:SetScript("OnMouseDown", function(self)
			if toolsbg:IsShown() then
				--tools tab
				toolsbg:Hide()
				Line01tools:Hide()
				Line02tools:Hide()
				Line03tools:Hide()
			else
				--tools tab
				toolsbg:Show()
				Line01tools:Show()
				Line02tools:Show()
				Line03tools:Show()
				--raid tools tab
				raidtoolbg:Hide()
				Line01:Hide()
				Line02:Hide()
				Line03:Hide()
				Line04:Hide()
			end
		end)
	end

------------------------------------------------------------------------------------------
-- METERS 
------------------------------------------------------------------------------------------
	if IsAddOnLoaded('Skada')then
		T.CreateBtn("ShowHideMeters", RIGHTChatline, (400/3), 20, "", "")
		ShowHideMeters:Point("LEFT", RIGHTChatline, "LEFT", 0, 0)
		ShowHideMeters:SetAttribute("macrotext1", "/Skada toggle")
		ShowHideMeters:SetAlpha(0)

		local DamageMeterText = RIGHTChatline:CreateFontString(nil, "OVERLAY")
		if C["MaxUI Media"]["Font"] == "Caps" then
			DamageMeterText:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\caps.ttf", FontSize, FontFlag)
		elseif C["MaxUI Media"]["Font"] == "Comic" then
			DamageMeterText:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\comic.ttf", FontSize, FontFlag)
		elseif C["MaxUI Media"]["Font"] == "MaxUI" then
			DamageMeterText:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\MaxUI.ttf", FontSize, FontFlag)
		else	
			DamageMeterText:SetFont(C["Medias"].Font, FontSize, FontFlag)
		end
		DamageMeterText:Point("LEFT", RIGHTChatline, "LEFT", 14, 0)
		DamageMeterText:SetText("Meters")

		RIGHTChatline.iconleft = RIGHTChatline:CreateTexture(nil, "OVERLAY")
		RIGHTChatline.iconleft:Size(17, 17)
		RIGHTChatline.iconleft:Point("LEFT", RIGHTChatline, "LEFT", 70, 0)
		RIGHTChatline.iconleft:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\menuicons\damagemeter.tga]])
		
		ShowHideMeters:SetScript("OnEnter", function(self)
			DamageMeterText:SetTextColor(class.r, class.g, class.b)
			RIGHTChatline.iconleft:SetVertexColor(class.r, class.g, class.b)
		end)
		
		ShowHideMeters:SetScript("OnLeave", function(self)
			DamageMeterText:SetTextColor(1, 1, 1)
			RIGHTChatline.iconleft:SetVertexColor(1, 1, 1)
		end)
		
	-- SHOW HIDE FUNCTIONALITY 
		ShowHideMeters:SetScript("OnMouseDown", function(self)
			--tools tab
			toolsbg:Hide()
			Line01tools:Hide()
			Line02tools:Hide()
			Line03tools:Hide()
			--raid tools tab
			raidtoolbg:Hide()
			Line01:Hide()
			Line02:Hide()
			Line03:Hide()
			Line04:Hide()
		end)
	end
end
hooksecurefunc(Panels, "Enable", Enable)