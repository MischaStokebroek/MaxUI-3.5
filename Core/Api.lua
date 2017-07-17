------------------------------------------------------------------------------------------
-- MaxUI 3.50 TukUI 17 - LEGION 7.0 -- v. 21-04-2017
------------------------------------------------------------------------------------------

--setting up API.

------------------------------------------------------------------------------------------
-- LOCALS
------------------------------------------------------------------------------------------

local T, C, L = Tukui:unpack()
local class = RAID_CLASS_COLORS[select(2, UnitClass("player"))]
local classcolor = T.RGBToHex(class.r, class.g, class.b)

------------------------------------------------------------------------------------------
--	MaxUI WELCOME
------------------------------------------------------------------------------------------

print("|cffFFFC01Welcome |r" ..classcolor ..UnitName("Player").."|r|cffFFFC01, entering World of Warcraft - LEGION.|r")
print("|cffFFFC01MaxUI v3.702 for|r |cffff8000Tukui 17|r |cffFFFC01loaded, check http://www.tukui.org/ for changelog or troubleshoot.|r")

UIErrorsFrame:AddMessage("|cffFFFC01Welcome |r" ..classcolor ..UnitName("Player").."|r|cffFFFC01, entering World of Warcraft - LEGION.|r")

------------------------------------------------------------------------------------------
-- Overlay Function (Background portraits)
------------------------------------------------------------------------------------------

local function CreateOverlay(f)
	if f.overlay then return end
	
	local overlay = f:CreateTexture(f:GetName() and f:GetName().."Overlay" or nil, "BORDER", f)
	overlay:ClearAllPoints()
	overlay:Point("TOPLEFT", 0, 0)
	overlay:Point("BOTTOMRIGHT", 0, 0)
	overlay:SetTexture(T.GetTexture(C["MaxUI Media"]["Texture"]))
	overlay:SetVertexColor(0.3, 0.3, 0.3)
	f.overlay = overlay
end

local function AddAPI(object)
	local mt = getmetatable(object).__index
	
	if not object.CreateOverlay then mt.CreateOverlay = CreateOverlay end
end

local Handled = {["Frame"] = true}

local Object = CreateFrame("Frame")
AddAPI(Object)
AddAPI(Object:CreateTexture())
AddAPI(Object:CreateFontString())

Object = EnumerateFrames()

while Object do
	if (not Handled[Object:GetObjectType()]) then
		AddAPI(Object)
		Handled[Object:GetObjectType()] = true
	end

	Object = EnumerateFrames(Object)
end
------------------------------------------------------------------------------------------
--Overlay Function (Tooltip, backdrop containers, ...)
------------------------------------------------------------------------------------------

local function CreateOverlayTooltip(f)
	if f.overlaytooltip then return end

	local overlaytooltip = f:CreateTexture(f:GetName() and f:GetName().."overlaytooltip" or nil, "BORDER", f)
	overlaytooltip:ClearAllPoints()
	overlaytooltip:Point("TOPLEFT", 2, -2)
	overlaytooltip:Point("BOTTOMRIGHT", -2, 2)
	overlaytooltip:SetTexture(T.GetTexture(C["MaxUI Media"]["Texture"]))
	overlaytooltip:SetAlpha(C["MaxUI Media"]["chatpanelalpha"])
	overlaytooltip:SetVertexColor(0.22, 0.22, 0.22)
	f.overlaytooltip = overlaytooltip
end

local function AddAPI(object)
	local mt = getmetatable(object).__index
	
	if not object.CreateOverlayTooltip then mt.CreateOverlayTooltip = CreateOverlayTooltip end
end

local Handled = {["Frame"] = true}

local Object = CreateFrame("Frame")
AddAPI(Object)
AddAPI(Object:CreateTexture())
AddAPI(Object:CreateFontString())

Object = EnumerateFrames()

while Object do
	if (not Handled[Object:GetObjectType()]) then
		AddAPI(Object)
		Handled[Object:GetObjectType()] = true
	end

	Object = EnumerateFrames(Object)
end