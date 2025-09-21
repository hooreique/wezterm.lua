local wezterm = require 'wezterm'

local config = wezterm.config_builder()

-- https://wezterm.org/config/lua/config/term.html
-- https://github.com/wezterm/wezterm/blob/main/termwiz/data/wezterm.terminfo
config.term = 'wezterm'

config.set_environment_variables = { COLORTERM = 'truecolor' }

config.default_domain = 'WSL:Ubuntu-24.04'

config.color_scheme = 'Sonokai (Gogh)'

config.font_rules = {
  {
    intensity = 'Half',
    italic = false,
    font = wezterm.font {
      family = 'Cartograph CF',
      weight = 'Light',
      harfbuzz_features = { 'ss03' },
    },
  },
  {
    intensity = 'Half',
    italic = true,
    font = wezterm.font {
      family = 'Cartograph CF',
      weight = 'Light',
      style = 'Italic',
      harfbuzz_features = { 'ss03' },
    },
  },
  {
    intensity = 'Normal',
    italic = false,
    font = wezterm.font {
      family = 'Cartograph CF',
      weight = 'DemiBold',
      harfbuzz_features = { 'ss03' },
    },
  },
  {
    intensity = 'Normal',
    italic = true,
    font = wezterm.font {
      family = 'Cartograph CF',
      weight = 'DemiBold',
      style = 'Italic',
      harfbuzz_features = { 'ss03' },
    },
  },
  {
    intensity = 'Bold',
    italic = false,
    font = wezterm.font {
      family = 'Cartograph CF',
      weight = 'Black',
      harfbuzz_features = { 'ss03' },
    },
  },
  {
    intensity = 'Bold',
    italic = true,
    font = wezterm.font {
      family = 'Cartograph CF',
      weight = 'Black',
      style = 'Italic',
      harfbuzz_features = { 'ss03' },
    },
  },
}

config.font_size = 14
config.line_height = 0.9
config.underline_position = '-0.1cell'

config.window_decorations = 'INTEGRATED_BUTTONS | RESIZE'
config.window_padding = { top = 0, left = 0, bottom = 0, right = 0 }
config.window_background_opacity = 0.95
config.window_frame = {
  font = wezterm.font('JetBrains Mono', { weight = 'Bold' }),
  font_size = 10,
}

wezterm.on('gui-startup', function(cmd)
  local _, _, muxwin = wezterm.mux.spawn_window(cmd or {})
  local win = muxwin:gui_window()

  win:set_position(420, 120)
  win:set_inner_size(1080, 640)
end)

wezterm.on('custom-alt-shift-n', function()
  local _, _, muxwin = wezterm.mux.spawn_window {}
  local win = muxwin:gui_window()

  win:set_position(420, 120)
  win:set_inner_size(1080, 640)
end)

local function toggle_zoom()
  local zoom = false

  return function(win)
    local o = win:get_config_overrides() or {}

    if zoom then
      zoom = false
      o.font_size = 14
      win:set_position(420, 120)
      win:set_inner_size(1080, 640)
    else
      zoom = true
      o.font_size = 18.2
      win:set_position(106, 45)
      win:set_inner_size(1708, 921)
    end

    win:set_config_overrides(o)
  end
end

wezterm.on('custom-alt-f', toggle_zoom())

config.canonicalize_pasted_newlines = 'None'
config.adjust_window_size_when_changing_font_size = false
config.disable_default_key_bindings = true
config.keys = {
  {
    key = 'd',
    mods = 'ALT | SHIFT',
    action = wezterm.action.ShowDebugOverlay,
  },
  {
    key = 'f',
    mods = 'ALT',
    action = wezterm.action.EmitEvent 'custom-alt-f',
  },
  {
    key = 'n',
    mods = 'ALT | SHIFT',
    action = wezterm.action.EmitEvent 'custom-alt-shift-n',
  },
  {
    key = 'c',
    mods = 'ALT',
    action = wezterm.action.CopyTo 'Clipboard',
  },
  {
    key = 'v',
    mods = 'ALT',
    action = wezterm.action.PasteFrom 'Clipboard',
  },
  {
    key = 'k',
    mods = 'ALT',
    action = wezterm.action.Multiple {
      wezterm.action.ClearScrollback 'ScrollbackOnly',
      wezterm.action.SendKey { key = 'k', mods = 'ALT' },
    },
  },
  {
    key = '=',
    mods = 'ALT',
    action = wezterm.action.IncreaseFontSize,
  },
  {
    key = '-',
    mods = 'ALT',
    action = wezterm.action.DecreaseFontSize,
  },
  {
    key = '0',
    mods = 'ALT',
    action = wezterm.action.ResetFontSize,
  },
}

return config
