# COSE312 Compiler 2017, HW2

The goal of this assignment is to implement a parser for a toy programming language. 
The source language ("S") and target language ("T") are defined in lecture slides.

This package includes the following files:
- [lexer.mll]: the lexer specification for ocamllex
- [parser.mly]: the parser specification for ocamlyacc
- [s.ml]: abstract syntax and interpreter definitions for the S language
- [t.ml]: abstract syntax and interpreter definitions for the T language
- [translator.ml]: the translator that compiles S to T
- [optimizer.ml]: an optimizer that translates a T program to an efficient T program
- [main.ml]: the driver routine

Your job is to complete the implementation of the lexer, parser, translator, and optimizer:
- Complete the lexical definition of S in [lexer.mll]
- Complete the syntax definition of S in [parser.mly]
- Implement the translator from S to T in [translator.ml]
- Implement an optimizer from S to T in [optimizer.ml]

Regarding the optimizer, try your best as you can. The score will be based on the
correctness (i.e., semantics-preserveness) of the optimizer and the quality of the
final code (i.e., the number of instructions being executed).

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
    == translated target program ==
    0 : x = 0
    0 : t1 = 0
    0 : x = t1
    0 : t3 = x
    0 : t4 = 1
    0 : t2 = t3 + t4
    0 : write t2
    0 : HALT
    == execute the translated program ==
    1
    The number of instructions executed : 7
    == optimized target program (NOTE: this is just an exmaple of optimization) ==
    0 : write 1
    0 : HALT
    == execute the optimized target program ==
    1
    The number of instructions executed : 1

If everything is properly done, you will get the output similar to above:
- It shows the source program, 
- the output of the source program by the S interpreter,
- the translated T program, 
- the output of the translated program by the T interpreter,
- the optimized T program, and
- the output of the optimized program by the T interpreter.
- The T interpreter also shows the number of instructions executed. In optimization, your goal is to reduce that number as possible as you can, while preserving the output of the original program.
