# Performance profiling

#### languages:
- C
- C++
- Python
- Ruby
- JavaScript (browser and node.js runtimes)

#### Algorithms
- Nilakantha method of determining PI to a specified precision


#### Running instructions:
1. Compile C and C++ programs however you want. Sample methods listed below. If you want to profile Python or Ruby, make sure you have them installed.
2. Open run.bat
3. Traverse the menus

#### Input file:
Instead of typing in the same parameters, you can select a file to input the data for you. The contents of the file should be 2 lines:
```
precision
number of iterations
```
**EX:**
```
12
10
```
You select the file in the settings menu of `run.bat`

#### Output file:
Each time you run a program, it will output the results to a `out.part` file. In the settings, you can generate a master `out.txt` file which stitches all the `.part` files together.
If you want to test something specific and don't want all your previous trial history included in the master out file, select the *Reset output files* option before testing.

#### Sample compilation:
- Linux
  - C:   `gcc nilakantha.c -o nilakantha -lm`
  - C++: `g++ nilakantha.cpp -o nilakantha`

- Windows
	1. Open in Visual Studio or other GUI and compile
	2. Open Developer Command Prompt for VS
		- cd into the correct directory
		- cl -EHsc nilakantha.c (same with C++)
