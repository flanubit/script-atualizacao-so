#!/bin/bash
AMARELO="\e[33m"
VERDE="\e[32m"
VERMELHO="\e[31m'"
BRANCO="\e[0m"
clear && echo -e "${AMARELO}> Iniciando apt update [...]${BRANCO}"
if apt update; then
	echo -e "${VERDE}> apt update: [OK]${BRANCO}"
	echo -e "${AMARELO}> Iniciando apt upgrade [...]${BRANCO}"
	if apt upgrade -y; then
		echo -e "${VERDE}> apt upgrade: [OK]${BRANCO}"
		echo -e "${AMARELO}> Iniciando apt autoremove [...]${BRANCO}"
		if apt autoremove -y; then
			echo -e "${VERDE}> apt autoremove: [OK]${BRANCO}"
		else
			echo -e "${VERMELHO}> apt autoremove: [ERRO]${BRANCO}"
		fi
	else
		echo -e "${VERMELHO}> apt upgrade: [ERRO]${BRANCO}"
	fi	
else
	echo -e "${VERMELHO}> apt update: [ERRO]${BRANCO}"
fi
