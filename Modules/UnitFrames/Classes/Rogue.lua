------------------------------------------------------------------------------------------
-- MaxUI 3.50 TukUI 17 - LEGION 7.0 -- version: 20-07-2016
------------------------------------------------------------------------------------------

--setting up ROGUE.

------------------------------------------------------------------------------------------
-- LOCALS/FUNCTIONS/...
------------------------------------------------------------------------------------------

local T, C, L = Tukui:unpack()

local TukuiUnitFrames = T["UnitFrames"]
local Class = select(2, UnitClass("player"))
local Panels = T.Panels

if (Class ~= "ROGUE") then
	return
end

local function Player(self)

end

hooksecurefunc(TukuiUnitFrames, "Player", Player)