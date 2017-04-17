# COSE312 Compiler 2017, HW2

The goal of this assignment is to implement a parser for a toy programming language. 
The syntax of the source language ("S") is defined in the homework document.

This package includes the following files:
- [lexer.mll]: the lexer specification for ocamllex
- [parser.mly]: the parser specification for ocamlyacc
- [s.ml]: abstract syntax and interpreter definitions for the S language
- [main.ml]: the driver routine

Your job is to complete the implementation of the lexer and parser:
- Complete the lexical definition of S in [lexer.mll]
- Complete the syntax definition of S in [parser.mly]

# How to run

    $ Make
    $ ./run test/t0.s
    == source program ==
    {
    int x;
    x = 0;
    print x+1;
    }
    == execute the source program ==
    1
