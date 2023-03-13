from libqtile.config import Group, Match, DropDown, ScratchPad

groups = [
    Group(
        "1",
        label="󰣐",
        matches=[
            Match(wm_class="vivaldi-snapshot"),
        ],
        layout="stack",
    ),
    Group("2", label="二", layout="monadtall"),
    Group("3", label="三", layout="columns"),
    Group(
        "4",
        label="四",
        matches=[
            Match(wm_class="discord"),
            Match(wm_class="zoom"),
            Match(wm_class="teams"),
            Match(wm_class="whatsdesk"),
        ],
        layout="stack",
    ),
    Group("5", label="五", matches=[
          Match(wm_class="youtube music")], layout="stack"),
]

groups.append(
    ScratchPad(
        "s",
        [
            DropDown(
                "spad",
                "kitty --class spad",
                width=0.6,
                height=0.8,
                x=0.2,
                y=0.1,
                on_focus_lost_hide=False,
            ),
            DropDown(
                "pop",
                "kitty --class pop",
                width=0.4,
                height=0.08,
                x=0.3,
                y=0.02,
                on_focus_lost_hide=False,
            ),
            DropDown(
                "spotify",
                "spotify",
                width=0.6,
                height=0.8,
                x=0.2,
                y=0.1,
            ),
        ],
    ),
)
