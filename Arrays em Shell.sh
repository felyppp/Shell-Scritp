#!/bin/bash
echo "Olá Mundo"

MUNDO=("Shell Script" "Bash" "GNU" "Linux" "Debian")

echo ${mundo[0]} # Ira mostrar o primeiro que é Shell Script
echo ${mundo[1]} # Ira mostrar o Segundo que é Bash
echo ${mundo[2]} # Ira mostrar o Terceiro que é	GNU
echo ${mundo[3]} # Ira mostrar o Quarto que é Linux
echo ${mundo[4]} # Ira mostrar o Quinto que é Debian

echo ${mundo[@]:2} # Ira mostrar do Segundo elemento pra frente # GNU Linux Debian
