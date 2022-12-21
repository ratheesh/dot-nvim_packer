-- Copyright (c) 2022 Ratheesh <ratheeshreddy@gmail.com>
-- License: MIT
-- Color Configuration

-- _G.colors = {
-- 	red  = "#BF616A" , teal  = "#97B7D7"  , one_bg = "#373D49"   , lightbg  = "#3B4252"  , blue       = "#81A1C1"   ,
-- 	cyan = "#5E81AC" , black  = "#1E2430" , orange  = "#D08770"  , one_bg2  = "#434C5E"  , foreground = "#EEEEEE"   ,
-- 	grey = "#4B515D" , green  = "#A3BE8C" , purple  = "#8FBCBB"  , one_bg3  = "#4C566A"  , light_grey = "#646A76"   ,
-- 	line = "#3A404C" , white  = "#D8DEE9" , yellow  = "#EBCB8B"  , lightbg2 = "#393F4B"  , dark_purple = "#B48EAD"  ,
-- 	pink = "#D57780" , black2 = "#343A46" , grey_fg  = "#606672" , baby_pink = "#DE878F" , darker_black = "#2A303C" ,
-- }

-- vim.g.terminal_color_0  = "#1E2430"
-- vim.g.terminal_color_1  = "#BF616A"
-- vim.g.terminal_color_2  = "#A3BE8C"
-- vim.g.terminal_color_3  = "#EBCB8B"
-- vim.g.terminal_color_4  = "#81A1C1"
-- vim.g.terminal_color_5  = "#B48EAD"
-- vim.g.terminal_color_6  = "#5E81AC"
-- vim.g.terminal_color_7  = "#EEEEEE"
-- vim.g.terminal_color_8  = "#4C566A"
-- vim.g.terminal_color_9  = "#BF616A"
-- vim.g.terminal_color_10 = "#A3BE8C"
-- vim.g.terminal_color_11 = "#EBCB8B"
-- vim.g.terminal_color_12 = "#81A1C1"
-- vim.g.terminal_color_13 = "#B48EAD"
-- vim.g.terminal_color_14 = "#5E81AC"
-- vim.g.terminal_color_15 = "#8FBCBB"

local hl = vim.api.nvim_set_hl

