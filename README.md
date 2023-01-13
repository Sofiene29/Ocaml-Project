# BASE PROJECT : FORD FULKERSON 

Base project for Ocaml project on Ford-Fulkerson.  
## Demonstration of the project 
A makefile provides some useful commands:
 - `make build` to compile. This creates an ftest.native executable
 - `make demo2` to run the `ftest22` program with some arguments
 - `make format` to indent the entire project
 - `make edit` to open the project in VSCode
 - `make clean` to remove build artifacts

 ### To launch the series of tests, type the `make demo2` command on the terminal.
 ### To view the results, `graphs/outfile.dot` is generated automatically to view the output.


# MEDIUM PROJECT : Bippartite-Matching --Assign applicants to Jobs according to preferences --

Medium project for Ocaml on Bipartite-Matching using the Ford-Fulkerson Algorithm.
The test files for the medium project are data_test1, data_test2 and data_test3. 
In order to see the result of the algorithm, on each of the test files use the commands of the Makefile below.

To use, you should install the *OCaml* extension in VSCode. Other extensions might work as well but make sure there is only one installed.

## Demonstration of the project 
A makefile provides some useful commands:
 - `make build` to compile. This creates an ftest.native executable
 - `make demo` to run the `ftest` program with some arguments
 - `make format` to indent the entire project
 - `make edit` to open the project in VSCode
 - `make clean` to remove build artifacts
 
 ### To launch the series of tests, type the `make demo` command on the terminal.


 The input data_test files contain the different jobs available. 
 Our applicants have submitted a form with the jobs they are interested in (1: interested , 0: not intereted)

### ==== TEST1 ==== 
    -> is a basic test case with 6 jobs and 5 applicants.

### ==== TEST2 ====
    -> is another basic test case with 6 jobs and 6 applicants.

### ==== TEST3 ==== 
    -> is a special test case with 6 jobs and 7 applicants who are interested in all jobs.



In case of trouble with the VSCode extension (e.g. the project does not build, there are strange mistakes), a common workaround is to (1) close vscode, (2) `make clean`, (3) `make build` and (4) reopen vscode (`make edit`).

