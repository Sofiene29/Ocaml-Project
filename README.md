# Functionnal Programming : OCaml Project

In order to practice further our knowledge in functional programming, we were instructured to build up this project. We went through 2 main phases :
    
1. **The base project** : Defining data structures and functions to illustrate the Ford fulkerson Algorithm.
2. **The medium project** : An application to one of the main uses of the algorithm called *Bippartite-Matching*. **Assign jobs to applicants according to their preferences** 

# Setup and Test

* To use, you should install the *OCaml* extension in VSCode. Other extensions might work as well but make sure there is only one installed.


* A makefile is provided with some useful commands:
    - `make build` to compile. This creates an ftest.native executable
    - `make demo2` to run the `ftest22` program with some arguments
    - `make demo` to run the `ftest` program with some arguments
    - `make format` to indent the entire project
    - `make edit` to open the project in VSCode
    - `make clean` to remove build artifacts

*In case of trouble with the VSCode extension (e.g. the project does not build, there are strange mistakes), a common workaround is to (1) close vscode, (2) `make clean`, (3) `make build` and (4) reopen vscode (`make edit`).*

## 1. Ford Fulkerson 

> This algorithm is a powerful tool that calculates  the maximum flow in a flow network. The approach is to augmenting paths in a residual graph when this path is found.

* The input data test file is `graphs/graph`. `ftest22.ml` contains the code testing the input.
* To launch the test, type the `make demo2` in the command line.
* To view the results, `graphs/outfile.dot` is generated automatically with the resulting output graph.


## 2. Bippartite-Matching : Assign jobs to applicants according to their preferences

> There are M applicants who want jobs, and N jobs. Each applicant has a subset of jobs that she/he is interested in. Each job opening can only accept one applicant and a job applicant can be appointed for only one job. 

> Our program helps assign jobs to applicants in such that as many applicants as possible get jobs.


* The input data test files are `data_test1`, `data_test2` and `data_test3`. 
* To launch the series of tests, type the `make demo` in the command line.
* The result of the 3 tests will be displayed automatically.

### Testing cases
* The input data_test files contain the different jobs available.  Our applicants have submitted a form with the jobs they are interested in (1: interested , 0: not intereted)

> ==== TEST1 ==== -> is a basic test case with 6 jobs and 5 applicants.

> ==== TEST2 ==== -> is another basic test case with 6 jobs and 6 applicants.

> ==== TEST3 ==== -> is a special test case with 6 jobs and 7 applicants who are interested in all jobs.

