local _, Frogtome = ...
if not Frogtome.UI then
	Frogtome.UI = {}
end
Frogtome.UI.UI = {}

local Log = Frogtome.Misc.Log
local UI = Frogtome.UI.UI
local UIConfig = Frogtome.UI.UIConfig
local Utils = Frogtome.Misc.Utils

--------------------
-- Font Functions --
--------------------

function UI:ApplyTextWidgetFont(widget, color, fontSize, opacityHex)
	widget:SetFontObject(UIConfig.GLOBAL_FONT_OBJECT)
	
	if fontSize then
		widget:SetFont(UIConfig.GLOBAL_FONT_PATH, fontSize)
	end
	
	if not color then
		color = UIConfig.GLOBAL_TEXT_COLOR
	end
	if not opacityHex then
		opacityHex = 0xFF
	end
	
	opacityHex = bit.lshift(opacityHex, 24)
	color = bit.bor(color, opacityHex)
	
	local r, g, b = Utils:GetColorsFromHex(color, true)
	widget:SetTextColor(r, g, b, a)
end

function UI:ApplyButtonWidgetFontSize(widget, fontSize)
	if fontSize then
		local fontString = widget:GetFontString()
		fontString:SetFont(UIConfig.GLOBAL_FONT_PATH, fontSize)
	end
end

-------------------------------------
-- Basic Widget Creation Functions --
-------------------------------------

-- Creates a generic-use frame widget from the provided parameters.
function UI:CreateFrame(parent, width, height, alignment, frameAlignment, xOffset, yOffset, frameForAlignment)
	if not frameForAlignment then
		frameForAlignment = parent
	end
	
	local widget = CreateFrame("Frame", nil, parent)
	widget:SetSize(width, height)
	widget:SetPoint(alignment, frameForAlignment, frameAlignment, xOffset, yOffset)
	widget:Show()
	
	return widget
end

-- Creates a texture widget and child texture itself from the provided parameters.
function UI:CreateTexture(parent, texture, width, height, alignment, frameAlignment, xOffset, yOffset, frameForAlignment)
	if not frameForAlignment then
		frameForAlignment = parent
	end
	
	local widget = CreateFrame("Frame", nil, parent)
	widget:SetSize(width, height)
	widget:SetPoint(alignment, frameForAlignment, frameAlignment, xOffset, yOffset)
	
	local widgetTexture = widget:CreateTexture(nil, "OVERLAY")
	widgetTexture:SetAllPoints()
	widgetTexture:SetTexture(texture)
	
	return widget, widgetTexture
end

-- Creates a text widget from the provided parameters.
function UI:CreateText(parent, text, alignment, frameAlignment, xOffset, yOffset, color, fontSize, opacityHex, frameForAlignment)
	if not frameForAlignment then
		frameForAlignment = parent
	end
	
	local widget = parent:CreateFontString(nil, "OVERLAY", UIConfig.GLOBAL_FONT_OBJECT)
	widget:SetPoint(alignment, frameForAlignment, frameAlignment, xOffset, yOffset)
	widget:SetText(text)
	
	UI:ApplyTextWidgetFont(widget, color, fontSize, opacityHex)
	
	return widget
end

-- Creates a button widget from the provided parameters.
function UI:CreateButton(parent, text, width, height, alignment, frameAlignment, xOffset, yOffset, listener, fontSize, frameForAlignment)
	if not frameForAlignment then
		frameForAlignment = parent
	end
	
	local widget = CreateFrame("Button", nil, parent, "GameMenuButtonTemplate")
	widget:SetSize(width, height)
	widget:SetPoint(alignment, frameForAlignment, frameAlignment, xOffset, yOffset)
	widget:SetText(text)
	widget:SetNormalFontObject(UIConfig.GLOBAL_FONT_OBJECT)
	widget:SetHighlightFontObject(UIConfig.GLOBAL_HIGHLIGHTED_FONT_OBJECT)
	
	widget:SetScript("OnClick", listener)
	
	UI:ApplyButtonWidgetFontSize(widget, fontSize)
	
	return widget
end

-- Creates a checkbox widget from the provided parameters.
function UI:CreateCheckbox(parent, checked, alignment, frameAlignment, xOffset, yOffset, listener, frameForAlignment)
	if not frameForAlignment then
		frameForAlignment = parent
	end
	
	local widget = CreateFrame("CheckButton", nil, parent, "UICheckButtonTemplate")
	widget:SetPoint(alignment, frameForAlignment, frameAlignment, xOffset, yOffset)
	widget:SetChecked(checked)
	
	widget:SetScript("OnClick", function()
		local checked = widget:GetChecked()
		widget:SetChecked(checked)
		listener(checked)
	end)
	
	return widget
end

