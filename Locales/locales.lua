------------------------------------------------------------------------------------------
-- MaxUI 3.50 TukUI 17 - LEGION 7.0 -- v. 21-04-2017
------------------------------------------------------------------------------------------

--setting up Locales.

------------------------------------------------------------------------------------------
-- LOCALES
------------------------------------------------------------------------------------------

--setting up locales/descriptions for MaxUI and MaxUI config.

local T, C, L = Tukui:unpack()

------------------------------------------------------------------------------------------
-- MaxUI Layout Locales
------------------------------------------------------------------------------------------

local MaxUILayout = {

	-- Layouts
		["Heallayout"] = {
			["Name"] = "Basic Healer/Caster Layout",
			["Desc"] = "Enable a more healer/caster friendly layout focused on centering the raidframes for clickcast addons like Clique, and 3x4 actionbars (disable the melee layout).",
		},

		["Meleelayout"] = {
			["Name"] = "Basic Melee/Tank Layout",
			["Desc"] = "Enable a basic layout with 3x12 actionbars, with raidframes to the side (Disable the heal layout).",
		},
		
		["DPSlayout"] = {
			["Name"] = "+ DPS Layout",
			["Desc"] = "When either Melee or Heal layout is selected, this adjusts the Unitframes to a more DPS appropiate Layout. ***MELEE: focus and focustarget are centered near Player and target. ***HEAL: Player, Target, Target of Target, Focus and Focustarget all get anchored at the bottomcenter for fast clickcast spellcasting.",
		},

		["SINGLECenterBar"] = {
			["Name"] = "+ Single ActionBar Centered Layout",
			["Desc"] = "Centering Actionbar 4, in a 4 by 3 grid, between Player and Target frames, only works when Melee/Tank Layout is active, overrides DPS Layout.",
		},

		["DOUBLECenterBar"] = {
			["Name"] = "+ Double ActionBar Centered Layout",
			["Desc"] = "Centering Actionbar 4 and 5, in two 4 by 3 grids, between Player and Target frames, only works when Melee/Tank Layout is active, overrides DPS Layout.",
		},
		
	-- class resources on castbar
		["ClassResourcesAB"] = {
		["Name"] = "Class Powers on top of Actiobars",
		["Desc"] = "Anchor the Class Powers/Resources/ComboBar to the castbarline's center, on top of the ActionBars.",
		},
		
	}
	
TukuiConfig.enUS["MaxUI Layout"] = MaxUILayout

------------------------------------------------------------------------------------------
-- MaxUI Media Locales
------------------------------------------------------------------------------------------

local MaxUIMedia = {

	-- MaxUI unitframes
		["MaxUIUF"] = {
			["Name"] = "MaxUI Unitframes",
			["Desc"] = "Enable/Disable the MaxUI styled Unitframes",
		},

	-- actionbar mouseover
		["MouseoverAB"] = {
		["Name"] = "Mouseover Side Actionbars",
		["Desc"] = "Enable/Disable the mouseover function on the left and right actionbars (ab 2 and 3). (WIP)",
		},

		-- potrait 3D overlay on hp bar
		["portraitonhp"] = {
		["Name"] = "Portrait Overlay",
		["Desc"] = "Portrait overlay on HP bar, removing the portraits",
		},

		-- chatpanel visibility
		["Chatpanels"] = {
		["Name"] = "Chat Backgrounds",
		["Desc"] = "Set the chatbackgrounds as visible or hidden.",
		},

	-- master font
		["Font"] = {
		["Name"] = "Master Font UI (WIP)",
		["Desc"] = "Set the Font for most texts in the UI. MaxUI, Caps or Comic for now (WIP).",
		},

	-- master font size
		["FontSize"] = {
		["Name"] = "Font Size (WIP)",
		["Desc"] = "Set the Font Size for most texts in the UI (NOT WORKING ATM. WIP).",
		},

	-- Master Fontflag	
		["FontFlag"] = {
		["Name"] = "Font flag (WIP)",
		["Desc"] = "Set the Font Flag for most texts in the UI (NOT WORKING ATM, WIP).",
		},

	-- texture for MaxUI
		["Texture"] = {
		["Name"] = "Texture Backdrop",
		["Desc"] = "Set chosen texture as backdrop for several panels in the UI, i.e. backdrop on portraitframes, tooltip and backdrop for chatpanels. (WIP)",
		},

	-- class art	
		["ClassTexture"] = {
		["Name"] = "Class Texture Chat Backdrop",
		["Desc"] = "Set Class textures as backdrop for the chatpanels.",
		},
	
	-- MaxUI art
		["MaxUIlogoChat"] = {
		["Name"] = "MaxUI Chat Backdrop",
		["Desc"] = "Set the MaxUI logo as backdrop for the chatpanels.",
		},

		["Art"] = {
		["Name"] = "display Art",
		["Desc"] = "Enable/Disable experimental art on several panels.",
		},
		
	-- custom roll icons
		["MaxUIrollicons"] = {
		["Name"] = "Custom Roll Icons",
		["Desc"] = "Use the custom Roll Icons created for MaxUI, blue shield = tank, red lightning = dps, green heart = healer.",
		},
	
	-- class art actionbars
		["ActionbarClass"] = {
		["Name"] = "Class Texture actionbars",
		["Desc"] = "Set a Class texture as backdrop for the actionbars.",
		},

	-- backdrop color
		["Backdrop"] = {
		["Name"] = "Backdrop Color Frames (WIP)",
		["Desc"] = "Adjust the backdropcolor for most panels/frames using textures, base color is class color. (WIP)",
		},

	-- panel alpha	
		["chatpanelalpha"] = {
		["Name"] = "Background Transparency",
		["Desc"] = "Set the chatbackground, tooltip and other panels transparency. 0 = not visible, 1 = no transparency, base setting 0.6.",
		},
	}

