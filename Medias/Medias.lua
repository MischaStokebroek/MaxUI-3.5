------------------------------------------------------------------------------------------
-- MaxUI 3.50 TukUI 17 - LEGION 7.0 -- v. 21-04-2017
------------------------------------------------------------------------------------------

--setting up MEDIA.

------------------------------------------------------------------------------------------
-- LOCALS
------------------------------------------------------------------------------------------

local T, C, L = Tukui:unpack()

------------------------------------------------------------------------------------------
-- MAXUI MEDIA -- force fonts to set font
------------------------------------------------------------------------------------------
if not C["Medias"] then C["Medias"] = {} end

C["Medias"]["Font"] = [=[Interface\Addons\TukuiMaxUI\Medias\Fonts\MaxUI.ttf]=]
C["Medias"]["AltFont"] = [=[Interface\AddOns\TukuiMaxUI\Medias\Fonts\MaxUI.ttf]=]
C["Medias"]["DamageFont"] = [=[Interface\AddOns\TukuiMaxUI\Medias\Fonts\MaxUI.ttf]=]
C["Medias"]["PixelFont"] = [=[Interface\Addons\TukuiMaxUI\Medias\Fonts\MaxUI.ttf]=]
C["Medias"]["ActionBarFont"] = [=[Interface\Addons\TukuiMaxUI\Medias\Fonts\MaxUI.ttf]=]
C["Medias"]["NormalFont"] = [=[Interface\Addons\TukuiMaxUI\Medias\Fonts\MaxUI.ttf]=]
C["Medias"]["UnitFramesFont"] = [=[Interface\Addons\TukuiMaxUI\Medias\Fonts\MaxUI.ttf]=]

--C["General"]["InvisibleFont"] = [=[Interface\Addons\TukuiMaxUI\Medias\Fonts\MaxUI.ttf]=]

------------------------------------------------------------------------------------------
--  MaxUI -- fonts added 
------------------------------------------------------------------------------------------

-- Registering new media with Tukui
TukuiMedia = T["Media"]

-- comic normal
local Comic = CreateFont("comic")
Comic:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\comic.ttf", 14)
TukuiMedia:RegisterFont("Comic", "comic")

-- comic outlined
local ComicOutlined = CreateFont("comicoutlined")
ComicOutlined:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\comic.ttf", 14, "OUTLINE")
TukuiMedia:RegisterFont("Comic OUTLINED", "comicoutlined")

-- Maxui normal
local Maxui = CreateFont("MaxUI")
Maxui:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\MaxUI.ttf", 14)
TukuiMedia:RegisterFont("MaxUI", "MaxUI")

-- MaxUI outlined
local MaxuiOutlined = CreateFont("MaxUIoutlined")
MaxuiOutlined:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\MaxUI.ttf", 14, "OUTLINE")
TukuiMedia:RegisterFont("MaxUI OUTLINED", "MaxUIoutlined")

------------------------------------------------------------------------------------------
--  MaxUI -- textures added 
------------------------------------------------------------------------------------------

-- texture sharing with TukUI Config
TukuiMedia:RegisterTexture("Gloss", "Interface\\AddOns\\TukuiMaxUI\\Medias\\Textures\\Gloss.tga")
TukuiMedia:RegisterTexture("Graphite", "Interface\\AddOns\\TukuiMaxUI\\Medias\\Textures\\Graphite.tga")
TukuiMedia:RegisterTexture("Glosswave", "Interface\\AddOns\\TukuiMaxUI\\Medias\\Textures\\glosswave.tga")
TukuiMedia:RegisterTexture("Drop", "Interface\\AddOns\\TukuiMaxUI\\Medias\\Textures\\drop.tga")
TukuiMedia:RegisterTexture("Fiery", "Interface\\AddOns\\TukuiMaxUI\\Medias\\Textures\\Fiery.tga")
TukuiMedia:RegisterTexture("Fifths", "Interface\\AddOns\\TukuiMaxUI\\Medias\\Textures\\Fifths.tga")
TukuiMedia:RegisterTexture("Fourths", "Interface\\AddOns\\TukuiMaxUI\\Medias\\Textures\\Fourths.tga")
TukuiMedia:RegisterTexture("Glamour", "Interface\\AddOns\\TukuiMaxUI\\Medias\\Textures\\Glamour6.tga")
TukuiMedia:RegisterTexture("Rounded", "Interface\\AddOns\\TukuiMaxUI\\Medias\\Textures\\Overlay.tga")