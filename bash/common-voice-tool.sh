#!/bin/bash

# Tool creato per agevolare il lavoro con le stringhe di common voice.
# 
# Reach me on GitHub - github.com/dag7dev
# Email: dag7@protonmail.com

#   Copyright (C) 2018 dag7

#   This program is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.

#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.

#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <https://www.gnu.org/licenses/>.

# declaration of array for multilanguage
declare -a language

function printHelp(){
	for i in `seq 1 18`
	do
		echo -e ${language["$i"]}
	done

	echo -e ${language[47]}
	echo -e ${language[48]}
}

function chooseLanguage(){
	# LANGUAGE EXPERIMENTAL
	mkdir -p lang

	# l'utente sceglie che lingua utilizzare
	echo "Choose your language:"

	cd lang

	ls | cut -d ' ' -f9

	read -e -p "Your choice:" fileL

	# controlla se il file non esiste
	if [[ ! -f "$fileL" ]]; then
		echo "Language file not found! Exiting..."
	exit 1
	fi

	# rows in translation file
	rowsLanguage=`wc -l $fileL | cut -d ' ' -f1`

	#load array with every row of the specified file
	for i in `seq 1 $rowsLanguage`
	do
		language[$i]=`sed -n "$i"p "$fileL"`
	done

	cd ..
}

function main() {
	echo ${language[19]}
	echo ${language[20]}
	echo

	ls -l
	read -e -p "${language[21]}" fileN

	# controlla se il file non esiste
	if [[ ! -f $fileN ]]; then
			echo "${language[22]}"
		exit 1
	fi

	# sfruttando wc si ricava il numero delle stringhe
	rows=`wc -l $fileN | cut -d ' ' -f1`

	# stampa le informazioni "da conoscere"
	echo
	echo "${language[23]}$rows"
	pressEnter

	setDefaultValues

	echo
}

# dato numero di stringa  in input ricava la lunghezza della stringa
# ritorna la lunghezza della stringa
function strLen () {
	str=`sed "$1q;d" $fileN`

	len=${#str}
}

# data lunghezza in input
# controlla che la stringa risulti essere nel range
# stampa se la riga è troppo lunga o corta, il numero di caratteri superiori
# o inferiori al range e il numero di riga
function checkLen () {
	if [ $1 -gt $3 ]; then
		echo "${language[24]}$i - ${language[26]}" $(( $1-$3 ))
	else
		if [ $1 -lt $2 ];then
			echo "${language[24]}$i - ${language[27]}" $(( $2-$1 ))
		fi
	fi
}

# dato il numero di stringhe, per ogni stringa del file controlla se è nel range
function areStrsInRange() {
	for ((i=1;$i<=$1;i++)){
		# controlla lunghezza delle frasi
		strLen $i
		checkLen $len $carMin $carMax
	}
}

# acquisisce un carattere e mostra "premi invio per continuare"
# pulisce la console dopo aver premuto enter
function pressEnter() {
	read -p "${language[28]}"
	clear
}

# imposta il valore del range ai valori di default
function setDefaultValues() {
	carMin=1
	carMax=125
}

function promptMaxMinUser() {
	rangeOk=false

	read -p "${language[31]}" ris

	if [ "$ris" != "S" -a "$ris" != "s" -a -n "$ris" ];then
		while [ "$rangeOk" = false ] ; do
			carMin=""
			carMax=""
			
			until [[ $carMin -gt 1 ]] && [[ ! -z $carMin ]] && [[ $carMin =~ ^-?[0-9]+$ ]]
			do				
				read -p "${language[32]}" carMin
			done

			until [[ $carMax -gt 1 ]] && [[ ! -z $carMax ]] && [[ $carMax =~ ^-?[0-9]+$ ]]
			do
				read -p "${language[33]}" carMax
			done

			if [ $carMin -ge $carMax -o $carMin == $carMax ] ; then
				clear
				echo "${language[34]}"
			else
				rangeOk=true
			fi
		done
	else
		echo "${language[35]}"
		setDefaultValues
        pressEnter
	fi
}

# Dato in input il carattere da gestire in eccezione
# Se il secondo parametro e' -ac (autocorreggi)
# si provvede ad aggiungere il punto, altrimenti
# si stampano ultimo  carattere e nRiga della frase
function chkPoint() {
	# definizione del carattere
	car="$1"

	echo
	echo -n "${language[36]}"
	if [ "$2" == "-ac" ];then
		echo "ON"
	else
		echo "OFF"
	fi

	echo 

	echo -e "${language[37]}"


	# controlla ogni frase.
	for ((i=1;i<=$rows;i++)) {
		strLen $i
		
		if [ $len -lt $carMax ] && [ $len -gt $carMin ];then

			case "${str: -1}" in
				'?'|'!'|'.'|';'|' ')
				;;
				
				*)
					echo "${language[24]}$i -"

					# Se non presente il punto a fine frase lo aggiunge.
					if [ "$2" == "-ac" ];then
						echo "${language[38]}"
						sed -i "${i}s/$/./" "$fileN"
					fi

					;;
			esac
		fi
	}
}

