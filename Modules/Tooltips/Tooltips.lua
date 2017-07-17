------------------------------------------------------------------------------------------
-- MaxUI 3.50 TukUI 17 - LEGION 7.0 -- version: 21-04-2017
------------------------------------------------------------------------------------------

--setting up TOOLTIP.

------------------------------------------------------------------------------------------
-- LOCALS/FUNCTIONS/...
------------------------------------------------------------------------------------------

local T, C, L = Tukui:unpack()
local Tooltips = T["Tooltips"]

------------------------------------------------------------------------------------------
-- anchoring tooltip
------------------------------------------------------------------------------------------

local function CreateAnchor(self)
	local Anchor = Tooltips.Anchor
	local Tooltip = GameTooltip

	if C["MaxUI Media"]["Chatpanels"] == true then
		Anchor:ClearAllPoints()
		Anchor:SetPoint("BOTTOMRIGHT", RIGHTChatline, "TOPRIGHT", 0, 10)
	end
	
	if C["MaxUI CombatFade"]["ToolTip"] == true then
		RegisterStateDriver(Tooltip, "visibility", "[combat] hide; show")
	end	
end
hooksecurefunc(Tooltips, "CreateAnchor", CreateAnchor)


------------------------------------------------------------------------------------------
-- color, backdrop etc. tooltip
------------------------------------------------------------------------------------------
local function SetColor(self)
	local GetMouseFocus = GetMouseFocus()
	--local Unit = (select(2, self:GetUnit())) or (GetMouseFocus and GetMouseFocus:GetAttribute("unit"))
	local Unit = select(2, self:GetUnit()) or (GetMouseFocus and GetMouseFocus.GetAttribute and GetMouseFocus:GetAttribute("unit"))
	local HealthBar = GameTooltipStatusBar
	local Reaction = Unit and UnitReaction(Unit, "player")
	local Player = Unit and UnitIsPlayer(Unit)	

	HealthBar.Backdrop:SetBackdropBorderColor(unpack(C.General.BorderColor))
	HealthBar.Backdrop:CreateShadow("Default")

	self:SetBackdropBorderColor(unpack(C.General.BorderColor))
	self:SetBackdropColor(0,0,0, 0.4)
	self:CreateShadow("Default")
	self:CreateOverlayTooltip()
	
	if Player then
		local Class = select(2, UnitClass(Unit))
		local Color = T.Colors.class[Class]
		R, G, B = Color[1], Color[2], Color[3]
		HealthBar:SetStatusBarColor(R, G, B)
	elseif Reaction then
		local Color = T.Colors.reaction[Reaction]
		R, G, B = Color[1], Color[2], Color[3]
		HealthBar:SetStatusBarColor(R, G, B)
	else
		local Link = select(2, self:GetItem())
		local Quality = Link and select(3, GetItemInfo(Link))
		
		if (Quality and Quality >= 2) then
			R, G, B = GetItemQualityColor(Quality)
			self:SetBackdropBorderColor(R, G, B)
		else
			HealthBar:SetStatusBarColor(1, 1, 1)
		end
	end
end
hooksecurefunc(Tooltips, "SetColor", SetColor)

------------------------------------------------------------------------------------------
-- healthbar position tooltip
------------------------------------------------------------------------------------------
local function Enable(self)
	local HealthBar = GameTooltipStatusBar
	local Tooltip = GameTooltip

	HealthBar:ClearAllPoints()
	HealthBar:SetPoint("BOTTOMLEFT", Tooltip, "TOPLEFT", 2, 6)
	HealthBar:SetPoint("BOTTOMRIGHT", Tooltip, "TOPRIGHT", -2, 6)

	if C.Tooltips.UnitHealthText then
		HealthBar.Text:SetFont(T.GetFont(C.UnitFrames.Font), 12, "OUTLINE")
		HealthBar.Text:SetShadowOffset(0, 0)
	end
end
hooksecurefunc(Tooltips, "Enable", Enable)


