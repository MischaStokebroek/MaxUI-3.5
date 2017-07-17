------------------------------------------------------------------------------------------
-- MaxUI 3.50 TukUI 17 - LEGION 7.0 -- version: 21-04-2017
------------------------------------------------------------------------------------------

--setting up ACTION BARS.

------------------------------------------------------------------------------------------
-- LAYOUT / DESCRIPTION
------------------------------------------------------------------------------------------

-- Melee/tank layout
-- ab2 4x3 - 3x12 AB 4-5-1 - ab3 4x3

-- healing layout
-- ab5 3x4, ab3 3x4 -- ab1 1x12 -- ab2 3x4, ab4 3x4

-- centered layout
--	ab4 4x3 between player and target
--  ab2 6x2 - 2x12 AB 5-1 - ab3 6x2

------------------------------------------------------------------------------------------
-- LOCALS/FUNCTIONS/BASIC PANELS/ANCHORLINES
------------------------------------------------------------------------------------------

local T, C, L = Tukui:unpack()

local Panels = T.Panels
local ActionBars = T.ActionBars
local thickness = 1
local class = RAID_CLASS_COLORS[select(2, UnitClass("player"))]
local Movers = T["Movers"]

local function Enable()
	local Size = C.ActionBars.NormalButtonSize
	local Spacing = C.ActionBars.ButtonSpacing

	-- BASIC LAYOUT
	local ABline01 = CreateFrame("Frame", "ABline01", UIParent)
	ABline01:SetTemplate()
	ABline01:SetHeight(thickness) 
	ABline01:SetWidth((Size * 13) + (Spacing * 13))
	ABline01:Point("BOTTOM", UIParent, "BOTTOM", 0, 90)
	ABline01:SetFrameLevel(2)
	ABline01:SetFrameStrata("BACKGROUND")
	ABline01:SetAlpha(1)

	local ABline02 = CreateFrame("Frame", "ABline02", UIParent)
	ABline02:SetTemplate()
	ABline02:SetHeight(thickness) 
	ABline02:SetWidth((Size * 13) + (Spacing * 13))
	ABline02:Point("BOTTOM", ABline01, "BOTTOM", 0, (Size * 1) + (Spacing * 1))
	ABline02:SetFrameLevel(2)
	ABline02:SetFrameStrata("BACKGROUND")
	ABline02:SetAlpha(1)

	local ABline03 = CreateFrame("Frame", "ABline03", UIParent)
	ABline03:SetTemplate()
	ABline03:SetHeight(thickness) 
	ABline03:SetWidth((Size * 13) + (Spacing * 13))
	ABline03:Point("BOTTOM", ABline02, "BOTTOM", 0, (Size * 1) + (Spacing * 1))
	ABline03:SetFrameLevel(2)
	ABline03:SetFrameStrata("BACKGROUND")
	ABline03:SetAlpha(1)

	-- Class art as backdrop
	if C["MaxUI Media"]["ActionbarClass"] == true then
		ABline01.Logoclass = ABline01:CreateTexture(nil, "OVERLAY")
		ABline01.Logoclass:Size(250, 250)
		ABline01.Logoclass:Point("BOTTOM", ABline01, "TOP", 0, -80)
	
		if select(2, UnitClass('player')) == "DRUID" then
		ABline01.Logoclass:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\ClassIcons\DRUID.tga]])
		end
		
		if select(2, UnitClass('player')) == "MONK" then
		ABline01.Logoclass:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\ClassIcons\MONK.tga]])
		end
		
		if select(2, UnitClass('player')) == "ROGUE" then
		ABline01.Logoclass:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\ClassIcons\ROGUE.tga]])
		end
		
		if select(2, UnitClass('player')) == "MAGE" then
		ABline01.Logoclass:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\ClassIcons\MAGE.tga]])
		end
		
		if select(2, UnitClass('player')) == "PRIEST" then
		ABline01.Logoclass:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\ClassIcons\PRIEST.tga]])
		end
		
		if select(2, UnitClass('player')) == "WARLOCK" then
		ABline01.Logoclass:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\ClassIcons\WARLOCK.tga]])
		end
		
		if select(2, UnitClass('player')) == "SHAMAN" then
		ABline01.Logoclass:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\ClassIcons\SHAMAN.tga]])
		end
		
		if select(2, UnitClass('player')) == "HUNTER" then
		ABline01.Logoclass:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\ClassIcons\HUNTER.tga]])
		end
		
		if select(2, UnitClass('player')) == "DEATHKNIGHT" then
		ABline01.Logoclass:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\ClassIcons\DEATHKNIGHT.tga]])
		end
		
		if select(2, UnitClass('player')) == "WARRIOR" then
		ABline01.Logoclass:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\ClassIcons\WARRIOR.tga]])
		end
	
		if select(2, UnitClass('player')) == "PALADIN" then
		ABline01.Logoclass:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\ClassIcons\PALADIN.tga]])
		end
		
		if select(2, UnitClass('player')) == "DEMONHUNTER" then
		ABline01.Logoclass:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\ClassIcons\DEMONHUNTER.tga]])
		end
	end
	
	-- HEALING LAYOUT
	if C["MaxUI Layout"]["Heallayout"] == true and C["MaxUI Layout"]["Meleelayout"] == false then
	
		ABline01:ClearAllPoints()
		ABline01:Point("BOTTOM", UIParent, "BOTTOM", 0, 54)
		
		if C["MaxUI Layout"]["SINGLECenterBar"] == true then
			ABline01:ClearAllPoints()
			ABline01:Point("BOTTOM", UIParent, "BOTTOM", 0, 318)
		end

		if C["MaxUI Layout"]["DOUBLECenterBar"] == true then
			ABline01:ClearAllPoints()
			ABline01:Point("BOTTOM", UIParent, "BOTTOM", 0, 318)
		end
		
		ABline02:ClearAllPoints()
		ABline02:SetWidth((Size * 3) + (Spacing * 8))
		ABline02:Point("LEFT", LEFTChatline, "RIGHT", 10, 0)

			local ABline02V = CreateFrame("Frame", "ABline02V", ABline02)
			ABline02V:SetTemplate()
			ABline02V:SetHeight((Size * 4) + (Spacing * 8)) 
			ABline02V:SetWidth(thickness)
			ABline02V:Point("TOP", ABline02, "BOTTOM", 0, 0)
			ABline02V:SetFrameLevel(2)
			ABline02V:SetFrameStrata("BACKGROUND")
			ABline02V:SetAlpha(1)
		
		ABline03:ClearAllPoints()
			local ABline03V = CreateFrame("Frame", "ABline03V", ABline03)
			ABline03V:SetTemplate()
			ABline03V:SetHeight((Size * 4) + (Spacing * 8)) 
			ABline03V:SetWidth(thickness)
			ABline03V:Point("TOP", ABline03, "BOTTOM", 0, 0)
			ABline03V:SetFrameLevel(2)
		ABline03:SetWidth((Size * 3) + (Spacing * 8))
		ABline03:Point("LEFT", ABline02, "RIGHT", -10, 0)

			ABline03V:SetFrameStrata("BACKGROUND")
			ABline03V:SetAlpha(1)
		
		local ABline04 = CreateFrame("Frame", "ABline04", UIParent)
		ABline04:SetTemplate()
		ABline04:SetHeight(thickness) 
		ABline04:SetWidth((Size * 3) + (Spacing * 8))
		ABline04:Point("RIGHT", RIGHTChatline, "LEFT", -10, 0)
		ABline04:SetFrameLevel(2)
		ABline04:SetFrameStrata("BACKGROUND")
		ABline04:SetAlpha(1)

			local ABline04V = CreateFrame("Frame", "ABline04V", ABline04)
			ABline04V:SetTemplate()
			ABline04V:SetWidth(thickness) 
			ABline04V:SetHeight((Size * 4) + (Spacing * 8))
			ABline04V:Point("TOP", ABline04, "BOTTOM", 0, 0)
			ABline04V:SetFrameLevel(2)
			ABline04V:SetFrameStrata("BACKGROUND")
			ABline04V:SetAlpha(1)

		local ABline05 = CreateFrame("Frame", "ABline05", UIParent)
		ABline05:SetTemplate()
		ABline05:SetHeight(thickness) 
		ABline05:SetWidth((Size * 3) + (Spacing * 8))
		ABline05:Point("RIGHT", ABline04, "LEFT", 10, 0)
		ABline05:SetFrameLevel(2)
		ABline05:SetFrameStrata("BACKGROUND")
		ABline05:SetAlpha(1)

			local ABline05V = CreateFrame("Frame", "ABline05V", ABline05)
			ABline05V:SetTemplate()
			ABline05V:SetWidth(thickness) 
			ABline05V:SetHeight((Size * 4) + (Spacing * 8))
			ABline05V:Point("TOP", ABline05, "BOTTOM", 0, 0)
			ABline05V:SetFrameLevel(2)
			ABline05V:SetFrameStrata("BACKGROUND")
			ABline05V:SetAlpha(1)
			
		RegisterStateDriver(ABline04, "visibility", "[vehicleui][petbattle][overridebar] hide; show")
		RegisterStateDriver(ABline04V, "visibility", "[vehicleui][petbattle][overridebar] hide; show")
		RegisterStateDriver(ABline05, "visibility", "[vehicleui][petbattle][overridebar] hide; show")
		RegisterStateDriver(ABline05V, "visibility", "[vehicleui][petbattle][overridebar] hide; show")
	
	if C["MaxUI Layout"]["DOUBLECenterBar"] == true then
		ABline03:SetAlpha(0)
		ABline03V:SetAlpha(0)
		ABline05:SetAlpha(0)
		ABline05V:SetAlpha(0)
	end
	end

	-- SINGLE CENTER BAR LAYOUT
	if C["MaxUI Layout"]["SINGLECenterBar"] == true and C["MaxUI Layout"]["Meleelayout"] == true then
		ABline03:ClearAllPoints()
		ABline03:SetWidth((Size * 5) + (Spacing * 5))
		ABline03:Point("CENTER", UIParent, "CENTER", 0, -222)
		
		--ABline01:ClearAllPoints()
		--ABline01:Point("BOTTOM", UIParent, "BOTTOM", 0, 216 -((Size * 1) + (Spacing * 1)))
		
		--ABline02:ClearAllPoints()
		--ABline02:Point("BOTTOM", ABline01, "BOTTOM", 0, ((Size * 1) + (Spacing * 1)))
	end
	
	-- DOUBLE CENTER BAR LAYOUT
	if C["MaxUI Layout"]["DOUBLECenterBar"] == true and C["MaxUI Layout"]["Meleelayout"] == true then
		ABline03:ClearAllPoints()
		ABline03:SetWidth((Size * 9) + (Spacing * 10))
		ABline03:Point("CENTER", UIParent, "CENTER", 0, -222)
		
		ABline01:ClearAllPoints()
		ABline01:Point("BOTTOM", UIParent, "BOTTOM", 0, 90+(Size/2))
		ABline01:SetWidth((Size * 7) + (Spacing * 8))
		ABline01:SetAlpha(0)
		
		ABline02:ClearAllPoints()
		ABline02:Hide()
	end
	
	-- Pet battle Fade / in Vehicle
	RegisterStateDriver(ABline01, 'visibility', '[petbattle] hide; show') 
	RegisterStateDriver(ABline02, "visibility", "[vehicleui][petbattle][overridebar] hide; show")
	RegisterStateDriver(ABline03, "visibility", "[vehicleui][petbattle][overridebar] hide; show")
	
	-- Combat Fade options
	if C["MaxUI CombatFade"]["ActionBar1"] == true then
		RegisterStateDriver(ABline01, "visibility", "[combat] hide; show")
	end
	if C["MaxUI CombatFade"]["ActionBar3"] == true and C["MaxUI Layout"]["Heallayout"] == true and C["MaxUI Layout"]["Meleelayout"] == false then
		RegisterStateDriver(ABline03, "visibility", "[combat] hide; show")
		RegisterStateDriver(ABline03V, "visibility", "[combat] hide; show")
	end
	if C["MaxUI CombatFade"]["ActionBar2"] == true and C["MaxUI Layout"]["Heallayout"] == true and C["MaxUI Layout"]["Meleelayout"] == false then
		RegisterStateDriver(ABline05, "visibility", "[combat] hide; show")
		RegisterStateDriver(ABline05V, "visibility", "[combat] hide; show")
	end
	if C["MaxUI CombatFade"]["ActionBar4"] == true and C["MaxUI Layout"]["Heallayout"] == true and C["MaxUI Layout"]["Meleelayout"] == false then
		RegisterStateDriver(ABline04, "visibility", "[combat] hide; show")
		RegisterStateDriver(ABline04V, "visibility", "[combat] hide; show")
	end
	if C["MaxUI CombatFade"]["ActionBar5"] == true and C["MaxUI Layout"]["Heallayout"] == true and C["MaxUI Layout"]["Meleelayout"] == false then
		RegisterStateDriver(ABline02, "visibility", "[combat] hide; show")
		RegisterStateDriver(ABline02V, "visibility", "[combat] hide; show")
	end
	if C["MaxUI CombatFade"]["ActionBar1"] == true and C["MaxUI Layout"]["Heallayout"] == true and C["MaxUI Layout"]["Meleelayout"] == false then
		RegisterStateDriver(ABline01, "visibility", "[combat] hide; show")
	end
