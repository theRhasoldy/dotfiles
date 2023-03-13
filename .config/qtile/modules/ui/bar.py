from libqtile.config import Screen
from libqtile import bar, widget

from .spotify import Spotify

screens = [
    Screen(
        bottom=bar.Bar(
            [
                widget.CurrentLayout(),
                widget.Prompt(),
                widget.Chord(
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.GroupBox(
                    active="#b75566", inactive="#FFD5CD20", highlight_method="text"
                ),
                widget.Spacer(),
                Spotify(),
                widget.Spacer(),
                widget.TextBox("Rhasoldy", name="default"),
                widget.TextBox("Press &lt;M-r&gt; to spawn",
                               foreground="#d75f5f"),
                # NB Systray is incompatible with Wayland, consider using StatusNotifier instead
                # widget.StatusNotifier(),
                widget.Systray(),
                widget.Clock(format="%Y-%m-%d %a %I:%M %p"),
                widget.QuickExit(),
            ],
            26,
            background="#00000000",
        ),
    ),
]

widget_defaults = dict(
    font="Ubuntu semi-bold",
    fontsize=12,
    padding=5,
)
extension_defaults = widget_defaults.copy()
