#!/bin/bash

clear  
echo -e "\n\tSeja Bem Vindo usuario: $USER!"
sleep 1s

menu() {
clear
echo -e "Qual operação matematica deseja fazer ?\n"
echo "1. Soma [+]"
echo "2. Subtração [-]"
echo "3. Multiplicação [×]"
echo "4. Divisão [÷]"
echo -e "5. Sair\n"
echo -n "_:"
 
		read opcao 
			case $opcao in
			  1) soma ;;
			  2) subt ;;
			  3) multi ;;
			  4) divi ;;
			  5) sair ;;
			  *) echo -e "\t\nOpcao Invalida" ;;
esac
}

soma() {
echo
  echo -n "Digite um valor: " 
  read valor1
  echo
  echo -n "Digite outro valor: " 
  read valor2
  echo
  echo "Calculando..."
  sleep 1s
  echo ...
		SUMAR=$((valor1+valor2)) 
		echo "$valor1 + $valor2 = $SUMAR"
  sleep 2s
  clear
  echo -e "\nO que deseja fazer agora ? "
  echo -n "Digite a opção: [c]ontinuar, [m]enu Principal ou [s]air: "
  read opi
		  if [[ $opi = "c" ]]
		  then
			  soma
		  elif [[ $opi = "m" ]]
		  then
			menu
		  elif [[ $opi = "s" ]]
		  then	  
			sair
		  else
			  echo "Opção Invalida! \nIrei te redirecionar para o Menu Principal "
			  sleep 1.5
			  menu
		  fi
}

subt() {
echo
  echo -n "Digite um valor: " 
  read valor1
  echo
  echo -n "Digite outro valor: " 
  read valor2
  echo
  echo "Calculando..."
  sleep 1s
  echo ...
	  menus=$((valor1-valor2))
	  echo "$valor1 - $valor2 = $menus"
  sleep 2s
  clear
  echo -e "\nO que deseja fazer agora ? "
  echo -n "Digite a opção: [c]ontinuar, [m]enu Principal ou [s]air: "
  read opi
		  if [[ $opi = "c" ]]
		  then
			  subt
		  elif [[ $opi = "m" ]]
		  then
			menu
		  elif [[ $opi = "s" ]]
		  then	  
			sair
		  else
			  echo "Opção Invalida! \nIrei te redirecionar para o Menu Principal "
			  sleep 1.5
			  menu
		  fi
}

multi() {
echo
  echo -n "Digite um valor: " 
  read valor1
  echo
  echo -n "Digite outro valor: " 
  read valor2
  echo
  echo "Calculando..."
  sleep 1s
  echo ...
	  multip=$((valor1*valor2))
	  echo "$valor1 × $valor2 = $multip"
  sleep 2s
  clear
  echo -e "\nO que deseja fazer agora ? "
  echo -n "Digite a opção: [c]ontinuar, [m]enu Principal ou [s]air: "
  read opi
		  if [[ $opi = "c" ]]
		  then
			  multi
		  elif [[ $opi = "m" ]]
		  then
			menu
		  elif [[ $opi = "s" ]]
		  then	  
			sair
		  else
			  echo "Opção Invalida! \nIrei te redirecionar para o Menu Principal "
			  sleep 1.5
			  menu
		  fi
}

divi() {
echo
  echo -n "Digite um valor: " 
  read valor1
  echo
  echo -n "Digite outro valor: " 
  read valor2
  echo
  echo "Calculando..."
  sleep 1s
  echo ...
	  didi=$((valor1/valor2))
	  echo "$valor1 ÷ $valor2 = $didi"
  sleep 2s
  clear
  echo -e "\nO que deseja fazer agora ? "
  echo -n "Digite a opção: [c]ontinuar, [m]enu Principal ou [s]air: "
  read opi
		  if [[ $opi = "c" ]]
		  then
			  divi
		  elif [[ $opi = "m" ]]
		  then
			menu
		  elif [[ $opi = "s" ]]
		  then	  
			sair
		  else
			  echo "Opção Invalida! \nIrei te redirecionar para o Menu Principal "
			  sleep 1.5
			  menu
		  fi
}

sair() {
 clear
 echo "Heheheheh Bye Bye..."
 sleep 0.75
 exit
}

menu