end

hooksecurefunc(Panels, "Enable", Enable)
	
------------------------------------------------------------------------------------------
-- ACTIONBAR 1
------------------------------------------------------------------------------------------
hooksecurefunc(ActionBars, 'CreateBar1', function()
	local Size = C.ActionBars.NormalButtonSize
	local Spacing = C.ActionBars.ButtonSpacing
	local ActionBar1 = Panels.ActionBar1
	local MainMenuBar_OnEvent = MainMenuBar_OnEvent
	
	-- MELEE LAYOUT
	ActionBar1:SetPoint("BOTTOM", ABline01, "BOTTOM", 0, -16)
	ActionBar1.Backdrop:SetAlpha(C["MaxUI Media"]["chatpanelalpha"])
	ActionBar1:Height( (Size*3) + (Spacing*4) )
	
	-- SINGLE CENTERED BAR
	if C["MaxUI Layout"]["SINGLECenterBar"] == true and C["MaxUI Layout"]["Meleelayout"] == true then
	ActionBar1:Height( (Size*2) + (Spacing*3) )
	end
	
	-- DOUBLE CENTERED BAR
	if C["MaxUI Layout"]["DOUBLECenterBar"] == true and C["MaxUI Layout"]["Meleelayout"] == true then
	ActionBar1:Height( (Size*2) + (Spacing*3) )
	ActionBar1:Width( (Size*6) + (Spacing*7) )
	ActionBar1:ClearAllPoints()
	ActionBar1:SetPoint("CENTER", ABline01, "CENTER", 0, 0)
	
	ActionBar1:SetScript("OnEvent", function(self, event, unit, ...)
		if (event == "ACTIVE_TALENT_GROUP_CHANGED") then
			TukuiActionBars:UpdateBar1()
		elseif (event == "PLAYER_ENTERING_WORLD") then
			for i = 1, NUM_ACTIONBAR_BUTTONS do
				local Button = _G["ActionButton"..i]
				Button:Size(Size)
				Button:ClearAllPoints()
				Button:SetParent(self)
					
				if (i == 1) then
					Button:SetPoint("BOTTOMLEFT", Spacing, Spacing)
				elseif (i == 7) then
					Button:SetPoint("TOPLEFT", Spacing, -Spacing)
				else
					local Previous = _G["ActionButton"..i-1]
					Button:SetPoint("LEFT", Previous, "RIGHT", Spacing, 0)
				end
			end
		else
			MainMenuBar_OnEvent(self, event, ...)
		end
	end)

		for i = 1, NUM_ACTIONBAR_BUTTONS do
			local Button = _G["ActionButton"..i]
			ActionBar1["Button"..i] = Button
		end
	end
	
	-- HEALING LAYOUT
	if C["MaxUI Layout"]["Heallayout"] == true and C["MaxUI Layout"]["Meleelayout"] == false then
		ActionBar1:ClearAllPoints()
		ActionBar1:SetPoint("CENTER", ABline01, "CENTER", 0, 0)
		ActionBar1:Height( (Size*1) + (Spacing*2) )

		if C["MaxUI Layout"]["DOUBLECenterBar"] == true then
			ActionBar1:ClearAllPoints()
			ActionBar1:SetPoint("CENTER", ABline01, "CENTER", 0, 0)
			ActionBar1:Height( (Size*2) + (Spacing*3) )
			ActionBar1:Width( (Size*6) + (Spacing*7) )
			
			ActionBar1:SetScript("OnEvent", function(self, event, unit, ...)
				if (event == "ACTIVE_TALENT_GROUP_CHANGED") then
					TukuiActionBars:UpdateBar1()
				elseif (event == "PLAYER_ENTERING_WORLD") then
					for i = 1, NUM_ACTIONBAR_BUTTONS do
						local Button = _G["ActionButton"..i]
						Button:Size(Size)
						Button:ClearAllPoints()
						Button:SetParent(self)
							
						if (i == 1) then
							Button:SetPoint("BOTTOMLEFT", Spacing, Spacing*2/3)
						elseif (i == 7) then
							Button:SetPoint("TOPLEFT", Spacing, -Spacing*2/3)
						else
							local Previous = _G["ActionButton"..i-1]
							Button:SetPoint("LEFT", Previous, "RIGHT", Spacing, 0)
						end
					end
				else
					MainMenuBar_OnEvent(self, event, ...)
				end
			end)

				for i = 1, NUM_ACTIONBAR_BUTTONS do
					local Button = _G["ActionButton"..i]
					ActionBar1["Button"..i] = Button
				end
		end
	end	

	RegisterStateDriver(ActionBar1, "visibility", "[petbattle] hide; show")
		if C["MaxUI CombatFade"]["ActionBar1"] == true then
		RegisterStateDriver(ActionBar1, "visibility", "[combat] hide; show")
		end
end)

