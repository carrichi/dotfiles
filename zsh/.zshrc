# Lines configured by zsh-newuser-install
HISTFILE=~/.config/zsh/.histfile
HISTSIZE=200
SAVEHIST=400
setopt nomatch
unsetopt autocd beep extendedglob notify
bindkey -v
# End of lines configured by zsh-newuser-install

# CONFIGURACION DE PROMPT 
############################
autoload -U compinit promptinit
compinit
promptinit

# Colores:
# black, green, blue, cyan, red, yellow, magenta, white
autoload -U colors && colors

# Prompt izquierdo
# %n = Nombre de usuario
# %m = Nombre del ordenador activo
# $~ = Mostrar la carpeta activa desde sustituyendo /home/<user> por '~'.
# $d = Mostrar solo la carpeta actual.
PROMPT="%{$reset_color%} %{$fg_bold[cyan]%}%n%{$fg_bold[white]%} 🌀 %{$fg_bold[magenta]%}%m %{$fg_bold[white]%}%#%{$reset_color%} "
# Prompt derecho
RPROMPT="%{$reset_color%}%{$fg_bold[yellow]%} %1~ %{$fg_bold[white]%}<<< %{$reset_color%}"

# ALIAS PERZONALIZADOS
#########################
if [ -x /usr/bin/dircolors ]; then
    test -r $HOME/.dircolors && eval "$(dircolors -b $HOME/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
alias ll='ls -l';
alias la='ls -a';
alias lla='ls -la';
alias cterm='nvim ~/.config/alacritty/alacritty.yml';
alias czsh='nvim ~/.zshrc';
alias uzsh='source ~/.zshrc';
alias cvim='nvim ~/.config/nvim/init.vim';
alias ctmux='nvim $HOME/.config/tmux/.tmux.conf'
alias cl='clear';
alias v='nvim';
alias cat='bat';
# CONFIGURACION PARA 256 COLORES
###################################
export TERM=xterm-256color

neofetch
