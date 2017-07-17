
------------------------------------------------------------------------------------------
-- MaxUI 3.50 TukUI 17 - LEGION 7.0 -- version: 21-04-2017
------------------------------------------------------------------------------------------

--setting up BUFFS AND DEBUFFS.

------------------------------------------------------------------------------------------
-- LOCALS
------------------------------------------------------------------------------------------

local T, C, L = Tukui:unpack()
local Auras = T["Auras"]

------------------------------------------------------------------------------------------
-- UNWANTED PARTS/first adjustments
------------------------------------------------------------------------------------------

-- anchoring buffs frame at the the center top of the screen

local function CreateHeaders()
	if (not C.Auras.Enable) then return	end
	
	local Headers = Auras.Headers
	local Buffs = Headers[1]
	local Debuffs = Headers[2]
	
	Buffs:ClearAllPoints()
	Buffs:SetPoint("TOP", UIParent, "TOP", 0, -40 )
end

hooksecurefunc(Auras, "CreateHeaders", CreateHeaders)