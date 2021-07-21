
# CUSTOM CONFIGURATION FROM:
#  - Roberto Carrichi.
##############################

import os, subprocess
from typing import List  # noqa: F401
from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

# PERSONALIZADOS!
# from settings.keys import mod, keys 
# from settings.groups import groups
# from settings.layouts import layouts, floating_layout
# from settings.widgets import widget_defaults, extension_defaults
# from settings.screens import screens
# from settings.mouse import mouse
# from settings.path import qtile_path

mod = "mod4"
terminal = guess_terminal()

keys = [Key(key[0], key[1], *key[2:]) for key in [
    # Switch between windows
    # Cambiar a ventana activa de la izquierda.
    ([mod], "h", lazy.layout.left()),
    # Cambiar a la ventana activa de la derecha.
    ([mod], "l", lazy.layout.right()),
    # Cambiar ventana activa de abajo.
    ([mod], "j", lazy.layout.down()),
    # Cambiar ventana activa de arriba.
    ([mod], "k", lazy.layout.up()),
    # Cambiar  de ventana sin direccion.
    ([mod], "space", lazy.layout.next()),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    # Mover ventana activa a la izquierda.
    ([mod, "shift"], "h", lazy.layout.shuffle_left()),
    # Mover ventana a la derecha.
    ([mod, "shift"], "l", lazy.layout.shuffle_right()),
    # Mover ventana abajo.
    ([mod, "shift"], "j", lazy.layout.shuffle_down()),
    # Mover ventana arriba.
    ([mod, "shift"], "k", lazy.layout.shuffle_up()),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    # Agrandar la ventana activa hacia la izquierda.
    ([mod, "control"], "h", lazy.layout.grow_left()),
    # Agrandar la ventana activa hacia la derecha.
    ([mod, "control"], "l", lazy.layout.grow_right()),
    # Agrandar la ventana activa hacia abajo.
    ([mod, "control"], "j", lazy.layout.grow_down()),
    # Agrandar la ventana activa hacia arriba.
    ([mod, "control"], "k", lazy.layout.grow_up()),
    # Colocar TODAS las ventanas a tu tamanio original.
    ([mod], "n", lazy.layout.normalize()),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    # Intercambiar si "bloquear" la ventana para que pueda divirse o si no.
    # Si un pedazo de la ventana esta bloqueda solo se generaran nuevas pestanias.
    #     , desc="Toggle between split and unsplit sides of stack"),
    ([mod, "shift"], "Return", lazy.layout.toggle_split()),
    
    # Toggle between different layouts as defined below
    # Intercambiar entre los diferentes tipos de plantillas "Maximizada", "Por columnas", etc.
    ([mod], "Tab", lazy.next_layout()),
    # Matar una ventana.
    ([mod], "q", lazy.window.kill()),

    # Reiniciar Qtile.
    ([mod, "control"], "r", lazy.restart()),

    # Apagar Qtile. "Cerrar sesion"
    ([mod, "control"], "q", lazy.shutdown()),

    # Comando para ejecutar un unico comando.
    ([mod], "r", lazy.spawncmd()),
    
    # Cambiar de monitores
    ([mod], "period", lazy.prev_screen()),

    #################################
    # COMANDOS SOBRE APLICACIONES   #
    #################################

    # Comando para crear una nueva consola.
    ([mod], "Return", lazy.spawn("alacritty")),

    # Mostrar menu de aplicaciones TODAS LAS APLICACIONES
    ([mod], "m", lazy.spawn("rofi -show drun")),

    # Mostrar las aplicaciones activas.
    ([mod, "shift"], "m", lazy.spawn("rofi -show")),
    
    # Abrir navegador.
    ([mod], "u", lazy.spawn("brave")),

    # Abrir explorador de archivos.
    ([mod], "y", lazy.spawn("thunar")),

    # Abrir explorador de archivos por consola.
    ([mod, "shift"], "y", lazy.spawn("ranger")),

    # Screenshot
    #([mod], "s", lazy.spawn("scrot")),
    #([mod, "shift"], "s", lazy.spawn("scrot -s")),

    #####################################
    # COMANDOS SOBRE EL HARDWARE
    ####################################

    # Configuracion de volumen
    ([mod, "control"], "s", lazy.spawn("pavucontrol")),
    # Volume
    ([mod, "shift"], "o", lazy.spawn(
        "pamixer --decrease 5"
    )),
    ([mod, "shift"], "i", lazy.spawn(
        "pamixer --decrease 5"
    )),
    ([mod, "control"], "p", lazy.spawn(
        "pamixer --toggle-mute"
    )),

    # Brightness
    ([mod], "o", lazy.spawn("brightnessctl set +10%")),
    ([mod], "i", lazy.spawn("brightnessctl set 10%-")),

    # Distribuciones de teclado
    ([mod], "p", lazy.widget["keyboardlayout"].next_keyboard()),
]]

