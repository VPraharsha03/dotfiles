local wezterm = require 'wezterm'
return 
{
	animation_fps = 1,
	background = 
	{
		-- Layer tables start from here
		--[[{
			source =
			{
				--Color = 'red',
				Gradient = 
				{
					--preset = 'Warm',
					orientation = 'Vertical',
					colors = 
					{
						'#0f0c29',
						'#302b63',
						'#24243e',
					},
					interpolation = 'Linear',
					blend = 'Rgb',
				},
			},
			height = '100%',
			width = '100%',
		},]]--
		{
			source =
			{
				Color = wezterm.color.load_scheme(os.getenv("USERPROFILE") .. '\\.config\\wezterm\\colors\\Aurelia.toml').background,
			},
			height = '100%',
			width = '100%',
		},
		{
			source = 
			{
				File = os.getenv("USERPROFILE") .. '\\.config\\wezterm\\au-os-M.png', -- Take the value of env variable from the running process
			},
			vertical_align = 'Bottom',
			horizontal_align = 'Right',
			height = '300px',
			width = '300px',
		},
		-- End of layer tables
	},
	color_scheme = 'Aurelia',
	-- color_scheme_dirs = {os.getenv("USERPROFILE") .. '\\.config\\wezterm\\colors'}, 
	cursor_blink_rate = 500,
	default_cursor_style = 'BlinkingBar',
	enable_scroll_bar = true,
	--font = wezterm.font 'Segoe UI Emoji',
	font = wezterm.font_with_fallback({"Delugia Mono Nerd Font", "Segoe UI Emoji"}),
	launch_menu =
	{
		{
			label = 'Powershell',
			args = {'powershell.exe'},
		},
		{
			label = 'Neovide',
			args = {'neovide.exe'},
		},
	},
	set_environment_variables =
	{
		clink_profile = os.getenv("USERPROFILE") .. '\\.config\\clink', 
	},
	--window_background_opacity = 1.0,
	--window_background_image = 'au-os-M.png',
	--[[window_background_gradient = 
	{
		-- Can be "Vertical" or "Horizontal".  Specifies the direction
		-- in which the color gradient varies.  The default is "Horizontal",
		-- with the gradient going from left-to-right.
		-- Linear and Radial gradients are also supported; see the other
		-- examples below
		orientation = 'Vertical',

		-- Specifies the set of colors that are interpolated in the gradient.
		-- Accepts CSS style color specs, from named colors, through rgb
		-- strings and more
		colors = {
		  '#0f0c29',
		  '#302b63',
		  '#24243e',
		},

		-- Instead of specifying `colors`, you can use one of a number of
		-- predefined, preset gradients.
		-- A list of presets is shown in a section below.
		-- preset = "Warm",

		-- Specifies the interpolation style to be used.
		-- "Linear", "Basis" and "CatmullRom" as supported.
		-- The default is "Linear".
		interpolation = 'Linear',

		-- How the colors are blended in the gradient.
		-- "Rgb", "LinearRgb", "Hsv" and "Oklab" are supported.
		-- The default is "Rgb".
		blend = 'Rgb',

		-- To avoid vertical color banding for horizontal gradients, the
		-- gradient position is randomly shifted by up to the `noise` value
		-- for each pixel.
		-- Smaller values, or 0, will make bands more prominent.
		-- The default value is 64 which gives decent looking results
		-- on a retina macbook pro display.
		-- noise = 64,

		-- By default, the gradient smoothly transitions between the colors.
		-- You can adjust the sharpness by specifying the segment_size and
		-- segment_smoothness parameters.
		-- segment_size configures how many segments are present.
		-- segment_smoothness is how hard the edge is; 0.0 is a hard edge,
		-- 1.0 is a soft edge.

		-- segment_size = 11,
		-- segment_smoothness = 0.0,
	},]]--
}