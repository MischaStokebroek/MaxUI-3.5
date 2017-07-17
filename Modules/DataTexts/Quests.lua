------------------------------------------------------------------------------------------
-- MaxUI 3.50 TukUI 17 - LEGION 7.0 -- version: 21-04-2017
------------------------------------------------------------------------------------------

--setting up QUEST DATATEXT.


-- (WIP) to do: insert required description and items

------------------------------------------------------------------------------------------
-- VARIABLES
------------------------------------------------------------------------------------------

local T, C, L = unpack(Tukui) 

local DataText = T["DataTexts"]
local Misc = T["Miscellaneous"]
local class = RAID_CLASS_COLORS[select(2, UnitClass("player"))]

local textalpha = 1
local textwrap = 1 -- 1 = wrap, 0 = not
local format = format

------------------------------------------------------------------------------------------
-- QUEST DATATEXT
------------------------------------------------------------------------------------------

local Update = function(self)
	local numEntries, numQuests = GetNumQuestLogEntries()
	self.Text:SetText(format(DataText.NameColor.."Quests: |r"..DataText.ValueColor.."%s%s".."|r", numQuests, "/25"))
end

local OnEnter = function(self)

	self.Text:SetTextColor(class.r, class.g, class.b)
	
	local questDescription, questObjectives = GetQuestLogQuestText()	
	
	local questIndex = GetQuestLogSelection()	
	local questTitle, level, questTag, suggestedGroup, isHeader, isCollapsed, isComplete, isDaily, questID = GetQuestLogTitle(questIndex)	
	--local index = GetNumQuestCurrencies() 
	--local name, texture, amount = GetQuestCurrencyInfo(required)

	GameTooltip:SetOwner(self:GetTooltipAnchor())
	GameTooltip:ClearLines()
	
	-- header/title:
	GameTooltip:AddLine(format("lvl %s: %s", level, questTitle))
	GameTooltip:AddLine(" ") -- spacing
	--GameTooltip:AddLine(isComplete, 1,1,1 , textalpha, textwrap)
	--GameTooltip:AddLine(isDaily, 1,1,1 , textalpha, textwrap)
			
	-- quest objective text
	GameTooltip:AddLine(format("%s:", "Objective"))
	GameTooltip:AddLine(questObjectives, 1,1,1 , textalpha, textwrap)
	GameTooltip:AddLine(" ") -- spacing
	
	-- quest objective requirements (items, kills, ...)
	GameTooltip:AddLine(format("%s:", "Required"))
	GameTooltip:AddLine("insert requirement info", 1,1,1 , textalpha, textwrap)
	GameTooltip:AddLine(" ") -- spacing
	
	-- quest description
	GameTooltip:AddLine(format("%s:", "Description"))
	GameTooltip:AddLine(questDescription, 1,1,1, textalpha, textwrap)
	
	-- additional quest info
	GameTooltip:AddLine(" ")
	
	GameTooltip:Width(400)
	GameTooltip:Show()
	 
end

local OnLeave = function(self)
	self.Text:SetTextColor(1, 1, 1)
	GameTooltip:Hide()
end


local OnMouseDown = function()
	
	if WorldMapFrame:IsShown() then
	WorldMapFrame:Hide()
	else
	WorldMapFrame:Show()
	end
	
end

local Enable = function(self)
	
	self:RegisterEvent("PLAYER_ENTERING_WORLD")
	self:RegisterEvent("UNIT_QUEST_LOG_CHANGED")
	self:RegisterEvent("QUEST_LOG_UPDATE")
	
	self:SetScript("OnEvent", Update)
	self:SetScript("OnEnter", OnEnter)
	self:SetScript("OnLeave", OnLeave)
	self:SetScript("OnMouseDown", OnMouseDown)
	
	self:Update()
end

local Disable = function(self)
	self.Text:SetText("")
	self:UnregisterAllEvents()
	self:SetScript("OnEvent", nil)
	self:SetScript("OnMouseDown", nil)
	self:SetScript("OnEnter", nil)
	self:SetScript("OnLeave", nil)
end

DataText:Register("Quests", Enable, Disable, Update)