#!/bin/bash

alias cls='echo -en "\ec"'
shopt -s expand_aliases

file=""
toggle="false"
use_file="false"

echo This program will run the nilakantha algorithm to determine the value of pi to a decimal precision you specify.

function javascript() {
	echo [1] Node.js
	echo [2] Browser
	echo [B] Back

	read -p "Enter runtime: " input

	if [[ $input == 1 ]]; then
		echo Node.js
		echo ""
		cd js
		if [[ $use_file == "true" ]]; then
			node index-node.js < ../$file
		else
			node index-node.js
		fi
		cd ..
	elif [[ $input == 2 ]]; then
		echo Browser
		echo ""
		xdg-open js/index.js
	elif [[ $input == B || $input == b ]]; then
		main
	else
		javascript
	fi
}

function main() {
	echo --MENU--
	echo [1] C
	echo [2] C++
	echo [3] Python
	echo [4] Ruby
	echo [5] JavaScript
	echo [B] Back

	if [[ $toggle == "true" ]]; then
		if [[ $file != "" ]]; then
			use_file="true"
		else
			use_file="false"
		fi
	else
		use_file="false"
	fi

	read -p "Enter language: " input

	if [[ $input == 1 ]]; then
		echo -------------------- C --------------------
		cd C
		if [[ $use_file == "true" ]]; then
			./nilakantha < ../$file
		else
			./nilakantha
		fi
		cd ..
	elif [[ $input == 2 ]]; then
		echo -------------------- C++ --------------------
		cd C++
		if [[ $use_file == "true" ]]; then
			./nilakantha < ../$file
		else
			./nilakantha
		fi
		cd ..
	elif [[ $input == 3 ]]; then
		echo -------------------- Python --------------------
		cd python
		if [[ $use_file == "true" ]]; then
			python3 -i nilakantha.py < ../$file
		else
			python3 -i nilakantha.py
		fi
		cd ..
	elif [[ $input == 4 ]]; then
		echo -------------------- Ruby --------------------
		if [[ $use_file == "true" ]]; then
			ruby nilakantha.rb < ../$file
		else
			ruby nilakantha.rb
		fi
	elif [[ $input == 5 ]]; then
		echo -------------------- JavaScript --------------------
		javascript
	elif [[ $input == B || $input == b ]]; then
		menu
	fi

	echo ""
	main
}

function settings() {
	cls
	echo --Settings--
	if [[ $toggle == "false" ]]; then
		echo Input file toggled off
	elif [[ $file == "" ]]; then
		echo No input file set
	else
		echo Input file set to be $file
	fi

	echo ""

	echo [I] Set standard input file
	echo [T] Toggle input file on/off
	echo [G] Generate output file
	echo [R] Reset output file
	echo [S] Setup - compile C and C++
	echo [B] Back

	read -p "Enter Menu Option: " input

	if [[ $input == "B" || $input == "b" ]]; then
		menu
	elif [[ $input == "T" || $input == "t" ]]; then
		if [[ $toggle == "true" ]]; then
			toggle="false"
		else
			toggle="true"
		fi
	elif [[ $input == "I" || $input == "i" ]]; then
		cls
		echo --Set Input File--
		directory=`pwd`
		read -p  "Enter File Path from ${directory} " file
		toggle="true"
		echo $file	
	elif [[ $input == "G" || $input == "g" ]]; then
		cls
		directory=`pwd`
		echo --Generating output file to ${directory}--
		echo nilakantha algorithm performance test > out.txt
		echo "" >> out.txt

		if [[ -f C/out.part ]]; then
			echo --C-- >> out.txt
			cat C/out.part >> out.txt
		fi
		if [[ -f C++/out.part ]]; then
			echo --C++-- >> out.txt
			cat C++/out.part >> out.txt
		fi
		if [[ -f python/out.part ]]; then
			echo --python-- >> out.txt
			cat python/out.part >> out.txt
		fi
		if [[ -f ruby/out.part ]]; then
			echo --ruby-- >> out.txt
			cat ruby/out.part >> out.txt
		fi
		if [[ -f js/out.part ]]; then
			echo --JavaScript-- >> out.txt
			cat js/out.part >> out.txt
		fi

		read -p "Press any key to continue..."
		settings
	elif [[ $input == "R" || $input == "r" ]]; then
		rm C/out.part
		rm C++/out.part
		rm python/out.part
		rm ruby/out.part
		rm js/out.part
		cls
		echo --Deleted all program-specific output files--
		read -p "Press any key to continue..."
	elif [[ $input == "S" || $input == "s" ]]; then
		gcc C/nilakantha.c -o C/nilakantha -lm
		g++ C++/nilakantha.cpp -o C++/nilakantha
		cls
		echo --Compiled C and C++--
		read -p "Press any key to continue..."
	fi

	settings
}

function menu() {
	cls
	echo --MENU--
	echo [L] Language Select
	echo [S] Settings

	read -p "Enter Menu Option: " input
	if [[ $input == "L" || $input == "l" ]]; then
		cls
		main
	elif [[ $input == "S" || $input == "s" ]]; then
		settings
	fi
	menu
}

menu