------------------------------------------------------------------------------------------
-- ACTIONBAR 2
------------------------------------------------------------------------------------------
hooksecurefunc(ActionBars, 'CreateBar2', function()
	local Size = C.ActionBars.NormalButtonSize
	local Spacing = C.ActionBars.ButtonSpacing
	local ActionBar2 = Panels.ActionBar2

	-- MELEE
	ActionBar2:SetFrameLevel(5)
	ActionBar2:SetHeight( (Size*3) + (Spacing*4))
	ActionBar2:SetWidth((Size*4) + (Spacing * 5))
	ActionBar2.Backdrop:SetAlpha(C["MaxUI Media"]["chatpanelalpha"])

	if C["MaxUI Media"]["MouseoverAB"] == true then
		ActionBar2:SetAlpha(0)
			if C["MaxUI Layout"]["Heallayout"] == true and C["MaxUI Layout"]["Meleelayout"] == false then
				ABline05:SetAlpha(0)
				ABline05V:SetAlpha(0)
			end
		ActionBar2:SetScript("OnEnter", function(self)
			ActionBar2:SetAlpha(1)
			if C["MaxUI Layout"]["Heallayout"] == true and C["MaxUI Layout"]["Meleelayout"] == false then
				ABline05:SetAlpha(1)
				ABline05V:SetAlpha(1)
			end
		end)
		ActionBar2:SetScript("OnLeave", function(self)
			ActionBar2:SetAlpha(0)
			if C["MaxUI Layout"]["Heallayout"] == true and C["MaxUI Layout"]["Meleelayout"] == false then
				ABline05:SetAlpha(0)
				ABline05V:SetAlpha(0)
			end
		end)
	end
		
	for i = 1, NUM_ACTIONBAR_BUTTONS do
		local Button = _G["MultiBarBottomLeftButton"..i]
		local PreviousButton = _G["MultiBarBottomLeftButton"..i-1]
		
		Button:Size(Size)
		Button:ClearAllPoints()
		Button:SetFrameStrata("BACKGROUND")
		Button:SetFrameLevel(2)

		if C["MaxUI Media"]["MouseoverAB"] == true then
			Button:SetScript("OnEnter", function(self)
				ActionBar2:SetAlpha(1)
				if C["MaxUI Layout"]["Heallayout"] == true and C["MaxUI Layout"]["Meleelayout"] == false then
					ABline05:SetAlpha(1)
					ABline05V:SetAlpha(1)
				end
			end)
			
			Button:SetScript("OnLeave", function(self)
				ActionBar2:SetAlpha(0)
				if C["MaxUI Layout"]["Heallayout"] == true and C["MaxUI Layout"]["Meleelayout"] == false then
					ABline05:SetAlpha(0)
					ABline05V:SetAlpha(0)
				end
			end)
		end
		
		if (i == 1) then
			Button:SetPoint("BOTTOMRIGHT", ActionBar2, -Spacing, Spacing)
		elseif (i == 5) then
			Button:SetPoint("RIGHT", ActionBar2, -Spacing, 0)
		elseif (i == 9) then
			Button:SetPoint("TOPRIGHT", ActionBar2, -Spacing, -Spacing)
		else
			Button:SetPoint("RIGHT", PreviousButton, "LEFT", -Spacing, 0)
		end
		
	ActionBar2["Button"..i] = Button
	end

	for i = 7, 12 do
		local Button = _G["MultiBarBottomLeftButton"..i]
		local Button1 = _G["MultiBarBottomLeftButton1"]
		
		Button:SetFrameLevel(Button1:GetFrameLevel() - 2)
	end

	-- HEALING 
	if C["MaxUI Layout"]["Heallayout"] == true and C["MaxUI Layout"]["Meleelayout"] == false then
		ActionBar2:SetFrameLevel(5)
		ActionBar2:SetHeight( (Size*4) + (Spacing*5))
		ActionBar2:SetWidth((Size*3) + (Spacing * 4))
		ActionBar2:ClearAllPoints()
		ActionBar2:SetPoint("TOP", ABline05, "BOTTOM", 0, -Spacing)

		for i = 1, NUM_ACTIONBAR_BUTTONS do
			local Button = _G["MultiBarBottomLeftButton"..i]
			local PreviousButton = _G["MultiBarBottomLeftButton"..i-1]
		
			Button:Size(Size)
			Button:ClearAllPoints()
			Button:SetFrameStrata("BACKGROUND")
			Button:SetFrameLevel(15)
		
			if (i == 1) then
				Button:SetPoint("BOTTOMRIGHT", ActionBar2, -Spacing, Spacing)
			elseif (i == 4) then
				Button:SetPoint("BOTTOMRIGHT", ActionBar2, -Spacing, (Size+(Spacing*2) ) )
			elseif (i == 7) then
				Button:SetPoint("TOPRIGHT", ActionBar2, -Spacing, -(Size+(Spacing*2)) )
			elseif (i == 10) then
				Button:SetPoint("TOPRIGHT", ActionBar2, -Spacing, -Spacing)
			else
				Button:SetPoint("RIGHT", PreviousButton, "LEFT", -Spacing, 0)
			end
		
			ActionBar2["Button"..i] = Button
		end

		for i = 7, 12 do
			local Button = _G["MultiBarBottomLeftButton"..i]
			local Button1 = _G["MultiBarBottomLeftButton1"]
			Button:SetFrameLevel(Button1:GetFrameLevel() - 2)
		end
	
		if C["MaxUI Layout"]["DOUBLECenterBar"] == true then
			ActionBar2:ClearAllPoints()
			ActionBar2:Point("LEFT", ABline01, "CENTER", (Size*3+Spacing*4+2), 0)
			ActionBar2:SetFrameLevel(5)
			ActionBar2:SetHeight((Size*2) + (Spacing*3))
			ActionBar2:SetWidth((Size*3) + (Spacing *2))
		
			for i = 1, NUM_ACTIONBAR_BUTTONS do
			local Button = _G["MultiBarBottomLeftButton"..i]
			local PreviousButton = _G["MultiBarBottomLeftButton"..i-1]
				local Spacing = Spacing
				Button:Size(Size*2/3)
				Button:ClearAllPoints()
				Button:SetFrameStrata("BACKGROUND")
				Button:SetFrameLevel(15)
			
				if (i == 1) then
					Button:SetPoint("BOTTOMRIGHT", ActionBar2, -Spacing*2/3, Spacing*2/3)
				elseif (i == 5) then
					Button:SetPoint("RIGHT", ActionBar2, -Spacing*2/3, 0)
				elseif (i == 9) then
					Button:SetPoint("TOPRIGHT", ActionBar2, -Spacing*2/3, -Spacing*2/3)
				else
					Button:SetPoint("RIGHT", PreviousButton, "LEFT", -Spacing, 0)
				end
				ActionBar2["Button"..i] = Button
			end
		
			for i = 7, 12 do
				local Button = _G["MultiBarBottomLeftButton"..i]
				local Button1 = _G["MultiBarBottomLeftButton1"]
				Button:SetFrameLevel(Button1:GetFrameLevel() - 2)
			end
		end
	end
	
	-- CENTER BAR LAYOUT
	if (C["MaxUI Layout"]["SINGLECenterBar"] == true or C["MaxUI Layout"]["DOUBLECenterBar"] == true) and C["MaxUI Layout"]["Meleelayout"] == true then
		ActionBar2:SetFrameLevel(5)
		ActionBar2:SetHeight( (Size*2) + (Spacing*3))
		ActionBar2:SetWidth((Size*6) + (Spacing * 7))

		for i = 1, NUM_ACTIONBAR_BUTTONS do
			local Button = _G["MultiBarBottomLeftButton"..i]
			local PreviousButton = _G["MultiBarBottomLeftButton"..i-1]
		
			Button:Size(Size)
			Button:ClearAllPoints()
			Button:SetFrameStrata("BACKGROUND")
			Button:SetFrameLevel(15)
		
			if (i == 1) then
				Button:SetPoint("BOTTOMRIGHT", ActionBar2, -Spacing, Spacing)
			elseif (i == 7) then
				Button:SetPoint("BOTTOMRIGHT", ActionBar2, -Spacing, (Size+(Spacing*2) ) )
			else
				Button:SetPoint("RIGHT", PreviousButton, "LEFT", -Spacing, 0)
			end
		
			ActionBar2["Button"..i] = Button
		end

		for i = 7, 12 do
			local Button = _G["MultiBarBottomLeftButton"..i]
			local Button1 = _G["MultiBarBottomLeftButton1"]
		
			Button:SetFrameLevel(Button1:GetFrameLevel() - 2)
		end
	end
	
	if C["MaxUI CombatFade"]["ActionBar2"] == true then
	RegisterStateDriver(ActionBar2, "visibility", "[combat] hide; show")
	end

end)

