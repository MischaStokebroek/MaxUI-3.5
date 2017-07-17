------------------------------------------------------------------------------------------
-- MaxUI 3.50 TukUI 17 - LEGION 7.0 -- v. 21-04-2017
------------------------------------------------------------------------------------------

--setting up CONFIGURATION.

------------------------------------------------------------------------------------------
-- LOCALS
------------------------------------------------------------------------------------------

local T, C, L = Tukui:unpack()
local class = RAID_CLASS_COLORS[select(2, UnitClass("player"))]

------------------------------------------------------------------------------------------
-- in game configuration settings MaxUI Tools
------------------------------------------------------------------------------------------

C["MaxUI CombatFade"] = {
	
	["Topline"] = false,
	["BottomLine"] = false,
	["DataTexts"] = false, 

	["Locator"] = false,
	["ChatBG"] = false,
	["Map"] = false,

	["ActionBar1"] = false,
	["ActionBar2"] = false,
	["ActionBar3"] = false,
	["ActionBar4"] = false,
	["ActionBar5"] = false,
	
	["RepBar"] = false,	

	["ToolTip"] = false
}
