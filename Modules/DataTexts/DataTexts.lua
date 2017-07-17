------------------------------------------------------------------------------------------
-- MaxUI 3.50 TukUI 17 - LEGION 7.0 -- version: 21-04-2017
------------------------------------------------------------------------------------------

--setting up DATA TEXT FIELDS.

------------------------------------------------------------------------------------------
-- LOCALS/FUNCTIONS/...
------------------------------------------------------------------------------------------

local T, C, L = Tukui:unpack()
local TukuiDT = T["DataTexts"]
local Panels = T.Panels
local Minimap = T.Maps.Minimap
local BottomLine = Panels.BottomLine
local class = RAID_CLASS_COLORS[select(2, UnitClass("player"))]

local FontSize = 14
local FontFlag = "OUTLINE"
--local Font = "MaxUI"

------------------------------------------------------------------------------------------
-- DATATEXTS
------------------------------------------------------------------------------------------

local RemoveData = function(self)
	if self.Data then
		self.Data.Position = 0
		self.Data:Disable()
	end
	self.Data = nil
end

local SetData = function(self, object)
	
	-- Disable the old data text in use
	if self.Data then
		RemoveData(self)
	end
	
	-- Set the new data text
	self.Data = object
	self.Data:Enable()
	self.Data.Text:Point("RIGHT", self, 0, 0)
	self.Data.Text:Point("LEFT", self, 0, 0)
	self.Data.Text:Point("TOP", self, 0, -1)
	self.Data.Text:Point("BOTTOM", self, 0, -1)
	self.Data.Position = self.Num
	self.Data:SetAllPoints(self.Data.Text)
	
	if C["MaxUI Media"]["Font"] == "Caps" then
		self.Data.Text:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\caps.ttf", FontSize, "OUTLINE")
	elseif C["MaxUI Media"]["Font"] == "Comic" then
		self.Data.Text:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\comic.ttf", FontSize, "OUTLINE")
	elseif C["MaxUI Media"]["Font"] == "MaxUI" then
		self.Data.Text:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\MaxUI.ttf", FontSize, "OUTLINE")
	else	
		self.Data.Text:SetFont(C["Medias"].Font, FontSize, "OUTLINE")
	end
	
	if C["MaxUI CombatFade"]["DataTexts"] == true then
	RegisterStateDriver(object, "visibility", "[combat] hide; show")
	end
end

------------------------------------------------------------------------------------------
-- DATATEXT anchors
------------------------------------------------------------------------------------------

function TukuiDT:CreateAnchors()
	local Panels = T["Panels"]
	BottomLine = Panels.BottomLine
	self.NumAnchors = self.NumAnchors + 12		

	for i = 1, self.NumAnchors do
		local Frame = CreateFrame("Button", nil, UIParent)
		Frame:Size( ( (BottomLine:GetWidth()/9) -1), 24)
		Frame:SetFrameLevel(BottomLine:GetFrameLevel() + 1)
		Frame:SetFrameStrata("HIGH")
		Frame:EnableMouse(false)
		Frame.SetData = SetData
		Frame.RemoveData = RemoveData
		Frame.Num = i
		Frame.Tex = Frame:CreateTexture()
		Frame.Tex:SetAllPoints()
		
		self.Anchors[i] = Frame
		
		if C["MaxUI Tools"]["Bottomline"] == true then
			if (i == 1) and (C["MaxUI Tools"]["Bottomline"] == true) then
				Frame:Point("LEFT", BottomLine, 0, 1)
			elseif (i == 10) and (C["MaxUI Tools"]["Topline"] == true) then
				Frame:Point("LEFT", Topline, 0, 1)
				Frame:Size( ( (Topline:GetWidth()/9) -1), 24)
			else
				Frame:Point("LEFT", self.Anchors[i-1], "RIGHT", 1, 0)
			end
		else	
			if (i == 1) then
				Frame:Hide()
			elseif (i == 5) then
				Frame:Size(300, 24)
				Frame:Point("CENTER", BottomLineAlt, "CENTER", 0, 1)
			elseif (i == 6) then
				Frame:Hide()
			elseif (i == 7) then
				Frame:Hide()
			elseif (i == 8) then
				Frame:Hide()
			elseif (i == 9) then
				Frame:Hide()
			elseif (i == 10) and (C["MaxUI Tools"]["Topline"] == true) then
				Frame:Point("LEFT", Topline, 0, 1)
				Frame:Size( ( (Topline:GetWidth()/9) -1), 24)
			else
				Frame:Point("LEFT", self.Anchors[i-1], "RIGHT", 1, 0)
			end
		end

		if C["MaxUI CombatFade"]["DataTexts"] == true then
		RegisterStateDriver(Frame, "visibility", "[combat] hide; show")
		end
	end
end

------------------------------------------------------------------------------------------
-- DATATEXT tooltip anchoring
------------------------------------------------------------------------------------------