__groups = {
    # 1:Group("TERM", matches=[Match(wm_class=["alacritty"])]),
    1:Group("TERM"),
    # 2:Group("WWW", matches=[Match(wm_class=["Brave"])]),
    2:Group("WWW"),
    3:Group("FILES", matches=[Match(wm_class=["thunar"])]),
}
groups = [__groups[num] for num in __groups]

def get_group_key(name):
    return [k for k, g in __groups.items() if g.name == name][0]

for i in groups:
    keys.extend([
        # Cambiar de espacio de trabajo con los numeros.
        # mod + numero = Cambiar a el grupo indicado.
        Key([mod], str(get_group_key(i.name)), lazy.group[i.name].toscreen()),

        # Enviar ventana hacia un worksace en especifico.
        # mod + shift + numero = mover la ventana activa a un grupo definido.
        # Key([mod], "shift"], actual_key, lazy.window.togroup(group.name, switch_group=True)),
        Key([mod, "shift"], str(get_group_key(i.name)), lazy.window.togroup(i.name)),

        # Or, use below if you prefer not to switch to that group.
        # # mod1 + shift + letter of group = move focused window to group
        # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
        #     desc="move focused window to group {}".format(i.name)),
    ])

layouts = [
    layout.Columns(
        border_focus='#A7D0CD',
        border_width=3,
        margin=6,
    ),
    layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font='sans',
    fontsize=14,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                # widget.CurrentLayout(),
                widget.GroupBox(),
                widget.Prompt(),
                widget.WindowName(foreground="#7C83FD"),
                widget.Chord(
                    chords_colors={
                        'launch': ("#A7D0CD", "#ffffff"),
                    },
                    name_transform = lambda name: name.upper(),
                ),
                # widget.TextBox("Meethelight", name="default"),
                # widget.TextBox("Press &lt;M-r&gt; to spawn", foreground="#d75f5f"),
                # widget.Systray(),
                # widget.KeyboardLayout(configured_keyboards=['us']),
                widget.Clock(format='%B %d, %Y %H:%M'),
            ],
            24,
        ),
    ),
    Screen(
        top=bar.Bar(
            [
                # widget.CurrentLayout(),
                widget.GroupBox(),
                widget.Prompt(),
                widget.WindowName(foreground="#7C83FD"),
                widget.Chord(
                    chords_colors={
                        'launch': ("#A7D0CD", "#ffffff"),
                    },
                    name_transform = lambda name: name.upper(),
                ),
                # widget.TextBox("Meethelight", name="default"),
                # widget.TextBox("Press &lt;M-r&gt; to spawn", foreground="#d75f5f"),
                # widget.Systray(),
                # widget.KeyboardLayout(configured_keyboards=['us']),
                widget.Clock(format="%B %d, %Y %H:%M"),
            ],
            24,
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = False
# Que es esto de cursor_warp?
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
])
auto_fullscreen = True
focus_on_window_activation = "smart"
# focus_on_window_activation = "urgent"

# COMANDOS QUE QUIERO QUE SE EJECUTEN AL MOMENTO DE INICIAR LA COMPUTADORA
############################################################################

autostart = [
    # Carcar el fondo de pantalla.
    "feh --bg-fill $HOME/wallpaper.jpg",
    # Aplicar transparencia.
    "picom &",
]

for command in autostart:
    os.system(command)

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
