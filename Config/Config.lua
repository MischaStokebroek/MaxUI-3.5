------------------------------------------------------------------------------------------
-- MaxUI 3.50 TukUI 17 - LEGION 7.0 -- v. 21-04-2017
------------------------------------------------------------------------------------------

--setting up CONFIGURATION.

------------------------------------------------------------------------------------------
-- LOCALS
------------------------------------------------------------------------------------------

local T, C, L = Tukui:unpack()
local class = RAID_CLASS_COLORS[select(2, UnitClass("player"))]

------------------------------------------------------------------------------------------
-- in game configuration base settings (standard TukUI)
------------------------------------------------------------------------------------------

-- General
	C["General"]["AutoScale"] = true
	C["General"]["UIScale"] = 0.71
	C["General"]["BackdropColor"] = {0.06, 0.06, 0.06} 
	C["General"]["BorderColor"] = {0.03, 0.03, 0.03}
	C["General"]["HideShadows"] = true

-- Actionbars	
	C["ActionBars"]["Enable"] = true
	C["ActionBars"]["EquipBorder"] = true
	C["ActionBars"]["HotKey"] = true
	C["ActionBars"]["Macro"] = true
	C["ActionBars"]["ShapeShift"] = true
	C["ActionBars"]["Pet"] = true
	C["ActionBars"]["SwitchBarOnStance"] = true
	C["ActionBars"]["NormalButtonSize"] = 26
	C["ActionBars"]["PetButtonSize"] = 25
	C["ActionBars"]["ButtonSpacing"] = 4
	C["ActionBars"]["HideBackdrop"] = true
	C["ActionBars"]["Font"] = "MaxUI OUTLINED"

-- Auras
	C["Auras"]["Enable"] = true
	C["Auras"]["Consolidate"] = false
	C["Auras"]["Flash"] = false
	C["Auras"]["ClassicTimer"] = true
	C["Auras"]["HideBuffs"] = false
	C["Auras"]["HideDebuffs"] = false
	C["Auras"]["Animation"] = false
	C["Auras"]["BuffsPerRow"] = 12
	C["Auras"]["Font"] = "MaxUI OUTLINED"

-- Bags
	C["Bags"]["Enable"] = true
	C["Bags"]["ButtonSize"] = 28
	C["Bags"]["Spacing"] = 4
	C["Bags"]["ItemsPerRow"] = 11
	C["Bags"]["PulseNewItem"] = false
	C["Bags"]["BagFilter"] = false
	C["Bags"]["Font"] = "MaxUI OUTLINED"

-- Chat	
	C["Chat"]["Enable"] = true
	C["Chat"]["WhisperSound"] = true
	C["Chat"]["LinkColor"] = {0.08, 1, 0.36}
	C["Chat"]["LinkBrackets"] = true
	C["Chat"]["LootFrame"] = false
	C["Chat"]["Background"] = true -- dont change!
	C["Chat"]["ScrollByX"] = 3
	C["Chat"]["TabFont"] = "MaxUI OUTLINED"
	C["Chat"]["ChatFont"] = "MaxUI"
	
-- Cooldowns
	C["Cooldowns"]["Font"] = "MaxUI OUTLINED"

-- Datatexts	
	C["DataTexts"]["Battleground"] = true
	C["DataTexts"]["LocalTime"] = true
	C["DataTexts"]["Time24HrFormat"] = true
	C["DataTexts"]["NameColor"] = {class.r, class.g, class.b}
	C["DataTexts"]["ValueColor"] = {1, 1, 1}
	C["DataTexts"]["Font"] = "MaxUI"

-- Merchant	
	C["Merchant"]["AutoSellGrays"] = true
	C["Merchant"]["SellMisc"] = true
	C["Merchant"]["AutoRepair"] = true
	C["Merchant"]["UseGuildRepair"] = true

-- Misc
	C["Misc"]["ThreatBarEnable"] = true
	C["Misc"]["AltPowerBarEnable"] = true
	C["Misc"]["ExperienceEnable"] = true
	C["Misc"]["ReputationEnable"] = true
	C["Misc"]["ErrorFilterEnable"] = true
	C["Misc"]["AutoInviteEnable"] = false
	C["Misc"]["TalkingHeadEnable"] = true

