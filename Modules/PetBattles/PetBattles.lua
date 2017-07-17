------------------------------------------------------------------------------------------
-- MaxUI 3.50 TukUI 17 - LEGION 7.0 -- version: 21-04-2017
------------------------------------------------------------------------------------------

--setting up PetBattles.

------------------------------------------------------------------------------------------
-- LOCALS/FUNCTIONS/...
------------------------------------------------------------------------------------------

local T, C, L = Tukui:unpack()
local Battle = T["PetBattles"]
local PetBattles = PetBattleFrame

local Pets = {
	PetBattles.ActiveAlly,
	PetBattles.ActiveEnemy,
}

------------------------------------------------------------------------------------------
-- adjustments pet battle unitframes
------------------------------------------------------------------------------------------

hooksecurefunc(Battle, 'AddActionBar', function()
	local Bar = Battle.ActionBar
	Bar:ClearAllPoints()
	Bar:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 44)
end)

hooksecurefunc(Battle, 'SkinUnitFrames', function()
	PetBattles.ActiveAlly:ClearAllPoints()
	PetBattles.ActiveAlly:Point("BOTTOMRIGHT", UIParent, "BOTTOM", -200, 200)

	PetBattles.ActiveEnemy:ClearAllPoints()
	PetBattles.ActiveEnemy:Point("BOTTOMLEFT", UIParent, "BOTTOM", 200, 200)

	PetBattles.TopVersusText:ClearAllPoints()
	PetBattles.TopVersusText:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 200)
end)
