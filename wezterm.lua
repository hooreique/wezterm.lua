local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.default_domain = 'WSL:Ubuntu-24.04'

config.color_scheme = 'Sonokai (Gogh)'

config.font = wezterm.font 'D2Coding'

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

config.font_size = 12.5
config.cell_width = 1.2
config.line_height = 1.1
config.underline_position = -3

config.initial_rows = 36
config.initial_cols = 127

config.window_decorations = 'INTEGRATED_BUTTONS|RESIZE'
config.window_padding = { top = 0, left = 0, bottom = 0, right = 0 }
config.window_background_opacity = 0.95
config.window_frame = {
  font = wezterm.font('JetBrains Mono', { weight = 'Bold' }),
  font_size = 10,
}

wezterm.on('gui-startup', function()
  wezterm.mux.spawn_window {
    position = { x = 260, y = 80, origin = 'MainScreen' }
  }
end)

return config
