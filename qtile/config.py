
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
    #([mod], "space", lazy.layout.next()),
    ([mod1], "Tab", lazy.layout.next()),

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
    ([mod, "shift"], "u", lazy.spawn("brave")),

    # Abrir explorador de archivos.
    ([mod], "y", lazy.spawn("thunar")),

    # Abrir explorador de archivos por consola.
    ([mod, "shift"], "y", lazy.spawn("ranger")),

    # Screenshot
    # Screenshot con autoguardado en portapapeles
    ([mod], "s", lazy.spawn("scrot -s -f '/tmp/ss_%Y-%m-%d-%T_$wx$h.png' -e 'xclip -selection clipboard -target image/png -i $f' ")),
    # Screenshot que solo guarda la imagen
    ([mod, "shift"], "s", lazy.spawn("scrot -s -f 'ss_%Y-%m-%d-%T_$wx$h.png' -e 'mv $f img/ss/' ")),

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
    ([mod, "control"], "o", lazy.spawn("brightnessctl set +5%")),
    ([mod, "control"], "i", lazy.spawn("brightnessctl set 5%-")),

    # Distribuciones de teclado
    ([mod1], "space", lazy.widget["keyboardlayout"].next_keyboard()),

    # Suspender computadora.
    ([mod, "control"], "x", lazy.spawn("systemctl suspend")),

    # Reiniciar computadora.
    ([mod, "control"], "c", lazy.spawn("reboot")),

    # Apagar computadora.
    ([mod, "control"], "z", lazy.spawn("shutdown now")),
]]

