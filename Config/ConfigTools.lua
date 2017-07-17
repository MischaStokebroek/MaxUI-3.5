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

C["MaxUI Tools"] = {
	
	["chattools"] = true,
	["Masterlooter"] = false,
	["Tools"] = true,
	["RaidTools"] = true, 
	--["Battleground"] = false,
	
	["MaxUIMenu"] = false,
	["GameMenu"] = true,
	
	["Bottomline"] = true,
	["Topline"] = true,
	["Locator"] = true,
	["OtherLootHide"] = false,
	["Nomap"] = true
}
