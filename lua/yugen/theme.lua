local M = {}

function M.get(config)
  local p = require 'yugen.palette'

  local theme = {}
  local groups = config.groups or {}
  local styles = {
    italic = (config.disable_italics and p.none) or 'italic',
    vert_split = (config.bold_vert_split and groups.border) or p.none,
    background = (config.transparent and p.none) or groups.background,
    float_background = (config.transparent_statusline and p.none) or groups.panel,
  }
  styles.nc_background = (config.dim_nc_background and not config.transparent and groups.panel)
      or styles.background

  theme = {
    ColorColumn = { bg = p.placeholder },
    Conceal = { fg = p.color200, bg = p.none },
    CurSearch = { link = 'IncSearch' },
    Cursor = { fg = p.color200, bg = p.placeholder },
    CursorColumn = { bg = p.color800 },
    CursorLine = { bg = p.color600 },
    CursorLineNr = { fg = p.color300 },
    DarkenedPanel = { bg = groups.panel },
    DarkenedStatusline = { bg = groups.panel },
    DiffAdd = { bg = p.color700, },
    DiffChange = { fg = p.color200, bg = p.color700 },
    DiffDelete = { bg = p.color700 },
    DiffText = { bg = p.color700 },
    diffAdded = { link = 'DiffAdd' },
    diffChanged = { link = 'DiffChange' },
    diffRemoved = { link = 'DiffDelete' },
    Directory = { fg = p.color300, bg = p.none },
    ErrorMsg = { fg = p.error, style = 'bold' },
    FloatBorder = { fg = groups.border },
    FloatTitle = { fg = p.color200 },
    FoldColumn = { fg = p.color200 },
    Folded = { fg = p.color200, bg = groups.panel },
    IncSearch = { fg = p.color200, bg = p.color600 },
    LineNr = { fg = p.color500 },
    MatchParen = { fg = p.color200, bg = p.color700 },
    ModeMsg = { fg = p.color200 },
    MoreMsg = { fg = p.color200 },
    NonText = { fg = p.color500 },
    Normal = { fg = p.color200, bg = styles.background },
    NormalFloat = { fg = p.color200, bg = styles.float_background },
    NormalNC = { fg = p.color200, bg = styles.nc_background },
    NvimInternalError = { fg = p.error, bg = p.color700 },
    Pmenu = { fg = p.color200, bg = p.color700 },
    PmenuSbar = { bg = p.colo700 },
    PmenuSel = { fg = p.color200, bg = p.color400 },
    PmenuThumb = { bg = p.color600 },
    Question = { fg = p.warning },
    RedrawDebugClear = { fg = p.color100, bg = p.warning },
    RedrawDebugComposed = { fg = p.color100, bg = p.placeholder },
    RedrawDebugRecompose = { fg = p.error, bg = p.color700 },
    Search = { fg = p.color200, bg = p.color600 },
    SpecialKey = { fg = p.color200 },
    SpellBad = { sp = p.error, style = 'undercurl' },
    SpellCap = { sp = p.blue1, style = 'undercurl' },
    SpellLocal = { sp = p.warning, style = 'undercurl' },
    SpellRare = { sp = p.blue1, style = 'undercurl' },
    SignColumn = { fg = p.color200, bg = p.none },
    StatusLine = { fg = p.color200, bg = styles.float_background },
    StatusLineNC = { fg = p.color200, bg = styles.background },
    StatusLineTerm = { link = 'StatusLine' },
    StatusLineTermNC = { link = 'StatusLineNC' },
    TabLine = { fg = p.color200  },
    TabLineFill = { bg = p.color800 },
    TabLineSel = { fg = p.color200, bg = p.color800 },
    Title = { fg = p.color200 },
    VertSplit = { fg = groups.border },
    Visual = { fg = p.color200, bg = p.color600 },
    WarningMsg = { fg = p.warning },
    Whitespace = { fg = p.color700 },
    WildMenu = { link = 'IncSearch' },

    Constant = { fg = p.color200 },
    String = { fg = p.primary },
    Character = { fg = p.successuccess },
    Number = { fg = p.primary },
    Boolean = { fg = p.primary },
    Float = { fg = p.primary },

    Identifier = { fg = p.color200 },
    Function = { fg = p.primary },

    Statement = { fg = p.color200 },
    Conditional = { fg = p.color200 },
    Repeat = { fg = p.color200 },
    Label = { fg = p.color200 },
    Operator = { fg = p.color400 },
    Keyword = { fg = p.color400 },
    Exception = { fg = p.color200 },

    PreProc = { fg = p.color200 },
    Include = { fg = p.primary },

    Type = { fg = p.color300 },

    Special = { fg = p.color200 },
    Tag = { fg = p.primary },
    Delimiter = { fg = p.color200 },
    SpecialComment = { fg = p.color500 },

    Comment = { fg = p.color500 },

    Underlined = { style = 'underline' },
    Bold = { style = 'bold' },
    Italic = { style = 'italic' },
    qfLineNr = { fg = p.color200 },
    qfFileName = { fg = p.color200 },
    debugPC = { bg = p.color800 },
    debugBreakpoint = { bg = p.placeholder, fg = p.color200 },
    DiagnosticError = { fg = groups.error },
    DiagnosticHint = { fg = groups.hint },
    DiagnosticInfo = { fg = groups.info },
    DiagnosticWarn = { fg = groups.warn },
    DiagnosticDefaultError = { fg = groups.error },
    DiagnosticDefaultHint = { fg = groups.hint },
    DiagnosticDefaultInfo = { fg = groups.info },
    DiagnosticDefaultWarn = { fg = groups.warn },
    DiagnosticFloatingError = { fg = groups.error },
    DiagnosticFloatingHint = { fg = groups.hint },
    DiagnosticFloatingInfo = { fg = groups.info },
    DiagnosticFloatingWarn = { fg = groups.warn },
    DiagnosticSignError = { fg = groups.error },
    DiagnosticSignHint = { fg = groups.hint },
    DiagnosticSignInfo = { fg = groups.info },
    DiagnosticSignWarn = { fg = groups.warn },
    DiagnosticStatusLineError = { fg = groups.error, bg = groups.panel },
    DiagnosticStatusLineHint = { fg = groups.hint, bg = groups.panel },
    DiagnosticStatusLineInfo = { fg = groups.info, bg = groups.panel },
    DiagnosticStatusLineWarn = { fg = groups.warn, bg = groups.panel },
    DiagnosticUnderlineError = { sp = groups.error, style = 'undercurl' },
    DiagnosticUnderlineHint = { sp = groups.hint, style = 'undercurl' },
    DiagnosticUnderlineInfo = { sp = groups.info, style = 'undercurl' },
    DiagnosticUnderlineWarn = { sp = groups.warn, style = 'undercurl' },
    DiagnosticVirtualTextError = { fg = groups.error },
    DiagnosticVirtualTextHint = { fg = groups.hint },
    DiagnosticVirtualTextInfo = { fg = groups.info },
    DiagnosticVirtualTextWarn = { fg = groups.warn },

    -- Treesitter
    ['@variable'] = { fg = p.color200 },
    ['@boolean'] = { link = 'Boolean' },
    ['@comment'] = { link = 'Comment' },
    ['@variable.builtin'] = { fg = p.color300 },
    ['@constant.builtin'] = { fg = p.color300 },
    ['@constant.falsy'] = { fg = p.primary },
    ['@constant.rescript'] = { fg = p.primary },
    ['@constant'] = { link = ' Constant' },
    ['@constructor'] = { fg = p.color500 },
    ['field'] = { fg = p.color200 },
    ['@function.builtin'] = { fg = p.color300 },
    ['@function'] = { link = 'Function' },
    ['@function.call'] = { fg = p.primary },
    TSInclude = { fg = p.color200 },
    ['@keyword.rescript'] = { fg = p.primary },
    ['@keyword'] = { link = 'Keyword' },
    ['@keyword.return'] = { fg = p.color300 },
    ['@keyword.function'] = { fg = p.color300 },
    ['@keyword.operator'] = { fg = p.color400 },
    ['@label'] = { fg = p.color500 },
    ['@method'] = { fg = p.primary },
    ['@operator'] = { fg = 'color400' },
    ['@parameter'] = { fg = p.color200 },
    ['@property'] = { fg = p.color300 },
    ['@punctuation.delimiter'] = { fg = groups.punctuation },
    ['@punctuation.special'] = { fg = groups.punctuation },
    ['@punctuation.bracket'] = { fg = p.color400 },
    ['@string'] = { fg = p.color400 },
    ['@string.escape'] = { fg = p.color100 },
    ['@tag'] = { fg = p.primary },
    ['@tag.delimiter'] = { fg = p.color400 },
    ['@tag.attribute'] = { fg = p.color300, style = styles.italic },
    ['@text'] = { fg = p.color200 },
    ['@title'] = { fg = groups.headings.h1, style = 'bold' },
    ['@type'] = { link = 'Type' },
    ['@type.builtin'] = { link = 'Type' },
    TSURI = { fg = groups.link },

    -- tsx
    ['@keyword.export.tsx'] = { fg = p.color400 },
    ['@keyword.import.tsx'] = { fg = p.color400 },
    ['@import.identifier.tsx'] = { fg = p.color300 },

    -- typescript
    ['@keyword.export.typescript'] = { fg = p.color400 },
    ['@keyword.import.typescript'] = { fg = p.color400 },
    ['@import.identifier.typescript'] = { fg = p.color300 },
    typescriptVariable = { fg = p.color200 },
    typescriptExport = { fg = p.color200 },
    typescriptDefault = { fg = p.color200 },
    typescriptConstraint = { fg = p.color200 },
    typescriptBlock = { fg = p.color200 },
    typescriptIdentifierName = { fg = p.color200 },
    typescriptTSInclude = { fg = p.color200 },
    typescriptCastKeyword = { fg = p.color200 },
    typescriptEnum = { fg = p.color200 },
    typescriptTypeCast = { fg = p.color200 },
    typescriptParenExp = { fg = p.color200 },
    typescriptObjectType = { fg = p.color200 },

    -- lua
    luaTSConstructor = { fg = p.color200 },

    -- vim.lsp.buf.document_highlight()
    LspReferenceText = { bg = p.color800 },
    LspReferenceRead = { bg = p.color800 },
    LspReferenceWrite = { bg = p.color8000 },

    -- lsp-highlight-codelens
    LspCodeLens = { fg = p.color200 },
    LspCodeLensSeparator = { fg = p.color200 },

    -- lewis6991/gitsigns.nvim
    GitSignsAdd = { fg = groups.git_add },
    GitSignsChange = { fg = groups.git_change },
    GitSignsDelete = { fg = groups.git_delete },
    SignAdd = { link = 'GitSignsAdd' },
    SignChange = { link = 'GitSignsChange' },
    SignDelete = { link = 'GitSignsDelete' },

    -- lukas-reineke/indent-blankline.nvim
    IndentBlanklineChar = { fg = p.color600 },
    IndentBlanklineContextChar = { fg = p.color100 },
    IblIndent = { fg = p.color600 },
    IblScope = { fg = p.color100 },

    -- nvimdev/indentmini.nvim
    IndentLine = { fg = p.color600 },
    IndentLineCurrent = { fg = p.color100 },

    -- NvimTree
    NvimTreeFileDirty = { fg = p.color200 },
    NvimTreeFileNew = { fg = p.color200 },
    NvimTreeFileRenamed = { fg = p.color200 },
    NvimTreeFileStaged = { fg = p.color200 },
    NvimTreeFolderIcon = { fg = p.color400 },
    NvimTreeFolderName = { fg = p.color300 },
    NvimTreeIndentMarker = { fg = p.color600 },
    NvimTreeGitDeleted = { fg = groups.color200 },
    NvimTreeGitDirty = { fg = p.color200 },
    NvimTreeGitIgnored = { fg = groups.git_ignore },
    NvimTreeGitMerge = { fg = groups.git_merge },
    NvimTreeGitNew = { fg = groups.git_add },
    NvimTreeGitRenamed = { fg = groups.git_rename },
    NvimTreeGitStaged = { fg = groups.git_stage },
    NvimTreeImageFile = { fg = p.color100 },
    NvimTreeExecFile = { fg = p.color100 },
    NvimTreeNormal = { fg = p.color200 },
    NvimTreeOpenedFile = { fg = p.color400, bg = 'none' },
    NvimTreeOpenedFolderName = { link = 'NvimTreeFolderName' },
    NvimTreeRootFolder = { fg = p.color100 },
    NvimTreeSpecialFile = { link = 'NvimTreeNormal' },
    NvimTreeWindowPicker = { fg = p.color100, bg = p.color600 },
    WinSeparator = { fg = p.color600, bg = p.color800 },

    -- folke/which-key.nvim
    WhichKey = { fg = p.color200 },
    WhichKeyGroup = { fg = p.color200 },
    WhichKeySeparator = { fg = p.color500 },
    WhichKeyDesc = { fg = p.color200 },
    WhichKeyBorder = { bg = p.color200 },
    WhichKeyFloat = { bg = p.color700 },
    WhichKeyValue = { fg = p.color200 },

    -- Nvim Cmp
    CmpItemAbbr = { fg = p.color200 },
    CmpItemAbbrDeprecated = { fg = p.color700, style = 'strikethrough' },
    CmpItemAbbrMatch = { fg = p.color300 },
    CmpItemAbbrMatchFuzzy = { fg = p.color100 },
    CmpItemKind = { fg = p.primary },
    CmpItemKindClass = { fg = p.primary },
    CmpItemKindFunction = { fg = p.primary },
    CmpItemKindInterface = { fg = p.primary },
    CmpItemKindMethod = { fg = p.primary },
    CmpItemKindSnippet = { fg = p.primary },
    CmpItemKindVariable = { fg = p.primary },

    -- Saghen/blink.cmp
    BlinkCmpMenu = { bg = p.color800 },
    BlinkCmpMenuBorder = { fg = p.color600 },
    BlinkCmpMenuSelection = "PmenuSel",
    BlinkCmpLabel = { fg = p.color300 },
    BlinkCmpLabelDepricated = { fg = p.color700, style = 'strikethrough' },
    BlinkCmpLabelMatch = { fg = p.color100 },
    BlinkCmpGhostText = { fg = p.color500 },
    BlinkCmpDoc = { bg = p.color800 },
    BlinkCmpDocBorder = { fg = p.color600 },
    BlinkCmpSignatureHelpBorder = { fg = p.color600 },
    BlinkCmpKindText = { fg = p.primary },
    BlinkCmpKindFunction = { fg = p.primary },
    BlinkCmpKindVariable = { fg = p.primary },
    BlinkCmpKindEnum = { fg = p.primary },
    BlinkCmpKindSnippet = { fg = p.primary },
    BlinkCmpKindField = { fg = p.primary },
    BlinkCmpKindConstant = { fg = p.primary },
    BlinkCmpKindMethod = { fg = p.primary },

    -- ray-x/lsp_signature.nvim
    LspSignatureActiveParameter = { bg = p.placeholder },

    -- Telescope
    TelescopeMatching = { fg = p.primary },
    TelescopeNormal = { fg = p.color200 },
    TelescopeSelection = { fg = p.color200, bg = p.color700 },
    TelescopeTitle = { fg = p.color200 },
    TelescopeBorder = { fg = p.color600 },
    TelescopePromptBorder = { fg = p.color700 },
    TelescopePromptNormal = { fg = p.color100 },
    TelescopePromptPrefix = { fg = p.color200 },
    TelescopePreviewTitle = { fg = p.color100, bg = p.color700 },
    TelescopePromptTitle = { fg = p.color100, bg = p.color700 },
    TelescopeResultsDiffAdd = { fg = p.primary },
    TelescopeResultsDiffChange = { fg = p.color600 },
    TelescopeResultsDiffDelete = { fg = p.primary },

    -- Dashboard
    DashboardFooter = { fg = p.color400, bg = 'none', bold = true },
    BvDashboardKey = { fg = p.primary, bg = 'none', bold = true },
    BvDashboardItemIcon = { fg = p.color300 },
    BvDashboardItemText = { fg = p.color300 },

    -- code action
    ActionPreviewNormal = { link = 'SagaNormal' },
    ActionPreviewBorder = { link = 'SagaBorder' },
    ActionPreviewTitle = { fg = p.color200, bg = p.placeholder },
    CodeActionNormal = { link = 'SagaNormal' },
    CodeActionBorder = { link = 'SagaBorder' },
    CodeActionText = { fg = p.warning },
    CodeActionNumber = { fg = p.color200 },
    -- finder
    FinderSelection = { fg = p.color200, bold = true },
    FinderFileName = { fg = p.color200 },
    FinderCount = { link = 'Label' },
    FinderIcon = { fg = p.warning },
    FinderType = { fg = p.color200 },
    --finder spinner
    FinderSpinnerTitle = { fg = p.color200, bold = true },
    FinderSpinner = { fg = p.color200, bold = true },
    FinderPreviewSearch = { link = 'Search' },
    FinderVirtText = { fg = p.color200 },
    FinderNormal = { link = 'SagaNormal' },
    FinderBorder = { link = 'SagaBorder' },
    FinderPreviewBorder = { link = 'SagaBorder' },
    -- definitionheading
    DefinitionBorder = { link = 'SagaBorder' },
    DefinitionNormal = { link = 'SagaNormal' },
    DefinitionSearch = { link = 'Search' },
    -- hover
    HoverNormal = { link = 'SagaNormal' },
    HoverBorder = { link = 'SagaBorder' },
    -- rename
    RenameBorder = { link = 'SagaBorder' },
    RenameNormal = { fg = p.color200, p.background2 },
    RenameMatch = { link = 'Search' },
    -- diagnostic
    DiagnosticBorder = { link = 'SagaBorder' },
    DiagnosticSource = { fg = p.color200 },
    DiagnosticNormal = { link = 'SagaNormal' },
    DiagnosticErrorBorder = { link = 'DiagnosticError' },
    DiagnosticWarnBorder = { link = 'DiagnosticWarn' },
    DiagnosticHintBorder = { link = 'DiagnosticHint' },
    DiagnosticInfoBorder = { link = 'DiagnosticInfo' },
    DiagnosticPos = { fg = p.color200 },
    DiagnosticWord = { fg = p.color200 },
    -- Call Hierachry
    CallHierarchyNormal = { link = 'SagaNormal' },
    CallHierarchyBorder = { link = 'SagaBorder' },
    CallHierarchyIcon = { fg = p.color200 },
    CallHierarchyTitle = { fg = p.color200 },
    -- lightbulb
    LspSagaLightBulb = { link = 'DiagnosticSignHint' },
    -- shadow
    SagaShadow = { bg = p.placeholder },
    -- Outline
    OutlineIndent = { fg = p.color200 },
    OutlinePreviewBorder = { link = 'SagaNormal' },
    OutlinePreviewNormal = { link = 'SagaBorder' },
    -- Float term
    TerminalBorder = { link = 'SagaBorder' },
    TerminalNormal = { link = 'SagaNormal' },
  }

  vim.g.terminal_color_0 = p.color800
  vim.g.terminal_color_8 = p.color300
  vim.g.terminal_color_1 = p.primary
  vim.g.terminal_color_9 = p.color300
  vim.g.terminal_color_2 = p.color400
  vim.g.terminal_color_10 = p.color500
  vim.g.terminal_color_3 = p.warning
  vim.g.terminal_color_11 = p.color300
  vim.g.terminal_color_4 = p.color400
  vim.g.terminal_color_12 = p.primary
  vim.g.terminal_color_5 = p.primary
  vim.g.terminal_color_13 = p.placeholder
  vim.g.terminal_color_6 = p.color200
  vim.g.terminal_color_14 = p.color200
  vim.g.terminal_color_7 = p.color100
  vim.g.terminal_color_15 = p.color100

  return theme
end

return M
