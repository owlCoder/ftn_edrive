%{
  #include <stdio.h>
  int yylex(void);
  int yyparse(void);
  int yyerror(char *);
  extern int yylineno;
%}

%token  _DOT
%token  _CAPITAL_WORD
%token  _WORD

%token _ACTOR
%token _COLON

%%

text 
  : sentence
  | text sentence
  ;

actor
  : /* moze se pojaviti, ali ne mora */
  | _ACTOR _COLON
  ;

sentence 
  : actor words _DOT
  ;

words 
  : _CAPITAL_WORD
  | words _WORD
  | words _CAPITAL_WORD    
  ;

%%

int main() {
  yyparse();
}

int yyerror(char *s) {
  fprintf(stderr, "line %d: SYNTAX ERROR %s\n", yylineno, s);
} 

