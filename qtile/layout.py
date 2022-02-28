from libqtile import layout
from libqtile.config import Match
from style import colors

layout_theme = {
    'border_width': 2,
    'border_focus': colors[1]
}

layouts = [
    layout.Columns(**layout_theme),
    layout.Max()
]

floating_layout = layout.Floating(
    float_rules=[
      *layout.Floating.default_float_rules,
      Match(wm_class='confirmreset'),  # gitk
      Match(wm_class='makebranch'),  # gitk
      Match(wm_class='maketag'),  # gitk
      Match(wm_class='ssh-askpass'),  # ssh-askpass
      Match(title='branchdialog'),  # gitk
      Match(title='pinentry'),  # GPG key password entry
  ]
)
