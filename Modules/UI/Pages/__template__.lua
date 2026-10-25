local _, Frogtome = ...
if not Frogtome.UI then
	Frogtome.UI = {}
end
if not Frogtome.UI.Pages then
	Frogtome.UI.Pages = {}
end
Frogtome.UI.Pages.__TEMPLATE__ = {}

local __TEMPLATE__Page = Frogtome.UI.Pages.__TEMPLATE__

----------------------------------
-- Display Update Functionality --
----------------------------------

----------------------------
-- Display Update Process --
----------------------------

function __TEMPLATE__Page:UpdateExpandedFrameView()
	-- TODO
end

function __TEMPLATE__Page:UpdateCondensedFrameView()
	-- TODO
end

function __TEMPLATE__Page:UpdateDisplay(force)
	if not force and not __TEMPLATE__Page.Page:IsVisible() then
		return
	end
	
	if force or __TEMPLATE__Page.Page.ExpandedFrameView:IsVisible() then
		__TEMPLATE__Page:UpdateExpandedFrameView()
	if force or __TEMPLATE__Page.Page.CondensedFrameView:IsVisible() then
		__TEMPLATE__Page:UpdateCondensedFrameView()
	end
end

------------------------
-- Listener Functions --
------------------------

function __TEMPLATE__Page:OnExpandedFrameViewShown()
	-- TODO
end

function __TEMPLATE__Page:OnCondensedFrameViewShown()
	-- TODO
end

function __TEMPLATE__Page:OnPageShown()
	-- TODO
end

function __TEMPLATE__Page:OnPageHidden()
	-- TODO
end

-----------------------
-- Page Construction --
-----------------------

function __TEMPLATE__Page:BuildExpandedFrameView(page)
	local view = UI:CreateExpandedView(page)
	
	-- Content
	
	local widget
	-- TODO
	
	return view
end

function __TEMPLATE__Page:BuildCondensedFrameView(page)
	local view = UI:CreateCondensedView(page)
	
	-- Content
	
	local widget
	-- TODO
	
	return view
end

function __TEMPLATE__Page:Build(parent)
	Log:Debug("Creating __TEMPLATE__ page...")
	
	local page = UI:CreatePage(parent, "Session")
	__TEMPLATE__Page.Page = page
	
	local expandedView = __TEMPLATE__Page:BuildExpandedFrameView(page)
	page.ExpandedFrameView = expandedView
	
	local condensedView = __TEMPLATE__Page:BuildCondensedFrameView(page)
	page.CondensedFrameView = condensedView
	
	-- Event Listeners
	
	-- TODO
	
	return page
end