------------------------------------------------------------------------------------------
-- ACTIONBAR 3
------------------------------------------------------------------------------------------
hooksecurefunc(ActionBars, 'CreateBar3', function()
	local Size = C.ActionBars.NormalButtonSize
	local Spacing = C.ActionBars.ButtonSpacing
	local ActionBar3 = Panels.ActionBar3
	
	-- MELEE
	ActionBar3:SetFrameLevel(5)
	ActionBar3:SetHeight( (Size*3) + (Spacing*4))
	ActionBar3:SetWidth((Size*4) + (Spacing * 5))
	ActionBar3.Backdrop:SetAlpha(C["MaxUI Media"]["chatpanelalpha"])

	if C["MaxUI Media"]["MouseoverAB"] == true then
		ActionBar3:SetAlpha(0)
		if C["MaxUI Layout"]["Heallayout"] == true and C["MaxUI Layout"]["Meleelayout"] == false then
			ABline03:SetAlpha(0)
			ABline03V:SetAlpha(0)
		end
		ActionBar3:SetScript("OnEnter", function(self)
			ActionBar3:SetAlpha(1)
			if C["MaxUI Layout"]["Heallayout"] == true and C["MaxUI Layout"]["Meleelayout"] == false then
				ABline03:SetAlpha(1)
				ABline03V:SetAlpha(1)
			end		
		end)
		ActionBar3:SetScript("OnLeave", function(self)
			ActionBar3:SetAlpha(0)
			if C["MaxUI Layout"]["Heallayout"] == true and C["MaxUI Layout"]["Meleelayout"] == false then
				ABline03:SetAlpha(0)
				ABline03V:SetAlpha(0)
			end
		end)
	end

	for i = 1, NUM_ACTIONBAR_BUTTONS do
		local Button = _G["MultiBarBottomRightButton"..i]
		local PreviousButton = _G["MultiBarBottomRightButton"..i-1]
		
		Button:Size(Size)
		Button:ClearAllPoints()
		Button:SetFrameStrata("BACKGROUND")
		Button:SetFrameLevel(15)

		if C["MaxUI Media"]["MouseoverAB"] == true then		
			Button:SetScript("OnEnter", function(self)
				ActionBar3:SetAlpha(1)
				if C["MaxUI Layout"]["Heallayout"] == true and C["MaxUI Layout"]["Meleelayout"] == false then
					ABline03:SetAlpha(1)
					ABline03V:SetAlpha(1)
				end
			end)
			Button:SetScript("OnLeave", function(self)
				ActionBar3:SetAlpha(0)
				if C["MaxUI Layout"]["Heallayout"] == true and C["MaxUI Layout"]["Meleelayout"] == false then
					ABline03:SetAlpha(0)
					ABline03V:SetAlpha(0)
				end
			end)
		end

		if (i == 1) then
			Button:SetPoint("BOTTOMLEFT", ActionBar3, Spacing, Spacing)
		elseif (i == 5) then
			Button:SetPoint("LEFT", ActionBar3, Spacing, 0)
		elseif (i == 9) then
			Button:SetPoint("TOPLEFT", ActionBar3, Spacing, -Spacing)
		else
			Button:SetPoint("LEFT", PreviousButton, "RIGHT", Spacing, 0)
		end
		
		ActionBar3["Button"..i] = Button
	end
	
	for i = 7, 12 do
		local Button = _G["MultiBarBottomRightButton"..i]
		local Button1 = _G["MultiBarBottomRightButton1"]
		
		Button:SetFrameLevel(Button1:GetFrameLevel() - 2)
	end

	-- HEALING LAYOUT
	if C["MaxUI Layout"]["Heallayout"] == true and C["MaxUI Layout"]["Meleelayout"] == false then
	
		ActionBar3:ClearAllPoints()
		ActionBar3:Point("TOP", ABline03, "BOTTOM", 0, -Spacing)
		ActionBar3:SetFrameLevel(5)
		ActionBar3:SetHeight((Size*4) + (Spacing*5))
		ActionBar3:SetWidth((Size*3) + (Spacing * 4))
	
		for i = 1, NUM_ACTIONBAR_BUTTONS do
			local Button = _G["MultiBarBottomRightButton"..i]
			local PreviousButton = _G["MultiBarBottomRightButton"..i-1]
		
			Button:Size(Size)
			Button:ClearAllPoints()
			Button:SetFrameStrata("BACKGROUND")
			Button:SetFrameLevel(15)
		
			if (i == 1) then
				Button:SetPoint("BOTTOMRIGHT", ActionBar3, -Spacing, Spacing)
			elseif (i == 4) then
				Button:SetPoint("BOTTOMRIGHT", ActionBar3, -Spacing, (Size+(Spacing*2) ) )
			elseif (i == 7) then
				Button:SetPoint("TOPRIGHT", ActionBar3, -Spacing, -(Size+(Spacing*2)) )
			elseif (i == 10) then
				Button:SetPoint("TOPRIGHT", ActionBar3, -Spacing, -Spacing)
			else
				Button:SetPoint("RIGHT", PreviousButton, "LEFT", -Spacing, 0)
			end
		
			ActionBar3["Button"..i] = Button
		end
	
		for i = 7, 12 do
			local Button = _G["MultiBarBottomRightButton"..i]
			local Button1 = _G["MultiBarBottomRightButton1"]
			Button:SetFrameLevel(Button1:GetFrameLevel() - 2)
		end
	
		if C["MaxUI Layout"]["DOUBLECenterBar"] == true then
			ActionBar3:ClearAllPoints()
			ActionBar3:Point("RIGHT", ABline01, "CENTER", -(Size*3+Spacing*4+2), 0)
			ActionBar3:SetFrameLevel(5)
			ActionBar3:SetHeight((Size*2) + (Spacing*3))
			ActionBar3:SetWidth((Size*3) + (Spacing *2))
		
			for i = 1, NUM_ACTIONBAR_BUTTONS do
				local Button = _G["MultiBarBottomRightButton"..i]
				local PreviousButton = _G["MultiBarBottomRightButton"..i-1]
				local Spacing = Spacing
				Button:Size(Size*2/3)
				Button:ClearAllPoints()
				Button:SetFrameStrata("BACKGROUND")
				Button:SetFrameLevel(15)
			
				if (i == 1) then
					Button:SetPoint("BOTTOMRIGHT", ActionBar3, -Spacing*2/3, Spacing*2/3)
				elseif (i == 5) then
					Button:SetPoint("RIGHT", ActionBar3, -Spacing*2/3, 0)
				elseif (i == 9) then
					Button:SetPoint("TOPRIGHT", ActionBar3, -Spacing*2/3, -Spacing*2/3)
				else
					Button:SetPoint("RIGHT", PreviousButton, "LEFT", -Spacing, 0)
				end
				ActionBar3["Button"..i] = Button
			end
		
			for i = 7, 12 do
				local Button = _G["MultiBarBottomRightButton"..i]
				local Button1 = _G["MultiBarBottomRightButton1"]
				Button:SetFrameLevel(Button1:GetFrameLevel() - 2)
			end
		end
	end
	
	-- SINGLE OR DOUBLE CENTER BAR LAYOUT
	if (C["MaxUI Layout"]["SINGLECenterBar"] == true or C["MaxUI Layout"]["DOUBLECenterBar"] == true) and C["MaxUI Layout"]["Meleelayout"] == true then
		ActionBar3:SetFrameLevel(5)
		ActionBar3:SetHeight((Size*2) + (Spacing*3))
		ActionBar3:SetWidth((Size*6) + (Spacing * 7))
	
		for i = 1, NUM_ACTIONBAR_BUTTONS do
			local Button = _G["MultiBarBottomRightButton"..i]
			local PreviousButton = _G["MultiBarBottomRightButton"..i-1]
		
			Button:Size(Size)
			Button:ClearAllPoints()
			Button:SetFrameStrata("BACKGROUND")
			Button:SetFrameLevel(15)
		
			if (i == 1) then
				Button:SetPoint("BOTTOMRIGHT", ActionBar3, -Spacing, Spacing)
			elseif (i == 7) then
				Button:SetPoint("BOTTOMRIGHT", ActionBar3, -Spacing, (Size+(Spacing*2) ) )
			else
				Button:SetPoint("RIGHT", PreviousButton, "LEFT", -Spacing, 0)
			end
		
			ActionBar3["Button"..i] = Button
		end
	
		for i = 7, 12 do
			local Button = _G["MultiBarBottomRightButton"..i]
			local Button1 = _G["MultiBarBottomRightButton1"]
			Button:SetFrameLevel(Button1:GetFrameLevel() - 2)
		end
	end
	
	if C["MaxUI CombatFade"]["ActionBar3"] == true then
	RegisterStateDriver(ActionBar3, "visibility", "[combat] hide; show")
	end

end)