hl(0 , "Normal"       , { fg = "#EEEEEE" , bg = "#1E2430" , italic = false , bold = false , underline = false })
hl(0 , "NormalFloat"  , { fg = "#EEEEEE" , bg = "#1E2430" , italic = false , bold = false , underline = false })
hl(0 , "FloatBorder"  , { fg = "#4C566A" , bg = nil       , italic = false , bold = true  , underline = false })
hl(0 , "FloatTitle"   , { fg = "#81A1C1" , bg = nil       , italic = false , bold = false , underline = false })
hl(0 , "Bold"         , { fg = nil       , bg = nil       , italic = false , bold = true  , underline = false })
hl(0 , "Debug"        , { fg = "#D57780" , bg = nil       , italic = false , bold = false , underline = false })
hl(0 , "Directory"    , { fg = "#81A1C1" , bg = nil       , italic = false , bold = false , underline = false })
hl(0 , "Error"        , { fg = "#1E2430" , bg = "#D57780" , italic = false , bold = false , underline = false })
hl(0 , "ErrorMsg"     , { fg = "#D57780" , bg = "#1E2430" , italic = false , bold = false , underline = false })
hl(0 , "Exception"    , { fg = "#D57780" , bg = nil       , italic = false , bold = false , underline = false })
hl(0 , "FoldColumn"   , { fg = "#97B7D7" , bg = "#3B4252" , italic = false , bold = false , underline = false })
hl(0 , "Folded"       , { fg = "#4C566A" , bg = "#3B4252" , italic = false , bold = false , underline = false })
hl(0 , "IncSearch"    , { fg = nil       , bg = "#485568" , italic = false , bold = false , underline = false })
hl(0 , "Search"       , { fg = nil       , bg = "#485568" , italic = false , bold = false , underline = false })
hl(0 , "Macro"        , { fg = "#D57780" , bg = nil       , italic = false , bold = false , underline = false })
hl(0 , "MatchParen"   , { fg = nil       , bg = "#2a454e" , italic = false , bold = false , underline = false })
hl(0 , "ModeMsg"      , { fg = "#A3BE8C" , bg = nil       , italic = false , bold = false , underline = false })
hl(0 , "MoreMsg"      , { fg = "#A3BE8C" , bg = nil       , italic = false , bold = false , underline = false })
hl(0 , "Question"     , { fg = "#81A1C1" , bg = nil       , italic = false , bold = false , underline = false })
hl(0 , "Substitute"   , { fg = "#3B4252" , bg = "#EBCB8B" , italic = false , bold = false , underline = false })
hl(0 , "SpecialKey"   , { fg = "#4C566A" , bg = nil       , italic = false , bold = false , underline = false })
hl(0 , "TooLong"      , { fg = "#D57780" , bg = nil       , italic = false , bold = false , underline = false })
hl(0 , "Underlined"   , { fg = "#D57780" , bg = nil       , italic = false , bold = false , underline = false })
hl(0 , "Visual"       , { fg = nil       , bg = "#38485E" , italic = false , bold = false , underline = false })
hl(0 , "VisualNOS"    , { fg = "#D57780" , bg = nil       , italic = false , bold = false , underline = false })
hl(0 , "WarningMsg"   , { fg = "#D57780" , bg = nil       , italic = false , bold = false , underline = false })
hl(0 , "WildMenu"     , { fg = "#D57780" , bg = "#EBCB8B" , italic = false , bold = false , underline = false })
hl(0 , "Title"        , { fg = "#81A1C1" , bg = nil       , italic = false , bold = false , underline = false })
hl(0 , "Conceal"      , { fg = "#81A1C1" , bg = "#1E2430" , italic = false , bold = false , underline = false })
hl(0 , "Cursor"       , { fg = "#1E2430" , bg = "#F0F0F0" , italic = false , bold = false , underline = false })
hl(0 , "NonText"      , { fg = "#4C566A" , bg = nil       , italic = false , bold = false , underline = false })
hl(0 , "LineNr"       , { fg = "#a0a0a0" , bg = "#2a4a56" , italic = false , bold = false , underline = false })
hl(0 , "StatusLineNC" , { fg = "#4C566A" , bg = nil       , italic = false , bold = false , underline = false })
hl(0 , "SignColumn"   , { fg = "#4C566A" , bg = nil       , italic = false , bold = false , underline = false })
hl(0 , "StatusLine"   , { fg = "#434C5E" , bg = nil       , italic = false , bold = false , underline = false })
hl(0 , "VertSplit"    , { fg = "#434C5E" , bg = nil       , italic = false , bold = false , underline = false })
hl(0 , "ColorColumn"  , { fg = nil       , bg = nil 			, italic = false , bold = false , underline = false })
hl(0 , "CursorColumn" , { fg = nil       , bg = "#2C373D" , italic = false , bold = false , underline = false })
hl(0 , "CursorLine"   , { fg = nil       , bg = "#153450" , italic = false , bold = false , underline = false })
hl(0 , "CursorLineNr" , { fg = "#f0f0f0" , bg = "#b16286" , italic = false , bold = false , underline = false })
hl(0 , "QuickFixLine" , { fg = nil       , bg = "#3B4252" , italic = false , bold = false , underline = false })
hl(0 , "Pmenu"        , { fg = "#373D49" , bg = "#1E2430" , italic = false , bold = false , underline = false })
hl(0 , "PmenuSbar"    , { fg = "#b16286" , bg = nil       , italic = false , bold = false , underline = false })
hl(0 , "PmenuSel"     , { fg = nil 			 , bg = "#25384F" , italic = false , bold = false , underline = false })
hl(0 , "PmenuThumb"   , { fg = "#a0a0a0" , bg = "#4B515C" , italic = false , bold = false , underline = false })
hl(0 , "TabLine"      , { fg = "#4C566A" , bg = "#3B4252" , italic = false , bold = false , underline = false })
hl(0 , "TabLineFill"  , { fg = "#4C566A" , bg = "#3B4252" , italic = false , bold = false , underline = false })
hl(0 , "TabLineSel"   , { fg = "#A3BE8C" , bg = "#e53a80" , italic = false , bold = true , underline = false  })