local GetTooltipAnchor = function(self)
	local Position = self.Position
	local From
	local Anchor = "ANCHOR_TOP"
	local X = 0
	local Y = T.Scale(5)
	
	--bottomline left to right
	if (Position == 1) then
		Anchor = "ANCHOR_TOP"
		From = BottomLine
		X = T.Scale(-840)
		Y = T.Scale(15)
	elseif (Position == 2) then
		Anchor = "ANCHOR_TOP"
		From = BottomLine
		X = T.Scale(-630)
		Y = T.Scale(15)
	elseif (Position == 3) then
		Anchor = "ANCHOR_TOP"
		From = BottomLine
		X = T.Scale(-420)
		Y = T.Scale(15)
	elseif (Position == 4) then
		Anchor = "ANCHOR_TOP"
		From = BottomLine
		X = T.Scale(-210)
		Y = T.Scale(15)
	elseif (Position == 5) then
		Anchor = "ANCHOR_TOP"
		From = BottomLine
		X = T.Scale(0)
		Y = T.Scale(15)
	elseif (Position == 6) then
		Anchor = "ANCHOR_TOP"
		From = BottomLine
		X = T.Scale(210)
		Y = T.Scale(15)
	elseif (Position == 7) then
		Anchor = "ANCHOR_TOP"
		From = BottomLine
		X = T.Scale(420)
		Y = T.Scale(15)
	elseif (Position == 8) then
		Anchor = "ANCHOR_TOP"
		From = BottomLine
		X = T.Scale(630)
		Y = T.Scale(15)
	elseif (Position == 9) then
		Anchor = "ANCHOR_TOP"
		From = BottomLine
		X = T.Scale(840)
		Y = T.Scale(15)

	--topline left to right
	elseif (Position == 10) then
		Anchor = "ANCHOR_BOTTOM"
		From = Topline
		X = T.Scale(-840)
		Y = T.Scale(-15)
	elseif (Position == 11) then
		Anchor = "ANCHOR_BOTTOM"
		From = Topline
		X = T.Scale(-630)
		Y = T.Scale(-15)
	elseif (Position == 12) then
		Anchor = "ANCHOR_BOTTOM"
		From = Topline
		X = T.Scale(-420)
		Y = T.Scale(-15)
	elseif (Position == 13) then
		Anchor = "ANCHOR_BOTTOM"
		From = Topline
		X = T.Scale(-210)
		Y = T.Scale(-15)
	elseif (Position == 14) then
		Anchor = "ANCHOR_BOTTOM"
		From = Topline
		X = T.Scale(0)
		Y = T.Scale(-15)
	elseif (Position == 15) then
		Anchor = "ANCHOR_BOTTOM"
		From = Topline
		X = T.Scale(210)
		Y = T.Scale(-15)
	elseif (Position == 16) then
		Anchor = "ANCHOR_BOTTOM"
		From = Topline
		X = T.Scale(420)
		Y = T.Scale(-15)
	elseif (Position == 17) then
		Anchor = "ANCHOR_BOTTOM"
		From = Topline
		X = T.Scale(630)
		Y = T.Scale(-15)
	elseif (Position == 18) then
		Anchor = "ANCHOR_BOTTOM"
		From = Topline
		X = T.Scale(840)
		Y = T.Scale(-15)
	end
	return From, Anchor, X, Y
end
		
-- Update the Anchor
for Name, DT in pairs(TukuiDT.Texts) do
	if DT.GetTooltipAnchor then
		DT.GetTooltipAnchor = GetTooltipAnchor
	end
end
	
------------------------------------------------------------------------------------------
-- Defaults
------------------------------------------------------------------------------------------

hooksecurefunc(TukuiDT, "AddDefaults", function()
	TukuiData[GetRealmName()][UnitName("Player")].Texts = {}
	
	-- bottomline 1-2-3---4-5-6---7-8-9
	TukuiData[GetRealmName()][UnitName("Player")].Texts[L.DataText.Guild] = {true, 1}
	TukuiData[GetRealmName()][UnitName("Player")].Texts[L.DataText.Friends] = {true, 2}
	TukuiData[GetRealmName()][UnitName("Player")].Texts[L.DataText.Durability] = {true, 4}
	TukuiData[GetRealmName()][UnitName("Player")].Texts[L.DataText.Currency] = {true, 8}
	TukuiData[GetRealmName()][UnitName("Player")].Texts[L.DataText.Gold] = {true, 9}
	
	-- topline 10-11-12---13-14-15---16-17-18
	TukuiData[GetRealmName()][UnitName("Player")].Texts[L.DataText.Talents] = {true, 10}
	TukuiData[GetRealmName()][UnitName("Player")].Texts[GARRISON_LOCATION_TOOLTIP] = {true, 11}
	TukuiData[GetRealmName()][UnitName("Player")].Texts[L.DataText.Time] = {true, 16}
	TukuiData[GetRealmName()][UnitName("Player")].Texts[L.DataText.Memory] = {true, 17}
	TukuiData[GetRealmName()][UnitName("Player")].Texts[L.DataText.FPSAndMS] = {true, 18}

end)
	