------------------------------------------------------------------------------------------
-- ACTIONBAR 4
------------------------------------------------------------------------------------------
hooksecurefunc(ActionBars, 'CreateBar4', function()
	local ActionBar4 = Panels.ActionBar4
	local Size = C.ActionBars.NormalButtonSize
	local Spacing = C.ActionBars.ButtonSpacing

	-- MELEE
	ActionBar4:SetPoint("BOTTOM", ABline03, "BOTTOM", 0, -16)
	ActionBar4:SetHeight((Size*1) + (Spacing*2))
	ActionBar4.Backdrop:SetAlpha(C["MaxUI Media"]["chatpanelalpha"])

	if C["ActionBars"]["HideBackdrop"] == false and C["MaxUI Layout"]["Meleelayout"] == true then
		ActionBar4.Backdrop:SetAlpha(0)
	end

	-- SINGLE CENTER BAR LAYOUT
	if C["MaxUI Layout"]["SINGLECenterBar"] == true and C["MaxUI Layout"]["Meleelayout"] == true then
		ActionBar4:ClearAllPoints()
		ActionBar4:SetPoint("CENTER", UIParent, "CENTER", 0, -222)
		ActionBar4:SetHeight((Size*3) + (Spacing*4))
		ActionBar4:SetWidth((Size*4) + (Spacing*5))
		ActionBar4.Backdrop:SetAlpha(C["MaxUI Media"]["chatpanelalpha"])
		--Movers:RegisterFrame(ActionBar4)
		
			for i = 1, NUM_ACTIONBAR_BUTTONS do
			local Button = _G["MultiBarRightButton"..i]
			local PreviousButton = _G["MultiBarRightButton"..i-1]
		
			Button:Size(Size)
			Button:ClearAllPoints()
			Button:SetFrameStrata("BACKGROUND")
			Button:SetFrameLevel(15)
		
			if (i == 1) then
				Button:SetPoint("BOTTOMRIGHT", ActionBar4, -Spacing, Spacing)
			elseif (i == 5) then
				Button:SetPoint("BOTTOMRIGHT", ActionBar4, -Spacing, (Size+(Spacing*2) ) )
			elseif (i == 9) then
				Button:SetPoint("TOPRIGHT", ActionBar4, -Spacing, -Spacing)
			else
				Button:SetPoint("RIGHT", PreviousButton, "LEFT", -Spacing, 0)
			end
			ActionBar4["Button"..i] = Button
		end
	
		for i = 7, 12 do
			local Button = _G["MultiBarRightButton"..i]
			local Button1 = _G["MultiBarRightButton1"]
			Button:SetFrameLevel(Button1:GetFrameLevel() - 2)
		end
	end	
		
	-- HEALING LAYOUT
	if C["MaxUI Layout"]["Heallayout"] == true and C["MaxUI Layout"]["Meleelayout"] == false then
		ActionBar4:ClearAllPoints()
		ActionBar4:SetFrameLevel(5)
		ActionBar4:SetHeight( (Size*4) + (Spacing*5))
		ActionBar4:SetWidth((Size*3) + (Spacing * 4))
		ActionBar4:SetPoint("TOP", ABline04, "BOTTOM", 0, -Spacing)
	
		for i = 1, NUM_ACTIONBAR_BUTTONS do
			local Button = _G["MultiBarRightButton"..i]
			local PreviousButton = _G["MultiBarRightButton"..i-1]
		
			Button:Size(Size)
			Button:ClearAllPoints()
			Button:SetFrameStrata("BACKGROUND")
			Button:SetFrameLevel(15)
			Button:SetAttribute("flyoutDirection", "UP")
		
			if (i == 1) then
				Button:SetPoint("BOTTOMRIGHT", ActionBar4, -Spacing, Spacing)
			elseif (i == 4) then
				Button:SetPoint("BOTTOMRIGHT", ActionBar4, -Spacing, (Size+(Spacing*2) ) )
			elseif (i == 7) then
				Button:SetPoint("TOPRIGHT", ActionBar4, -Spacing, -(Size+(Spacing*2)) )
			elseif (i == 10) then
				Button:SetPoint("TOPRIGHT", ActionBar4, -Spacing, -Spacing)
			else
				Button:SetPoint("RIGHT", PreviousButton, "LEFT", -Spacing, 0)
			end
		
			ActionBar4["Button"..i] = Button
		end
	
		for i = 7, 12 do
			local Button = _G["MultiBarRightButton"..i]
			local Button1 = _G["MultiBarRightButton1"]
			Button:SetFrameLevel(Button1:GetFrameLevel() - 2)
		end	
	end

	-- DOUBLE CENTER BAR LAYOUT
	if C["MaxUI Layout"]["DOUBLECenterBar"] == true and C["MaxUI Layout"]["Meleelayout"] == true then
		ActionBar4:ClearAllPoints()
		ActionBar4:SetPoint("RIGHT", UIParent, "CENTER", 0, -222)
		ActionBar4:SetHeight((Size*3) + (Spacing*4))
		ActionBar4:SetWidth((Size*4) + (Spacing*5))
		ActionBar4.Backdrop:SetAlpha(C["MaxUI Media"]["chatpanelalpha"])
		--Movers:RegisterFrame(ActionBar4)
		
			for i = 1, NUM_ACTIONBAR_BUTTONS do
			local Button = _G["MultiBarRightButton"..i]
			local PreviousButton = _G["MultiBarRightButton"..i-1]
		
			Button:Size(Size)
			Button:ClearAllPoints()
			Button:SetFrameStrata("BACKGROUND")
			Button:SetFrameLevel(15)
		
			if (i == 1) then
				Button:SetPoint("BOTTOMRIGHT", ActionBar4, -Spacing, Spacing)
			elseif (i == 5) then
				Button:SetPoint("BOTTOMRIGHT", ActionBar4, -Spacing, (Size+(Spacing*2) ) )
			elseif (i == 9) then
				Button:SetPoint("TOPRIGHT", ActionBar4, -Spacing, -Spacing)
			else
				Button:SetPoint("RIGHT", PreviousButton, "LEFT", -Spacing, 0)
			end
			ActionBar4["Button"..i] = Button
		end
	
		for i = 7, 12 do
			local Button = _G["MultiBarRightButton"..i]
			local Button1 = _G["MultiBarRightButton1"]
			Button:SetFrameLevel(Button1:GetFrameLevel() - 2)
		end
	end
	
	if C["MaxUI CombatFade"]["ActionBar4"] == true then
	RegisterStateDriver(ActionBar4, "visibility", "[combat] hide; show")
	end

end)