-- Creates a combo box widget from the provided parameters.
function UI:CreateComboBox(parent, options, selectedIndex, adlignment, frameAlignment, xOffset, yOffset, listener, frameForAlignment)
	if not frameForAlignment then
		frameForAlignment = parent
	end
	
	local widget = CreateFrame("Frame", nil, parent, "UIDropDownMenuTemplate")
	widget:SetPoint(alignment, frameForAlignment, frameAlignment, xOffset, yOffset)
	
	for index, option in ipairs(options) do
		local optionInfo = UIDropDownMenu_CreateInfo()
		
		optionInfo.value = index
		optionInfo.text = option
		optionInfo.func = function()
			UIDropDownMenu_SetSelectedValue(widget, value)
			listener(value)
		end
		
		UIDropDownMenu_AddButton(optionInfo)
	end
	
	UIDropDownMenu_SetSelectedValue(widget, selectedIndex)
	
	return widget
end

-- Adds a tooltip to the provided widget, using the provided function to generate the tooltip whenever it's shown.
function UI:ApplyTooltipToWidget(widget, alignment, tooltipFunction)
	widget:EnableMouse(true)
	widget:SetScript("OnEnter", function(self)
		local text, color = tooltipFunction()
		if not color then
			color = UIConfig.GLOBAL_TOOLTIP_COLOR
		end
		
		local r, g, b = Utils:GetColorsFromHex(color)
		
		GameTooltip:SetOwner(self, alignment)
		GameTooltip:AddLine(text, r, g, b)
		GameTooltip:Show()
	end)
	widget:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)
end

-- Adds a multi-line tooltip to the provided widget, using the provided function to generate a list of lines (with colors) for the tooltip whenever it's shown.
function UI:ApplyMultiLineTooltipToWidget(widget, alignment, tooltipFunction)
	widget:EnableMouse(true)
	widget:SetScript("OnEnter", function(self)
		local lines = tooltipFunction()
		
		GameTooltip:SetOwner(self, alignment)
		for _, line in ipairs(lines) do
			local text = line.Text
			local color = line.Color
			if not color then
				color = UIConfig.GLOBAL_TOOLTIP_COLOR
			end
			
			local r, g, b = Utils:GetColorsFromHex(color)
			GameTooltip:AddLine(text, r, g, b)
		end
		GameTooltip:Show()
	end)
	widget:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)
end

-------------------------------
-- Table Parameter Functions --
-------------------------------

-- Applies the provided default parameters to the provided table parameters.
function UI:SetDefaultTableParams(tableParameters, alignment, fontSize)
	local defaultParams = {}
	
	defaultParams.Alignment = widgetAlignment
	defaultParams.FontSize = fontSize
	
	tableParameters.Default = defaultParams
end

-- Applies the provided row parameters at the provided index to the provided table parameters.
function UI:SetTableRowParameters(tableParameters, yIndex, y, widgetAlignment, fontSize)
	local rowParameters = {}
	
	rowParameters.Index = yIndex
	rowParameters.Position = y
	rowParameters.Alignment = widgetAlignment
	rowParameters.FontSize = fontSize
	
	tableParameters.Rows[yIndex] = rowParameters
end

-- Applies the provided column parameters at the provided index to the provided table parameters.
function UI:SetTableColumnParameters(tableParameters, xIndex, x, widgetAlignment, fontSize)
	local columnParameters = {}
	
	columnParameters.Index = xIndex
	columnParameters.Position = x
	columnParameters.Alignment = widgetAlignment
	columnParameters.FontSize = fontSize
	
	tableParameters.Columns[xIndex] = columnParameters
end

-- Creates a set of parameters for use for aligning widgets into a table-like orientation.
function UI:CreateTableParameters(tableAlignment)
	local params = {}
	
	params.TableAlignment = tableAlignment
	
	UI:SetDefaultTableParams(params, "CENTER", 10)
	params.Rows = {}
	params.Columns = {}
	
	return params
end

-- Gets the relevant parameters to use from the provided table parameters, for the specified row and column indexes.
function UI:GetTableWidgetParameters(tableParameters, xIndex, yIndex)
	local defaultParameters = tableParameters.Default
	local rowParameters = tableParameters.Rows[yIndex]
	local columnParameters = tableParameters.Columns[xIndex]
	
	local x = columnParameters.Position
	if x == nil then
		Log:Error("Missing expected table column position for x=" .. tostring(xIndex) .. ", y=" .. tostring(yIndex))
	end
	
	local y = rowParameters.Position
	if y == nil then
		Log:Error("Missing expected table row position for x=" .. tostring(xIndex) .. ", y=" .. tostring(yIndex))
	end
	
	local alignment = defaultParameters.Alignment
	if columnParameters.Alignment then
		alignment = columnParameters.Alignment
	elseif rowParameters.Alignment then
		alignment = rowParameters.Alignment
	end
	if alignment == nil then
		Log:Error("Missing expected table alignment for x=" .. tostring(xIndex) .. ", y=" .. tostring(yIndex))
	end
	
	local fontSize = defaultParameters.FontSize
	if columnParameters.FontSize then
		fontSize = columnParameters.FontSize
	elseif rowParameters.FontSize then
		fontSize = rowParameters.FontSize
	end
	if fontSize == nil then
		Log:Error("Missing expected table font size for x=" .. tostring(xIndex) .. ", y=" .. tostring(yIndex))
	end
	
	return x, y, tableParameters.TableAlignment, alignment, fontSize