-- Standard syntax highlighting
hl(0 , "Boolean"      , { fg = "#D08770" , bg = nil       , italic = false , bold = false , underline = false })
hl(0 , "Character"    , { fg = "#D57780" , bg = nil       , italic = false , bold = false , underline = false })
hl(0 , "Comment"      , { fg = "#909090" , bg = nil       , italic = true  , bold = false , underline = false })
hl(0 , "Conditional"  , { fg = "#A3BE8C" , bg = nil       , italic = false , bold = false , underline = false })
hl(0 , "Constant"     , { fg = "#5E81AC" , bg = nil       , italic = false , bold = false , underline = false })
hl(0 , "Define"       , { fg = "#B48EAD" , bg = nil       , italic = false , bold = false , underline = false })
hl(0 , "Delimiter"    , { fg = "#B48EAD" , bg = nil       , italic = false , bold = false , underline = false })
hl(0 , "Float"        , { fg = "#D08770" , bg = nil       , italic = false , bold = false , underline = false })
hl(0 , "Function"     , { fg = "#EBCB8B" , bg = nil       , italic = false , bold = false , underline = false })
hl(0 , "Identifier"   , { fg = "#97B7D7" , bg = nil       , italic = false , bold = false , underline = false })
hl(0 , "Include"      , { fg = "#81A1C1" , bg = nil       , italic = false , bold = false , underline = false })
hl(0 , "Keyword"      , { fg = "#A3BE8C" , bg = nil       , italic = false , bold = false , underline = false })
hl(0 , "Label"        , { fg = "#EBCB8B" , bg = nil       , italic = false , bold = false , underline = false })
hl(0 , "Number"       , { fg = "#D08770" , bg = nil       , italic = false , bold = false , underline = false })
hl(0 , "Operator"     , { fg = "#D8DEE9" , bg = nil       , italic = false , bold = false , underline = false })
hl(0 , "PreProc"      , { fg = "#EBCB8B" , bg = nil       , italic = false , bold = false , underline = false })
hl(0 , "Repeat"       , { fg = "#5E81AC" , bg = nil       , italic = false , bold = false , underline = false })
hl(0 , "Special"      , { fg = "#D08770" , bg = nil       , italic = false , bold = false , underline = false })
hl(0 , "SpecialChar"  , { fg = "#B48EAD" , bg = nil       , italic = false , bold = false , underline = false })
hl(0 , "Statement"    , { fg = "#A3BE8C" , bg = nil       , italic = false , bold = false , underline = false })
hl(0 , "StorageClass" , { fg = "#EBCB8B" , bg = nil       , italic = false , bold = false , underline = false })
hl(0 , "String"       , { fg = "#7a8a80" , bg = nil       , italic = false , bold = false , underline = false })
hl(0 , "Structure"    , { fg = "#B48EAD" , bg = nil       , italic = false , bold = false , underline = false })
hl(0 , "Tag"          , { fg = "#EBCB8B" , bg = nil       , italic = false , bold = false , underline = false })
hl(0 , "Todo"         , { fg = "#EBCB8B" , bg = "#3B4252" , italic = false , bold = false , underline = false })
hl(0 , "Type"         , { fg = "#EBCB8B" , bg = nil       , italic = false , bold = false , underline = false })
hl(0 , "Typedef"      , { fg = "#EBCB8B" , bg = nil       , italic = false , bold = false , underline = false })

-- Diff highlighting
hl(0 , "DiffChange"  , { fg = "#4C566A" , bg = "#3B4252" , italic = false , bold = false , underline = false })
hl(0 , "DiffAdd"     , { fg = "#A3BE8C" , bg = "#3B4252" , italic = false , bold = false , underline = false })
hl(0 , "DiffDelete"  , { fg = "#D57780" , bg = "#3B4252" , italic = false , bold = false , underline = false })
hl(0 , "DiffText"    , { fg = "#81A1C1" , bg = "#3B4252" , italic = false , bold = false , underline = false })
hl(0 , "DiffAdded"   , { fg = "#A3BE8C" , bg = "#1E2430" , italic = false , bold = false , underline = false })
hl(0 , "DiffFile"    , { fg = "#D57780" , bg = "#1E2430" , italic = false , bold = false , underline = false })
hl(0 , "DiffNewFile" , { fg = "#A3BE8C" , bg = "#1E2430" , italic = false , bold = false , underline = false })
hl(0 , "DiffLine"    , { fg = "#81A1C1" , bg = "#1E2430" , italic = false , bold = false , underline = false })
hl(0 , "DiffRemoved" , { fg = "#D57780" , bg = "#1E2430" , italic = false , bold = false , underline = false })

