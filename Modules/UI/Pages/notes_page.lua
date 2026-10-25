local _, Frogtome = ...
if not Frogtome.UI then
	Frogtome.UI = {}
end
if not Frogtome.UI.Pages then
	Frogtome.UI.Pages = {}
end
Frogtome.UI.Pages.Notes = {}

local HiddenSettings = Frogtome.Settings.HiddenSettings
local Log = Frogtome.Misc.Log
local Notes = Frogtome.Core.Notes
local NotesPage = Frogtome.UI.Pages.Notes
local Strings = Frogtome.UI.Strings
local UI = Frogtome.UI.UI
local UIConfig = Frogtome.UI.UIConfig
local Utils = Frogtome.Misc.Utils

------------------------
-- Core Functionality --
------------------------

function NotesPage:WriteNotes(notes)
	local notes
	if NotesPage.Page.ExpandedFrameView:IsVisible() then
		notes = NotesPage.Page.ExpandedFrameView.NotesBox:GetText()
	elseif NotesPage.Page.CondensedFrameView:IsVisible() then
		notes = NotesPage.Page.CondensedFrameView.NotesBox:GetText()
	end
	
	if not notes then
		return
	end
	
	if NotesPage.ShowingAccountNotes then
		Notes:SetAccountNotes(notes)
	else
		Notes:SetCharacterNotes(notes)
	end
end

----------------------------
-- Display Update Process --
----------------------------

function NotesPage:UpdateExpandedFrameView()
	local notes
	if NotesPage.ShowingAccountNotes then
		notes = Notes:GetAccountNotes()
	else
		notes = Notes:GetCharacterNotes()
	end
	
	if not notes then
		notes = ""
	end
	
	NotesPage.Page.ExpandedFrameView.NotesBox:SetText(notes)
end

function NotesPage:UpdateCondensedFrameView()
	local notes
	if NotesPage.ShowingAccountNotes then
		notes = Notes:GetAccountNotes()
	else
		notes = Notes:GetCharacterNotes()
	end
	
	if not notes then
		notes = ""
	end
	
	NotesPage.Page.CondensedFrameView.NotesBox:SetText(notes)
end

function NotesPage:UpdateDisplay(force)
	if not force and not NotesPage.Page:IsVisible() then
		return
	end
	
	if force or NotesPage.Page.ExpandedFrameView:IsVisible() then
		NotesPage:UpdateExpandedFrameView()
	end
	if force or NotesPage.Page.CondensedFrameView:IsVisible() then
		NotesPage:UpdateCondensedFrameView()
	end
end

----------------------------------
-- Display Update Functionality --
----------------------------------

function NotesPage:ChangeShownNotes(showAccountNotes)
	if showAccountNotes then
		NotesPage.Page.ExpandedFrameView.CharacterNotesButton:UnlockHighlight()
		NotesPage.Page.ExpandedFrameView.AccountNotesButton:LockHighlight()
		
		NotesPage.Page.CondensedFrameView.CharacterNotesButton:UnlockHighlight()
		NotesPage.Page.CondensedFrameView.AccountNotesButton:LockHighlight()
	else
		NotesPage.Page.ExpandedFrameView.AccountNotesButton:UnlockHighlight()
		NotesPage.Page.ExpandedFrameView.CharacterNotesButton:LockHighlight()
		
		NotesPage.Page.CondensedFrameView.AccountNotesButton:UnlockHighlight()
		NotesPage.Page.CondensedFrameView.CharacterNotesButton:LockHighlight()
	end
	
	HiddenSettings:SetNotesPageLastShownNotesIsAccount(showAccountNotes)
	NotesPage.ShowingAccountNotes = showAccountNotes
	
	NotesPage:UpdateDisplay(true)
end

------------------------
-- Listener Functions --
------------------------

function NotesPage:OnExpandedFrameViewShown()
	NotesPage:UpdateDisplay(true)
end

function NotesPage:OnCondensedFrameViewShown()
	NotesPage:UpdateDisplay(true)
end

function NotesPage:OnPageShown()
	NotesPage.ShowingAccountNotes = HiddenSettings:GetNotesPageLastShownNotesIsAccount()
	
	NotesPage:ChangeShownNotes(NotesPage.ShowingAccountNotes)
	
	NotesPage.Page.ExpandedFrameView.NotesBox:ClearFocus()
	NotesPage.Page.CondensedFrameView.NotesBox:ClearFocus()
	
	NotesPage:UpdateDisplay(true)
end

function NotesPage:OnPageHidden()
	-- TODO
end

function NotesPage:OnAccountButtonClicked()
	NotesPage:ChangeShownNotes(true)
end

function NotesPage:OnCharacterButtonClicked()
	NotesPage:ChangeShownNotes(false)