TukuiConfig.enUS["MaxUI Media"] = MaxUIMedia

------------------------------------------------------------------------------------------
-- MaxUI Tools Locales
------------------------------------------------------------------------------------------

local MaxUITools = {

	-- Master looter tool
		["Masterlooter"] = {
		["Name"] = "Masterlooter Module",
		["Desc"] = "Enable/Disable the masterlooter module. (NOT FULLY FUNCIONAL, WIP)",
		},

	-- UI tool	
		["Tools"] = {
		["Name"] = "UI Tools Module",
		["Desc"] = "Enable/Disable the UI Tools module.",
		},

		["RaidTools"] = {
		["Name"] = "Raid Tools Module",
		["Desc"] = "Enable/Disable the Raid Tools module.",
		},

	-- Battleground tool	
		--["Battleground"] = {
		--["Name"] = "Battleground Module",
		--["Desc"] = "Enable/Disable Extended Battleground module.",
		--},

	-- lines anchoring tools	
		["chattools"] = {
		["Name"] = "Chat Tool Lines",
		["Desc"] = "Show/Hide the Chat Tool Lines.",
		},

	-- MaxUI menu		
		["MaxUIMenu"] = {
		["Name"] = "MaxUI Menu",
		["Desc"] = "Show/Hide the MaxUI Menu when entering World of Warcraft, still working on only showing on first login and not on reload and such. (WIP)",
		},

	-- Microbar game menu	
		["GameMenu"] = {
		["Name"] = "Micromenu Bar",
		["Desc"] = "Enable/Disable the replacement micromenu bar when clicking on the Game Menu Datatext",
		},

	-- bottomline	
		["Bottomline"] = {
		["Name"] = "Bottom Datatexts",
		["Desc"] = "Show/Hide the Bottomline and anchored Datatexts.",
		},
	
	-- Topline
		["Topline"] = { 
		["Name"] = "Top Datatexts",
		["Desc"] = "Show/Hide the Topline and anchored Datatexts.",
		},

	-- locator tool	
		["Locator"] = {
		["Name"] = "Locator",
		["Desc"] = "Enable/Disable the location and coordinates tool at the top of the screen.",
		},

	-- option voor hiding loot from other players in raid or group on bosskill	
		["OtherLootHide"] = {
		["Name"] = "Loot frame",
		["Desc"] = "Enable/Disable the list of loot shown at the center after a boss kill.",
		},
	
	-- map shown or hidden
		["Nomap"] = {
		["Name"] = "Minimap Visibility",
		["Desc"] = "Show/Hide the Minimap (show = green or hidden = red).",
		},
	
	-- Combat Fade
		["CombatFade"] = {
		["Name"] = "Combat Fading",
		["Desc"] = "Will fade out most UI border elements when entering combat when enabled",
		},
	}

TukuiConfig.enUS["MaxUI Tools"] = MaxUITools

------------------------------------------------------------------------------------------
-- MaxUI Combat Fade Locales
------------------------------------------------------------------------------------------

local MaxUICombatFade = {

		["Topline"] = {
		["Name"] = "Topline",
		["Desc"] = "Enable/Disable Combat Fade for this UI element",
		},

		["BottomLine"] = {
		["Name"] = "Bottomline",
		["Desc"] = "Enable/Disable Combat Fade for this UI element",
		},

		["BottomLineAlt"] = {
		["Name"] = "Small Bottomline",
		["Desc"] = "Enable/Disable the Raid Tools module.",
		},

		["DataTexts"] = {
		["Name"] = "Datatexts",
		["Desc"] = "Enable/Disable Combat Fade for this UI element",
		},

		["Locator"] = {
		["Name"] = "Locator",
		["Desc"] = "Enable/Disable Combat Fade for this UI element",
		},

		["ChatBG"] = {
		["Name"] = "Chat Backgrounds",
		["Desc"] = "Enable/Disable Combat Fade for this UI element",
		},

		["Minimap"] = {
		["Name"] = "Minimap",
		["Desc"] = "Enable/Disable Combat Fade for this UI element",
		},
	
		["ActionBar1"] = { 
		["Name"] = "Actionbar 1",
		["Desc"] = "Enable/Disable Combat Fade for this UI element",
		},

		["ActionBar2"] = {
		["Name"] = "Actionbar 2",
		["Desc"] = "Enable/Disable Combat Fade for this UI element",
		},

		["ActionBar3"] = {
		["Name"] = "Actionbar 3",
		["Desc"] = "Enable/Disable Combat Fade for this UI element",
		},
	
		["ActionBar4"] = {
		["Name"] = "Actionbar 4",
		["Desc"] = "Enable/Disable Combat Fade for this UI element",
		},
	
		["ActionBar5"] = {
		["Name"] = "Actionbar 5",
		["Desc"] = "Enable/Disable Combat Fade for this UI element",
		},
		
		["RepBar"] = {
		["Name"] = "Rep/XP/Artifact bar",
		["Desc"] = "Enable/Disable Combat Fade for this UI element",
		},
		
		["ToolTip"] = {
		["Name"] = "Tooltips",
		["Desc"] = "Enable/Disable Combat Fade for this UI element",
		},
	}

TukuiConfig.enUS["MaxUI CombatFade"] = MaxUICombatFade