__groups = {
    1:Group("", matches=[Match(wm_class=["Brave-browser"]), Match(wm_class=["firefox"])]),
    2:Group(""),
    3:Group("", matches=[Match(wm_class=["thunar"])]),
    4:Group(""),
    5:Group(""),
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
    #layout.MonadTall(
        #border_focus='#A7D0CD',
        #border_width=3,
        #margin=6,
    #), 
    layout.Columns(
        border_focus='#A7D0CD',
        border_width=3,
        margin=3,
    ),
    layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    
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
                    fontsize=48,
                    foreground="#DDDDDD",
                    background="#0F044C",
                ),
                widget.TextBox(
                    text=" ",
                    fontsize=34,
                    padding=-8,
                    foreground="#0F044C",
                    background="#396EB0",
                ),
                widget.GroupBox(
                    fontsize=32,
                    active="#DDDDDD",
                    inactive="#30475E",
                    padding=4,
                    borderwidth=0,
                    this_current_screen_border="#562349",
                    other_screen_border="#FFE9C5",
                    background="#396EB0",
                ),
                widget.TextBox(
                    text="",
                    fontsize=34,
                    padding=0,
                    foreground="#396EB0",
                    background='#DADDFC',
                ),
                widget.TextBox(
                    text="",
                    fontsize=52,
                    padding=5,
                    background="#DADDFC",
                    foreground="#2E4C6D", #texto
                ),
                widget.KeyboardLayout(
                    configured_keyboards=['us', 'latam'],
                    background="#DADDFC",
                    foreground="#2E4C6D", #texto
                    padding=6,
                ),
                widget.TextBox(
                    text="",
                    fontsize=34,
                    padding=0,
                    foreground="#DADDFC",
                ),
                widget.WindowName(fontsize=15, foreground="#DDDDDD"),

                # DERECHO
                #############

                widget.TextBox(
                    text="",
                    fontsize=45,
                    padding=0,
                    foreground="#E9D5DA",
                ),
                widget.TextBox(
                    text="墳",
                    fontsize=30,
                    padding=0,
                    background="#E9D5DA",
                    foreground="#1B1717",
                ),widget.Volume(
                    fontsize=16,
                    padding=10,
                    foreground="#1B1717",
                    background="#E9D5DA",
                ),
                widget.TextBox(
                    text="",
                    fontsize=45,
                    padding=0,
                    background="#E9D5DA",
                    foreground="#363062",
                ),
                widget.Battery(
                    full_char='',
                    empty_char='',
                    charge_char='',     
                    discharge_char='',
                    unknown_char='',
                    low_foreground="#D83A56",
                    format='{char} {percent:2.0%}',
                    background="#363062",
                    foreground="#E9D5DA",
                    fontsize=16,
                ),
                widget.TextBox(
                    text="",
                    fontsize=45,
                    padding=0,
                    background="#363062",
                    foreground="#750550",
                ),
                widget.TextBox(
                    text="",
                    fontsize=32,
                    background="#750550",
                    foreground="#E9D5DA",
                ),
                widget.Clock(
                    format=" %B %d, %Y ",
                    fontsize=15,
                    background="#750550",
                    foreground="#E9D5DA",
                ),
                widget.TextBox(
                    text="",
                    fontsize=45,
                    padding=0,
                    background="#750550",
                    foreground="#4C0027",
                ),
                widget.TextBox(
                    text="",
                    fontsize=32,
                    background="#4C0027",
                    foreground="#E9D5DA",
                ),
                widget.Clock(
                    format=" %H:%M ",
                    fontsize=16,
                    background="#4C0027",
                    foreground="#E9D5DA",
                ),
                widget.TextBox(
                    text="",
                    fontsize=45,
                    padding=0,
                    background="#4C0027",
                    foreground="#383E56",
                ),
                widget.NetGraph(
                    fill_color='#827397.3',
                    graph_color='#E9D5DA',
                    border_color='#383E56',
                    border_with=0,
                    margin_x=0,
                    margin_y=0,
                ),
            ],
            26,
            opacity=0.9,
            background="#383E56",
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
                    background="#396EB0",
                ),
                widget.GroupBox(
                    fontsize=32,
                    active="#DDDDDD",
                    inactive="#30475E",
                    padding=4,
                    borderwidth=0,
                    this_current_screen_border="#562349",
                    other_screen_border="#FFE9C5",
                    background="#396EB0",
                ),
                widget.TextBox(
                    text="",
                    fontsize=34,
                    padding=0,
                    foreground="#396EB0",
                    background='#DADDFC',
                ),
                widget.TextBox(
                    text="",
                    fontsize=52,
                    padding=5,
                    background="#DADDFC",
                    foreground="#2E4C6D", #texto
                ),
                widget.KeyboardLayout(
                    configured_keyboards=['us', 'latam'],
                    background="#DADDFC",
                    foreground="#2E4C6D", #texto
                    padding=6,
                ),
                widget.TextBox(
                    text="",
                    fontsize=34,
                    padding=0,
                    foreground="#DADDFC",
                ),
                widget.WindowName(fontsize=15, foreground="#DDDDDD"),

                # DERECHO
                #############

                widget.TextBox(
                    text="",
                    fontsize=45,
                    padding=0,
                    foreground="#E9D5DA",
                ),
                widget.TextBox(
                    text="墳",
                    fontsize=30,
                    padding=0,
                    background="#E9D5DA",
                    foreground="#1B1717",
                ),widget.Volume(
                    fontsize=16,
                    padding=10,
                    foreground="#1B1717",
                    background="#E9D5DA",
                ),
                widget.TextBox(
                    text="",
                    fontsize=45,
                    padding=0,
                    background="#E9D5DA",
                    foreground="#363062",
                ),
                widget.Battery(
                    full_char='',
                    empty_char='',
                    charge_char='',     
                    discharge_char='',
                    unknown_char='',
                    low_foreground="#D83A56",
                    format='{char} {percent:2.0%}',
                    background="#363062",
                    foreground="#E9D5DA",
                    fontsize=16,
                ),
                widget.TextBox(
                    text="",
                    fontsize=45,
                    padding=0,
                    background="#363062",
                    foreground="#750550",
                ),
                widget.TextBox(
                    text="",
                    fontsize=32,
                    background="#750550",
                    foreground="#E9D5DA",
                ),
                widget.Clock(
                    format=" %B %d, %Y ",
                    fontsize=15,
                    background="#750550",
                    foreground="#E9D5DA",
                ),
                widget.TextBox(
                    text="",
                    fontsize=45,
                    padding=0,
                    background="#750550",
                    foreground="#4C0027",
                ),
                widget.TextBox(
                    text="",
                    fontsize=32,
                    background="#4C0027",
                    foreground="#E9D5DA",
                ),
                widget.Clock(
                    format=" %H:%M ",
                    fontsize=16,
                    background="#4C0027",
                    foreground="#E9D5DA",
                ),
                widget.TextBox(
                    text="",
                    fontsize=45,
                    padding=0,
                    background="#4C0027",
                    foreground="#383E56",
                ),
                widget.NetGraph(
                    fill_color='#827397.3',
                    graph_color='#E9D5DA',
                    border_color='#383E56',
                    border_with=0,
                    margin_x=0,
                    margin_y=0,
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
    # Cargar el fondo de pantalla, se elige de forma aleatoria de la carpeta...
    "feh --no-fehbg --bg-fill img/wallpapers/$(echo $(ls img/wallpapers | sort -R | tail -n 1))",
    # Aplicar transparencia.
    "picom &",
]

for command in autostart:
    os.system(command)

wmname = "by:Carrichi"