end

function NotesPage:OnNoteTextChange()
	NotesPage:WriteNotes()
end

-----------------------
-- Page Construction --
-----------------------

function NotesPage:BuildExpandedFrameView(page)
	local view = UI:CreateExpandedView(page)
	
	local notesScrollFrame = CreateFrame("ScrollFrame", nil, view, "UIPanelScrollFrameTemplate")
	notesScrollFrame:SetPoint("TOPLEFT", view, "TOPLEFT", UIConfig.NOTES_PAGE_SCROLL_FRAME_INSET_LEFT, -UIConfig.NOTES_PAGE_SCROLL_FRAME_INSET_TOP)
	notesScrollFrame:SetPoint("BOTTOMRIGHT", view, "BOTTOMRIGHT", -UIConfig.NOTES_PAGE_SCROLL_FRAME_INSET_RIGHT, UIConfig.NOTES_PAGE_SCROLL_FRAME_INSET_BOTTOM)
	view.NotesScrollFrame = notesScrollFrame
	
	local notesBox = CreateFrame("EditBox", nil, notesScrollFrame)
	notesBox:SetSize(UIConfig.MAIN_FRAME_CONTENT_WIDTH - UIConfig.NOTES_PAGE_SCROLL_FRAME_SCROLLBAR_BUFFER, 200)
	notesBox:SetPoint("TOP", notesScrollFrame, "TOP", 0, 0)
	notesBox:SetMultiLine(true)
	notesBox:SetAutoFocus(false)
	notesBox:SetFocus(false)
	notesBox:SetFontObject(UIConfig.NOTES_PAGE_NOTE_FONT_OBJECT)
	notesBox:SetFont(UIConfig.NOTES_PAGE_NOTE_FONT_PATH, UIConfig.NOTES_PAGE_NOTE_FONT_SIZE, "")
	view.NotesBox = notesBox
	
	notesScrollFrame:SetScrollChild(notesBox)
	
	local notesBoxBackground = view:CreateTexture(nil, "BACKGROUND")
	notesBoxBackground:SetSize(UIConfig.MAIN_FRAME_CONTENT_WIDTH - UIConfig.NOTES_PAGE_SCROLL_FRAME_SCROLLBAR_BUFFER, UIConfig.MAIN_FRAME_CONTENT_EXPANDED_HEIGHT - UIConfig.NOTES_PAGE_VIEW_BUTTON_HEIGHT - UIConfig.NOTES_PAGE_VIEW_BUTTON_OFFSET_Y - UIConfig.NOTES_PAGE_BACKGROUND_INSET_Y)
	notesBoxBackground:SetPoint("TOP", view, "TOP", UIConfig.NOTES_PAGE_BACKGROUND_OFFSET_X, UIConfig.NOTES_PAGE_BACKGROUND_OFFSET_Y)
	
	local r, g, b, a = Utils:GetColorsFromHex(UIConfig.NOTES_PAGE_BACKGROUND)
	notesBoxBackground:SetColorTexture(r, g, b, a)
	
	view.AccountNotesButton = UI:CreateButton(view, Strings:Get("NOTES_PAGE_ACCOUNT_BUTTON"), UIConfig.NOTES_PAGE_VIEW_BUTTON_WIDTH, UIConfig.NOTES_PAGE_VIEW_BUTTON_HEIGHT, "BOTTOMRIGHT", "BOTTOM", -UIConfig.NOTES_PAGE_VIEW_BUTTON_OFFSET_X, UIConfig.NOTES_PAGE_VIEW_BUTTON_OFFSET_Y, NotesPage.OnAccountButtonClicked, UIConfig.NOTES_PAGE_VIEW_BUTTON_FONT_SIZE)
	view.CharacterNotesButton = UI:CreateButton(view, Strings:Get("NOTES_PAGE_CHARACTER_BUTTON"), UIConfig.NOTES_PAGE_VIEW_BUTTON_WIDTH, UIConfig.NOTES_PAGE_VIEW_BUTTON_HEIGHT, "BOTTOMLEFT", "BOTTOM", UIConfig.NOTES_PAGE_VIEW_BUTTON_OFFSET_X, UIConfig.NOTES_PAGE_VIEW_BUTTON_OFFSET_Y, NotesPage.OnCharacterButtonClicked, UIConfig.NOTES_PAGE_VIEW_BUTTON_FONT_SIZE)
	
	notesBox:SetScript("OnTextChanged", NotesPage.OnNoteTextChange)
	
	return view
end

