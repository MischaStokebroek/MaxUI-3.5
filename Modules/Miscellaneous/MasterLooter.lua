------------------------------------------------------------------------------------------
-- MaxUI 3.50 TukUI 17 - LEGION 7.0 -- version: 21-04-2017
------------------------------------------------------------------------------------------

--setting up MASTER LOOTER.

-- WIP: to do: shorten the REPOOC code, better functionality, ...

------------------------------------------------------------------------------------------
-- VARIABLES
------------------------------------------------------------------------------------------

local T, C, L = Tukui:unpack()
local Panels = T.Panels
local class = RAID_CLASS_COLORS[select(2, UnitClass("player"))]

local thickness = 1
local FontSize = 14
local FontFlag = "OUTLINE"
local Font = T.GetFont(C["MaxUI Media"]["Font"])

------------------------------------------------------------------------------------------
-- Function/script/...
------------------------------------------------------------------------------------------

local function Enable()

	if C["MaxUI Tools"]["Masterlooter"] == true then

		-- BACKGROUND PANEL
		local masterlootbg = CreateFrame("Frame", "masterlootbg", UIParent, "SecureActionButtonTemplate")
		masterlootbg:SetTemplate()
		masterlootbg:SetHeight(142)
		masterlootbg:SetWidth(390)
		masterlootbg:Point("BOTTOMRIGHT", LEFTChatline, "TOPRIGHT", 0, 16)
		masterlootbg:SetFrameLevel(1)
		masterlootbg:SetFrameStrata("BACKGROUND")
		masterlootbg:SetAlpha(C["MaxUI Media"]["chatpanelalpha"])
		
		if C["MaxUI Media"]["ClassTexture"] == true then
			masterlootbg.Logoclass = masterlootbg:CreateTexture(nil, "OVERLAY")
			masterlootbg.Logoclass:Size(142, 142)
			masterlootbg.Logoclass:Point("CENTER", masterlootbg, "CENTER", 0, 0)
		
			if select(2, UnitClass('player')) == "DRUID" then
				masterlootbg.Logoclass:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\ClassIcons\DRUID.tga]])
			end
			
			if select(2, UnitClass('player')) == "MONK" then
				masterlootbg.Logoclass:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\ClassIcons\MONK.tga]])
			end
			
			if select(2, UnitClass('player')) == "ROGUE" then
				masterlootbg.Logoclass:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\ClassIcons\ROGUE.tga]])
			end
			
			if select(2, UnitClass('player')) == "MAGE" then
				masterlootbg.Logoclass:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\ClassIcons\MAGE.tga]])
			end
			
			if select(2, UnitClass('player')) == "PRIEST" then
				masterlootbg.Logoclass:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\ClassIcons\PRIEST.tga]])
			end
			
			if select(2, UnitClass('player')) == "WARLOCK" then
				masterlootbg.Logoclass:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\ClassIcons\WARLOCK.tga]])
			end
			
			if select(2, UnitClass('player')) == "SHAMAN" then
			masterlootbg.Logoclass:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\ClassIcons\SHAMAN.tga]])
			end
			
			if select(2, UnitClass('player')) == "HUNTER" then
				masterlootbg.Logoclass:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\ClassIcons\HUNTER.tga]])
			end
			
			if select(2, UnitClass('player')) == "DEATHKNIGHT" then
				masterlootbg.Logoclass:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\ClassIcons\DEATHKNIGHT.tga]])
			end
			
			if select(2, UnitClass('player')) == "WARRIOR" then
				masterlootbg.Logoclass:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\ClassIcons\WARRIOR.tga]])
			end
		
			if select(2, UnitClass('player')) == "PALADIN" then
				masterlootbg.Logoclass:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\ClassIcons\PALADIN.tga]])
			end

			if select(2, UnitClass('player')) == "DEMONHUNTER" then
				masterlootbg.Logoclass:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\ClassIcons\DEMONHUNTER.tga]])
			end
		end
		masterlootbg:Hide()

		-- ANCHOR LINES
		local Line01ML = CreateFrame("Frame", "Line01ML", UIParent)
		Line01ML:SetTemplate()
		Line01ML:Size(380, thickness)
		Line01ML:Point("TOP", masterlootbg, "TOP", 0, -40)
		Line01ML:SetFrameLevel(2)
		Line01ML:SetFrameStrata("BACKGROUND")
		Line01ML:SetAlpha(1)
		Line01ML:Hide()
		
		local MLAtext = Line01ML:CreateFontString(nil, "OVERLAY")
		if C["MaxUI Media"]["Font"] == "Caps" then
			MLAtext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\caps.ttf", FontSize, "OUTLINE")
		elseif C["MaxUI Media"]["Font"] == "Comic" then
			MLAtext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\comic.ttf", FontSize, "OUTLINE")
		elseif C["MaxUI Media"]["Font"] == "MaxUI" then
			MLAtext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\MaxUI.ttf", FontSize, "OUTLINE")
		else	
			MLAtext:SetFont(C["Medias"].Font, FontSize, "OUTLINE")
		end
		MLAtext:Point("LEFT", Line01ML, "LEFT", 4, 0)
		MLAtext:SetText("Set:")
			
		local Line02ML = CreateFrame("Frame", "Line02ML", UIParent)
		Line02ML:SetTemplate()
		Line02ML:Size(380, thickness)
		Line02ML:Point("TOP", masterlootbg, "TOP", 0, -70)
		Line02ML:SetFrameLevel(2)
		Line02ML:SetFrameStrata("BACKGROUND")
		Line02ML:SetAlpha(1)
		Line02ML:Hide()

		local Rollstext = Line02ML:CreateFontString(nil, "OVERLAY")
		if C["MaxUI Media"]["Font"] == "Caps" then
			Rollstext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\caps.ttf", FontSize, "OUTLINE")
		elseif C["MaxUI Media"]["Font"] == "Comic" then
			Rollstext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\comic.ttf", FontSize, "OUTLINE")
		elseif C["MaxUI Media"]["Font"] == "MaxUI" then
			Rollstext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\MaxUI.ttf", FontSize, "OUTLINE")
		else	
			Rollstext:SetFont(C["Medias"].Font, FontSize, "OUTLINE")
		end
		Rollstext:Point("LEFT", Line02ML, "LEFT", 4, 0)
		Rollstext:SetText("Rolls:")

		local Line03ML = CreateFrame("Frame", "Line03ML", UIParent)
		Line03ML:SetTemplate()
		Line03ML:Size(380, thickness)
		Line03ML:Point("TOP", masterlootbg, "TOP", 0, -100)
		Line03ML:SetFrameLevel(2)
		Line03ML:SetFrameStrata("BACKGROUND")
		Line03ML:SetAlpha(1)
		Line03ML:Hide()

		local Callstext = Line03ML:CreateFontString(nil, "OVERLAY")
		if C["MaxUI Media"]["Font"] == "Caps" then
			Callstext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\caps.ttf", FontSize, "OUTLINE")
		elseif C["MaxUI Media"]["Font"] == "Comic" then
			Callstext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\comic.ttf", FontSize, "OUTLINE")
		elseif C["MaxUI Media"]["Font"] == "MaxUI" then
			Callstext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\MaxUI.ttf", FontSize, "OUTLINE")
		else	
			Callstext:SetFont(C["Medias"].Font, FontSize, "OUTLINE")
		end
		Callstext:Point("LEFT", Line03ML, "LEFT", 4, 0)
		Callstext:SetText("Calls:")
		
		-- SHOW HIDE BUTTON
		local ShowHideML = CreateFrame("Frame", "ShowHideML", LEFTChatline)
		ShowHideML:SetTemplate()
		ShowHideML:Size((400/3), 20)
		ShowHideML:Point("RIGHT", LEFTChatline, "RIGHT", 0, 0)
		ShowHideML:SetFrameLevel(2)
		ShowHideML:SetFrameStrata("BACKGROUND")
		ShowHideML:SetAlpha(0.0)

		local Masterlootertext = LEFTChatline:CreateFontString(nil, "OVERLAY")
		if C["MaxUI Media"]["Font"] == "Caps" then
			Masterlootertext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\caps.ttf", FontSize, "OUTLINE")
		elseif C["MaxUI Media"]["Font"] == "Comic" then
			Masterlootertext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\comic.ttf", FontSize, "OUTLINE")
		elseif C["MaxUI Media"]["Font"] == "MaxUI" then
			Masterlootertext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\MaxUI.ttf", FontSize, "OUTLINE")
		else	
			Masterlootertext:SetFont(C["Medias"].Font, FontSize, "OUTLINE")
		end
		Masterlootertext:Point("RIGHT", LEFTChatline, "RIGHT", -20, 0)
		Masterlootertext:SetText("Master Looter")

		LEFTChatline.iconml = LEFTChatline:CreateTexture(nil, "OVERLAY")
		LEFTChatline.iconml:Size(17, 17)
		LEFTChatline.iconml:Point("RIGHT", LEFTChatline, "RIGHT", -2, 0)
		LEFTChatline.iconml:SetTexture([[Interface\AddOns\TukuiMaxUI\Medias\menuicons\gold.tga]])

		ShowHideML:SetScript("OnEnter", function(self)
			Masterlootertext:SetTextColor(class.r, class.g, class.b)
			LEFTChatline.iconml:SetVertexColor(class.r, class.g, class.b)
		end)
		
		ShowHideML:SetScript("OnLeave", function(self)
			Masterlootertext:SetTextColor(1, 1, 1)
			LEFTChatline.iconml:SetVertexColor(1, 1, 1)
		end)
		
		ShowHideML:SetScript("OnMouseDown", function(self)
			if masterlootbg:IsShown() then
				masterlootbg:Hide()
				Line01ML:Hide()
				Line02ML:Hide()
				Line03ML:Hide()
			else
				masterlootbg:Show()
				Line01ML:Show()
				Line02ML:Show()
				Line03ML:Show()
			end
		end)

	------------------------------------------------------------------------------------------
	--imported LootAnnouncer made by Repooc
	------------------------------------------------------------------------------------------

		local check = false
		local t = 0
		local loottemp = {}
		LootAnnouncerOptions = {}
		if LootAnnouncerOptions["enabled"] == nil then LootAnnouncerOptions["enabled"] = false end
		if LootAnnouncerOptions["quality"] == nil then LootAnnouncerOptions["quality"] = "EPIC" end
		if LootAnnouncerOptions["auto"] == nil then LootAnnouncerOptions["auto"] = true end
		if LootAnnouncerOptions["chat"] == nil then LootAnnouncerOptions["chat"] = "RAID" end

		local function CheckLoot()
			local name, rank, isML
			for x = 1, GetNumGroupMembers() do
				name, rank, _, _, _, _, _, _, _, _, isML = GetRaidRosterInfo(x)
				if name == UnitName("player") and isML then
					return true
				elseif name == UnitName("player") and rank == 1 then
					return true
				elseif name == UnitName("player") and rank == 2 then
					return true
				end
			end
			return false
		end

		local function AnnounceLoot()
			print("Loot Window Open")
			local name = {}
			local loot = {}
			local numbers = {}
			local m = 0
			local q = LootAnnouncerOptions["quality"] == "EPIC" and 4 or LootAnnouncerOptions["quality"] == "RARE" and 3 or LootAnnouncerOptions["quality"] == "UNCOMMON" and 2
			local n = 0
			local inGroup, inRaid, inPartyLFG = IsInGroup(), IsInRaid(), IsPartyLFG()
			local p, chat
			if not inGroup then return end -- not in group, exit.
			if (CheckLoot() and LootAnnouncerOptions["auto"]) or (IsLeftControlKeyDown() and (IsInGroup() or IsInRaid())) then
				for i = 1, GetNumLootItems() do
					if GetLootSlotType(i) == 1 then
						for j = 1, t do
							if GetLootSlotLink(i) == loottemp[j] then
								check = true
							end
						end 
					end
				end
				if check == false or IsLeftControlKeyDown() then
					for i = 1, GetNumLootItems() do
						if GetLootSlotType(i) ~= 1 then 
							m = m + 1
						else 
							local _, item, quantity, quality = GetLootSlotInfo(i)
							if quality >= q then
								name[i] = item
								k = 1
								while name[i] ~= name[k] do
								k = k + 1
								end

								if i == k then
									n = n + 1
									loot[n] = GetLootSlotLink(i)
									numbers[n] = quantity 
								else
									p = 1
									while GetLootSlotLink(k) ~= loot[p] do
									p = p + 1
								end
								numbers[p] = numbers[p] + quantity
								
							end
						end
					end
				end
				if n ~= 0 then 
					if LootAnnouncerOptions["chat"] == "PARTY" then
						SendChatMessage("Loot Dropped:", inPartyLFG and "INSTANCE_CHAT" or "PARTY")
					elseif LootAnnouncerOptions["chat"] == "RAID" then
						if inRaid then
							SendChatMessage("Loot Dropped:", inPartyLFG and "INSTANCE_CHAT" or "RAID")
						else
							SendChatMessage("Loot Dropped:", inPartyLFG and "INSTANCE_CHAT" or "PARTY")
						end
					elseif LootAnnouncerOptions["chat"] == "SAY" then
						SendChatMessage("Loot Dropped:", "SAY")
					end
				end
				for i = 1, n do
					if LootAnnouncerOptions["chat"] == "PARTY" then
						if numbers[i] == 1 then
							SendChatMessage(i..". "..loot[i], inPartyLFG and "INSTANCE_CHAT" or "PARTY")
						elseif numbers[i] > 1 then
							SendChatMessage(i..". "..loot[i].."x"..numbers[i], inPartyLFG and "INSTANCE_CHAT" or "PARTY")
						end
					elseif LootAnnouncerOptions["chat"] == "RAID" then
						if inRaid then
							if numbers[i] == 1 then
								SendChatMessage(i..". "..loot[i], inPartyLFG and "INSTANCE_CHAT" or "RAID")
							elseif numbers[i] > 1 then
									SendChatMessage(i..". "..loot[i].."x"..numbers[i], inPartyLFG and "INSTANCE_CHAT" or "RAID")
								end	
							else
								if numbers[i] == 1 then
									SendChatMessage(i..". "..loot[i], inPartyLFG and "INSTANCE_CHAT" or "PARTY")
								elseif numbers[i] > 1 then
									SendChatMessage(i..". "..loot[i].."x"..numbers[i], inPartyLFG and "INSTANCE_CHAT" or "PARTY")
								end
							end	
					elseif LootAnnouncerOptions["chat"] == "SAY" then
						if numbers[i] == 1 then
							SendChatMessage(i..". "..loot[i], "SAY")	
						elseif numbers[i] > 1 then
							SendChatMessage(i..". "..loot[i].."x"..numbers[i], "SAY")
							end
						end
					end
				end
				for i = 1, GetNumLootItems() do
					if GetLootSlotType(i) == 1 then
						loottemp[i] = GetLootSlotLink(i)
					end
				end
				t = GetNumLootItems()
				check = false
			end
		end

		local LoadLootAnnounce = CreateFrame("Frame")
		if IsAddOnLoaded('masterlooter') then
		LoadLootAnnounce:RegisterEvent("PLAYER_ENTERING_WORLD")
		LoadLootAnnounce:SetScript("OnEvent", function(self, event)
			self:UnregisterEvent("PLAYER_ENTERING_WORLD")
			print("Loaded |cff1784d1Loot Announcer|r by |cffFFFF00Repooc|r & |cffFFFF00Darth Predator|r. To configure, type: |cffFF0000/la|r")
			end)
		end

		local LootAnnouncer = CreateFrame("Frame")
		LootAnnouncer:RegisterEvent("LOOT_OPENED")
		LootAnnouncer:SetScript("OnEvent", function(self, event)
			AnnounceLoot()
		end)

		local strlower = string.lower
		local function Split(str)
			if str:find("%s") then
				return strsplit(" ", str)
			else
				return str
			end
		end

		RepoocSlashHandler = function(msg)
			local cmd = strlower(msg)
			local arg1, arg2 = Split(cmd)
			
			if (arg1 == "enable" or arg1 == "on") and arg2 == nil then
				LootAnnouncerOptions["enabled"] = true;
				print("Loot Announcer is Enabled!")
				print("Please Reload for changes to take effect. /rl")
			elseif (arg1 == "disable" or arg1 == "off") and arg2 == nil then
				LootAnnouncerOptions["enabled"] = false;
				print("Loot Announcer is Disabled!")
				print("Please Reload for changes to take effect. /rl")
			elseif arg1 == "quality" then
				if arg2 == "1" then
					LootAnnouncerOptions["quality"] = "EPIC"
					print("Quality set to EPIC.")
					print("Please Reload for changes to take effect. /rl")
				elseif arg2 == "2" then
					LootAnnouncerOptions["quality"] = "RARE"
					print("Quality set to RARE.")
					print("Please Reload for changes to take effect. /rl")
				elseif arg2 == "3" then
					LootAnnouncerOptions["quality"] = "UNCOMMON"
					print("Quality set to UNCOMMON.")
					print("Please Reload for changes to take effect. /rl")
				else
					print("Loot Announcer Options")
					print("/la quality 1 - Sets quality to EPIC.")
					print("/la quality 2 - Sets quality to RARE.")
					print("/la quality 3 - Sets quality to UNCOMMON.")
				end
			elseif arg1 == "chat" then
				if arg2 == "1" then
					LootAnnouncerOptions["chat"] = "RAID"
					print("Announce to RAID set.")
					print("Please Reload for changes to take effect. /rl")
				elseif arg2 == "2" then
					LootAnnouncerOptions["chat"] = "PARTY"
					print("Announce to PARTY set.")
					print("Please Reload for changes to take effect. /rl")
				elseif arg2 == "3" then
					LootAnnouncerOptions["chat"] = "SAY"
					print("Announce to SAY set.")
					print("Please Reload for changes to take effect. /rl")
				else
					print("Loot Announcer Options")
					print("/la chat 1 - Sets chat to RAID.")
					print("/la chat 2 - Sets chat to PARTY.")
					print("/la chat 3 - Sets chat to SAY.")
				end
			elseif arg1 == "auto" then
				if (arg2 == "enable" or arg2 == "on") then
					LootAnnouncerOptions["auto"] = true
					print("Auto announcing function enabled.")
				elseif (arg2 == "disable" or arg2 == "off") then
					LootAnnouncerOptions["auto"] = false
					print("Auto announcing disable, need to have Left CTRL held while looting.")
				else
					print("Loot Announcer Options")
					print("/la auto enable|on - Announces automatically when you loot.")
					print("/la auto disable|off - Turns auto announcing off, need to hold Left CTRL while looting.")
				end
			else
				print("Loot Announcer Options")
				print("/la on|off - Turns addon on or off.")
				print("/la auto on|off - Turns auto announcing when looting on or off.")
				print("/la quality 1|2|3 - Sets quality to announce to EPIC|RARE|UNCOMMON.")
				print("/la chat 1|2|3 - Sets chat channel RAID|PARTY|SAY.")
			end
		end

		SLASH_LOOTANNOUNCER1 = "/la"
		SlashCmdList["LOOTANNOUNCER"] = RepoocSlashHandler

		SLASH_RELOADUI1 = "/rl"
		SlashCmdList.RELOADUI = ReloadUI
	
		---------------------------------------------------------------
		-- Button creation function
		---------------------------------------------------------------

		local CreateBtn = function(name, parent, w, h, tt_txt, txt) -- 1. Name, 2. Parent, 3. width, 4. height, 5. tooltip text, 6. text on button
			
			local b = CreateFrame("Button", name, parent)
			b:Width(w)
			b:Height(h)
			b:SetTemplate()
			
			local btext=b:CreateFontString(nil, "OVERLAY")
				if C["MaxUI Media"]["Font"] == "Caps" then
					btext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\dajova.ttf", FontSize, "OUTLINE")
				elseif C["MaxUI Media"]["Font"] == "Comic" then
					btext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\comic.ttf", FontSize, "OUTLINE")
				elseif C["MaxUI Media"]["Font"] == "Maxui" then
					btext:SetFont("Interface\\AddOns\\TukuiMaxUI\\Medias\\Fonts\\maxui.ttf", FontSize, "OUTLINE")
				else	
					btext:SetFont(C["Medias"].Font, FontSize, "OUTLINE")
				end
			btext:SetText(txt)
			btext:SetTextColor(1, 1, 1)
			btext:SetPoint("CENTER", b, 'CENTER', 0, 0)
			btext:SetJustifyH("CENTER")	
			
			b:SetScript("OnEnter", function(self)
				GameTooltip:SetOwner(Line01ML, "ANCHOR_TOP", 0, 20)
				GameTooltip:AddLine(tt_txt, 1, 1, 1, 1, 1, 1)
				GameTooltip:Show()
				btext:SetTextColor(class.r, class.g, class.b)
				b:SetBackdropBorderColor(class.r, class.g, class.b)
			end)
			
			b:SetScript("OnLeave", function(self)
				GameTooltip:Hide()
				btext:SetTextColor(1, 1, 1)
				b:SetBackdropBorderColor(unpack(C["General"]["BorderColor"]))	
			end)
			
			b:SetAttribute("type1", "macro")
			b:CreateOverlayTooltip()
		end

		------------------------------------------------------------------------------------------
		-- MASTER LOOTER BASIC BUTTONS
		------------------------------------------------------------------------------------------

		-- roll need Main Spec/Current Spec button:
		CreateBtn("MSRoll", Line02ML, 96, 19, "Main/Current Spec Need rolls starting", "MS rolls")
		MSRoll:Point("LEFT", Line02ML, "LEFT", 70, 0)
		MSRoll:SetAttribute("macrotext1", "/s Main/Current Spec rolls starting now")
		--MSRoll:SetAttribute("macrotext1", "/i Main/Current Spec rolls starting now")
		--MSRoll:SetAttribute("macrotext1", "/rw Main/Current Spec rolls starting now")

		-- roll need Off spec button:
		CreateBtn("OSRoll", Line02ML, 96, 19, "Off Spec Need rolls starting", "OS Rolls")
		OSRoll:Point("LEFT", MSRoll, "RIGHT", 5,0)
		OSRoll:SetAttribute("macrotext1", "/s Off Spec rolls starting now")
		--OSRoll:SetAttribute("macrotext1", "/i Off Spec rolls starting now")
		--OSRoll:SetAttribute("macrotext1", "/rw Off Spec rolls starting now")

		-- raidroll/greed roll button: 
		CreateBtn("GreedRoll", Line02ML, 96, 19, "Greed Rolls starting", "Greed")
		GreedRoll:Point("LEFT", OSRoll, "RIGHT", 5,0)
		GreedRoll:SetAttribute("macrotext1", "/s Greed rolls starting now")
		--GreedRoll:SetAttribute("macrotext1", "/i Greed rolls starting now")
		--GreedRoll:SetAttribute("macrotext1", "/rw Greed rolls starting now")

		-- countdown timer button:
		CreateBtn("LootTimer", Line03ML, 96, 19, "Countdown Timer", "Countdown")
		LootTimer:Point("LEFT", Line03ML, "LEFT", 70,0)
		LootTimer:SetAttribute("macrotext1", "/rw Roll countdown starting" and "/dbm broadcast ctimer 30 Now Rolling!")
		--LootTimer:SetAttribute("macrotext1", "/dbm broadcast ctimer 15 Now Rolling!" )

		-- loot view:
		CreateBtn("ShowLootRolls", Line03ML, 96, 19, "Show loot Roll Frame", "Loot Rolls")
		ShowLootRolls:Point("LEFT", LootTimer, "RIGHT", 5,0)
		ShowLootRolls:SetAttribute("macrotext1", "/loot")

		-- ???:
		CreateBtn("extrabutton", Line03ML, 96, 19, "????", "????")
		extrabutton:Point("LEFT", ShowLootRolls, "RIGHT", 5,0)
		extrabutton:SetAttribute("macrotext1", "/")

		------------------------------------------------------------------------------------------
		-- LOOT ANNOUNCER ADDITIONAL BUTTONS (Loot Announcer made by Repooc and Darth)
		------------------------------------------------------------------------------------------

		-- loot announcer on/off toggle
		CreateBtn("latoggleon", Line01ML, 60, 19, "Loot announcer addon on", "LA on")
		latoggleon:Point("LEFT", Line01ML, "LEFT", 70, 0)
		latoggleon:SetAttribute("macrotext1", "/la on")

		CreateBtn("latoggleoff", Line02ML, 60, 19, "Loot announcer addon off", "LA off")
		latoggleoff:Point("LEFT", latoggleon, "RIGHT", 5, 0)
		latoggleoff:SetAttribute("macrotext1", "/la off")

		-- loot threshold UNCOMMON / GREEN
		CreateBtn("lootgreen", Line01ML, 24, 19, "loot threshold uncommon/green", "")
		lootgreen:Point("LEFT", latoggleoff, "RIGHT", 5, 0)
		lootgreen:SetAttribute("macrotext1", "/la quality 3")
		lootgreen:SetBackdropBorderColor(51/255, 255/255, 51/255, 1)
		lootgreen:SetScript("OnLeave", function(self)
			lootgreen:SetBackdropBorderColor(51/255, 255/255, 51/255, 1)
		end)

		-- loot threshold RARE / BLUE
		CreateBtn("lootblue", Line01ML, 24, 19, "loot threshold rare/blue", "")
		lootblue:Point("LEFT", lootgreen, "RIGHT", 5, 0)
		lootblue:SetAttribute("macrotext1", "/la quality 2")
		lootblue:SetBackdropBorderColor(0/255, 128/255, 255/255, 1)
		lootblue:SetScript("OnLeave", function(self)
			lootblue:SetBackdropBorderColor(0/255, 128/255, 255/255, 1)
		end)

		-- loot threshold EPIC / PURPLE
		CreateBtn("lootpurple", Line01ML, 24, 19, "loot threshold epic/purple", "")
		lootpurple:Point("LEFT", lootblue, "RIGHT", 5, 0)
		lootpurple:SetAttribute("macrotext1", "/la quality 1")
		lootpurple:SetBackdropBorderColor(255/255,0/255, 255/255, 1)
		lootpurple:SetScript("OnLeave", function(self)
			lootpurple:SetBackdropBorderColor(255/255,0/255, 255/255, 1)
		end)

		-- channel "say"
		CreateBtn("lachannelsay", Line01ML, 24, 19, "Channel SAY", "S")
		lachannelsay:Point("LEFT", lootpurple, "RIGHT", 5, 0)
		lachannelsay:SetAttribute("macrotext1", "/la chat 3")

		-- channel "party"
		CreateBtn("lachannelparty", Line01ML, 24, 19, "Channel Party", "P")
		lachannelparty:Point("LEFT", lachannelsay, "RIGHT", 5, 0)
		lachannelparty:SetAttribute("macrotext1", "/la chat 2")

		-- channel "instance/raid
		CreateBtn("lachannelraid", Line01ML, 24, 19, "Channel Raid", "R")
		lachannelraid:Point("LEFT", lachannelparty, "RIGHT", 5, 0)
		lachannelraid:SetAttribute("macrotext1", "/la chat 1")
			
	end
end
hooksecurefunc(Panels, "Enable", Enable)