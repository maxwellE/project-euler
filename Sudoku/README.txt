SudokuSolver
===============
By: Issac Post and Maxwell Elliott, elliott.432@osu.edu

Getting Started
----------------

The solver expects to see a text file containing a starting sudoku grid like the following:

5..|.9.|3..
.89|713|...
...|52.|.47
-----------
..1|..9|57.
..5|2.1|4..
.94|3..|6..
-----------
21.|.35|...
...|872|13.
..7|.4.|..9

If the file does not contain a valid grid then the solver will print and error message
and quit.

How to run the solver:

    $ ./sudoku_solver.rb FILE_PATH

example call:

    $ ./sudoku_solver.rb difficult_input.txt

Thats it, if the puzzle can be solved then it will print the solution, otherwise the solver will print a message saying the puzzle cannot be solved.
