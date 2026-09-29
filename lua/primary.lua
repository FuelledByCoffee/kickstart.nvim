local M = {}

local palette = {
  background = '#1e1e1e',
  foreground = '#f3f3f3',
  surface = '#2c323c',
  muted = '#707070',
  comment = '#b0b0b0',
  variable = '#86d700',
  function_ = '#f58720',
  keyword = '#fcd000',
  preprocessor = '#c22add',
  special = '#f21d27',
  type = '#2f7dff',
  constant = '#17d9c9',
  string = '#ffdd00',
  identifier = '#42bdf7',
  statement = '#ffc026',
  exception = '#ff1dce',
  macro = '#ad13f9',
  selection = '#bbbbbb',
}

local defaults = {
  transparent_background = true,
  terminal_colors = true,
  styles = {},
  palette_overrides = {},
  custom_highlights = {},
}

local highlight_colors = {
  Normal = 'foreground',
  NormalFloat = 'foreground',
  Comment = 'comment',
  Constant = 'constant',
  String = 'string',
  Character = 'string',
  Number = 'constant',
  Boolean = 'macro',
  Float = 'constant',
  Identifier = 'identifier',
  Variable = 'variable',
  Function = 'function_',
  Statement = 'statement',
  Conditional = 'keyword',
  Repeat = 'keyword',
  Label = 'statement',
  Operator = 'keyword',
  Keyword = 'keyword',
  Exception = 'exception',
  PreProc = 'preprocessor',
  Include = 'preprocessor',
  Define = 'preprocessor',
  Macro = 'macro',
  Type = 'type',
  StorageClass = 'exception',
  Structure = 'type',
  Typedef = 'special',
  Special = 'special',
  SpecialComment = 'muted',
  Directory = 'type',
  Title = 'identifier',
  ['@comment'] = 'comment',
  ['@string'] = 'string',
  ['@string.escape'] = 'constant',
  ['@string.regex'] = 'special',
  ['@number'] = 'constant',
  ['@boolean'] = 'macro',
  ['@constant'] = 'constant',
  ['@variable'] = 'variable',
  ['@function'] = 'function_',
  ['@function.call'] = 'function_',
  ['@keyword'] = 'keyword',
  ['@keyword.function'] = 'special',
  ['@type'] = 'type',
  ['@type.builtin'] = 'special',
  ['@operator'] = 'keyword',
  ['@attribute'] = 'constant',
  ['@tag'] = 'constant',
}

local style_groups = {
  comments = { 'Comment', '@comment' },
  conditionals = { 'Conditional', 'Repeat' },
  functions = { 'Function', '@function', '@function.call' },
  keywords = { 'Keyword', '@keyword' },
  strings = { 'String', '@string' },
  types = { 'Type', '@type' },
  variables = { 'Variable', '@variable' },
}

local terminal_colors = {
  '#1e1e1e', '#fc2525', '#87d700', '#ffdd00',
  '#2f7dff', '#ad13f9', '#3bffff', '#d8d8d2',
  '#707070', '#ff2525', '#50ef2b', '#ffff00',
  '#429df7', '#ff1dce', '#3ac8c5', '#f3f3f3',
}

local options = vim.deepcopy(defaults)

local function resolved_palette()
  return vim.tbl_extend('force', vim.deepcopy(palette), options.palette_overrides)
end

local function apply_styles()
  for style_name, groups in pairs(style_groups) do
    local style = options.styles[style_name]
    if type(style) == 'table' then
      for _, group in ipairs(groups) do
        local current = vim.api.nvim_get_hl(0, { name = group, link = false })
        vim.api.nvim_set_hl(0, group, vim.tbl_extend('force', current, style))
      end
    end
  end
end

local function apply_custom_highlights(colors)
  local custom = options.custom_highlights
  if type(custom) == 'function' then
    custom = custom(vim.deepcopy(colors))
  end

  for group, highlight in pairs(custom) do
    vim.api.nvim_set_hl(0, group, highlight)
  end
end

local function apply()
  local colors = resolved_palette()

  for group, color_name in pairs(highlight_colors) do
    vim.api.nvim_set_hl(0, group, { fg = colors[color_name] })
  end

  local background = options.transparent_background and 'NONE' or colors.background
  for _, group in ipairs({ 'Normal', 'NormalNC', 'NormalFloat', 'SignColumn', 'EndOfBuffer' }) do
    vim.api.nvim_set_hl(0, group, { bg = background })
  end

  apply_styles()

  if options.terminal_colors then
    for index, color in ipairs(terminal_colors) do
      vim.g['terminal_color_' .. (index - 1)] = color
    end
  end

  apply_custom_highlights(colors)
end

function M.setup(user_options)
  options = vim.tbl_deep_extend('force', vim.deepcopy(defaults), user_options or {})

  local group = vim.api.nvim_create_augroup('primary_colorscheme', { clear = true })
  vim.api.nvim_create_autocmd('ColorScheme', {
    group = group,
    pattern = 'primary',
    callback = apply,
  })

  if vim.g.colors_name == 'primary' then
    apply()
  end

  return M
end

function M.get_palette()
  return resolved_palette()
end

return M