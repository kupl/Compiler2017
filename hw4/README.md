# COSE312 Compiler Project 2017, Korea University
## Due: 6/14(Wed) 24:00

The goal is to implement a translator and an optimizer for the S language.
The source language ("S") and target language ("T") are defined in lecture slides (lecture 16).

This package includes the following files:
- [lexer.mll]: the lexer specification for ocamllex
- [parser.mly]: the parser specification for ocamlyacc
- [s.ml]: abstract syntax and interpreter definitions for the S language
- [t.ml]: abstract syntax and interpreter definitions for the T language
- [translator.ml]: the translator that compiles S to T
- [optimizer.ml]: an optimizer that translates a T program to an efficient T program

Your job is to complete the implementation of the translator and the optimizer:
- Implement the translator from S to T in [translator.ml]
- Implement an optimizer for T in [optimizer.ml]

Regarding the optimizer, try to do your best effort. The score will be based on the
correctness (i.e., semantics-preserveness) of the optimizer and the quality of the
final code (i.e., the reduction in the number of instructions being executed).

# How to run

    $ Make
    $ ./run test/t0.s

If everything is properly done, you will get the following output:
(It shows the source program, the execution result of the source program by the S interpreter,
the translated T program, and the execution result of the translated program by the T interpreter.
The results from the S and T interpreters must be equivalent.)

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
    0 : t4 = 0
    0 : x = t4
    0 : t1 = x
    0 : t2 = 1
    0 : t3 = t1 + t2
    0 : write t3
    0 : HALT
    == execute the translated program ==
    1
    The number of instructions executed : 7
    == optimized target program (this is just an example) ==
    0 : t3 = 1
    0 : write t3
    0 : HALT
    == execute the optimized target program ==
    1
    The number of instructions executed : 2
