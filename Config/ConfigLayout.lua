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
-- in game configuration settings MaxUI Layout
------------------------------------------------------------------------------------------

C["MaxUI Layout"] = {

	-- Maxui UnitFrames
	--["MaxUIUF"] = true,
	--Healing layout
	["Heallayout"] = false,
	--Melee Layout
	["Meleelayout"] = true,
	--DPS focus target at bottom Layout
	["DPSlayout"] = true,
	--DPS Centered layout
	["SINGLECenterBar"] = false,
	--DOUBLE Centered layout
	["DOUBLECenterBar"] = false,
	--HEALING Centered layout
	["SmallCenteredHealing"] = false,
	-- class resources / combo bar on castbarline
	["ClassResourcesAB"] = true
}