# dato nome di un file trimma gli spazi bianchi alla fine di ogni riga
# se il secondo parametro e' noEmpty trimma le linee
function trim () {
	if [ "$2" == "-noEmpty" ];then
		# trim righe vuote
		sed -i -r '/^\s*$/d' $1
	else
		# trim spazi fine frase
		sed -i 's/[ ]*$//' $1		
	fi
}

# given a string: capitalize it
function capitalize(){
	strCap=${1^}
}

function capitalizeF(){
	for ((i=1;$i<=$rows;i++)){
		strLen $i
		capitalize "$str"

		echo "$strCap" >> "$fileN".tmp
	}

	mv "$fileN".tmp "$fileN"
}

#######################
# LAUNCHER PRINCIPALE #
#######################
# check folder and file for strings (translation)
if [ ! -d "lang" ];then
	echo "Directory 'lang' not found!"
	echo
	echo "You need to have a 'lang' directory into the folder where you are running"
	echo "this script and at least one translation file"
	echo
	echo "You can retrieve official translation files by visiting:"
	echo "https://github.com/dag7dev/common-voice-tool"
	
	exit 1
fi

if [ -z "$(ls -A lang)" ];then
	echo "Error! Please download a translation file for this tool"
	echo "and put it in 'lang' folder!"
	echo ""
	echo "You can retrieve official translation files by visiting:"
	echo "https://github.com/dag7dev/common-voice-tool"
	exit 1
fi

if [ -z "$1" -o "$1" == "-h" -o "$1" == "-help" ];then
	clear

	chooseLanguage

	clear

	printHelp

	exit 1
fi

clear

chooseLanguage

clear

# acquisisce file da processare
# memorizza in alcune variabili alcune info importanti
# stampa informazioni utili
main

# a seconda degli argomenti passati effettua le diverse operazioni
for var in "$@"
do
    case $var in
    	# stringhe sono nel range
    	"-range"|"-chkLen")
			echo "RANGE"
			echo "--------"
			promptMaxMinUser
			echo "${language[39]}"
			areStrsInRange $rows;
			echo
		;;
		
		# eliminare spazi a fine riga
		"-trim")
			echo "TRIM"
			echo "--------"
			trim $fileN
			echo "${language[40]}"
			echo
		;;
		
		"-noEmpty")
			echo "NO-EMPTY"
			echo "--------"
			trim $fileN $var
			echo "${language[41]}"
			echo
		;;

		# controllare il punto a fine frase
		"-chkPoint")
			echo "CHKPOINT"
			echo "--------"
			chkPoint .
			echo
    	;;
    	
    	# autoCorrezionePunto: aggiunge il punto
    	"-ac")
			echo "AUTOCORREZIONE"
			echo "---------------"
			chkPoint . "$var"
			echo
		;;

		# capitalizza
		"-capitalize")
			echo "CAPITALIZE"
			echo "---------------"
			capitalizeF
			echo
		;;
		
		*)
			echo "${language[42]} $var ${language[43]}"
			echo "${language[44]}"
		;;
    esac

    pressEnter
done

echo "${language[45]}"
echo "${language[46]}"

exit 0
