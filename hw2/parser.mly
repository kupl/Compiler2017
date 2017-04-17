%{

%}

%token <int> NUM
%token <string> ID
%token INT PLUS MINUS STAR SLASH EQUAL EQUALEQUAL LE LT GE GT NOT AND OR IF ELSE WHILE DO READ PRINT SEMICOLON
%token LBRACE RBRACE LBLOCK RBLOCK LPAREN RPAREN EOF

%start program
%type <S.program> program
%%

program:
    block EOF { $1 }
    ;

block:
    LBRACE decls stmts RBRACE { ($2,$3) }
    ;

decls:
   |  { [] }
    ;

stmts:
   |  { [] }
    ;