-- Nameplates	
	C["NamePlates"]["Enable"] = true
	C["NamePlates"]["Width"] = 120
	C["NamePlates"]["Height"] = 8
	C["NamePlates"]["CastHeight"] = 5
	C["NamePlates"]["Texture"] = "Gloss"
	C["NamePlates"]["Font"] = "MaxUI OUTLINED"

-- Party	
	C["Party"]["Enable"] = false
	C["Party"]["Portrait"] = true
	C["Party"]["HealBar"] = true
	C["Party"]["ShowPlayer"] = true
	C["Party"]["ShowHealthText"] = true
	C["Party"]["RangeAlpha"] = 0.3
	C["Party"]["Font"] = "MaxUI OUTLINED"
	C["Party"]["HealthFont"] = "MaxUI OUTLINED"
	C["Party"]["PowerTexture"] = "Gloss"
	C["Party"]["HealthTexture"] = "Gloss"
	
-- Raid	
	C["Raid"]["Enable"] = true
	C["Raid"]["HealBar"] = true
	C["Raid"]["AuraWatch"] = true
	C["Raid"]["AuraWatchTimers"] = true
	C["Raid"]["DebuffWatch"] = true
	C["Raid"]["RangeAlpha"] = 0.3
	C["Raid"]["ShowRessurection"] = true
	C["Raid"]["ShowHealthText"] = false
	C["Raid"]["ShowPets"] = true
	C["Raid"]["VerticalHealth"] = false
	C["Raid"]["Highlight"] = true
	C["Raid"]["MaxUnitPerColumn"] = 10
	C["Raid"]["Font"] = "MaxUI OUTLINED"
	C["Raid"]["HealthFont"] = "MaxUI OUTLINED"
	C["Raid"]["PowerTexture"] = "Gloss"
	C["Raid"]["HealthTexture"] = "Gloss"
	C["Raid"]["GroupBy"] = {
			["Options"] = {
				["Group"] = "GROUP",
				["Class"] = "CLASS",
				["Role"] = "ROLE",
				},
			["Value"] = "GROUP",
	}

-- Tooltip		
	C["Tooltips"]["Enable"] = true
	C["Tooltips"]["HideOnUnitFrames"] = false
	C["Tooltips"]["UnitHealthText"] = true
	C["Tooltips"]["ShowSpec"] = true
	C["Tooltips"]["MouseOver"] = false
	C["Tooltips"]["HealthFont"] = "MaxUI OUTLINED"
	C["Tooltips"]["HealthTexture"] = "Gloss"

-- Unitframes	
	C["UnitFrames"]["Enable"] = true
	C["UnitFrames"]["Portrait"] = true
	C["UnitFrames"]["CastBar"] = true
	C["UnitFrames"]["ComboBar"] = true
	C["UnitFrames"]["UnlinkCastBar"] = true
	C["UnitFrames"]["CastBarIcon"] = true
	C["UnitFrames"]["CastBarLatency"] = true
	C["UnitFrames"]["Smooth"] = true
	C["UnitFrames"]["TargetEnemyHostileColor"] = true
	C["UnitFrames"]["CombatLog"] = false
	C["UnitFrames"]["HealBar"] = true
	C["UnitFrames"]["TotemBar"] = true
	C["UnitFrames"]["AnticipationBar"] = true
	C["UnitFrames"]["TargetAuras"] = true
	C["UnitFrames"]["FocusAuras"] = true
	C["UnitFrames"]["FocusTargetAuras"] = true
	C["UnitFrames"]["ArenaAuras"] = true
	C["UnitFrames"]["BossAuras"] = true
	C["UnitFrames"]["OnlySelfDebuffs"] = true
	C["UnitFrames"]["OnlySelfBuffs"] = false
	C["UnitFrames"]["Threat"] = true
	C["UnitFrames"]["AltPowerText"] = false
	C["UnitFrames"]["DarkTheme"] = false
	C["UnitFrames"]["Arena"] = true
	C["UnitFrames"]["Boss"] = true
	C["UnitFrames"]["Font"] = "MaxUI OUTLINED"
	C["UnitFrames"]["PowerTexture"] = "Gloss"
	C["UnitFrames"]["HealthTexture"] = "Gloss"
	C["UnitFrames"]["CastTexture"] = "Gloss"