------------------------------------------------------------------------------------------
-- ACTIONBAR 5
------------------------------------------------------------------------------------------
hooksecurefunc(ActionBars, 'CreateBar5', function()
	local ActionBar5 = Panels.ActionBar5
	local Size = C.ActionBars.NormalButtonSize
	local Spacing = C.ActionBars.ButtonSpacing
	
	-- MELEE
	ActionBar5:ClearAllPoints()
	ActionBar5:SetPoint("BOTTOM", ABline02, "BOTTOM", 0, -16)
	ActionBar5:SetHeight((Size*1) + (Spacing*2))
	ActionBar5:SetWidth((Size * 12) + (Spacing * 13))
	ActionBar5.Backdrop:SetAlpha(C["MaxUI Media"]["chatpanelalpha"])
	
	if C["ActionBars"]["HideBackdrop"] == false and C["MaxUI Layout"]["Meleelayout"] == true then
		ActionBar5.Backdrop:SetAlpha(0)
	end
	
	for i = 1, NUM_ACTIONBAR_BUTTONS do
		local Button = _G["MultiBarLeftButton"..i]
		local PreviousButton = _G["MultiBarLeftButton"..i-1]
		
		Button:Size(Size)
		Button:ClearAllPoints()
		Button:SetFrameStrata("BACKGROUND")
		Button:SetFrameLevel(15)

		if (i == 1) then
			Button:SetPoint("LEFT", ActionBar5, "LEFT", Spacing, 0)
		else
			Button:SetPoint("LEFT", PreviousButton, "RIGHT", Spacing, 0)
		end
		ActionBar5["Button"..i] = Button
	end

	-- HEALING LAYOUT
	if C["MaxUI Layout"]["Heallayout"] == true and C["MaxUI Layout"]["Meleelayout"] == false then
	
	ActionBar5:ClearAllPoints()
	ActionBar5:SetFrameLevel(5)
	ActionBar5:SetHeight( (Size*4) + (Spacing*5))
	ActionBar5:SetWidth((Size*3) + (Spacing * 4))
	ActionBar5:SetPoint("TOP", ABline02, "BOTTOM", 0, -Spacing)
	
		for i = 1, NUM_ACTIONBAR_BUTTONS do
			local Button = _G["MultiBarLeftButton"..i]
			local PreviousButton = _G["MultiBarLeftButton"..i-1]
		
			Button:Size(Size)
			Button:ClearAllPoints()
			Button:SetFrameStrata("BACKGROUND")
			Button:SetFrameLevel(15)

			if (i == 1) then
				Button:SetPoint("BOTTOMLEFT", ActionBar5, Spacing, Spacing)
			elseif (i == 4) then
				Button:SetPoint("BOTTOMLEFT", ActionBar5, Spacing, (Size+(Spacing*2)) )
			elseif (i == 7) then
				Button:SetPoint("TOPLEFT", ActionBar5, Spacing, -(Size+(Spacing*2)) )
			elseif (i == 10) then
				Button:SetPoint("TOPLEFT", ActionBar5, Spacing, -Spacing)
			else
				Button:SetPoint("LEFT", PreviousButton, "RIGHT", Spacing, 0)
			end
			ActionBar5["Button"..i] = Button
		end
	
		for i = 7, 12 do
			local Button = _G["MultiBarLeftButton"..i]
			local Button1 = _G["MultiBarLeftButton1"]
		
			Button:SetFrameLevel(Button1:GetFrameLevel() - 2)
		end
	end

	-- DOUBLE CENTER BAR LAYOUT
	if C["MaxUI Layout"]["DOUBLECenterBar"] == true and C["MaxUI Layout"]["Meleelayout"] == true then
		ActionBar5:ClearAllPoints()
		ActionBar5:SetPoint("LEFT", UIParent, "CENTER", 0, -222)
		ActionBar5:SetHeight((Size*3) + (Spacing*4))
		ActionBar5:SetWidth((Size*4) + (Spacing*5))
		ActionBar5.Backdrop:SetAlpha(C["MaxUI Media"]["chatpanelalpha"])
		--Movers:RegisterFrame(ActionBar5)
		
			for i = 1, NUM_ACTIONBAR_BUTTONS do
			local Button = _G["MultiBarLeftButton"..i]
			local PreviousButton = _G["MultiBarLeftButton"..i-1]
		
			Button:Size(Size)
			Button:ClearAllPoints()
			Button:SetFrameStrata("BACKGROUND")
			Button:SetFrameLevel(15)
		
			if (i == 1) then
				Button:SetPoint("BOTTOMRIGHT", ActionBar5, -Spacing, Spacing)
			elseif (i == 5) then
				Button:SetPoint("BOTTOMRIGHT", ActionBar5, -Spacing, (Size+(Spacing*2) ) )
			elseif (i == 9) then
				Button:SetPoint("TOPRIGHT", ActionBar5, -Spacing, -Spacing)
			else
				Button:SetPoint("RIGHT", PreviousButton, "LEFT", -Spacing, 0)
			end
			ActionBar5["Button"..i] = Button
		end
	
		for i = 7, 12 do
			local Button = _G["MultiBarLeftButton"..i]
			local Button1 = _G["MultiBarLeftButton1"]
			Button:SetFrameLevel(Button1:GetFrameLevel() - 2)
		end
	end
	
	if C["MaxUI CombatFade"]["ActionBar5"] == true then
	RegisterStateDriver(ActionBar5, "visibility", "[combat] hide; show")
	end
	
end)