-- Git highlighting
hl(0 , "gitcommitOverflow"      , { fg = "#D57780" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "gitcommitSummary"       , { fg = "#A3BE8C" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "gitcommitComment"       , { fg = "#4C566A" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "gitcommitUntracked"     , { fg = "#4C566A" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "gitcommitDiscarded"     , { fg = "#4C566A" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "gitcommitSelected"      , { fg = "#4C566A" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "gitcommitHeader"        , { fg = "#B48EAD" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "gitcommitSelectedType"  , { fg = "#81A1C1" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "gitcommitUnmergedType"  , { fg = "#81A1C1" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "gitcommitDiscardedType" , { fg = "#81A1C1" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "gitcommitBranch"        , { fg = "#D08770" , bg = nil , italic = true  , bold = false , underline = false })
hl(0 , "gitcommitOnBranch"      , { fg = "#909090" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "gitcommitUntrackedFile" , { fg = "#EBCB8B" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "gitcommitUnmergedFile"  , { fg = "#D57780" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "gitcommitDiscardedFile" , { fg = "#D57780" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "gitcommitSelectedFile"  , { fg = "#A3BE8C" , bg = nil , italic = false , bold = false , underline = false })

hl(0 , "EndOfBuffer"				 		, { fg = "#1E2430" , bg = nil       , italic = false , bold = false , underline = false })
hl(0 , "NvimInternalError"	 		, { fg = "#BF616A" , bg = nil       , italic = false , bold = false , underline = false })

-- Gitsigns
-- sign column
hl(0 , "GitSignsAdd"                , { fg = "#81A1C1" , bg = nil       , italic = false , bold = false , underline = false })
hl(0 , "GitSignsChange"             , { fg = "#606672" , bg = nil       , italic = false , bold = false , underline = false })
hl(0 , "GitSignsModified"           , { fg = "#C586C0" , bg = nil       , italic = false , bold = false , underline = false })

hl(0 , "GitSignsAddNr"              , { fg = "#a0a0a0" , bg = "#2a4a56" , italic = false , bold = false , underline = false })
hl(0 , "GitSignsChangeNr"           , { fg = "#a0a0a0" , bg = "#2a4a56" , italic = false , bold = false , underline = false })
hl(0 , "GitSignsModifiedNr"         , { fg = "#a0a0a0" , bg = "#2a4a56" , italic = false , bold = false , underline = false })

-- preview hunk
hl(0 , "GitSignsAddPreview"         , { fg = "#A3BE8C" , bg = "#2a384e" , italic = false , bold = false , underline = false })
hl(0 , "GitSignsChangePreview"      , { fg = "#A3BE8C" , bg = "#2a384e" , italic = false , bold = false , underline = false })
hl(0 , "GitSignsDeletePreview"      , { fg = "#D57780" , bg = "#2a384e" , italic = false , bold = false , underline = false })

hl(0 , "GitSignsAddLn"        			, { fg = "#A3BE8C" , bg = "#2a384e" , italic = false , bold = false , underline = false })
hl(0 , "GitSignsChangeLn"     			, { fg = "#A3BE8C" , bg = "#2a384e" , italic = false , bold = false , underline = false })
hl(0 , "GitSignsDeleteLn"     			, { fg = "#D57780" , bg = "#2a384e" , italic = false , bold = false , underline = false })
-- buffer
hl(0 , "GitSignsAddLine"        		, { fg = "#A3BE8C" , bg = "#606672" , italic = false , bold = false , underline = false })
hl(0 , "GitSignsChangeLine"     		, { fg = "#A3BE8C" , bg = "#606672" , italic = false , bold = false , underline = false })
hl(0 , "GitSignsDeleteLine"     		, { fg = "#D57780" , bg = "#606672" , italic = false , bold = false , underline = false })

hl(0 , "GitSignsAddInline"          , { fg = "#A3BE8C" , bg = "#606672" , italic = false , bold = false , underline = false })
hl(0 , "GitSignsChangeInline"       , { fg = "#A3BE8C" , bg = "#606672" , italic = false , bold = false , underline = false })
hl(0 , "GitSignsDeleteInline"       , { fg = "#D57780" , bg = "#606672" , italic = false , bold = false , underline = false })

hl(0 , "GitSignsAddLnInline"        , { fg = "#81a1c1" , bg = "#606672" , italic = false , bold = false , underline = true })
hl(0 , "GitSignsChangeLnInline"     , { fg = "#81a1c1" , bg = "#606672" , italic = false , bold = false , underline = true })
hl(0 , "GitSignsDeleteLnInline"     , { fg = "#D57780" , bg = "#606672" , italic = false , bold = false , underline = true })

-- hl(0 , "GitSignsStagedAdd"        , { fg = "#A3BE8C" , bg = nil , italic = false , bold = false , underline = false })
-- hl(0 , "GitSignsStagedChange"     , { fg = "#606672" , bg = nil , italic = false , bold = false , underline = false })
-- hl(0 , "GitSignsStagedDelete"     , { fg = "#D57780" , bg = nil , italic = false , bold = false , underline = false })
--
hl(0 , "GitSignsStagedAddNr"      , { fg = "#000000" , bg = "#CBAA91" , italic = false , bold = false , underline = false })
hl(0 , "GitSignsStagedChangeNr"   , { fg = "#F0F0F0" , bg = "#4C5D79" , italic = false , bold = false , underline = false })
hl(0 , "GitSignsStagedDeleteNr"   , { fg = "#000000" , bg = "#D57780" , italic = false , bold = false , underline = false })

-- nvim-cmp
hl(0 , "CmpDocNormal"           	, { fg = "#b0b0b0" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "CmpItemAbbr"           		, { fg = "#909090" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "CmpItemAbbrMatchFuzzy" 		, { fg = "#F06372" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "CmpItemAbbrMatch"      		, { fg = "#6888b4" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "CmpItemMatch"          		, { fg = "#eeeeee" , bg = nil , italic = false , bold = false , underline = true  })
hl(0 , "CmpItemAbbrDeprecated" 		, { fg = "#eeeeee" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "CmpItemKind"           		, { fg = "#F7B0BA" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "CmpItemMenu"           		, { fg = "#6E7179" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "CmpItemKindVariable"   		, { fg = "#C76D83" , bg = nil , italic = false , bold = true  , underline = false })
hl(0 , "CmpItemKindInterface"  		, { fg = "#00A7CF" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "CmpItemKindText"       		, { fg = "#C586C0" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "CmpItemKindFunction"   		, { fg = "#00A7CF" , bg = nil , italic = false , bold = true  , underline = false })
hl(0 , "CmpItemKindMethod"     		, { fg = "#C586C0" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "CmpItemKindKeyword"    		, { fg = "#fbb4ae" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "CmpItemKindSnippet"    		, { fg = "#9467bd" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "CmpItemKindConstructor"   , { fg = "#A3BE8C" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "CmpItemKindField"         , { fg = "#9467bd" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "CmpItemKindClass"         , { fg = "#9c755f" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "CmpItemKindModule"        , { fg = "#3DB4AE" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "CmpItemKindProperty"      , { fg = "#F06372" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "CmpItemKindUnit"          , { fg = "#9c755f" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "CmpItemKindValue"         , { fg = "#EBCB8B" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "CmpItemKindEnum"          , { fg = "#9467bd" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "CmpItemKindColor"         , { fg = "#97B7D7" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "CmpItemKindFile"          , { fg = "#E0AF8F" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "CmpItemKindReference"     , { fg = "#97B7D7" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "CmpItemKindFolder"        , { fg = "#E0AF8F" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "CmpItemKindEnumMember"    , { fg = "#3D7BBF" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "CmpItemKindConstant"      , { fg = "#6B717C" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "CmpItemKindStruct"        , { fg = "#af7aa1" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "CmpItemKindEvent"         , { fg = "#3D7BBF" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "CmpItemKindOperator"      , { fg = "#ef8d97" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "CmpItemKindTypeParameter" , { fg = "#97B7D7" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "CmpGhostText"          		, { fg = "#707080" , bg = nil , italic = true  , bold = false , underline = false })

hl(0 , "IndentBlanklineChar" , { fg = "#3A404C" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "DiagnosticError"     , { fg = "#BF616A" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "DiagnosticWarn"      , { fg = "#EBCB8B" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "DiagnosticInfo"      , { fg = "#A3BE8C" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "DiagnosticHint"      , { fg = "#8FBCBB" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "NotifyINFOBorder"    , { fg = "#A3BE8C" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "NotifyINFOTitle"     , { fg = "#A3BE8C" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "NotifyINFOIcon"      , { fg = "#A3BE8C" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "NotifyWARNBorder"    , { fg = "#EBCB8B" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "NotifyWARNTitle"     , { fg = "#EBCB8B" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "NotifyWARNIcon"      , { fg = "#EBCB8B" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "NotifyERRORBorder"   , { fg = "#BF616A" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "NotifyERRORTitle"    , { fg = "#BF616A" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "NotifyERRORIcon"     , { fg = "#BF616A" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "WhichKeyValue"       , { fg = "#8FBCBB" , bg = nil , italic = false , bold = false , underline = false })

-- special attribute which require sp and undercurl attributes only
hl(0 , "DiagnosticUnderlineError" , { fg = nil, bg = nil , italic = false , bold = false , underline = false, undercurl = true, sp ='#F06372' })
hl(0 , "DiagnosticUnderlineWarn"  , { fg = nil, bg = nil , italic = false , bold = false , underline = false, undercurl = true, sp ='#E0AF8F' })
hl(0 , "DiagnosticUnderlineInfo"  , { fg = nil, bg = nil , italic = false , bold = false , underline = false, undercurl = true, sp ='#6B717C' })
hl(0 , "DiagnosticUnderlineHint"  , { fg = nil, bg = nil , italic = false , bold = false , underline = false, undercurl = true, sp ='#9467bd' })

hl(0 , "LspReferenceRead"  , { fg = nil , bg = "#3B4252" , italic = false , bold = false , underline = false })
hl(0 , "LspReferenceWrite" , { fg = nil , bg = "#3B4252" , italic = false , bold = false , underline = false })

-- Treesitter highlighting
hl(0 , "@property"            , { fg = "#e1e1e1" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "@string"              , { fg = "#7d8590" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "@preproc"             , { fg = "#7d8590" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "@string.escape"       , { fg = "#a0a0a0" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "@number"              , { fg = "#1DAA89" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "@keyword"             , { fg = "#6272a4" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "@keyword.operator"    , { fg = "#6272a4" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "@function.call"       , { fg = "#c0c0c0" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "@function"            , { fg = "#c0c0c0" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "@type"                , { fg = "#277A9A" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "@function.builtin"    , { fg = "#bab0ab" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "@method"              , { fg = "#8da0cb" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "@boolean"             , { fg = "#a0a0a0" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "@float"               , { fg = "#a0a0a0" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "@field"               , { fg = "#a0a0a0" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "@parameter"           , { fg = "#B6819E" , bg = nil , italic = true  , bold = false , underline = false })
hl(0 , "@conditional"         , { fg = "#B6819E" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "@repeat"              , { fg = "#B6819E" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "@constant.builtin"    , { fg = "#a0a0a0" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "@constant.macro"      , { fg = "#a0a0a0" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "@variable"            , { fg = "#BFC1C7" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "@include"             , { fg = "#BC70A4" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "@define"              , { fg = "#4b8a8d" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "@operator"            , { fg = "#C5B4C0" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "@punctuation"         , { fg = "#C5B4C0" , bg = nil , italic = false , bold = true  , underline = false })
hl(0 , "@constructor"         , { fg = "#a0a0a0" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "@punctuation.bracket" , { fg = nil 		   , bg = nil , italic = false , bold = true  , underline = false })
-- hl(0 , "@constant"            , { fg = "#709081" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "@type.definition"     , { fg = "#a0a0a0" , bg = nil , italic = false , bold = false , underline = false })

hl(0 , "cIncluded"            , { fg = "#7d8590" , bg = nil , italic = true , bold = false , underline = false })
hl(0 , "cCppOutIf2"       		, { fg = "#3d4570" , bg = nil , italic = false, bold = false , underline = false })
hl(0 , "pythonTSComment"      , { fg = "#909090" , bg = nil , italic = true , bold = false , underline = false })

-- jinja2
hl(0 , "jinjaVarDelim"      , { fg = "#EB6D7F" , bg = nil , italic = false , bold = true  , underline = false })
hl(0 , "jinjaVariable"      , { fg = "#5F9EA0" , bg = nil , italic = true  , bold = false , underline = false })
hl(0 , "jinjaTagDelim"      , { fg = "#EB6D7F" , bg = nil , italic = false , bold = true  , underline = false })
hl(0 , "jinjaStatement"     , { fg = "#bd93f9" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "jinjaBlockName"     , { fg = "#5F9EA0" , bg = nil , italic = true  , bold = true  , underline = false })

-- Fidget
hl(0 , "FidgetTask"         , { fg = "#B6919E" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "FidgetTitle"        , { fg = "#2AD198" , bg = nil , italic = false , bold = false , underline = false })

-- wilder.nvim
hl(0 , "WildMenu"           , { fg = "#000000" , bg = "#8F575A" , italic = true  , bold = false , underline = false })
hl(0 , "WildStatus"         , { fg = "#c0c0c0" , bg = "#1A3A59" , italic = false , bold = false , underline = false })
hl(0 , "WildSelected"       , { fg = "#d5b07B" , bg = "#3d506c" , italic = true  , bold = false , underline = false })
hl(0 , "WildSelectedAccent" , { fg = "#2AD198" , bg = "#3d506c" , italic = true  , bold = true  , underline = false })
hl(0 , "WildMode"           , { fg = "#f0f0f0" , bg = "#6B717C" , italic = true  , bold = false , underline = false })
hl(0 , "WildSeparator"      , { fg = "#bd93f9" , bg = "#1A3A59" , italic = false , bold = false , underline = false })
hl(0 , "WildAccent"         , { fg = "#ec7279" , bg = "#1A3A59" , italic = false , bold = false , underline = false })
hl(0 , "WildIndex"          , { fg = "#f0f0f0" , bg = "#4d708c" , italic = false , bold = false , underline = false })
hl(0 , "WildSepLeft"        , { fg = "#FCCC82" , bg = "#1A3A59" , italic = false , bold = false , underline = false })
hl(0 , "WildSepRight2"      , { fg = "#FCCC82" , bg = "#1A3A59" , italic = false , bold = false , underline = false })
hl(0 , "WildSepLeft"        , { fg = "#FCCC82" , bg = "#1A3A59" , italic = false , bold = false , underline = false })
hl(0 , "WildSepRight2"      , { fg = "#FCCC82" , bg = "#1A3A59" , italic = false , bold = false , underline = false })

hl(0, "MarkSignNumHL", { fg = "#c0c0c0", bg = "#4a6470", italic = false, bold = true, underline = false })

hl(0, "iCursor", { fg = "#ff5555", bg = "#ff5555", italic = false, bold = true, underline = false })
hl(0, "nCursor", { fg = "#f2f2f2", bg = "#f2f2f2", italic = false, bold = true, underline = false })
hl(0, "vCursor", { fg = "#1bb1e7", bg = "#1bb1e7", italic = false, bold = true, underline = false })
hl(0, "rCursor", { fg = "#d65b84", bg = "#d65b84", italic = false, bold = true, underline = false })
hl(0, "oCursor", { fg = "#00ff00", bg = "#00ff00", italic = false, bold = true, underline = false })

-- Noice
hl(0 , "NoiceCmdlineCmdline"    , { fg = "#FA2C77" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "NoiceCmdlinePopupBorder", { fg = "#858ba8" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "NoiceCmdlineIcon" 		  , { fg = "#1bb1e7" , bg = nil , italic = false , bold = true  , underline = false })
hl(0 , "NoicePopupMenuMatch" 		, { fg = "#1bb1e7" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "NoiceLspProgressTitle"  , { fg = "#858ba8" , bg = nil , italic = true  , bold = false , underline = false })
hl(0 , "NoiceLspProgressClient" , { fg = "#C76D83" , bg = nil , italic = false , bold = true  , underline = false })
hl(0 , "NoiceVirtualText"       , { fg = "#F7CAB8" , bg = nil , italic = true  , bold = false , underline = false })

-- LeaderF
hl(0 , "Lf_hl_popup_window"    , { fg = "#c0c0c0" , bg = "#1E2430" , italic = false , bold = false , underline = false })
hl(0 , "Lf_hl_popup_inputText" , { fg = "#c0c0c0" , bg = "#1E2430" , italic = false , bold = false , underline = false })
hl(0 , "Lf_hl_popupBorder"     , { fg = "#e79498" , bg = "#1E2430" , italic = false , bold = false , underline = false })
hl(0 , "Lf_hl_popup_prompt"    , { fg = "#FA2C77" , bg = "#1E2430" , italic = false , bold = true  , underline = false })
hl(0 , "Lf_hl_cursorline"      , { fg = "#858ba8" , bg = nil       , italic = false , bold = false , underline = false })
hl(0 , "Lf_hl_match"      		 , { fg = "#EB6D7F" , bg = nil       , italic = true  , bold = false , underline = false })

-- mini.nvim
hl(0, "MiniIndentscopeSymbol", { fg = "#3F4F5B", bg = nil, italic = false, bold = false, underline = false })
hl(0, "MiniSurround", 				 { fg = "#ec7279", bg = nil, italic = false, bold = false, underline = false })

-- VirtColumn
hl(0, "VirtColumn", { fg = "#393F4B", bg = nil, italic = false, bold = true, underline = false })

-- nvim-treesitter-context
-- hl(0, "TreesitterContext", { fg = nil, bg = "#0B2038", italic = false, bold = false, underline = false })
hl(0, "TreesitterContextBottom", { fg = nil, bg = "#1E2430", italic = false, bold = false, underline = true, sp = "#5E6169" })
-- hi TreesitterContextBottom gui=underline guisp=Grey

-- nvim-surround
hl(0, "NvimSurroundHighlightTextObject", { fg = "#FCCC82", bg = "#1A3A59", italic = true, bold = false, underline = false })

-- QuickScope
hl(0, "QuickScopeSecondary", { fg = "#FCCC82", bg = "#1A3A59", italic = true, bold = false, underline = false })

-- lsp-signature
hl(0, "LspSignatureActiveParameter", { fg = "#6E7179", bg = "#1A3A59", italic = true, bold = false, underline = false })

-- Startify
hl(0 , "StartifyNumber"  , { fg = "#cc9977" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "StartifySelect"  , { fg = nil       , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "StartifyBracket" , { fg = "#6E7179" , bg = nil , italic = false , bold = true  , underline = false })
hl(0 , "StartifySpecial" , { fg = "#cd5c5c" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "StartifyPath"    , { fg = "#64648a" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "StartifyFile"    , { fg = "#00707B" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "StartifySlash"   , { fg = "#897588" , bg = nil , italic = false , bold = false , underline = false })
hl(0 , "StartifyHeader"  , { fg = "#6E7179" , bg = nil , italic = false , bold = true  , underline = false })
hl(0 , "StartifySection" , { fg = "#00afcb" , bg = nil , italic = true  , bold = false , underline = false })
hl(0 , "StartifyFooter"  , { fg = "#a0a0a0" , bg = nil , italic = false , bold = false , underline = false })

-- rainbow
-- hl(0, "rainbowcol1", { fg = "#d78488", bg = nil, italic = false, bold = true, underline = false })
-- hl(0, "rainbowcol2", { fg = "#81A1C1", bg = nil, italic = false, bold = true, underline = false })
-- hl(0, "rainbowcol3", { fg = "#d5b07B", bg = nil, italic = false, bold = true, underline = false })
-- hl(0, "rainbowcol4", { fg = "#AA4499", bg = nil, italic = false, bold = true, underline = false })
-- hl(0, "rainbowcol5", { fg = "#FA2CA7", bg = nil, italic = false, bold = true, underline = false })
-- hl(0, "rainbowcol6", { fg = "#B3C1A9", bg = nil, italic = false, bold = true, underline = false })
-- hl(0, "rainbowcol7", { fg = "#bd93f9", bg = nil, italic = false, bold = true, underline = false })

-- nvim-rainbow-ts - #65C3AD #E8C060 #33AFFF #2AA198
hl(0, "rainbowcol1", { fg = "#4682B4", bg = nil, italic = false, bold = false, underline = false })
hl(0, "rainbowcol2", { fg = "#AD5D60", bg = nil, italic = false, bold = false, underline = false })
hl(0, "rainbowcol3", { fg = "#1D8D77", bg = nil, italic = false, bold = false, underline = false })
hl(0, "rainbowcol4", { fg = "#8661AD", bg = nil, italic = false, bold = false, underline = false })
hl(0, "rainbowcol5", { fg = "#d5b07B", bg = nil, italic = false, bold = false, underline = false })
hl(0, "rainbowcol6", { fg = "#50AFBB", bg = nil, italic = false, bold = false, underline = false })
hl(0, "rainbowcol7", { fg = "#d78488", bg = nil, italic = false, bold = false, underline = false })

hl(0 , "ScrollView"    , { fg = nil       , bg = "#54586A" , italic = false , bold = false , underline = false })
hl(0 , "SearchCurrent" , { fg = "#FB391F" , bg = nil       , italic = false , bold = true  , underline = false })
hl(0 , "SearchSV"      , { fg = "#FCC077" , bg = nil       , italic = false , bold = false , underline = false })

-- vim-sandwich
hl(0, "OperatorSandwichBuns",   { fg = "#fbb4ae", bg = "#3E5062", italic = false, bold = true, underline = true  })
hl(0, "OperatorSandwichAdd",    { fg = "#99c794", bg = nil 			, italic = false, bold = true, underline = true  })
hl(0, "OperatorSandwichDelete", { fg = "#F06372", bg = nil 			, italic = false, bold = true, underline = true  })
hl(0, "OperatorSandwichChange", { fg = "#C586C0", bg = "#3E5062", italic = false, bold = true, underline = false })

hl(0, "InclineFileName", { fg = "#F06372", bg = nil, 			 italic = false, bold = false, underline = false })
hl(0, "InclineNormal"  , { fg = "#E0E0E0", bg = "#444864", italic = false, bold = false, underline = false })
hl(0, "InclineNormalNC", { fg = "#E0E0E0", bg = "#444864", italic = false, bold = false, underline = false })

hl(0 , "hiPairs_matchPair" , { fg = nil       , bg = nil , italic = false , bold = false , underline = true })

hl(0 , "LspInfoBorder"   , { fg = "#4C566A" , bg = nil , italic = false , bold = true , underline = false })

hl(0 , "LspInlayHint"   , { fg = "#5C667A" , bg = nil , italic = true , bold = false , underline = false })

-- Glance
hl(0 , "GlanceWinBarTitle"    , { fg = "#E0E0E0" , bg = "#444864" , italic = true , bold = false , underline = false })
hl(0 , "GlanceWinBarFilename" , { fg = "#E0E0E0" , bg = "#444864" , italic = true , bold = false , underline = false })
hl(0 , "GlanceWinBarFilepath" , { fg = "#E0E0E0" , bg = "#444864" , italic = true , bold = false , underline = false })
hl(0 , "GlanceListFilename"   , { fg = "#E0E0E0" , bg = "#444864" , italic = true , bold = false , underline = false })
hl(0 , "GlanceListFilepath"   , { fg = "#E0E0E0" , bg = "#444864" , italic = true , bold = false , underline = false })

-- vim notifer
hl(0 , "NotifierContent"   , { fg = "#6B717C" , bg = nil , italic = false, bold = false , underline = false })
hl(0 , "NotifierContentDim", { fg = "#6B717C" , bg = nil , italic = true , bold = false , underline = false })
hl(0 , "NotifierTitle"     , { fg = "#99c794" , bg = nil , italic = false, bold = false , underline = false })
hl(0 , "NotifierIcon"      , { fg = "#E23D75" , bg = nil , italic = true , bold = false , underline = false })

hl(0 , "markdownError"     , { fg = nil       , bg = nil , italic = false, bold = false , underline = false })
-- End of File
