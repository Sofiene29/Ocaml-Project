
build:
	@echo "\n==== COMPILING ====\n"
	ocamlbuild ftest.native

build2:
	@echo "\n==== COMPILING ====\n"
	ocamlbuild ftest22.native

format:
	ocp-indent --inplace src/*

edit:
	code . -n

demo: build
	@echo "\n============ TEST1 ============\n"
	./ftest.native jobapptest/data_test1 outfile1

	@echo "\n============ TEST2 ============n"
	./ftest.native jobapptest/data_test2 outfile2

	@echo "\n============ TEST3 ============n"
	./ftest.native jobapptest/data_test3 outfile3

demo2: build2
	@echo "\n============ TEST FULKERSON ============\n"
	./ftest22.native graphs/graph1 outfile
	
clean:
	-rm -rf _build/
	-rm ftest.native
