# Performance profiling

#### languages:
- C
- C++
- Python
- Ruby
- JavaScript (runs in browser)

#### Algorithms
- Nilakantha method of determining PI to a specified precision


#### Running instructions:
1. Compile C and C++ programs however you want. Sample methods listed below. If you want to profile Python or Ruby, make sure you have them installed.
2. Open run.bat
3. Select a programming language and input what you are prompted for.

#### Sample compilation:
- Linux
  - C:   `gcc nilakantha.c -o nilakantha -lm`
  - C++: `g++ nilakantha.cpp -o nilakantha`

- Windows
	1. Open in Visual Studio or other GUI and compile
	2. Open Developer Command Prompt for VS
		- cd into the correct directory
		- cl -EHsc nilakantha.c (same with C++)
