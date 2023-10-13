# -*- coding: utf-8 -*-
import os
import socket
import subprocess
from libqtile import qtile
from libqtile.config import Click, Drag, Group, Key, Match, Screen, Rule
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook
from libqtile.lazy import lazy
from typing import List  # noqa: F401

mod = "mod4"                                     # Sets mod key to SUPER/WINDOWS
my_term = "alacritty"                             # My terminal of choice

if qtile.core.name == "wayland":
    term = my_term
elif qtile.core.name == "x11":
    term = my_term

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

group_names = [("", {'layout': 'monadtall'}),
               ("", {'layout': 'monadtall'}),
               ("", {'layout': 'monadtall'}),
               ("", {'layout': 'floating'}),
               ("", {'layout': 'floating'}),
               ("", {'layout': 'monadtall'}),
               ("", {'layout': 'floating'}),
               ("", {'layout': 'floating'}),
               ("", {'layout': 'floating'})]

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

# Themes
colors = ["#282828", # panel background
          "#665c54", # background for current screen tab #fbf1c7
          "#83a598", # font color for group names
          "#b8bb26", # border line color for current tab
          "#458588", # border line color for 'other tabs' and color for 'odd widgets'
          "#fe8019", # color for the 'even widgets'
          "#a89984", # window name
          "#fbf1c7"]

catppuccin = {
    "flamingo": "#F3CDCD",
    "mauve": "#DDB6F2",
    "pink": "#f5c2e7",
    "maroon": "#e8a2af",
    "red": "#f28fad",
    "peach": "#f8bd96",
    "yellow": "#fae3b0",
    "green": "#abe9b3",
    "teal": "#b4e8e0",
    "blue": "#96cdfb",
    "sky": "#89dceb",
    "white": "#d9e0ee",
    "gray": "#6e6c7e",
    "black": "#1a1826",
        }

my_fonts = {
        'JetBrainsMono': 'JetBrainsMono Nerd Font',
        'Terminess': 'TerminessTTF Nerd Font',
        'FontAwesome': 'Font Awesome 5 Free',
        'FontAwesomeSolid': 'Font Awesome 5 Free Solid',
}

prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())

##### DEFAULT WIDGET SETTINGS #####
widget_defaults = dict(
    font = my_fonts['JetBrainsMono'],
    fontsize = 16,
    padding = 2,
    forground=catppuccin["black"],
)
extension_defaults = widget_defaults.copy()

def init_widgets_list():
    widgets_list = [
        widget.TextBox(
        text="",
        padding=0,
        fontsize=30,
        foreground=catppuccin["mauve"],
        background="#00000000",
        ),
        widget.GroupBox(
                   font = my_fonts['JetBrainsMono'],
                   fontsize = 22,
                   margin_y = 3,
                   margin_x = 2,
                   padding_y = 8,
                   padding_x = 8,
                   inactive=catppuccin["black"],
                   highlight_color=[catppuccin["mauve"], catppuccin["mauve"]],
                   highlight_method = "line",
                   background=catppuccin["mauve"],
                   ),
        widget.TextBox(
            text="",
            padding=0,
            fontsize=30,
            foreground=catppuccin["mauve"],
            background="#00000000",
            ),
        widget.WindowName(
            fontsize=20,
            foreground=catppuccin["white"],
            opacity=0.8,
            ),
        widget.TextBox(
            text="",
            padding=0,
            fontsize=30,
            foreground=catppuccin["pink"],
            background="#00000000",
            ),
        widget.CurrentLayoutIcon(
            custom_icon_paths = [os.path.expanduser("~/.config/qtile/icons")],
            foreground = colors[0],
            background = catppuccin["pink"],
            padding = 0,
            scale = 0.7
            ),
        widget.TextBox(
            text="",
            padding=0,
            fontsize=30,
            foreground=catppuccin["pink"],
            background="#00000000",
            ),
        widget.TextBox(
            text="",
            padding=0,
            fontsize=30,
            foreground=catppuccin["sky"],
            background="#00000000",
            ),
        widget.Volume(
            fmt="墳 {}",
            mute_command="amixer -D pulse set Master toggle",
            foreground=catppuccin["black"],
            background=catppuccin["sky"],
            ),
        widget.TextBox(
            text="",
            padding=0,
            fontsize=30,
            foreground=catppuccin["sky"],
            background="#00000000",
            ),
         widget.TextBox(
            text="",
            padding=0,
            fontsize=30,
            foreground=catppuccin["peach"],
            background="#00000000",
            ),
        widget.CPU(
            format=" {load_percent:04}%",
            foreground=catppuccin["black"],
            background=catppuccin["peach"],
            ),
        widget.Memory(
            format="{MemUsed: .0f}M",
            foreground = catppuccin["black"],
            background = catppuccin["peach"],
            padding = 5
        ),
        widget.DF(
            foreground = catppuccin["black"],
            background = catppuccin["peach"],
            padding = 5,
            measure = 'G',
            partition = '/',
            format = ' {p} {r:.0f}%',
            visible_on_warn = False,
            mouse_callbacks = {'Button1': lambda qtile: qtile.cmd_spawn(my_term + ' -t=float -e=ranger')},
        ),
        widget.TextBox(
            text="",
            padding=0,
            fontsize=30,
            foreground=catppuccin["peach"],
            background="#00000000",
            ),
        widget.TextBox(
            text="",
            padding=0,
            fontsize=30,
            foreground=catppuccin["maroon"],
            background="#00000000",
            ),
        widget.Clock(
            format = "%A, %B %d - %H:%M ",
            foreground=catppuccin["black"],
            background=catppuccin["maroon"],
            ),
        widget.TextBox(
            text="",
            padding=0,
            fontsize=30,
            foreground=catppuccin["maroon"],
            background="#00000000",
            ),
        widget.TextBox(
            text="",
            padding=0,
            fontsize=30,
            foreground=catppuccin["teal"],
            background="#00000000",
            ),
        widget.Battery(
            foreground = catppuccin["black"],
            background = catppuccin["teal"],
            padding = 5,
            charge_char = "",
            discharge_char = "",
            low_foreground = catppuccin["red"],
            low_percentage = 0.2,
            format = " {percent:2.0%}",
        ),
        widget.Backlight(
            format = " {percent:2.0%}",
            foreground = catppuccin["black"],
            background = catppuccin["teal"],
            padding = 5,
            brightness_file = '/sys/class/backlight/intel_backlight/brightness',
            backlight_name = 'intel_backlight'
        ),
        widget.TextBox(
            text="",
            padding=0,
            fontsize=30,
            foreground=catppuccin["teal"],
            background="#00000000",
            ),
        widget.Systray(
            padding = 5
        ),
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
#        Screen(top=bar.Bar(widgets=init_widgets_screen1(), margin=[5, 8, 0, 8], opacity=1.0, size=20)),
        Screen(top=bar.Bar(widgets=init_widgets_screen2(), margin=[5, 8, 0, 8], background="#00000000", size=22))
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
dgroups_app_rules = [
    Rule(Match(wm_class=["firefox"]), group=""),
    Rule(Match(wm_class=["dbeaver"]), group=""),
    Rule(Match(wm_class=["kdenlive"]), group=""),
    Rule(Match(wm_class=["chromium"]), group=""),
]  # type: List

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
