#!/bin/bash

clear

echo -e '\n\t\t\t\033[05;32mDados:\033[m\n:'
sleep 1
cat dados | while read LINHA
do
	NOME=$(echo $LINHA | awk '{print $1}')
	IDADE=$(echo $LINHA | awk '{print $2}')
	CIDADE=$(echo $LINHA | awk '{print $3}')
	PROFISSAO=$(echo $LINHA | awk '{print $4}')
	EMPRESA=$(echo $LINHA | awk '{print $5}')


	echo -e "\033[01;32mPessoa: $NOME"
	echo -e "\tIdade: $IDADE"
	echo -e "\tCidade: $CIDADE"
	echo -e "\tProfissao: $PROFISSAO"
	echo -e "\tEmpresa: $EMPRESA\n\t\t----------"

done

echo -e '\033[05;34mR.A: 0210971811010 \033[m'
echo -e '\033[05;34mR.A: 0210971811041 \033[m'
