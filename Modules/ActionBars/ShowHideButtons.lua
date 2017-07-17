------------------------------------------------------------------------------------------
-- MaxUI 3.50 TukUI 17 - LEGION 7.0 -- version: 21-04-2017
------------------------------------------------------------------------------------------

--setting up ACTION BARS Show and Hide buttons.

------------------------------------------------------------------------------------------
-- LOCALS/FUNCTIONS/...
------------------------------------------------------------------------------------------

local T, C, L = Tukui:unpack()

------------------------------------------------------------------------------------------
--Show Hide Button adjustments
------------------------------------------------------------------------------------------

local ActionBars = T["ActionBars"]

local KillToggleButtons = function()
	for i = 4, 5 do
		local Button = T.Panels["ActionBar" .. i .. "ToggleButton"]
		Button:SetScript("OnEnter", nil)
		Button:SetScript("OnLeave", nil)
		Button:SetScript("OnClick", nil)
		Button:Hide()
	end

	if C["MaxUI Media"]["MouseoverAB"] == true then
		for i = 2, 3 do
			local Button = T.Panels["ActionBar" .. i .. "ToggleButton"]
			Button:SetScript("OnEnter", nil)
			Button:SetScript("OnLeave", nil)
			Button:SetScript("OnClick", nil)
			Button:Hide()
		end
	end
	
	if C["MaxUI Layout"]["Heallayout"] == true and C["MaxUI Layout"]["Meleelayout"] == false then
		for i = 2, 3 do
			local Button = T.Panels["ActionBar" .. i .. "ToggleButton"]
			Button:SetScript("OnEnter", nil)
			Button:SetScript("OnLeave", nil)
			Button:SetScript("OnClick", nil)
			Button:Hide()
		end
	end
end

hooksecurefunc(ActionBars, "CreateToggleButtons", KillToggleButtons)