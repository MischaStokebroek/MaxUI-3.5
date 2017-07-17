------------------------------------------------------------------------------------------
-- MaxUI 3.50 TukUI 17 - LEGION 7.0 -- v. 21-04-2017
------------------------------------------------------------------------------------------

--setting up Sharing of media.

------------------------------------------------------------------------------------------
-- 
------------------------------------------------------------------------------------------
if IsAddOnLoaded('LibSharedMedia-3.0')then

local LSM = LibStub('LibSharedMedia-3.0')

if LSM == nil then return end

LSM:Register('font','Comic', [[Interface\AddOns\TukuiMaxUI\Medias\Fonts\comic.TTF]])
LSM:Register('font','MaxUI', [[Interface\AddOns\TukuiMaxUI\Medias\Fonts\MaxUI.TTF]])

LSM:Register('texture', "Gloss", [[Interface\\AddOns\\TukuiMaxUI\\Medias\\Textures\\Gloss.tga]])
LSM:Register('texture', "Graphite", [[Interface\\AddOns\\TukuiMaxUI\\Medias\\Textures\\Graphite.tga]])
LSM:Register('texture', "Glosswave", [[Interface\\AddOns\\TukuiMaxUI\\Medias\\Textures\\glosswave.tga]])
LSM:Register('texture', "Drop", [[Interface\\AddOns\\TukuiMaxUI\\Medias\\Textures\\drop.tga]])
LSM:Register('texture', "Fiery", [[Interface\\AddOns\\TukuiMaxUI\\Medias\\Textures\\Fiery.tga]])
LSM:Register('texture', "Fifths", [[Interface\\AddOns\\TukuiMaxUI\\Medias\\Textures\\Fifths.tga]])
LSM:Register('texture', "Fourths", [[Interface\\AddOns\\TukuiMaxUI\\Medias\\Textures\\Fourths.tga]])
LSM:Register('texture', "Glamour", [[Interface\\AddOns\\TukuiMaxUI\\Medias\\Textures\\Glamour6.tga]])

end