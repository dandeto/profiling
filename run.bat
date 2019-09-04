@echo off

title Profiling Suite :)

echo This program will run the nilakantha algorithm to determine the value of pi to a decimal precision you specify.
echo
::add redirection and outputting to files later...

:main
	echo/
	echo --MENU--
	echo [1] C
	echo [2] C++
	echo [3] Python
	echo [4] Ruby
	echo [5] JavaScript

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
	) else (
		goto :main
	)

	echo/
	goto :%input%

:1
	cd C
	nilakantha
	cd..

goto :main

:2
	cd C++
	nilakantha
	cd..

goto :main

:3
	python -i python/nilakantha.py

goto :main

:4
	ruby ruby/nilakantha.rb

goto :main

:5
	echo [1] Node.js
	echo [2] Browser
	set /p input= "Enter runtime: "
	if %input% == 1 (
		echo Node.js
		echo/
		node js/index-node.js
	) else if %input% == 2 (
		echo Browser
		echo/
		start js/index.html
	)

goto :main
