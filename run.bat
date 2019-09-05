@echo off

title Profiling Suite :)

set file= ""
set toggle= "false"
set use_file= "false"

echo This program will run the nilakantha algorithm to determine the value of pi to a decimal precision you specify.
echo/

::each program must handle outputting on its own.
::this program can stitch the outputs together and reset them etc.

:menu
	cls
	echo --MENU--
	echo [L] Language Select
	echo [S] Settings

	set /p input= "Enter Menu Option: "
	cls
	if %input% == L (goto :main) else if %input% == l (goto :main) else if %input% == S (goto :settings) else if %input% == s (goto :settings) else (goto :menu)

:settings
	cls
	echo --Settings--
	if %toggle% == "false" (
		echo Input file toggled off
	) else if %file% == "" (
		echo No input file set
	) else (
		echo Input file set to be %file%
	)
	echo/
	echo [I] Set standard input file
	echo [T] Toggle input file on/off
	echo [B] Back

	set /p input= "Enter Menu Option: "
	if %input% == B (goto :menu) else if %input% == b (goto :menu
	) else if %input% == T (goto :toggle) else if %input% == t (goto :toggle
	) else if %input% == I (goto :input_file) else if %input% == i (goto :input_file) 
	goto :settings

:toggle
	if %toggle% == "true" (set toggle= "false") else (set toggle= "true")
	goto :settings


:input_file
	cls
	echo --Set Input File--
	set /p file= "Enter File Path from %CD% "
	set toggle= "true"
	echo %file%	
	goto :settings


:main
	echo/
	echo --MENU--
	echo [1] C
	echo [2] C++
	echo [3] Python
	echo [4] Ruby
	echo [5] JavaScript
	echo [B] Back

	if %toggle% == "true" (
		if NOT %file% == "" (
			set use_file= "true"
		) else ( set use_file= "false" )
	) else ( set use_file="false" )

	set /p input= "Enter language: "
	if %input% == 1 (
		echo -------------------- C --------------------
	) else if %input% == 2 (
		echo -------------------- C++ --------------------
	) else if %input% == 3 (
		echo -------------------- Python --------------------
	) else if %input% == 4 (
		echo -------------------- Ruby --------------------
	) else if %input% == 5 (
		echo -------------------- JavaScript --------------------
	) else if %input% == B (goto :menu) else if %input% == b (goto :menu
	) else (
		goto :main
	)

	echo/
	goto :%input%

:1
	cd C
	if %use_file% == "true" ( nilakantha < ../%file%
	) else ( nilakantha )
	cd..

goto :main

:2
	cd C++
	if %use_file% == "true" ( nilakantha < ../%file%
	) else ( nilakantha )
	cd..

goto :main

:3
	if %use_file% == "true" ( python -i python/nilakantha.py < %file%
	) else ( python -i python/nilakantha.p y)

goto :main

:4
	if %use_file% == "true" ( ruby ruby/nilakantha.rb < %file%
	) else ( ruby ruby/nilakantha.rb )

goto :main

:5
	echo [1] Node.js
	echo [2] Browser
	echo [B] Back
	set /p input= "Enter runtime: "
	if %input% == 1 (
		echo Node.js
		echo/
		if %use_file% == "true" ( node js/index-node.js < %file%
		) else ( node js/index-node.js )
	) else if %input% == 2 (
		echo Browser
		echo/
		start js/index.html
	) else if %input% == B (goto :main) else if %input% == b (goto :main
	) else (goto :5)

goto :main
