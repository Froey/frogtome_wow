local _, Frogtome = ...
if not Frogtome.UI then
	Frogtome.UI = {}
end
Frogtome.UI.MainFrame = {}

local CharactersPage = Frogtome.UI.Pages.Characters
local FarmingPage = Frogtome.UI.Pages.Farming
local HiddenSettings = Frogtome.Settings.HiddenSettings
local Log = Frogtome.Misc.Log
local MainFrame = Frogtome.UI.MainFrame
local NotesPage = Frogtome.UI.Pages.Notes
local QuestingPage = Frogtome.UI.Pages.Questing
local SessionPage = Frogtome.UI.Pages.Session
local Settings = Frogtome.Settings.Settings
local SettingsPage = Frogtome.UI.Pages.SettingsPage
local Strings = Frogtome.UI.Strings
local UI = Frogtome.UI.UI
local UIConfig = Frogtome.UI.UIConfig

----------------------
-- Page Definitions --
----------------------

MainFrame.PAGE_IMPL_DICT = {
	["CharactersPage"] = CharactersPage,
	["FarmingPage"] = FarmingPage,
	["NotesPage"] = NotesPage,
	["QuestingPage"] = QuestingPage,
	["SettingsPage"] = SettingsPage
}

MainFrame.PAGE_USE_DICT = {
	["CharactersPage"] = Settings.IsShowingCharactersPage,
	["FarmingPage"] = Settings.IsShowingFarmingPage,
	["NotesPage"] = Settings.IsShowingNotesPage,
	["QuestingPage"] = Settings.IsShowingQuestingPage,
	["SettingsPage"] = function() return true end
}

MainFrame.PAGE_DISPLAY_ORDER = {
	"CharactersPage",
	"FarmingPage",
	"QuestingPage",
	"NotesPage",
	"SettingsPage"
}

-----------
-- Pages --
-----------

-- Returns the (ordered) list of page IDs to use for this instance of Frogtome.
function MainFrame:GetPagesIdsToUse()
	local pageIdsToUse = {}
	for _, pageId in ipairs(MainFrame.PAGE_DISPLAY_ORDER) do
		if MainFrame.PAGE_USE_DICT[pageId]() then
			local page = MainFrame.PAGE_IMPL_DICT[pageId]
			if page then
				table.insert(pageIdsToUse, pageId)
			end
		end
	end
	
	return pageIdsToUse
end

-- Returns the dictionary of page implementations to use for this instance of Frogtome.
function MainFrame:GetPageImplementationsToUse()
	local pageImplsToUse = {}
	for _, pageId in ipairs(MainFrame.PAGE_DISPLAY_ORDER) do
		if MainFrame.PAGE_USE_DICT[pageId]() then
			local pageImpl = MainFrame.PAGE_IMPL_DICT[pageId]
			if pageImpl then
				pageImplsToUse[pageId] = pageImpl
			end
		end
	end
	
	return pageImplsToUse
end

-- Builds all pages to be used for this instance of Frogtome, attaching them to the main frame.
function MainFrame:BuildUsedPages()
	MainFrame.Frame.Pages = {}
	for pageId, pageImpl in pairs(MainFrame:GetPageImplementationsToUse()) do
		local page = pageImpl:Build(MainFrame.Frame)
		MainFrame.Frame.Pages[pageId] = page
		page:Hide()
	end
end

