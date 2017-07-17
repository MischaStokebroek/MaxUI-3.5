------------------------------------------------------------------------------------------
-- MaxUI 3.50 TukUI 17 - LEGION 7.0 -- v. 21-04-2017
------------------------------------------------------------------------------------------

--setting up FUNCTIONS.

------------------------------------------------------------------------------------------
-- LOCALS
------------------------------------------------------------------------------------------

--[[

local T, C, L = Tukui:unpack()

local thickness = 1
local FontSize = 14
local FontFlag = "OUTLINE"
local Font = T.GetFont(C["MaxUI Media"]["Font"])

------------------------------------------------------------------------------------------
-- global button function
------------------------------------------------------------------------------------------

T.CreateBtn = function(buttonname, buttonparent, buttonwidth, buttonheight, tooltiptext, buttontext, buttonicon) -- 1. Name, 2. Parent, 3. width, 4. height, 5. tooltip text, 6. text on button 7. icon texture on button
	
	-- basic button
	local button = CreateFrame("Button", buttonname, buttonparent, "SecureActionButtonTemplate")
	button:Width(buttonwidth)
	button:Height(buttonheight)
	button:SetTemplate()

	-- button text
	local buttontext = button:CreateFontString(nil, "OVERLAY")
		if C["MaxUI Media"]["Font"]== "Caps" then
		buttontext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\caps.ttf", FontSize, FontFlag)
		elseif C["MaxUI Media"]["Font"] == "Comic" then
		buttontext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\comic.ttf", FontSize, FontFlag)
		elseif C["MaxUI Media"]["Font"] == "MaxUI" then
		buttontext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\MaxUI.ttf", FontSize, FontFlag)
		else	
		buttontext:SetFont(C["Medias"].Font, FontSize, FontFlag)
		end

	buttontext:SetText(buttontext)
	buttontext:SetTextColor(1, 1, 1)
	buttontext:SetPoint("CENTER", button, 'CENTER', 0, 0)
	buttontext:SetJustifyH("CENTER")	
	
	--button mouseaction (mousover or click)
	button:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_TOP", 0, -20)
		GameTooltip:AddLine(tooltiptext, 1, 1, 1, 1, 1, 1)
		GameTooltip:Show()
		buttontext:SetTextColor(class.r, class.g, class.b)
		button:SetBackdropBorderColor(class.r, class.g, class.b)
	end)
	
	button:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
		buttontext:SetTextColor(1, 1, 1)
		button:SetBackdropBorderColor(unpack(C["General"]["BorderColor"]))
	end)

	button:SetAttribute("type1", "macro")

	buttonicon = button:CreateTexture(nil, "OVERLAY")
	buttonicon:Size(buttonwidth, buttonheight)
	buttonicon:Point("CENTER", button, "CENTER", 0, 0)
	buttonicon:SetTexture(GetTexture(buttonicon))
	
	button:CreateOverlayTooltip()

end

]]--