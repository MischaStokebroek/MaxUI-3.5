------------------------------------------------------------------------------------------
-- MaxUI 3.50 TukUI 17 - LEGION 7.0 -- version: 21-04-2017
------------------------------------------------------------------------------------------

--setting up Misc.

------------------------------------------------------------------------------------------
-- LOCALS/FUNCTIONS/...
------------------------------------------------------------------------------------------

local T, C, L = Tukui:unpack()
local Misc = T.Miscellaneous
local ObjectiveTracker = Misc.ObjectiveTracker
local Mirror = Misc.MirrorTimers
local Timer = Misc.TimerTracker
local Panels = T.Panels
local Ghost = Misc.Ghost
local DataText = T["DataTexts"]

--local BGFrame = DataText.BGFrame

------------------------------------------------------------------------------------------
-- Raid Lootframe others
------------------------------------------------------------------------------------------

if C["MaxUI Tools"]["OtherLootHide"] == false then
	-- http://us.battle.net/forums/en/wow/topic/20042934931
	BossBanner:UnregisterAllEvents()
end

------------------------------------------------------------------------------------------
-- Objective tracker anchor
------------------------------------------------------------------------------------------
local function Enable()
	ObjectiveTracker:ClearAllPoints()
	ObjectiveTracker:Point("RIGHT", Topline, "CENTER", -244, 0)
		if C["MaxUI CombatFade"]["Locator"] == true then
		RegisterStateDriver(ObjectiveTracker, "visibility", "[combat] hide; show")
		end
end
hooksecurefunc(ObjectiveTracker, "Enable", Enable)

------------------------------------------------------------------------------------------
-- Mirror Timer.
------------------------------------------------------------------------------------------
local function Update(self, Bar)
	for i = 1, MIRRORTIMER_NUMTIMERS, 1 do
		local Bar = _G["MirrorTimer"..i]
		local Status = _G[Bar:GetName().."StatusBar"]
		local Text = _G[Bar:GetName().."Text"]
		
		Status:SetStatusBarTexture(T.GetTexture(C.UnitFrames.HealthTexture))
		Bar:SetBackdrop(nil)
		Bar:CreateBackdrop("Transparent")
		Bar.Backdrop:CreateShadow("Default")
	end
end
hooksecurefunc(Mirror, "Update", Update)

------------------------------------------------------------------------------------------
-- Battleground Timer.
------------------------------------------------------------------------------------------
local function UpdateBar(self)
	self:SetStatusBarTexture(T.GetTexture(C.UnitFrames.HealthTexture))
	self:SetBackdrop(nil)
	self:CreateBackdrop("Transparent")
	self.Backdrop:CreateShadow("Default")
	
	for i = 1, self:GetNumRegions() do
		local Region = select(i, self:GetRegions())
		if Region:GetObjectType() == "FontString" then
				Region:SetFont(C.Medias.Font, 14, "OUTLINE")
				Region:SetShadowOffset(0, 0)
		end
	end
end
hooksecurefunc(Timer, "UpdateBar", UpdateBar)

------------------------------------------------------------------------------------------
-- GHOST Button
------------------------------------------------------------------------------------------
local function CreateButton(self)
local Button = self.Button
local BottomLine = Panels.BottomLine

	Button:Height(T.Panels.DataTextRight:GetHeight())
	Button:Width(T.Panels.DataTextRight:GetWidth()+10)
	Button:ClearAllPoints()
	Button:SetPoint("CENTER", REPXPline, "CENTER", 0, 0)
	Button:CreateOverlayTooltip()
	if C["MaxUI Layout"]["Heallayout"] == true and C["MaxUI Layout"]["Meleelayout"] == false then
		Button:SetPoint("CENTER", BottomLine, "CENTER", 0, 0)
	end
end
hooksecurefunc(T.Miscellaneous.Ghost, "CreateButton", CreateButton)

local function Enable(self)
	GhostFrame:SetAllPoints(self.Button)
end
hooksecurefunc(T.Miscellaneous.Ghost, "Enable", Enable)

------------------------------------------------------------------------------------------
-- FLIGHT DISMOUNT Button
------------------------------------------------------------------------------------------
local function CreateVehicleButtons()
local VehicleLeft = T.Panels.VehicleButtonLeft
local VehicleRight = T.Panels.VehicleButtonRight
local BottomLine = Panels.BottomLine

	VehicleLeft:ClearAllPoints()
	VehicleLeft:Height(T.Panels.DataTextRight:GetHeight())
	VehicleLeft:Width(T.Panels.DataTextRight:GetWidth()+10)
	VehicleLeft:SetPoint("CENTER", REPXPline, "CENTER", 0, 0)
	
	VehicleRight:ClearAllPoints()
	VehicleRight:Height(T.Panels.DataTextRight:GetHeight())
	VehicleRight:Width(T.Panels.DataTextRight:GetWidth()+10)
	VehicleRight:SetPoint("CENTER", REPXPline, "CENTER", 0, 0)
	VehicleRight:CreateOverlayTooltip()

	if C["MaxUI Layout"]["Heallayout"] == true and C["MaxUI Layout"]["Meleelayout"] == false then
		VehicleLeft:SetPoint("CENTER", BottomLine, "CENTER", 0, 0)
		VehicleRight:SetPoint("CENTER", BottomLine, "CENTER", 0, 0)
	end
end
hooksecurefunc(T.ActionBars, "CreateVehicleButtons", CreateVehicleButtons)

------------------------------------------------------------------------------------------
-- Battleground Datatext
------------------------------------------------------------------------------------------

local function Enable()
	local BGFrame = DataText.BGFrame
	local Panels = T.Panels
	local BottomLine = Panels.BottomLine
	local Text1 = DataText.BGFrame.Text1
	local Text3 = DataText.BGFrame.Text3
	
		BGFrame:ClearAllPoints()
		BGFrame:Width(T.Panels.DataTextRight:GetWidth()+80)
		BGFrame:Height(T.Panels.DataTextRight:GetHeight())
		BGFrame:SetPoint("CENTER", REPXPline, "CENTER", 0, 0)
		BGFrame:CreateOverlayTooltip()
		if C["MaxUI Layout"]["Heallayout"] == true and C["MaxUI Layout"]["Meleelayout"] == false then
			BGFrame:SetPoint("CENTER", BottomLine, "CENTER", 0, 0)
		end
		BGFrame:SetFrameLevel(2)
		BGFrame:SetFrameStrata("MEDIUM")
		Text1:SetPoint("LEFT", 10, -1)
		Text3:SetPoint("RIGHT", -10, -1)
end
hooksecurefunc(DataText, "Enable", Enable)