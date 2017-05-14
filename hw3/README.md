# COSE312 Compiler 2017, HW3

The goal of this assignment is to implement interpreters and a translator. 
The syntax and semantics of the source and target languages (While and M) are defined in the homework document.

This package includes the following files:
- lexer.mll: the lexer specification for While
- parser.mly: the parser specification for While
- while.ml: abstract syntax and interpreter definitions for the While language
- m.ml: abstract syntax and interpreter definitions for the M language
- translation.ml: translator (from While to M)
- main.ml: the driver routine

Your job is to complete the the three files:
- while.ml
- m.ml
- translation.ml

# How to run

    $ Make
    $ ./run test/test1 
    == source program ==
    x = 1; y = 2; z = x+y; print z
    == execute the source program ==
    3
    == target program ==
    push(1) store(x) push(2) store(y) fetch(y) fetch(x) add store(z) fetch(z) print
    == execute the target program ==
    3
