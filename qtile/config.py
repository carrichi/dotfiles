
# CUSTOM CONFIGURATION FROM:
#  - Roberto Carrichi.
##############################

import os, subprocess
from typing import List  # noqa: F401
from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

mod = "mod4" # SUPER (TECLA WINDOWS)
mod1 = "mod1" # ALT

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

    # Intercambiar si "bloquear" la ventana para que pueda divirse o si no.
    # Si un pedazo de la ventana esta bloqueda solo se generaran nuevas pestanias.
    #     , desc="Toggle between split and unsplit sides of stack"),
    ([mod, "shift"], "Return", lazy.layout.toggle_split()),
    
    # Intercambiar entre los diferentes tipos de plantillas "Maximizada", "Por columnas", etc.
    ([mod], "Tab", lazy.next_layout()),

    # Matar una ventana.
    ([mod], "q", lazy.window.kill()),

    # Reiniciar Qtile.
    ([mod, "control"], "r", lazy.restart()),

    # Apagar Qtile. "Cerrar sesion"
    ([mod, "control"], "q", lazy.shutdown()),

    # Apagar computadora.
    ([mod, "control"], "z", lazy.spawn("shutdown now")),

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
    ([mod], "m", lazy.spawn("rofi -show drun -show-icons")),

    # Mostrar las aplicaciones activas.
    ([mod, "shift"], "m", lazy.spawn("rofi -show")),
    
    # Abrir navegador.
    ([mod], "u", lazy.spawn("firefox")),
    ([mod, "control"], "u", lazy.spawn("brave")),

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
    ([mod], "o", lazy.spawn(
        "amixer -D pulse sset Master 10%+"
    )),
    ([mod], "i", lazy.spawn(
        "amixer -D pulse sset Master 10%-"
    )),
    ([mod], "p", lazy.spawn(
        "amixer -D pulse sset Master toggle"
    )),

    # Brightness
    ([mod, "control"], "o", lazy.spawn("brightnessctl set +10%")),
    ([mod, "control"], "i", lazy.spawn("brightnessctl set 10%-")),

    # Distribuciones de teclado
    ([mod1], "space", lazy.widget["keyboardlayout"].next_keyboard()),
]]