------------------------------------------------------------------------------------------
-- TOTEM/STANCE/CLASSBAR
------------------------------------------------------------------------------------------

hooksecurefunc(ActionBars, 'CreateStanceBar', function()
	if (not C.ActionBars.ShapeShift) then
		return
	end
	
	local StanceBar = Panels.StanceBar
	local Size = C.ActionBars.NormalButtonSize
	local Spacing = C.ActionBars.ButtonSpacing

	StanceBar:ClearAllPoints()
	StanceBar:Point("RIGHT", castbarline, "LEFT", -16, 0)
	StanceBar.Backdrop:SetAlpha(C["MaxUI Media"]["chatpanelalpha"])
	
	for i = 1, NUM_STANCE_SLOTS do
		local Button = _G["StanceButton"..i]

		Button:SetFrameStrata("LOW")
		Button:Show()

		if (i ~= 1) then
			local Previous = _G["StanceButton"..i-1]
			Button:ClearAllPoints()
			Button:Point("RIGHT", Previous, "LEFT", -Spacing, 0)
		else
			Button:ClearAllPoints()
			Button:Point("BOTTOMRIGHT", StanceBar, "BOTTOMRIGHT", -Spacing, Spacing)		
		end
	end
end)

------------------------------------------------------------------------------------------
-- EXTRA BUTTON / BOSS BUTTON and Zone Ability Button
------------------------------------------------------------------------------------------

