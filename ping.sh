#!/bin/bash

clear

PING=$(ping -c 5 $1 )
Pac_Envi=$(ping -c 3 localhost | grep "packets trans" | awk '{print $1}')
Pac_Rece=$(ping -c 3 localhost | grep "packets trans" | awk '{print $4}')
Pac_Perd=$(ping -c 3 localhost | grep "packets trans" | awk '{print $6}')
Lat_Medi=$(ping -c 3 localhost | grep ^rtt | awk -F'/' '{print $7}')

echo -e "\n**** Estatisticas de Ping para $1 ****\n"

echo -e "\tPacotes Enviados:$Pac_Envi "

echo -e "\tPacotes Recebidos:$Pac_Rece "

echo -e "\tPacotes Perdidos: $Pac_Perd  "

echo -e "\tLatencia Media: $Lat_Medi "

echo -e "\n*********************************************"
