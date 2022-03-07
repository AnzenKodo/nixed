from libqtile.config import Click, Drag, Match
from libqtile.lazy import lazy
from libqtile import layout

from variables.commands import mod

# Float window config
floating_layout = layout.Floating(
    float_rules=[
      # Run the utility of `xprop` to see the wm class and name of an X client.
      *layout.Floating.default_float_rules,
      Match(wm_class='confirmreset'),  # gitk
      Match(wm_class='makebranch'),  # gitk
      Match(wm_class='maketag'),  # gitk
      Match(wm_class='ssh-askpass'),  # ssh-askpass
      Match(title='branchdialog'),  # gitk
      Match(title='pinentry'),  # GPG key password entry
  ]
)

# Drag floating layouts with cursor.
mouse = [
    Drag([mod], 'Button1', lazy.window.set_position_floating(),
         start=lazy.window.get_position(),
         desc="Make window float & Move the window"),
    Drag([mod], 'Button3', lazy.window.set_size_floating(),
        start=lazy.window.get_size(), desc="Set window size"),
    Click([mod], 'Button2', lazy.window.bring_to_front(),
          "Bring window to front")
]
