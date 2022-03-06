from typing import List

# If a window requests to be fullscreen, it is automatically fullscreened.
auto_fullscreen = True
# When clicked, should the window be brought to the front or not.
bring_front_click = False
# If true, the cursor follows the focus as directed by the keyboard.
cursor_warp = False
# A function which generates group binding hotkeys.
dgroups_key_binder = None
# A list of Rule objects which can send windows to various groups based on
# matching criteria.
dgroups_app_rules = []  # type: List
# Behavior of the _NET_ACTIVATE_WINDOW message sent by applications
# urgent: urgent flag is set for the window
# focus: automatically focus the window
# smart: automatically focus if the window is in the current group
# never: never automatically focus any window that requests it
focus_on_window_activation = 'smart'
# Controls whether or not focus follows the mouse around as it moves
# across windows in a layout.
follow_mouse_focus = False
# Controls whether or not to automatically reconfigure screens when there are
# changes in randr output configuration.
reconfigure_screens = True
# We're lying here. We may as well just lie and say that we're a working one by
# default. We choose LG3D to maximize irony: it is a 3D non-reparenting WM
# written in java that happens to be on java's whitelist.
wmname = 'LG3D'
# If things like steam games want to auto-minimize themselves when losing focus
# should Qtile respect this or not?
auto_minimize = True