__groups = {
    1:Group(""),
    # 2:Group("", matches=[Match(wm_class=["Brave-browser"])], layouts=[layout.Max()]),
    2:Group("", matches=[Match(wm_class=["Brave-browser"]), Match(wm_class=["firefox"])]),
    3:Group("", matches=[Match(wm_class=["thunar"])]),
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
        Key([mod, "shift"], str(get_group_key(i.name)), lazy.window.togroup(i.name)),
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

                widget.TextBox(
                    text="",
                    fontsize=40,
                    foreground="#DDDDDD",
                    background="#0F044C",
                ),
                widget.TextBox(
                    text=" ",
                    fontsize=38,
                    padding=-8,
                    foreground="#0F044C",
                    background="#AD6989",
                ),
                widget.GroupBox(
                    fontsize=24,
                    active="#DBC6EB",
                    inactive="#30475E",
                    borderwidth=0,
                    background="#AD6989",
                    padding=5,
                    this_current_screen_border="#562349",
                    other_screen_border="#FFE9C5",
                ),
                widget.Prompt(
                    fontsize=15,
                    prompt=" Ejecutar: ",
                    background="#AD6989",
                    foreground="#DDDDDD",
                ),
                widget.TextBox(
                    text="  ",
                    fontsize=38,
                    padding=-8,
                    foreground="#AD6989",
                ),
                widget.WindowName(fontsize=12.8, foreground="#DDDDDD"),
                widget.TextBox(
                    text=" ",
                    fontsize=45,
                    padding=-8,
                    foreground="#77ACF1",
                ),
                widget.TextBox(
                    text="墳 ",
                    fontsize=30,
                    padding=0,
                    background="#77ACF1",
                    foreground="#1B1717",
                ),
                widget.Volume(
                    fontsize=16,
                    foreground="#1B1717",
                    background="#77ACF1",
                ),
                widget.TextBox(
                    text=" ",
                    fontsize=45,
                    padding=-8,
                    background="#77ACF1",
                    foreground="#A685E2",
                ),
                widget.TextBox(
                    text="",
                    fontsize=42,
                    background="#A685E2",
                    foreground="#30475E",
                ),
                widget.TextBox(
                    text=" ",
                    background="#A685E2",
                ),
                widget.KeyboardLayout(
                    configured_keyboards=['us', 'latam'],
                    background="#A685E2",
                    foreground="#30475E",
                ),
               widget.TextBox(
                    text=" ",
                    background="#A685E2",
                ),
               widget.TextBox(
                    text=" ",
                    fontsize=45,
                    padding=-8,
                    background="#A685E2",
                    foreground="#F5F7B2",
                ),
                widget.Battery(
                    full_char=" ",
                    empty_char=" ",
                    charge_char=" ",     
                    discharge_char=" ",
                    unknown_char=" ",
                    low_foreground="#D83A56",
                    format='{char} {percent:2.0%}',
                    background="#F5F7B2",
                    foreground="#1B1717",
                ),
                widget.TextBox(
                    text=" ",
                    fontsize=45,
                    padding=-8,
                    background="#F5F7B2",
                    foreground="#A6D6D6",
                ),
                widget.TextBox(
                    text="",
                    fontsize=28,
                    background="#A6D6D6",
                    foreground="#30475E",
                ),
                widget.Clock(
                    fmt="{}",
                    format=" %B %d, %Y ",
                    fontsize=15,
                    background="#A6D6D6",
                    foreground="#30475E",
                ),
                widget.TextBox(
                    text=" ",
                    fontsize=45,
                    padding=-8,
                    background="#A6D6D6",
                    foreground="#D6B0B1",
                ),
                widget.TextBox(
                    text="",
                    fontsize=28,
                    background="#D6B0B1",
                    foreground="#30475E",
                ),
                widget.Clock(
                    format=" %H:%M ",
                    fontsize=16,
                    background="#D6B0B1",
                    foreground="#30475E",
                ),

            ],
            24,
            opacity=0.85,
        ),
    ),
    Screen(
        top=bar.Bar(
            [
                widget.TextBox(
                    text="",
                    fontsize=48,
                    foreground="#DDDDDD",
                    background="#0F044C",
                ),
                widget.TextBox(
                    text=" ",
                    fontsize=34,
                    padding=-8,
                    foreground="#0F044C",
                    background="#AD6989",
                ),
                widget.GroupBox(
                    fontsize=32,
                    active="#DDDDDD",
                    inactive="#30475E",
                    padding=4,
                    background="#AD6989",
                    borderwidth=0,
                    this_current_screen_border="#562349",
                    other_screen_border="#FFE9C5",
                ),
                widget.TextBox(
                    text="  ",
                    fontsize=34,
                    padding=-8,
                    foreground="#AD6989",
                ),
                widget.WindowName(fontsize=15, foreground="#DDDDDD"),

                # DERECHO
                #############

                widget.TextBox(
                    text=" ",
                    fontsize=45,
                    padding=-8,
                    foreground="#77ACF1",
                ),
                widget.TextBox(
                    text="墳 ",
                    fontsize=30,
                    padding=0,
                    background="#77ACF1",
                    foreground="#1B1717",
                ),widget.Volume(
                    fontsize=16,
                    foreground="#1B1717",
                    background="#77ACF1",
                ),
                widget.TextBox(
                    text=" ",
                    fontsize=45,
                    padding=-8,
                    background="#77ACF1",
                    foreground="#A685E2",
                ),
                widget.TextBox(
                    text="",
                    fontsize=52,
                    background="#A685E2",
                    foreground="#30475E",
                ),
                widget.TextBox(
                    text=" ",
                    background="#A685E2",
                ),
                widget.KeyboardLayout(
                    configured_keyboards=['us', 'latam'],
                    background="#A685E2",
                    foreground="#30475E",
                ),
                widget.TextBox(
                    text=" ",
                    background="#A685E2",
                ),
                widget.TextBox(
                    text=" ",
                    fontsize=45,
                    padding=-8,
                    background="#A685E2",
                    foreground="#F5F7B2",
                ),
                widget.Battery(
                    full_char=" ",
                    empty_char=" ",
                    charge_char=" ",     
                    discharge_char=" ",
                    unknown_char=" ",
                    low_foreground="#D83A56",
                    format='{char} {percent:2.0%}',
                    background="#F5F7B2",
                    foreground="#1B1717",
                ),
                widget.TextBox(
                    text=" ",
                    fontsize=45,
                    padding=-8,
                    background="#F5F7B2",
                    foreground="#A6D6D6",
                ),
                widget.TextBox(
                    text="",
                    fontsize=32,
                    background="#A6D6D6",
                    foreground="#30475E",
                ),
                widget.Clock(
                    format=" %B %d, %Y ",
                    fontsize=15,
                    background="#A6D6D6",
                    foreground="#30475E",
                ),
                widget.TextBox(
                    text=" ",
                    fontsize=45,
                    padding=-8,
                    background="#A6D6D6",
                    foreground="#D6B0B1",
                ),
                widget.TextBox(
                    text="",
                    fontsize=32,
                    background="#D6B0B1",
                    foreground="#30475E",
                ),
                widget.Clock(
                    format=" %H:%M ",
                    fontsize=16,
                    background="#D6B0B1",
                    foreground="#30475E",
                ),
            ],
            26,
            opacity=0.9,
            background="#383E56",
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

# COMANDOS QUE QUIERO QUE SE EJECUTEN AL MOMENTO DE INICIAR LA COMPUTADORA
############################################################################

autostart = [
    # Carcar el fondo de pantalla.
    "feh --bg-fill $HOME/wallpaper.jpg",
    # Aplicar transparencia.
    "picom &",
    # Sincronizar reloj.
    # "ntpd -qg",
    # Guardar reloj en el hardware: hwclock -w
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
wmname = "Meethelight"
