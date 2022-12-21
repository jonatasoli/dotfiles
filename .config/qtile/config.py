# -*- coding: utf-8 -*-
import os
import socket
import subprocess
from libqtile import qtile
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook
from libqtile.lazy import lazy
from typing import List  # noqa: F401

mod = "mod4"                                     # Sets mod key to SUPER/WINDOWS
my_term = "kitty"                             # My terminal of choice

keys = [
         ### The essentials
         Key([mod], "Return",
             lazy.spawn(my_term+" -e fish"),
             desc='Launches My Terminal'
             ),
         Key([mod, "shift"], "Return",
             lazy.spawn("dmenu_run -p 'Run: '"),
             # lazy.spawn("rofi -show drun -config ~/.config/rofi/themes/dt-dmenu.rasi -display-drun \"Run: \" -drun-display-format \"{name}\""),
             desc='Run Launcher'
             ),
         Key([mod], "Tab",
             lazy.next_layout(),
             desc='Toggle through layouts'
             ),
         Key([mod, "shift"], "c",
             lazy.window.kill(),
             desc='Kill active window'
             ),
         Key([mod, "shift"], "r",
             lazy.restart(),
             desc='Restart Qtile'
             ),
         Key([mod, "shift"], "q",
             lazy.shutdown(),
             desc='Shutdown Qtile'
             ),
         Key([mod], "b",
             lazy.hide_show_bar(),
             desc='Hides the bar'
             ),
         ### Switch focus to specific monitor (out of three)
         Key([mod], "w",
             lazy.to_screen(0),
             desc='Keyboard focus to monitor 1'
             ),
         Key([mod], "e",
             lazy.to_screen(1),
             desc='Keyboard focus to monitor 2'
             ),
         ### Switch focus of monitors
         Key([mod], "period",
             lazy.next_screen(),
             desc='Move focus to next monitor'
             ),
         Key([mod], "comma",
             lazy.prev_screen(),
             desc='Move focus to prev monitor'
             ),
         ### Window controls
         Key([mod], "k",
             lazy.layout.down(),
             desc='Move focus down in current stack pane'
             ),
         Key([mod], "j",
             lazy.layout.up(),
             desc='Move focus up in current stack pane'
             ),
         Key([mod, "shift"], "k",
             lazy.layout.shuffle_down(),
             desc='Move windows down in current stack'
             ),
         Key([mod, "shift"], "j",
             lazy.layout.shuffle_up(),
             desc='Move windows up in current stack'
             ),
         Key([mod], "h",
             lazy.layout.shrink(),
             lazy.layout.decrease_nmaster(),
             desc='Shrink window (MonadTall), decrease number in master pane (Tile)'
             ),
         Key([mod], "l",
             lazy.layout.grow(),
             lazy.layout.increase_nmaster(),
             desc='Expand window (MonadTall), increase number in master pane (Tile)'
             ),
         Key([mod], "n",
             lazy.layout.normalize(),
             desc='normalize window size ratios'
             ),
         Key([mod], "m",
             lazy.layout.maximize(),
             desc='toggle window between minimum and maximum sizes'
             ),
         Key([mod, "shift"], "f",
             lazy.window.toggle_floating(),
             desc='toggle floating'
             ),
         Key([mod, "shift"], "m",
             lazy.window.toggle_fullscreen(),
             desc='toggle fullscreen'
             ),
         ### Stack controls
         Key([mod, "shift"], "space",
             lazy.layout.rotate(),
             lazy.layout.flip(),
             desc='Switch which side main pane occupies (XmonadTall)'
             ),
         Key([mod], "space",
             lazy.layout.next(),
             desc='Switch window focus to other pane(s) of stack'
             ),
         Key([mod, "control"], "Return",
             lazy.layout.toggle_split(),
             desc='Toggle between split and unsplit sides of stack'
             ),
         # Dmenu scripts launched using the key chord SUPER+p followed by 'key'
]

group_names = [("MEN", {'layout': 'monadtall'}),
               ("WWW", {'layout': 'monadtall'}),
               ("DEV", {'layout': 'monadtall'}),
               ("DB", {'layout': 'monadtall'}),
               ("IDE", {'layout': 'floating'}),
               ("XMD", {'layout': 'monotall'}),
               ("OBS", {'layout': 'monadtall'}),
               ("ANY", {'layout': 'monotall'}),
               ("MUS", {'layout': 'floating'})]

groups = [Group(name, **kwargs) for name, kwargs in group_names]

