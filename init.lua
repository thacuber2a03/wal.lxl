---mod-version:3
local core = require 'core'
local config = require 'core.config'
local common = require 'core.common'
local command = require 'core.command'
local style = require 'core.style'
local json = require 'libraries.json'

config.plugins.wal = common.merge({
	colors = {
		background = "background",
		background2 = "background",
		background3 = "background",
		text = 3,
		accent = 5,
		caret = "cursor",
		dim = 6,
		divider = 7,
		selection = "foreground",
		line_number = 9,
		line_number2 = 9,
		line_highlight = "background",
		scrollbar = 12,
		scrollbar2 = 13,
	},
	syntax_colors = {
		normal = 7,
		symbol = 7,
		comment = "foreground",
		keyword = 3,
		keyword2 = 4,
		number = 2,
		literal = 4,
		string = 2,
		operator = 8,
		["function"] = 4,
	},
	brightness = {
		background = 2,
		background2 = 1.5,
		background3 = 1.25,
		selection = 0.2,
		line_highlight = 1.5,
		line_number2 = 1.5,
	},
	syntax_brightness = {
		comment = 0.4
	},
}, config.plugins.wal)

local colors_file_name = common.home_expand "~/.cache/wal/colors.json"

local function no_cached_file()
	core.error(
		"You don't have pywal installed "..
		"or there isn't a cached theme file."..
		"If you have pywal, please generate one."
	)
end

local function brighten(c, a)
	a = a or 1
	return {
		common.clamp(c[1] * a, 0, 255),
		common.clamp(c[2] * a, 0, 255),
		common.clamp(c[3] * a, 0, 255),
		c[4] -- imagine changing the brightness of alpha lmao
	}
end

local function get_color(wal, col)
	local c
	if type(col) == "number" then
		c = wal.colors["color"..col]
		if not c then
			core.error("\"color"..col.."\" does not exist.")
		end
	elseif type(col) == "string" then
		c = wal.special[col]
		if not c then
			core.error("Special color " .. col .. " does not exist.")
		end
	end
	return { common.color(c) }
end

local function apply_wal()
	local conf = config.plugins.wal
	local colors_file = io.open(colors_file_name, "rb")
	if not colors_file then no_cached_file() end
	---@cast colors_file -?
	local wal = json.decode(colors_file:read "*a")
	colors_file:close()

	for k, v in pairs(conf.colors) do
		style[k] = brighten(get_color(wal, v), conf.brightness[k])
	end

	for k, v in pairs(conf.syntax_colors) do
		style.syntax[k] = brighten(get_color(wal, v), conf.syntax_brightness[k])
	end
end

local function get_cached_file_mod()
	local info = system.get_file_info(colors_file_name)
	if not info then no_cached_file() end
	---@cast info -?
	return info.modified
end

core.add_thread(function()
	-- this plugin has some defaults set,
	-- but they're not the best.
	-- it is always recommended that the user
	-- customize the colors as they see fit.

	apply_wal() -- apply at start
	local last_mod = get_cached_file_mod()
	while true do
		local mod = get_cached_file_mod()
		if mod > last_mod then
			last_mod = mod
			apply_wal()
		end
		coroutine.yield(1)
	end
end)

command.add(nil, { ["wal:apply"] = apply_wal, })
