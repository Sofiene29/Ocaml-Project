
build:
	@echo "\n==== COMPILING ====\n"
	ocamlbuild ftest.native

format:
	ocp-indent --inplace src/*

edit:
	code . -n

demo: build
	./ftest.native jobapptest/data_test outfile
	
clean:
	-rm -rf _build/
	-rm ftest.native
