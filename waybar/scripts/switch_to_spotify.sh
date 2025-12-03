#!/bin/bash

# Verifica se o Spotify está rodando
SPOTIFY_PID=$(pgrep spotify)
if [ -z "$SPOTIFY_PID" ]; then
    # Se o Spotify não estiver rodando, inicia ele
    spotify &
    exit 0
fi

# Obtém informações dos clientes (janelas) abertos com hyprctl
CLIENTS=$(hyprctl clients -j)

# Procura pela janela do Spotify 
WORKSPACE=$(echo "$CLIENTS" | jq -r '.[] | select(.class == "spotify") | .workspace.id')

# Se encontrou um workspace, muda para ele
if [ -n "$WORKSPACE" ]; then
    hyprctl dispatch workspace "$WORKSPACE"
else
    # Se não encontrou, opcionalmente inicia o Spotify
    spotify &
fi
