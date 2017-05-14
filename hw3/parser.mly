%{

%}

%token <int> NUM
%token <string> ID
%token INT PLUS MINUS STAR SLASH EQUAL EQUALEQUAL LE LT GE GT NOT AND OR IF ELSE WHILE DO READ PRINT SEMICOLON
%token LBRACE RBRACE LBLOCK RBLOCK LPAREN RPAREN EOF TRUE FALSE

%left SEMICOLON
%left OR
%left AND
%left LT LE GT GE EQUALEQUAL
%left PLUS MINUS
%left STAR SLASH 
%right NOT 
%nonassoc RPAREN
%nonassoc ELSE


%start program
%type <While.program> program
%%

program:
    stmt EOF { $1 }
    ;

stmt:
  | stmt SEMICOLON stmt { While.SEQ ($1, $3) }
  | stmt SEMICOLON { $1 }
  | ID EQUAL aexp { While.ASSIGN ($1, $3) }
  | IF LPAREN bexp RPAREN LBRACE stmt RBRACE ELSE LBRACE stmt RBRACE { While.IF ($3,$6,$10) }
  | IF LPAREN bexp RPAREN LBRACE stmt RBRACE { While.IF ($3,$6,While.SKIP) }
  | WHILE LPAREN bexp RPAREN LBRACE stmt RBRACE {While.WHILE ($3,$6)}
  | READ LPAREN ID RPAREN { While.READ $3 }
  | PRINT LPAREN aexp RPAREN { While.PRINT $3 }
  ;

aexp:
  | aexp PLUS aexp  { While.ADD ($1,$3) }
  | aexp MINUS aexp { While.SUB ($1,$3) }
  | aexp STAR aexp  { While.MUL ($1,$3) }
  | NUM { While.NUM $1 }
  | ID { While.VAR $1 }
  | LPAREN aexp RPAREN { $2 }
  ;

bexp:
  | TRUE { While.TRUE }
  | FALSE { While.FALSE }
  | NOT bexp { While.NEG $2 }
  | aexp EQUALEQUAL aexp { While.EQ ($1,$3) }
  | aexp LE aexp { While.LE ($1,$3) } 
  | bexp AND bexp { While.AND ($1,$3) }
  | LPAREN bexp RPAREN { $2 }
  ;
%%

let parse_error s = print_endline s
