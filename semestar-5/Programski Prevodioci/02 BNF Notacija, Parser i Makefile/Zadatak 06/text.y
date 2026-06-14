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

%token _LPAREN
%token _RPAREN

%%

text 
  : sentence
  | text sentence
  ;
          
sentence 
  : words _DOT
  ;

left_prefix
  : /* ne mora da postoji zagrada */
  | _LPAREN
  ;

right_postfix
  : /* ne mora da postoji zagrada */
  | _RPAREN
  ;

words 
  : left_prefix _CAPITAL_WORD right_postfix
  | words left_prefix _WORD right_postfix
  | words left_prefix _CAPITAL_WORD right_postfix
  | words _LPAREN _RPAREN    
  ;

%%

int main() {
  yyparse();
}

int yyerror(char *s) {
  fprintf(stderr, "line %d: SYNTAX ERROR %s\n", yylineno, s);
} 