for i, (name, kwargs) in enumerate(group_names, 1):
    keys.append(Key([mod], str(i), lazy.group[name].toscreen()))        # Switch to another group
    keys.append(Key([mod, "shift"], str(i), lazy.window.togroup(name))) # Send current window to another group

layout_theme = {"border_width": 2,
                "margin": 8,
                "border_focus": "e1acff",
                "border_normal": "1D2330"
                }

layouts = [
    layout.MonadTall(**layout_theme),
    layout.Max(**layout_theme),
    layout.Tile(shift_windows=True, **layout_theme),
    layout.Floating(**layout_theme)
]

colors = ["#282828", # panel background
          "#665c54", # background for current screen tab #fbf1c7
          "#83a598", # font color for group names
          "#b8bb26", # border line color for current tab
          "#458588", # border line color for 'other tabs' and color for 'odd widgets'
          "#fe8019", # color for the 'even widgets'
          "#a89984", # window name
          "#fbf1c7"]

my_fonts = [
    'JetBrainsMono Nerd Font',
    'JetBrainsMono Nerd Font Mono',
    'TerminessTTF Nerd Font',
    'TerminessTTF Nerd Font Mono',
    'Font Awesome 5 Free',
    'Font Awesome 5 Free Solid',
]

prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())

##### DEFAULT WIDGET SETTINGS #####
widget_defaults = dict(
    font = "Ubuntu Mono",
    fontsize = 12,
    padding = 2,
    background=colors[2]
)
extension_defaults = widget_defaults.copy()

