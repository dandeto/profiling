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
	echo [G] Generate output file
	echo [R] Reset output file
	echo [B] Back

	set /p input= "Enter Menu Option: "
	if %input% == B (goto :menu) else if %input% == b (goto :menu
	) else if %input% == T (goto :toggle) else if %input% == t (goto :toggle
	) else if %input% == I (goto :input_file) else if %input% == i (goto :input_file
	) else if %input% == G (goto :output_file) else if %input% == g (goto :output_file
	) else if %input% == R (goto :reset_output) else if %input% == r (goto :reset_output)
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

:output_file
	cls
	echo --Generating output file to %CD%--
	echo nilakantha algorithm performance test > out.txt
	echo/ >> out.txt

	if exist C/out.txt (
		echo --C-- >> out.txt
		cd C
		type out.txt >> ../out.txt
		cd..
	)
	if exist C++/out.txt (
		echo --C++-- >> out.txt
		cd C++
		type out.txt >> ../out.txt
		cd..
	)
	if exist python/out.txt (
		echo --python-- >> out.txt
		cd python
		type out.txt >> ../out.txt
		cd..
	)
	if exist ruby/out.txt (
		echo --ruby-- >> out.txt
		cd ruby
		type out.txt >> ../out.txt
		cd..
	)
	if exist js/out.txt (
		echo --JavaScript-- >> out.txt
		cd js
		type out.txt >> ../out.txt
		cd..
	)

	pause
	goto :settings

:reset_output
	cls
	del "%CD%\C\out.txt"
	del "%CD%\C++\out.txt"
	del "%CD%\python\out.txt"
	del "%CD%\ruby\out.txt"
	del "%CD%\js\out.txt"
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
	cd python
	if %use_file% == "true" ( python -i nilakantha.py < ../%file%
	) else ( python -i nilakantha.py )
	cd..

goto :main

:4
	cd ruby
	if %use_file% == "true" ( ruby nilakantha.rb < ../%file%
	) else ( ruby nilakantha.rb )
	cd..

goto :main

:5
	echo [1] Node.js
	echo [2] Browser
	echo [B] Back
	set /p input= "Enter runtime: "
	if %input% == 1 (
		echo Node.js
		echo/
		cd js
		if %use_file% == "true" ( node index-node.js < ../%file%
		) else ( node index-node.js )
		cd..
	) else if %input% == 2 (
		echo Browser
		echo/
		start js/index.html
	) else if %input% == B (goto :main) else if %input% == b (goto :main
	) else (goto :5)

goto :main
