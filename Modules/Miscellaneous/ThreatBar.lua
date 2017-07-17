------------------------------------------------------------------------------------------
-- MaxUI 3.50 TukUI 17 - LEGION 7.0 -- version: 31-07-2016
------------------------------------------------------------------------------------------

-- setting up ACTION BARS.

------------------------------------------------------------------------------------------
-- LOCALS/FUNCTIONS/...
------------------------------------------------------------------------------------------
local T, C, L = Tukui:unpack()
local Miscellaneous = T["Miscellaneous"]
local ThreatBar = Miscellaneous.ThreatBar
local Panels = T.Panels
local Size = C.ActionBars.NormalButtonSize
local Spacing = C.ActionBars.ButtonSpacing
local FontSize = 12
local FontFlag = "OUTLINE"
local Font = T.GetFont(C["MaxUI Media"]["Font"])
local Text = ThreatBar.Text
local Title = ThreatBar.Title

------------------------------------------------------------------------------------------
-- THREATBAR ADJUSTMENTS
------------------------------------------------------------------------------------------
hooksecurefunc(ThreatBar, "Parent", function()
	ThreatBar:SetParent(castbarline)
end)

hooksecurefunc(ThreatBar, "Create", function()
	ThreatBar:SetFrameLevel(2)
	ThreatBar:SetHeight(12) 
	ThreatBar:SetWidth((Size * 13) + (Spacing * 13) -4)
	ThreatBar:CreateBackdrop()
	ThreatBar.Backdrop:CreateShadow("Default")
	ThreatBar:SetStatusBarTexture(T.GetTexture(C.UnitFrames.HealthTexture))

	if C["MaxUI Media"]["Font"] == "Caps" then
		ThreatBar.Text:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\caps.ttf", FontSize, "OUTLINE")
	elseif C["MaxUI Media"]["Font"] == "Comic" then
		ThreatBar.Text:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\comic.ttf", FontSize, "OUTLINE")
	elseif C["MaxUI Media"]["Font"] == "MaxUI" then
		ThreatBar.Text:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\MaxUI.ttf", FontSize, "OUTLINE")
	else	
		ThreatBar.Text:SetFont(C["Medias"].Font, 12, "OUTLINE")
	end

	if C["MaxUI Media"]["Font"] == "Caps" then
		ThreatBar.Title:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\caps.ttf", FontSize, "OUTLINE")
	elseif C["MaxUI Media"]["Font"] == "Comic" then
		ThreatBar.Title:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\comic.ttf", FontSize, "OUTLINE")
	elseif C["MaxUI Media"]["Font"] == "MaxUI" then
		ThreatBar.Title:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\MaxUI.ttf", FontSize, "OUTLINE")
	else	
		ThreatBar.Title:SetFont(C["Medias"].Font, 12, "OUTLINE")
	end
	
		ThreatBar.Title:ClearAllPoints()
		ThreatBar.Title:Point("LEFT", ThreatBar, 2, 0)

		ThreatBar.Text:ClearAllPoints()
		ThreatBar.Text:Point("RIGHT", ThreatBar, -2, 0)

	ThreatBar.Background:ClearAllPoints()
	ThreatBar.Background = ThreatBar:CreateTexture(nil, "BORDER")
	ThreatBar.Background:Point("TOPLEFT", ThreatBar, 0, 0)
	ThreatBar.Background:Point("BOTTOMRIGHT", ThreatBar, 0, 0)
	ThreatBar.Background:SetTexture(0, 0, 0)
	
	-- MELEE LAYOUT + MELEE DPS LAYOUT
	ThreatBar:ClearAllPoints()
	ThreatBar:SetPoint("CENTER", REPXPline, "CENTER", 0, -0)

	-- HEALING LAYOUT + HEALING DPS
	if C["MaxUI Layout"]["Heallayout"] == true and C["MaxUI Layout"]["Meleelayout"] == false then
		ThreatBar:ClearAllPoints()
		ThreatBar:SetFrameLevel(15)
		ThreatBar:SetHeight(12) 
		ThreatBar:SetWidth((Size * 6) + (Spacing * 9) -4)
		ThreatBar:SetPoint("TOP", ABline02V, "BOTTOM", 52, 0)
		
		ThreatBar.Title:ClearAllPoints()
		ThreatBar.Title:Point("LEFT", ThreatBar, 2, 0)

		ThreatBar.Text:ClearAllPoints()
		ThreatBar.Text:Point("RIGHT", ThreatBar, -2, 0)
	end
end)