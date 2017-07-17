------------------------------------------------------------------------------------------
-- MaxUI 3.50 TukUI 17 - LEGION 7.0 -- v. 21-04-2017
------------------------------------------------------------------------------------------

--setting up STARTUP MENU MAXUI.

------------------------------------------------------------------------------------------
-- LOCALS
------------------------------------------------------------------------------------------

local T, C, L = Tukui:unpack()
local Panels = T.Panels
local Movers = T["Movers"]

------------------------------------------------------------------------------------------
-- MaxUI own Menu (WIP)
------------------------------------------------------------------------------------------

local function Enable()
	-- needs to load when character logs on, not on reload.
	--if event == "PLAYER_ENTERING_WORLD" then 
	
-- frame
	local startupmenu = CreateFrame("Frame", "startupmenu", UIParent)
	startupmenu:SetTemplate()
	startupmenu:Size(390, 380)
	startupmenu:Point("RIGHT", UIParent, "RIGHT", -14, -130)
	startupmenu:SetFrameLevel(20)
	startupmenu:SetFrameStrata("HIGH")
	startupmenu:SetAlpha(1)
	startupmenu:CreateShadow("Default")
	Movers:RegisterFrame(startupmenu)

if C["MaxUI Tools"]["MaxUIMenu"] == true then 	
	startupmenu:Show()
else
	startupmenu:Hide()
end
	
-- logo
	startupmenu.Logomaxui = startupmenu:CreateTexture(nil, "OVERLAY")
	startupmenu.Logomaxui:Size(360, 180)
	startupmenu.Logomaxui:Point("TOP", startupmenu, "TOP", 0, -20)
	startupmenu.Logomaxui:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\Textures\maxui_logo.tga]])
	
---------------------------------------------------------------
-- Button creation function
---------------------------------------------------------------

local CreateBtn = function(name, parent, w, h, tt_txt, txt) -- 1. Name, 2. Parent, 3. width, 4. height, 5. tooltip text, 6. text on button
	
	local b = CreateFrame("Button", name, parent, "SecureActionButtonTemplate")
	b:Width(w)
	b:Height(h)
	b:SetTemplate()
	
	local btext = b:CreateFontString(nil, "OVERLAY")
		if C["MaxUI Media"]["Font"] == "Caps" then
			btext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\dajova.ttf", 14, "OUTLINE")
		elseif C["MaxUI Media"]["Font"] == "Comic" then
			btext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\comic.ttf", 14, "OUTLINE")
		elseif C["MaxUI Media"]["Font"] == "MaxUI" then
			btext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\MaxUI.ttf", 14, "OUTLINE")
		else	
			btext:SetFont(C["Medias"].Font, 14, "OUTLINE")
		end

	btext:SetText(txt)
	btext:SetTextColor(0.336, 0.357, 0.357)
	btext:SetPoint("CENTER", b, 'CENTER', 0, 0)
	btext:SetJustifyH("CENTER")	
	
	b:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(startupmenu, "ANCHOR_TOP", 0, -60)
		GameTooltip:AddLine(tt_txt, 1, 1, 1, 1, 1, 1)
		GameTooltip:Show()
	btext:SetTextColor(1, 1, 1)
	end)
	
	b:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	btext:SetTextColor(0.336, 0.357, 0.357)
	end)
	
	b:SetAttribute("type1", "macro")
	
end
		
---------------------------------------------------------------
-- Buttons
---------------------------------------------------------------

CreateBtn("exitbutton", startupmenu, 360, 19, "Exit MaxUI menu", "Exit")
exitbutton:Point("BOTTOM", startupmenu, "BOTTOM", 0, 15)
exitbutton:SetAttribute("macrotext1", "")
exitbutton:SetScript("OnMouseDown", function(self)
startupmenu:Hide()
end)
	
CreateBtn("defaultsbutton", startupmenu, 360, 19, "Start Default settings installer", "Defaults")
defaultsbutton:Point("BOTTOM", exitbutton, "TOP", 0, 4)
defaultsbutton:SetAttribute("macrotext1", "/tukui reset")

CreateBtn("datatexttogglebutton", startupmenu, 360, 19, "Access Datatext configuration", "Datatext configuration")
datatexttogglebutton:Point("BOTTOM", defaultsbutton, "TOP", 0, 4)
datatexttogglebutton:SetAttribute("macrotext1", "/tukui dt")

CreateBtn("datatextresetbutton", startupmenu, 360, 19, "Reset all Datatext fields", "Datatext reset")
datatextresetbutton:Point("BOTTOM", datatexttogglebutton, "TOP", 0, 4)
datatextresetbutton:SetAttribute("macrotext1", "/tukui dt reset")

CreateBtn("loadTukuiconfigbutton", startupmenu, 360, 19, "Load TukUI/MaxUI configuration", "MaxUI configuration")
loadTukuiconfigbutton:Point("BOTTOM", datatextresetbutton, "TOP", 0, 4)
loadTukuiconfigbutton:SetAttribute("macrotext1", "/tukui config")

CreateBtn("tukuitestmodebutton", startupmenu, 360, 19, "activate MaxUI test mode", "MaxUI Testmode")
tukuitestmodebutton:Point("BOTTOM", loadTukuiconfigbutton, "TOP", 0, 4)
tukuitestmodebutton:SetAttribute("macrotext1", "/tukui test")

CreateBtn("tukuimoveuibutton", startupmenu, 360, 19, "activate MaxUI move mode", "MaxUI move modus")
tukuimoveuibutton:Point("BOTTOM", tukuitestmodebutton, "TOP", 0, 4)
tukuimoveuibutton:SetAttribute("macrotext1", "/tukui move")
	
end

hooksecurefunc(Panels, "Enable", Enable)