-- Changes the page displayed within the main frame, using the provided page ID.
function MainFrame:SelectPage(newPageId)
	for pageSelectionButtonId, pageSelectionButton in pairs(MainFrame.Frame.PageSelectionTopbar.PageSelectionButtons) do
		if newPageId == pageSelectionButtonId then
			pageSelectionButton:LockHighlight()
		else
			pageSelectionButton:UnlockHighlight()
		end
	end
	
	-- Hide the old page
	local oldPageId = MainFrame.CurrentPageId
	if oldPageId then
		local oldPage = MainFrame.PAGE_IMPL_DICT[oldPageId]
		if oldPage and oldPage.Page then
			oldPage.Page:Hide()
			oldPage:OnPageHidden()
		end
	end
	
	-- Show the new page (if we've provided a new page to show)
	if newPageId and MainFrame.PAGE_USE_DICT[newPageId]() then
		if newPageId then
			local newPage = MainFrame.PAGE_IMPL_DICT[newPageId]
			if newPage and newPage.Page then
				newPage:OnPageShown()
				newPage.Page:Show()
			end
		end
		
		HiddenSettings:SetLastShownPageId(newPageId)
		MainFrame.CurrentPageId = newPageId
	end
end

-------------------------------------
-- Page Selection Topbar Listeners --
-------------------------------------

function MainFrame:OnPageSelectionButtonClicked(pageId)
	MainFrame:SelectPage(pageId)
end

----------------------------------------
-- Page Selection Topbar Construction --
----------------------------------------

function MainFrame:CreatePageSelectionButton(parent, pageId, pageNameText, buttonIndex, buttonCount)
	local allButtonsWidth = UIConfig.MAIN_FRAME_CONTENT_WIDTH - ((buttonCount - 1) * UIConfig.MAIN_FRAME_SELECTION_BUTTON_BUFFER)
	local buttonWidth = allButtonsWidth / buttonCount
	
	local centerIndex = (buttonCount / 2) + 0.5
	local indexOffset = buttonIndex - centerIndex
	local widthOffset = (buttonWidth + UIConfig.MAIN_FRAME_SELECTION_BUTTON_BUFFER) * indexOffset
	
	local pageSelectionButton = UI:CreateButton(parent, pageNameText, buttonWidth, UIConfig.MAIN_FRAME_SELECTION_BUTTON_HEIGHT, "CENTER", "CENTER", widthOffset, 0, function()
		MainFrame:OnPageSelectionButtonClicked(pageId)
	end)
	UI:ApplyButtonWidgetFontSize(pageSelectionButton, 16)
	
	return pageSelectionButton
end

function MainFrame:BuildPageSelectionTopbar(parent)
	Log:Trace("Building topbar selection frame...")
	
	local pageSelectionTopbar = CreateFrame("Frame", nil, parent)
	pageSelectionTopbar:SetSize(UIConfig.MAIN_FRAME_CONTENT_WIDTH, UIConfig.MAIN_FRAME_SELECTION_BUTTON_HEIGHT)
	pageSelectionTopbar:SetPoint("TOP", parent, "TOP", 0, -UIConfig.MAIN_FRAME_CONTENT_INSET_TOP)
	
	local pageIdsToUse = MainFrame:GetPagesIdsToUse()
	
	pageSelectionTopbar.PageSelectionButtons = {}
	for pageIndex, pageId in ipairs(pageIdsToUse) do
		local pageSelectionButton = MainFrame:CreatePageSelectionButton(pageSelectionTopbar, pageId, Strings:Get("MAIN_FRAME_SELECTION_BUTTON_" .. pageId:upper()), pageIndex, #pageIdsToUse)
		pageSelectionTopbar.PageSelectionButtons[pageId] = pageSelectionButton
	end
	
	return pageSelectionTopbar
end

--------------------------
-- Main Frame Listeners --
--------------------------

function MainFrame:OnMainFrameShown()
	local pageIdToShow = HiddenSettings:GetLastShownPageId()
	if pageIdToShow == nil or not MainFrame.PAGE_USE_DICT[pageIdToShow]() then
		-- Cycle through each page in order until we find a page we can show
		pageIdToShow = nil
		for _, pageId in ipairs(MainFrame.PAGE_DISPLAY_ORDER) do
			if pageIdToShow == nil and MainFrame.PAGE_USE_DICT[pageId]() then
				pageIdToShow = pageId
			end
		end
	end
	
	MainFrame.CurrentPageId = pageIdToShow
	MainFrame:SelectPage(MainFrame.CurrentPageId)
end

function MainFrame:OnMainFrameHidden()
	MainFrame:SelectPage(nil)
end

--------------------------------
-- Main Frame Control Actions --
--------------------------------

function MainFrame:GetFrameDimensions(ignoreSettings)
	local condensed = not ignoreSettings and Settings:IsShowingCondensedView()
	
	local mainFrameWidth = UIConfig.MAIN_FRAME_CONTENT_INSET_LEFT + UIConfig.MAIN_FRAME_CONTENT_WIDTH + UIConfig.MAIN_FRAME_CONTENT_INSET_RIGHT
	local contentHeight
	if condensed then
		contentHeight = UIConfig.MAIN_FRAME_CONTENT_CONDENSED_HEIGHT
	else
		contentHeight = UIConfig.MAIN_FRAME_CONTENT_EXPANDED_HEIGHT
	end
	
	local mainFrameHeight = UIConfig.MAIN_FRAME_CONTENT_INSET_TOP + UIConfig.MAIN_FRAME_SELECTION_BUTTON_HEIGHT + UIConfig.MAIN_FRAME_SELECTION_BAR_BUFFER + contentHeight + UIConfig.MAIN_FRAME_CONTENT_INSET_BOTTOM
	
	return mainFrameWidth, mainFrameHeight, condensed
end

function MainFrame:AdjustToPreferredView()
	local mainFrameWidth, mainFrameHeight, condensed = MainFrame:GetFrameDimensions(false)
	MainFrame.Frame:SetSize(mainFrameWidth, mainFrameHeight)
	
	for pageId, page in pairs(MainFrame.Frame.Pages) do
		local pageImpl = MainFrame.PAGE_IMPL_DICT[pageId]
		if condensed then
			if page.ExpandedFrameView then
				page.ExpandedFrameView:Hide()
			end
			if page.CondensedFrameView then
				page.CondensedFrameView:Show()
			end
			pageImpl:OnCondensedFrameViewShown()
		else
			if page.CondensedFrameView then
				page.CondensedFrameView:Hide()
			end
			if page.ExpandedFrameView then
				page.ExpandedFrameView:Show()
			end
			pageImpl:OnExpandedFrameViewShown()
		end
	end
end

function MainFrame:Toggle()
	local toBeMadeVisible = not MainFrame.Frame:IsShown()
	if toBeMadeVisible then
		MainFrame:AdjustToPreferredView()
	end
	
	MainFrame.Frame:SetShown(toBeMadeVisible)
end

-----------------------------
-- Main Frame Construction --
-----------------------------

function MainFrame:Build()
	Log:Trace("Building main frame...")
	
	MainFrame.CurrentPageId = HiddenSettings:GetLastShownPageId()
	
	local mainFrame = CreateFrame("Frame", "FrogtomeMainFrame", UIParent, "BasicFrameTemplateWithInset")
	
	-- Start with the main frame being hidden
	mainFrame:Hide()
	
	-- Establish sizing
	local mainFrameWidth, mainFrameHeight = MainFrame:GetFrameDimensions(true)
	mainFrame:SetSize(mainFrameWidth, mainFrameHeight)
	mainFrame:SetPoint("CENTER", UIParent, "CENTER")
	MainFrame.Frame = mainFrame
	
	-- For Escape functionality, hook it up as a special frame within World of Warcraft
	if Settings:IsHidingOnEscape() then
		_G["FrogtomeMainFrame"] = mainFrame
		table.insert(UISpecialFrames, "FrogtomeMainFrame")
	end
	
	-- Allow the main frame to be movable
	mainFrame:SetMovable(true)
	mainFrame:EnableMouse(true)
	mainFrame:RegisterForDrag("LeftButton")
	
	-- Allow the main frame to be draggable
	mainFrame:SetScript("OnDragStart", mainFrame.StartMoving)
	mainFrame:SetScript("OnDragStop", mainFrame.StopMovingOrSizing)
	mainFrame:SetScript("OnShow", function()
		mainFrame:StopMovingOrSizing()
		MainFrame:OnMainFrameShown()
	end)
	mainFrame:SetScript("OnHide", function()
		mainFrame:StopMovingOrSizing()
		MainFrame:OnMainFrameHidden()
	end)
	
	-- Set title for main frame
	local titleText = UI:CreateText(mainFrame, Strings:Get("MAIN_FRAME_TITLE"), "CENTER", "CENTER", 0, -2, UIConfig.MAIN_FRAME_TITLE_COLOR, UIConfig.MAIN_FRAME_TITLE_FONT_SIZE , 0xFF, mainFrame.TitleBg)
	mainFrame.TitleText = titleText
	
	-- Build pages and page Selection
	MainFrame:BuildUsedPages()
	mainFrame.PageSelectionTopbar = MainFrame:BuildPageSelectionTopbar(mainFrame)
	
	Log:Trace("Frame widgets constructed.")
end
