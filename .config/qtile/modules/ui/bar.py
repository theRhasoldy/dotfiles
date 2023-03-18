from libqtile.config import Screen
from libqtile import bar, widget

from .spotify import Spotify
from ..utils.theme import colors

space = 10

screens = [
    Screen(
        bottom=bar.Bar(
            [
                widget.CurrentLayoutIcon(),
                widget.GroupBox(
                    active="#b75566", inactive="#FFD5CD20", highlight_method="text"
                ),
                widget.Spacer(),
                Spotify(),
                widget.Spacer(),
                widget.Systray(),
                widget.Clock(format="%a %b %d"),
                widget.Clock(format="%H:%M"),
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
