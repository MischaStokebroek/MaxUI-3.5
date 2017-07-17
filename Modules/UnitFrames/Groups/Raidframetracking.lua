------------------------------------------------------------------------------------------
-- MaxUI 3.50 TukUI 17 - LEGION 7.0 -- version: 20-07-2016
------------------------------------------------------------------------------------------

--setting up UNITFRAMES GENERAL.

-- TO DO: need to check all the spells per class if they still have the same proc, usage etc.

------------------------------------------------------------------------------------------
-- LOCALS/FUNCTIONS/...
------------------------------------------------------------------------------------------

local T, C, L = Tukui:unpack()
local TukuiUnitFrames = T["UnitFrames"]

------------------------------------------------------------------------------------
-- RAID DEBUFFS (TRACKING LIST)
------------------------------------------------------------------------------------


------------------------------------------------------------------------------------
-- RAID BUFFS (SQUARED AURA TRACKING LIST)
------------------------------------------------------------------------------------
-- if true added to the spell ID, it tracks player and partymembers
-- if not added it only tracks own aura's even if other players provided the aura.


TukuiUnitFrames.RaidBuffsTracking = {

	PRIEST = {

		-- DISCIPLINE
		{17, "TOPLEFT", {0.81, 0.85, 0.1}, true},       	    -- Power Word: Shield
		--{47753, "LEFT",  {0, 1, 1}},  						-- Divine Aegis
		--{152118, "BOTTOMLEFT", {1, 128/255, 0}},  			-- Clarity of Will
		{33206, "TOP", {153/255, 51/255,1}, true},  			-- Pain Suppression
		{194384, "TOPRIGHT", {1, 128/255, 0}}, 					-- Atonement
		{81782, "RIGHT", {0.81, 0.85,  0.1}}, 					-- under Power Word: Barrier
		{187464, "BOTTOMRIGHT", {1, 0, 0}, true}, 				-- Shadow Mend debuff

		--HOLY
		{77489, "LEFT", {0.2, 0.7, 0.2}}, 						-- Echo of Light  (HOLY)
		{208065, "TOPLEFT", {0, 1, 1}},  						-- Light of T'uure (HOLY)
		{139, "BOTTOMLEFT", {0.4, 0.7, 0.2}},              	 	-- Renew (HOLY)
		{47788, "TOP", {153/255, 51/255,1}, true},  			-- Guardian Spirit  (HOLY)
		{64844, "RIGHT", {0.85, 0.85,  0.1}}, 					-- Divine Hymn 10% buff  (HOLY)
		{41635, "BOTTOMRIGHT", {0.2, 0.7, 0.2}},             	-- Prayer of Mending (HOLY)
		{234711, "TOPRIGHT", {153/255, 51/255,1}},             	-- Rammal's Ulterior Motive (Legendary gloves proc)
		--SHADOW
	},
	
	DRUID = {
	--RESTORATION
		{33763, "TOPLEFT", {0.4, 0.8, 0.2}},     				-- Lifebloom
		{102351, "LEFT", {210/255, 210/255, 210/255}, true},    -- Cenarion Ward
		{102352, "LEFT", {0.2, 0.8, 0.8}},      				-- Cenarion Ward
		{102342, "BOTTOMLEFT", {102/255, 51/255, 0}, true},     -- Ironbark
		{8936, "BOTTOMLEFT", {0.2, 0.8, 0.2}},   				-- Regrowth
		{774, "TOPRIGHT", {0.8, 0.4, 0.8}},      				-- Rejuvenation
		{155777, "RIGHT", {0.8, 0.4, 0.8}},      				-- Germination
		{48438, "BOTTOMRIGHT", {0.8, 0.4, 0}},   				-- Wild Growth
		{207386, "TOP", {0.4, 0.2, 0.8}},        				-- Spring Blossoms
		{200389, "BOTTOM", {1, 1, 0.4}},         				-- Cultivation
	},
	
	PALADIN = {
		{53563, "TOPLEFT", {0.7, 0.3, 0.7}},	             	-- Beacon of Light
		{156910, "TOPRIGHT", {0.7, 0.3, 0.7}},	             	-- Beacon of Faith
		{114163, "BOTTOMLEFT", {0.81, 0.85, 0.1}, true},	 	-- Eternal Flame
		{1022, "BOTTOMRIGHT", {0.2, 0.2, 1}, true}, 	     	-- Hand of Protection
		{1044, "BOTTOMRIGHT", {0.89, 0.45, 0}, true},	     	-- Hand of Freedom
		{6940, "BOTTOMRIGHT", {0.89, 0.1, 0.1}, true},	     	-- Hand of Sacrifice
	},
	
	SHAMAN = {
		--{974, "TOPRIGHT", {0.2, 0.7, 0.2}},                  	-- Earth Shield
		{61295, "TOPLEFT", {0.7, 0.3, 0.7}},                 	-- Riptide
	},
	
	MONK = {
		{119611, "TOPLEFT", {0.8, 0.4, 0.8}},	             	-- Renewing Mist
		{116849, "TOPRIGHT", {0.2, 0.8, 0.2}},	             	-- Life Cocoon
		{124682, "BOTTOMLEFT", {0.4, 0.8, 0.2}},             	-- Enveloping Mist
		{124081, "BOTTOMRIGHT", {0.7, 0.4, 0}},              	-- Zen Sphere
	},
	
	WARRIOR = {
	-- protection
		{190456, "TOPLEFT", {0, 1, 1}}, 						-- Ignore Pain (blue)
		{132404, "LEFT", {128/255, 128/255, 128/255}}, 			-- Shield block (grey)
		{23920, "BOTTOMLEFT", {1, 1, 1}}, 						-- Shield reflect (white)
		{871, "BOTTOMRIGHT", {0, 0, 1}}, 						-- Shield wall (blue)
		{12975, "RIGHT", {102/255, 51/255, 0}}, 				-- Last stand (brown)
		{147833, "TOPRIGHT", {0.81, 0.85, 0.1}, true}, 			-- Intercept buff on ally (Yellow)
	},	
	
	DEATHKNIGHT = {
	-- deathknight
		--{49222 , "TOPRIGHT", {0.4, 0.7, 0.2}}, 				-- Bone Shield (green)
		--{48707 , "RIGHT", {0.81, 0.85, 0.1}},					-- Anti Magic Shell (green/yellow)
	-- blood
		--{77535, "TOPLEFT", {1, 0, 0}, true}, 					-- Blood Shield (red)
		--{55233, "BOTTOMLEFT", {0.9, 0, 0}}, 					-- Vampiric Blood (red)
		--{49039, "LEFT", {128/255, 128/255, 128/255}},  		-- Lichborn (grey)

		--{48743, "BOTTOM", {1, 128/255, 0}}, 					-- Death Pact (orange)
	},	
	

	
	ALL = {
		{14253, "RIGHT", {0, 1, 0}},                     	    -- Abolish Poison
	},
		
}
