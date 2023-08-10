# wal.lxl
Integrates `pywal` into Lite XL, so that your probably-favourite-text-editor also looks sorta like your wallpaper. (thank me later, Arch users)

**NOTE**: The plugin has some defaults set, but it is highly recommended that you customize them, as they're not perfect. (I chose them, and I suck at theming, sooo...)

## Installation

### Through LPM (Lite XL Package Manager)
Just call `lpm install wal.lxl` and restart. :)

### Manual
`git clone` the repository into `~/.config/lite-xl/plugins/wal`. Then, restart the editor.
```bash
git clone https://github.com/ThaCuber/wal ~/.config/lite-xl/plugins/wal
```
You can also download the source code and either rename `init.lua` to `wal.lua`, or make a new folder and store the `init.lua` as-is onto it

## Configuration

`config.plugins.wal` is your friend here. It contains 4 fields.
All of them are tables and they go like so:
* `colors`: Colors of the things in the screen. Stuff like the background, scrollbar, text, etc.
* `syntax_colors`: The syntax highlighter's colors. Keywords, strings, numbers, literals, etc.
* `brightness`: The brightness scale of the things in the screen. All brightness values are normalized, so 0 is black and 1 is the original color. You can also use numbers outside that range.
* `syntax_brightness`: The brightness of the syntax hightlighter's colors.

Each field has, as key, the `style` field you want to modify, and as value, the index of a color, or a special color.
(yeah, this means Evergreen.lxl is implicitly supported)

Example config:
```lua
local config = require 'core.config'
local wal = config.plugins.wal

wal.colors.selection = 0 -- set selection highlight to color0
wal.brightness.selection = 1.5 -- increase it's brightness by 150%
wal.syntax_colors.number = 2 -- set number highlighting to color2
wal.colors.caret = "cursor" -- set caret's color to "special.cursor"
```

## Screenshots

![image](https://github.com/ThaCuber/wal.lxl/assets/70547062/c9751b9c-00a7-4659-a1b2-14c862317ca7)
![image](https://github.com/ThaCuber/wal.lxl/assets/70547062/60f1c3ef-0c48-403b-b293-6127ca0d1f4e)
![image](https://github.com/ThaCuber/wal.lxl/assets/70547062/af75cdea-97ea-4cf4-9c06-432b318af284)
![image](https://github.com/ThaCuber/wal.lxl/assets/70547062/6c1f24b4-2e1b-490b-aaa8-d1186f964e7e)
![image](https://github.com/ThaCuber/wal.lxl/assets/70547062/bb62bd6a-19e1-4ed0-88c7-4b47d44af747)
