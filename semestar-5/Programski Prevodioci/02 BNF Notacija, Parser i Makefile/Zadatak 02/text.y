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

%token _COMMA

%%

text 
  : sentence
  | text sentence
  ;
          
sentence 
  : words _DOT
  ;

words 
  : _CAPITAL_WORD
  | words comma _WORD
  | words comma _CAPITAL_WORD    
  ;

comma
  : 
  | _COMMA
  ;

%%

int main() {
  yyparse();
}

int yyerror(char *s) {
  fprintf(stderr, "line %d: SYNTAX ERROR %s\n", yylineno, s);
} 

