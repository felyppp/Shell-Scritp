#!/bin/bash

clear
echo -e -n "\nLoading "
for i in $(seq 1 1 5);
do
	echo -n "."
	sleep 01
	echo -ne ""
done
clear

#Variaveis
DATA=$(date +%d/%m/%Y)
HORA=$(date +%H:%M)

#Script
clear

#Informacoes de data
echo -e "\t\033[01;32m*** Relatorio do Sistema ***\033[01;37m\n"
echo -e "\tInformacoes do dia: $DATA"
echo -e "\tHorario da execucao: $HORA"

fnMemoriaRam(){
	 #Informacoes de Memoria RAM
	 MEM_TOTAL=$(free -m | grep ^Mem | awk '{print $2}')
	 MEM_USADO=$(free -m | grep ^Mem | awk '{print $3}')
	 MEM_LIVRE=$(free -m | grep ^Mem | awk '{print $4}')
	 MEM_CACHE=$(free -m | grep ^Mem | awk '{print $7}')

	 echo
	 echo -e "\t\033[01;32mInformacoes de Memoria RAM:\033[01;32m!"
	 echo -e "\t\tTotal: $MEM_TOTAL"
	 echo -e "\t\tUsado: $MEM_USADO"
	 echo -e "\t\tLivre: $(($MEM_LIVRE + $MEM_CACHE))"
}

fnCarga(){
	 #Informacoes de Carga
 	VALIDA_TEMPO_UP=$(uptime | grep min -c) #O -c conta quantos vezes ele encontrou o "min"

 	if [ $VALIDA_TEMPO_UP -eq 1 ]
 	then
   		CARGA=$(uptime | awk '{print $9}' | sed 's/,$//g') #O sed s/ Substitui o que tem ,$/ para nada
  		CARGA_PORCENTAGEM=$(uptime | awk '{print $9}' | awk -F',' '{print $1}') #O -F 
	else
 		CARGA=$(uptime | awk '{print $8}' | sed 's/,$//g')
		CARGA_PORCENTAGEM=$(uptime | awk '{print $8}' | awk -F',' '{print $1}')
	fi

	echo
	echo -e "\tInformacoes de Carga:"
	if [ $CARGA_PORCENTAGEM -ne 0 ]
	then
	       	echo -e "\t\tAtual: $CARGA \033[05;31m*PREOCUPANTE\033[m!"
	else
   		echo -e "\t\t\033[01;32mAtual:\033[m $CARGA"
	fi
}
fnDisco(){
	#Informações sobre HD

	echo
	df -h | grep -v ^Sist | while read LINHA
	do
		PARTICAO=$(echo $LINHA | awk '{print $6}')
		PONTO_MONTA=$(echo $LINHA | awk '{print $1}')
		UTILIZACAO=$(echo $LINHA | awk '{print $5}')

		echo -e "\033[01;32m\t\tA particao: $PARTICAO"
		echo -e "\t\t\tMontado em: $PONTO_MONTA"
		echo -e "\t\t\tUtilizacao: $UTILIZACAO\n\t\t\t----------------\033[m"
	done
}
fnRede(){
	DNS=$(host 'www.fatecourinhos.edu.br' | grep "has address" -c)
	GATEWAY=$(route -n | head -n3 | tail -n1 | awk '{print $2}')
	LOCAL=$(ping $GATEWAY -c 2 -q | grep  -oP "\d+(?=% packet loss)")
	INTERNET=$(ping 8.8.8.8 -c 2 -q | grep "loss" | awk '{print $6}' | sed 's/%$//g')

	echo -e "Informacoes de Rede\n"
	if [ $LOCAL -eq 0 ]
	then
		echo -e "\t*Rede Local: OK"
		echo -e "\t  Gateway Padrao: $GATEWAY"

	else
		echo -e "\t*Rede Local: Nao OK"
		echo -e "\t  Gateway Padrao: $GATEWAY"
	fi

	if [ $INTERNET -eq 0 ]
	then
		echo -e "\t*Internet: OK"
	else
		echo -e "\t*Internet: Nao OK"
	fi

	if [ $DNS -eq 1 ]
	then
		echo -e "\t*DNS: OK"
	
	else
		echo -e "\t*DNS: Nao OK"
	fi
}
case $1 in 
	Memoria|memoria|MEMORIA) fnMemoriaRam ;;
	Carga|CARGA|carga) fnCarga ;;
	Disco|disco|DISCO) fnDisco ;;
	Rede|REDE|rede) fnRede ;;
	TUDO|Tudo|tudo) fnMemoriaRam && fn Carga && fnDisco && fnRede ;;
	*) echo -e "\t\nOpcao Invalida" ;;
esac


read
