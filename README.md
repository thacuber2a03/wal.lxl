# wal.lxl
Integrates [pywal](https://github.com/dylanaraps/pywal) into Lite XL, so that your probably-favourite-text-editor also looks sorta like your wallpaper. (thank me later, Arch users)

**NOTE**: The plugin has some defaults set, but it is highly recommended that you customize them, as they're not perfect. (Especially to light theme users.)

## Installation

### Through [LPM (Lite XL Plugin Manager)](https://github.com/lite-xl/lite-xl-plugin-manager)
Just call `lpm install wal` and restart. :)

### Manually
`git clone` the repository into `~/.config/lite-xl/plugins/wal`. Then, restart the editor.
```bash
git clone https://github.com/thacuber2a03/wal.lxl ~/.config/lite-xl/plugins/wal
```
You can also download the source code and either rename `init.lua` to `wal.lua`, or make a new folder and store the `init.lua` as-is onto it. This allows you to add other files alongside it later.

## Configuration

`config.plugins.wal` is your friend here. It contains 4 fields.
All of them are tables and they go like so:
* `colors`: Colors of the things in the screen. Stuff like the background, scrollbar, text, etc.
* `syntax_colors`: The syntax highlighter's colors. Keywords, strings, numbers, literals, etc.
* `brightness`: The brightness scale of the things in the screen. All brightness values are normalized, so 0 is black and 1 is the original color. You can also use numbers outside that range.
* `syntax_brightness`: The brightness of the syntax hightlighter's colors.

Each field has, as key, the `style` field you want to modify, and as value, the index of a color, or a special color.
(yeah, this means [Evergreen.lxl](https://github.com/TorchedSammy/Evergreen.lxl) is implicitly supported)

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

![image](https://github.com/ThaCuber/wal.lxl/assets/70547062/acee6714-9a7d-46fc-b5b6-65aded3d10d4)
![image](https://github.com/ThaCuber/wal.lxl/assets/70547062/b8ee301d-4f7c-49a3-b822-f741dd372d93)
![image](https://github.com/ThaCuber/wal.lxl/assets/70547062/ba2e2465-e05e-43f1-ab0d-6984a62e0b08)
![image](https://github.com/ThaCuber/wal.lxl/assets/70547062/8f3e7119-cb3a-4cef-b24c-bba00c5bb581)

