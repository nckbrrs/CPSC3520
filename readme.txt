Nicholas Barrs
CPSC 3520-001
February 15, 2017

###############################  SDE 1 ########################################
      Using grammars and flex and bison to Implement an "Input Checker"
                  for Fuzzy Set Membership Functions
###############################################################################

PLEDGE:

	On my honor I have neither given nor received aid on this exam.

CONTENTS:

 * checker1.in
          - This file consists of regular expressions to be matched against
            the input file together with corresponding flex actions. This
            file is translated by flex into a C program that reads an input
            character stream, and, where possible, converts the input into
            tokens that match the specified regular expressions.

 * checker1.y
         - This file is a description of a context-free LALR grammar that
           is converted by bison into a C program to parse that grammar.
           It has four main sections: C declarations, Bison declarations, 
           Grammar rules, and an optional section for Additional C code. The C 
           Declarations Section contains macro defnitions and declarations of 
           functions and variables that are used in the actions of the grammar
           rules. The Bison declarations section contains declarations that 
           define terminal and nonterminal symbols, specify precedence, and so
           on. The grammar rules section contains one or more Bison grammar
           rules.


 * checker1.c
         - This file contains the main program that calls yyparse() that
           causes the parsing to occur. yyparse() reads tokens, executes
           actions, and ultimately returns when it encounters end-of-input
           or an unrecoverable syntax error.

 * yyerror.c
         - This file contains yyerror(), which is called by yyparse if ever
           an unrecoverable syntax error is encountered in the input.

 * checker1.log
         - This file contains a log of 10 sample uses of the resulting
           executable (both success and failure) for different classes.
