------------------------------------------------------------------------------------------
-- MaxUI 3.50 TukUI 17 - LEGION 7.0 -- version: 31-07-2016
------------------------------------------------------------------------------------------

-- setting up LOCATION PANELS AND COORDINATES.

--------------------------------------------------------------------------------------
-- LOCALS/FUNCTIONS/...
--------------------------------------------------------------------------------------

local T, C, L = Tukui:unpack()
local Maps = T.Maps
local Minimap = T.Maps.Minimap
local Panels = T.Panels

local thickness = 1
local FontSize = 14
local FontFlag = "OUTLINE"
--local Font = "MaxUI"

--------------------------------------------------------------------------------------
-- UNWANTED PARTS
--------------------------------------------------------------------------------------

local function AddZoneAndCoords(self)
	local Coords = Minimap.MinimapCoords
	local Zone = Minimap.MinimapZone

	if C["MaxUI Tools"]["Locator"] == true then
		Zone:Hide()
		Coords:Hide()
	end
end
hooksecurefunc(Minimap, "AddZoneAndCoords", AddZoneAndCoords)
		
--------------------------------------------------------------------------------------
-- location panel
--------------------------------------------------------------------------------------
local function Enable()

	if C["MaxUI Tools"]["Locator"] == true then

	-- center panel with location
		local locpanel = CreateFrame("Frame", "locpanel", UIParent)
		locpanel:SetTemplate("Default")
		locpanel:Size(420, thickness)
		locpanel:Point("TOP", UIParent, "TOP", 0, -14)
		locpanel:SetFrameLevel(3)
		locpanel:SetFrameStrata("BACKGROUND")
		locpanel:EnableMouse(true)
		locpanel:SetAlpha(1)

		local locpanelbg = CreateFrame("Frame", "locpanelbg", locpanel)
		locpanelbg:SetTemplate("Default")
		locpanelbg:Size(420, 19)
		locpanelbg:Point("CENTER", locpanel, "CENTER", 0, 0)
		locpanelbg:SetFrameLevel(1)
		locpanelbg:SetFrameStrata("BACKGROUND")
		locpanelbg:EnableMouse(true)
		locpanelbg:SetAlpha(0.0)
				
		-- Set font
		local locFS = locpanel:CreateFontString(nil, "OVERLAY")
		if C["MaxUI Media"]["Font"] == "Caps" then
			locFS:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\caps.ttf", FontSize, "OUTLINE")
		elseif C["MaxUI Media"]["Font"] == "Comic" then
			locFS:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\comic.ttf", FontSize, "OUTLINE")
		elseif C["MaxUI Media"]["Font"] == "MaxUI" then
			locFS:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\MaxUI.ttf", FontSize, "OUTLINE")
		else	
			locFS:SetFont(C["Medias"].Font, FontSize, "OUTLINE")
		end

		local function SetLocColor(frame, pvpT)
			if (pvpT == "arena" or pvpT == "combat") then
				frame:SetTextColor(1, 0.5, 0)
			elseif pvpT == "friendly" then
				frame:SetTextColor(0, 1, 0)
			elseif pvpT == "contested" then
				frame:SetTextColor(1, 1, 0)
			elseif pvpT == "hostile" then
				frame:SetTextColor(1, 0, 0)
			elseif pvpT == "sanctuary" then
				frame:SetTextColor(0, .9, .9)
			else
				frame:SetTextColor(0, 1, 0)
			end
		end

		local function OnEvent()
			location = GetMinimapZoneText()
			pvpType = GetZonePVPInfo();
			locFS:SetText(location)
			SetLocColor(locFS, pvpType)
			locFS:SetPoint("CENTER", locpanel, "CENTER", 0, 0)
			locFS:SetJustifyH("CENTER")
		end

		locpanelbg:SetScript("OnMouseDown", function()
			if WorldMapFrame:IsShown() then
				WorldMapFrame:Hide()
			else
				WorldMapFrame:Show()
			end
		end)

		locpanelbg:SetScript("OnEnter", function()
			locFS:SetTextColor(1, 1, 1)
			GameTooltip:SetOwner(locpanelbg, "ANCHOR_BOTTOM", 0, -6)
			GameTooltip:AddLine("Open Worldmap", 1, 1, 1, 1, 1, 1)
			GameTooltip:Show()
		end)

		locpanelbg:SetScript("OnLeave", function()
			pvpType = GetZonePVPInfo();
			SetLocColor(locFS, pvpType)	
			GameTooltip:Hide()
		end)

	-- right coord panel (Y coordinate)
		
		-- TOPPANEL Ycoords
		local ycoords = CreateFrame("Frame", "ycoords", locpanel)
		ycoords:SetTemplate("Default")
		ycoords:Size(40, thickness)
		ycoords:Point("TOPLEFT", locpanel, "TOPRIGHT", 2, 0)
		ycoords:SetFrameLevel(2)
		ycoords:SetFrameStrata("BACKGROUND")
		ycoords:SetAlpha(1)

		-- set font
		local yFS = ycoords:CreateFontString(nil, "OVERLAY")
		if C["MaxUI Media"]["Font"] == "Caps" then
			yFS:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\caps.ttf", FontSize, "OUTLINE")
		elseif C["MaxUI Media"]["Font"] == "Comic" then
			yFS:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\comic.ttf", FontSize, "OUTLINE")
		elseif C["MaxUI Media"]["Font"] == "MaxUI" then
			yFS:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\MaxUI.ttf", FontSize, "OUTLINE")
		else	
			yFS:SetFont(C["Medias"].Font, FontSize, "OUTLINE")
		end

		-- y update
		local function yUpdate()
			posX, posY = GetPlayerMapPosition("player");
			if posY then posY = math.floor(100 * posY) else posY = "0" end
			yFS:SetText(posY)
			yFS:SetPoint("CENTER", ycoords, "CENTER", 2, 0)
		end

		-- left coord panel (X coordinate)

		-- TOPPANEL Xcoords
		local xcoords = CreateFrame("Frame", "xcoords", locpanel)
		xcoords:SetTemplate("Default")
		xcoords:Size(40, thickness)
		xcoords:Point("TOPRIGHT", locpanel, "TOPLEFT", -2, 0)
		xcoords:SetFrameLevel(2)
		xcoords:SetFrameStrata("BACKGROUND")
		xcoords:SetAlpha(1)

		-- set font
		local xFS = xcoords:CreateFontString(nil, "OVERLAY")
		if C["MaxUI Media"]["Font"] == "Caps" then
			xFS:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\caps.ttf", FontSize, "OUTLINE")
		elseif C["MaxUI Media"]["Font"] == "Comic" then
			xFS:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\comic.ttf", FontSize, "OUTLINE")
		elseif C["MaxUI Media"]["Font"] == "MaxUI" then
			xFS:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\MaxUI.ttf", FontSize, "OUTLINE")
		else	
			xFS:SetFont(C["Medias"].Font, FontSize, "OUTLINE")
		end

		-- x update
		local function xUpdate()
			posX, posY = GetPlayerMapPosition("player");
			if posX then posX = math.floor(100 * posX) else posX = "0" end
			xFS:SetText(posX)
			xFS:SetPoint("CENTER", xcoords, "CENTER", 0, 0)
		end

		-- register and update
		locpanel:RegisterEvent("ZONE_CHANGED")
		locpanel:RegisterEvent("PLAYER_ENTERING_WORLD")
		locpanel:RegisterEvent("ZONE_CHANGED_INDOORS")
		locpanel:RegisterEvent("ZONE_CHANGED_NEW_AREA")
		locpanel:SetScript("OnEvent", OnEvent)
		xcoords:SetScript("OnUpdate", xUpdate)
		ycoords:SetScript("OnUpdate", yUpdate)

		if C["MaxUI CombatFade"]["Locator"] == true then
		RegisterStateDriver(locpanel, "visibility", "[combat] hide; show")
		RegisterStateDriver(xcoords, "visibility", "[combat] hide; show")
		RegisterStateDriver(ycoords, "visibility", "[combat] hide; show")
		end
	end	
end
hooksecurefunc(Panels, "Enable", Enable)