local TukuiActionBars = T["ActionBars"]
local Button = ExtraActionButton1
local Texture = Button.style
local Zone = ZoneAbilityFrame
local UnitFrames = T.UnitFrames
local Noop = function() end
local Player = UnitFrames.Units.Player

function TukuiActionBars:SetUpExtraActionButton()
	local Holder = CreateFrame("Frame", "TukuiExtraActionButton", UIParent)
	Holder:Size(120, 80)
	Holder:ClearAllPoints()
	Holder:SetPoint("CENTER", UIParent, "CENTER", 0, 4)
	
	ExtraActionBarFrame:SetParent(UIParent)
	ExtraActionBarFrame:ClearAllPoints()
	ExtraActionBarFrame:SetPoint("RIGHT", Holder, "RIGHT", 0, 0)
	ExtraActionBarFrame.ignoreFramePositionManager = true
	
	Texture:SetTexture("")
	
	Movers:RegisterFrame(Holder)
	Movers:RegisterFrame(ExtraActionBarFrame)
	
	ZoneAbilityFrame:SetParent(UIParent)
	ZoneAbilityFrame:ClearAllPoints()
	ZoneAbilityFrame:SetPoint("RIGHT", Holder, "RIGHT", 0, 0)
	ZoneAbilityFrame.ignoreFramePositionManager = true
	Movers:RegisterFrame(ZoneAbilityFrame)
	
	if ZoneAbilityFrame:IsVisible() then
		ExtraActionBarFrame:ClearAllPoints()
		ExtraActionBarFrame:SetPoint("LEFT", Holder, "LEFT", 0, 0)
	else
		ExtraActionBarFrame:ClearAllPoints()
		ExtraActionBarFrame:SetPoint("RIGHT", Holder, "RIGHT", 0, 0)
	end	
end