end

-------------------------------------
-- Table Widget Creation Functions --
-------------------------------------

-- Creates a texture widget and child texture itself from the provided parameters, aligned in a table through the provided table parameters.
function UI:CreateTableTexture(tableParameters, parent, texture, width, height, xIndex, yIndex, xOffset, yOffset)
	if not xOffset then
		xOffset = 0
	end
	if not yOffset then
		yOffset = 0
	end
	
	local x, y, tableAlignment, widgetAlignment, fontSize = UI:GetTableWidgetParameters(tableParameters, xIndex, yIndex)
	return UI:CreateTexture(parent, texture, width, height, widgetAlignment, tableAlignment, x + xOffset, y + yOffset)
end

-- Creates a text widget from the provided parameters, aligned in a table through the provided table parameters.
function UI:CreateTableText(tableParameters, parent, text, color, xIndex, yIndex, xOffset, yOffset)
	if not xOffset then
		xOffset = 0
	end
	if not yOffset then
		yOffset = 0
	end
	
	local x, y, tableAlignment, widgetAlignment, fontSize = UI:GetTableWidgetParameters(tableParameters, xIndex, yIndex)
	return UI:CreateText(parent, text, widgetAlignment, tableAlignment, x + xOffset, y + yOffset, color, fontSize)
end

-- Creates a button widget from the provided parameters, aligned in a table through the provided table parameters.
function UI:CreateTableButton(tableParameters, parent, text, width, height, clickFunction, xIndex, yIndex, xOffset, yOffset)
	if not xOffset then
		xOffset = 0
	end
	if not yOffset then
		yOffset = 0
	end
	
	local x, y, tableAlignment, widgetAlignment, fontSize = UI:GetTableWidgetParameters(tableParameters, xIndex, yIndex)
	return UI:CreateButton(parent, text, width, height, widgetAlignment, tableAlignment, x + xOffset, y + yOffset, clickFunction, fontSize)
end

function UI:CreateTableCheckbox(tableParameters, parent, checked, listener, xIndex, yIndex, xOffset, yOffset)
	if not xOffset then
		xOffset = 0
	end
	if not yOffset then
		yOffset = 0
	end
	
	local x, y, tableAlignment, widgetAlignment, fontSize = UI:GetTableWidgetParameters(tableParameters, xIndex, yIndex)
	return UI:CreateCheckbox(parent, checked, widgetAlignment, tableAlignment, x + xOffset, y + yOffset, listener)
end

--------------------------------------
-- Special Frame Creation Functions --
--------------------------------------

-- Creates a frame for use as the expanded view for a page.
function UI:CreateExpandedView(parent)
	local widget = CreateFrame("Frame", nil, parent)
	widget:SetSize(UIConfig.MAIN_FRAME_CONTENT_WIDTH, UIConfig.MAIN_FRAME_CONTENT_EXPANDED_HEIGHT)
	widget:SetPoint("TOP", parent, "TOP", 0, 0)
	
	-- By default on construct, assume this is shown
	widget:Show()
	
	return widget
end

-- Creates a frame for use as the condensed view for a page.
function UI:CreateCondensedView(parent)
	local widget = CreateFrame("Frame", nil, parent)
	widget:SetSize(UIConfig.MAIN_FRAME_CONTENT_WIDTH, UIConfig.MAIN_FRAME_CONTENT_CONDENSED_HEIGHT)
	widget:SetPoint("TOP", parent, "TOP", 0, 0)
	
	-- By default on construct, assume this is shown
	widget:Hide()
	
	return widget
end

-- Creates a frame for use as a page.
function UI:CreatePage(parent)
	local widget = CreateFrame("Frame", nil, parent)
	widget:SetSize(UIConfig.MAIN_FRAME_CONTENT_WIDTH, UIConfig.MAIN_FRAME_CONTENT_EXPANDED_HEIGHT)
	widget:SetPoint("TOP", parent, "TOP", 0, -UIConfig.MAIN_FRAME_CONTENT_INSET_TOP - UIConfig.MAIN_FRAME_SELECTION_BUTTON_HEIGHT - UIConfig.MAIN_FRAME_SELECTION_BAR_BUFFER)
	
	return widget
end

----------------------------------
-- Widget Destruction Functions --
----------------------------------

-- "Destroys" the provided widget, by hiding it and prepping it for garbage collection as aggressively as possible.
function UI:DestroyWidget(widget)
	widget:Hide()
	widget:SetParent(nil)
	
	if widget.GetScript then
		if widget:GetScript("OnShow") then
			widget:SetScript("OnClick", nil)
		end
		if widget:GetScript("OnUpdate") then
			widget:SetScript("OnUpdate", nil)
		end
	end
	
	if widget:GetName() then
		_G[widget:GetName()] = nil
	end
end