function NotesPage:BuildCondensedFrameView(page)
	local view = UI:CreateCondensedView(page)
	
	-- Content
	
	local widget
	
	local notesScrollFrame = CreateFrame("ScrollFrame", nil, view, "UIPanelScrollFrameTemplate")
	notesScrollFrame:SetPoint("TOPLEFT", view, "TOPLEFT", UIConfig.NOTES_PAGE_CONDENSED_SCROLL_FRAME_INSET_LEFT, -UIConfig.NOTES_PAGE_CONDENSED_SCROLL_FRAME_INSET_TOP)
	notesScrollFrame:SetPoint("BOTTOMRIGHT", view, "BOTTOMRIGHT", -UIConfig.NOTES_PAGE_CONDENSED_SCROLL_FRAME_INSET_RIGHT, UIConfig.NOTES_PAGE_CONDENSED_SCROLL_FRAME_INSET_BOTTOM)
	view.NotesScrollFrame = notesScrollFrame
	
	local notesBox = CreateFrame("EditBox", nil, notesScrollFrame)
	notesBox:SetSize(UIConfig.MAIN_FRAME_CONTENT_WIDTH - UIConfig.NOTES_PAGE_CONDENSED_SCROLL_FRAME_SCROLLBAR_BUFFER, UIConfig.MAIN_FRAME_CONTENT_CONDENSED_HEIGHT)
	notesBox:SetPoint("TOP", notesScrollFrame, "TOP", 0, 0)
	notesBox:SetMultiLine(true)
	notesBox:SetAutoFocus(false)
	notesBox:SetFocus(false)
	notesBox:SetFontObject(UIConfig.NOTES_PAGE_NOTE_FONT_OBJECT)
	notesBox:SetFont(UIConfig.NOTES_PAGE_NOTE_FONT_PATH, UIConfig.NOTES_PAGE_NOTE_FONT_SIZE, "")
	view.NotesBox = notesBox
	
	notesScrollFrame:SetScrollChild(notesBox)
	
	local notesBoxBackground = view:CreateTexture(nil, "BACKGROUND")
	notesBoxBackground:SetSize(UIConfig.MAIN_FRAME_CONTENT_WIDTH - UIConfig.NOTES_PAGE_CONDENSED_BACKGROUND_INSET_X, UIConfig.MAIN_FRAME_CONTENT_CONDENSED_HEIGHT)
	notesBoxBackground:SetPoint("TOPLEFT", view, "TOPLEFT", UIConfig.NOTES_PAGE_CONDENSED_BACKGROUND_OFFSET_X, UIConfig.NOTES_PAGE_CONDENSED_BACKGROUND_OFFSET_Y)
	
	local r, g, b, a = Utils:GetColorsFromHex(UIConfig.NOTES_PAGE_BACKGROUND)
	notesBoxBackground:SetColorTexture(r, g, b, a)
	
	view.AccountNotesButton = UI:CreateButton(view, Strings:Get("NOTES_PAGE_ACCOUNT_BUTTON"), UIConfig.NOTES_PAGE_VIEW_BUTTON_WIDTH, UIConfig.NOTES_PAGE_VIEW_BUTTON_HEIGHT, "TOPRIGHT", "TOPRIGHT", UIConfig.NOTES_PAGE_CONDENSED_VIEW_BUTTON_OFFSET_X, -UIConfig.NOTES_PAGE_CONDENSED_VIEW_BUTTON_INSET_Y, NotesPage.OnAccountButtonClicked, UIConfig.NOTES_PAGE_VIEW_BUTTON_FONT_SIZE)
	view.CharacterNotesButton = UI:CreateButton(view, Strings:Get("NOTES_PAGE_CHARACTER_BUTTON"), UIConfig.NOTES_PAGE_VIEW_BUTTON_WIDTH, UIConfig.NOTES_PAGE_VIEW_BUTTON_HEIGHT, "BOTTOMRIGHT", "BOTTOMRIGHT", UIConfig.NOTES_PAGE_CONDENSED_VIEW_BUTTON_OFFSET_X, UIConfig.NOTES_PAGE_CONDENSED_VIEW_BUTTON_INSET_Y, NotesPage.OnCharacterButtonClicked, UIConfig.NOTES_PAGE_VIEW_BUTTON_FONT_SIZE)
	
	notesBox:SetScript("OnTextChanged", NotesPage.OnNoteTextChange)
	
	return view
end

function NotesPage:Build(parent)
	Log:Debug("Creating Notes page...")
	
	NotesPage.ShowingAccountNotes = HiddenSettings:GetNotesPageLastShownNotesIsAccount()
	
	local page = UI:CreatePage(parent)
	NotesPage.Page = page
	
	local expandedView = NotesPage:BuildExpandedFrameView(page)
	page.ExpandedFrameView = expandedView
	
	local condensedView = NotesPage:BuildCondensedFrameView(page)
	page.CondensedFrameView = condensedView
	
	return page
end
