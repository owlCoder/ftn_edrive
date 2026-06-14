%{
  #include <stdio.h>
  int yylex(void);
  int yyparse(void);
  int yyerror(char *);
  extern int yylineno;

  int p_counter = 0;
%}

%token  _DOT
%token  _CAPITAL_WORD
%token  _WORD

%token _NEWLINE

%%

text 
  : paragraph       { p_counter++; }
  | text paragraph  { p_counter++; }
  ;
          
sentence 
  : words _DOT
  ;

newline
  : /* ne mora imati novi red */
  | newline _NEWLINE
  ;

paragraph
  : sentence newline
  ;

words 
  : _CAPITAL_WORD
  | words _WORD
  | words _CAPITAL_WORD    
  ;

%%

int main() {
  yyparse();

  printf("\nBroj pasusa je: %d\n", p_counter);
}

int yyerror(char *s) {
  fprintf(stderr, "line %d: SYNTAX ERROR %s\n", yylineno, s);
} 

