all: run

run: enum.cmo pMap.cmo lexer.cmo parser.cmo s.cmo main.cmo
		ocamlc -o run enum.cmo pMap.cmo lexer.cmo parser.cmo s.cmo main.cmo

enum.cmo : enum.ml
		ocamlc -c enum.ml

pMap.cmo : enum.cmo pMap.ml
		ocamlc -c pMap.ml

s.cmo : s.ml
		ocamlc -c s.ml

parser.ml: parser.mly s.cmo
		ocamlyacc parser.mly

parser.mli: parser.mly
		ocamlyacc parser.mly

parser.cmi: parser.mli
		ocamlc -c parser.mli

parser.cmo: parser.ml parser.cmi
		ocamlc -c parser.ml

main.cmo : s.cmo  main.ml
		ocamlc -c main.ml

lexer.cmo: lexer.ml
		ocamlc -c lexer.ml

lexer.ml: lexer.mll parser.cmo
		ocamllex lexer.mll

clean:
		rm -f *.cmx *.cmi parser.mli parser.ml lexer.ml run *.o *.cmo
