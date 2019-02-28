#!/bin/bash

clear
PING=$(ping -c 2 $1 > .ping.txt)

	Pac_Envi=$(grep "packets trans" .ping.txt | awk '{print $1}')
	Pac_Rece=$(grep "packes trans" .ping.txt | awk '{print $4}')
	Pac_Perd=$(cat .ping.txt | grep "packets trans" | awk '{print $6}')
	Lat_Medi=$(cat .ping.txt | grep ^rtt | awk -F '/' '{print $7}')

	echo -e "\n**** Estatisticas de Ping para $1 ****\n"

	echo -e "\tPacotes Enviados:$Pac_Envi "

	echo -e "\tPacotes Recebidos:$Pac_Rece "

	echo -e "\tPacotes Perdidos: $Pac_Perd  "

	echo -e "\tLatencia Media: $Lat_Medi "