def init_widgets_list():
    widgets_list = [
              widget.Sep(
                       linewidth = 0,
                       padding = 6,
                       foreground = colors[2],
                       background = colors[0]
                       ),
              widget.Image(
                       filename = "~/.config/qtile/icons/python-white.png",
                       scale = "False",
                       mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(my_term)}
                       ),
             widget.Sep(
                       linewidth = 0,
                       padding = 6,
                       foreground = colors[2],
                       background = colors[0]
                       ),
              widget.GroupBox(
                       font = "Ubuntu Mono",
                       fontsize = 12,
                       margin_y = 3,
                       margin_x = 2,
                       padding_y = 5,
                       padding_x = 5,
                       borderwidth = 3,
                       active = colors[2],
                       inactive = colors[2],
                       rounded = False,
                       highlight_color = colors[1],
                       highlight_method = "line",
                       this_current_screen_border = colors[6],
                       this_screen_border = colors [4],
                       other_current_screen_border = colors[6],
                       other_screen_border = colors[4],
                       foreground = colors[2],
                       background = colors[0]
                       ),
              widget.Notify(
                       foreground = colors[2],
                       background = colors[4],
                       padding = 5
              ),
              widget.Prompt(
                       prompt = prompt,
                       font = "Ubuntu Mono",
                       padding = 10,
                       foreground = colors[2],
                       background = colors[4],
                       ),
              widget.Sep(
                       linewidth = 0,
                       padding = 40,
                       foreground = colors[2],
                       background = colors[0]
                       ),
              widget.WindowName(
                       foreground = colors[7],
                       background = colors[0],
                       padding = 0
                       ),
              widget.Systray(
                       background = colors[0],
                       padding = 5
                       ),
              widget.Sep(
                       linewidth = 0,
                       padding = 6,
                       foreground = colors[0],
                       background = colors[0]
                       ),
             widget.Net(
                       interface = "wlp0s20f3",
                       format = '{down} ↓↑{up}',
                       foreground = colors[7],
                       background = colors[4],
                       padding = 2
                       ),
              widget.Sep(
                       linewidth = 0,
                       padding = 6,
                       foreground = colors[0],
                       background = colors[4]
                       ),
              widget.TextBox(
                       text = '\uf0a0',
                       foreground = colors[7],
                       background = colors[4],
                       padding = 0,
                       font = my_fonts[5],
                       fontsize = 20
                       ),
              widget.DF(
                       background = colors[4],
                       padding = 5,
                       measure = 'G',
                       partition = '/',
                       format = '{p} {r:.0f}%',
                       visible_on_warn = False,
                       mouse_callbacks = {'Button1': lambda qtile: qtile.cmd_spawn(my_term + ' -t=float -e=ranger')},
              ),
              widget.Sep(
                       linewidth = 0,
                       padding = 6,
                       foreground = colors[0],
                       background = colors[4]
                       ),
              widget.TextBox(
                       text = "\uf0c7",
                       font = my_fonts[5],
                       foreground = colors[7],
                       background = colors[4],
                       padding = 0,
                       fontsize = 20
                       ),
              widget.Memory(
                       foreground = colors[7],
                       background = colors[4],
                       mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(my_term + ' -e htop')},
                       padding = 5
                       ),
              widget.Sep(
                       linewidth = 0,
                       padding = 6,
                       foreground = colors[0],
                       background = colors[4]
                       ),
              widget.TextBox(
                       text = "\uf2db",
                       font = my_fonts[5],
                       padding = 2,
                       foreground = colors[7],
                       background = colors[4],
                       fontsize = 20
                       ),
              widget.CPU(
                       foreground = colors[7],
                       background = colors[4],
                       kouse_callbacks = {'Button2': lambda: qtile.cmd_spawn(my_term + ' -e htop')},
                       padding = 5
                       ),
              widget.Sep(
                       linewidth = 0,
                       padding = 6,
                       foreground = colors[0],
                       background = colors[4]
                       ),
              widget.TextBox(
                       text = "\uf241",
                       font = my_fonts[5],
                       padding = 2,
                       foreground = colors[7],
                       background = colors[4],
                       fontsize = 20
                       ),
              widget.Battery(
                       foreground = colors[7],
                       background = colors[4],
                       padding = 5
              ),
              widget.Sep(
                       linewidth = 0,
                       padding = 6,
                       foreground = colors[0],
                       background = colors[4]
                       ),
              widget.TextBox(
                       text = "\uf185",
                       font = my_fonts[5],
                       padding = 2,
                       foreground = colors[7],
                       background = colors[4],
                       fontsize = 20
                       ),
              widget.Backlight(
                       foreground = colors[7],
                       background = colors[4],
                       padding = 5,
                       brightness_file = '/sys/class/backlight/intel_backlight/brightness',
                       backlight_name = 'intel_backlight'
              ),
              widget.Sep(
                       linewidth = 0,
                       padding = 6,
                       foreground = colors[0],
                       background = colors[4]
                       ),
              widget.TextBox(
                      text = "\uf028",
                      font = my_fonts[5],
                      foreground = colors[7],
                      background = colors[4],
                      fontsize = 20,
                      padding = 0
                      ),
              widget.Volume(
                       foreground = colors[7],
                       background = colors[4],
                       padding = 5
                       ),
              widget.Sep(
                       linewidth = 0,
                       padding = 6,
                       foreground = colors[0],
                       background = colors[4]
                       ),
              widget.CurrentLayoutIcon(
                       custom_icon_paths = [os.path.expanduser("~/.config/qtile/icons")],
                       foreground = colors[0],
                       background = colors[4],
                       padding = 0,
                       scale = 0.7
                       ),
              widget.Sep(
                       linewidth = 0,
                       padding = 6,
                       foreground = colors[0],
                       background = colors[4]
                       ),
              widget.Clock(
                       foreground = colors[7],
                       background = colors[4],
                       format = "%A, %B %d - %H:%M "
                       ),
             widget.Sep(
                       linewidth = 0,
                       padding = 6,
                       foreground = colors[2],
                       background = colors[4]
                       ),
              widget.QuickExit(
                        default_text = '⏻',
                       foreground = colors[7],
                       background = colors[4]
                       )
              ]
    return widgets_list

def init_widgets_screen1():
    widgets_screen1 = init_widgets_list()
    del widgets_screen1[8:9]               # Slicing removes unwanted widgets (systray) on Monitors 1,3
    return widgets_screen1

def init_widgets_screen2():
    widgets_screen2 = init_widgets_list()
    return widgets_screen2                 # Monitor 2 will display all widgets in widgets_list

def init_screens():
    return [
        Screen(top=bar.Bar(widgets=init_widgets_screen1(), margin=[5, 8, 0, 8], opacity=1.0, size=20)),
        Screen(top=bar.Bar(widgets=init_widgets_screen2(), margin=[5, 8, 0, 8], opacity=1.0, size=20))
    ]

if __name__ in ["config", "__main__"]:
    screens = init_screens()
    widgets_list = init_widgets_list()
    # widgets_screen1 = init_widgets_screen1()
    # widgets_screen2 = init_widgets_screen2()


mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False

floating_layout = layout.Floating(float_rules=[
    *layout.Floating.default_float_rules,
    Match(wm_class='kdenlive'),  # kdenlive
])
auto_fullscreen = True
focus_on_window_activation = "smart"

@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/autostart.sh'])

# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
