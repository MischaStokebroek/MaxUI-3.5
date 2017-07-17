------------------------------------------------------------------------------------------
-- MaxUI 3.50 TukUI 17 - LEGION 7.0 -- version: 21-04-2017
------------------------------------------------------------------------------------------

--setting up SPEED DATATEXT.

------------------------------------------------------------------------------------------
-- VARIABLES
------------------------------------------------------------------------------------------

local T, C, L = Tukui:unpack()

------------------------------------------------------------------------------------------
-- Current Speed datatext - thanks to Tukz
------------------------------------------------------------------------------------------

local TukuiDT = T["DataTexts"]
local format = format
local tslu = 0.5

local Update = function(self, t)
	tslu = tslu - t
	
	if (tslu > 0) then
		return
	end
	
	CurrentSpeed = GetUnitSpeed("player") / 7 * 100
	self.Text:SetText(format(TukuiDT.NameColor.."Speed: |r"..TukuiDT.ValueColor.."%d%%".."|r", CurrentSpeed))
	tslu = 0.5
end

local Enable = function(self)
	self:SetScript("OnUpdate", Update)
	self:Update(1)
end

local Disable = function(self)
	self.Text:SetText("")
	self:SetScript("OnUpdate", nil)
end

TukuiDT:Register("Move Speed", Enable, Disable, Update)