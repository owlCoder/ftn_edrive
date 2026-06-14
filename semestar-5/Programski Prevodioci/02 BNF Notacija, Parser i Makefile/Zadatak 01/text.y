%{
  #include <stdio.h>
  int yylex(void);
  int yyparse(void);
  int yyerror(char *);
  extern int yylineno;

  int e_sentences = 0, q_sentences = 0, d_sentences = 0;
%}

%token  _DOT
%token  _CAPITAL_WORD
%token  _WORD

%token _QUESTION_MARK
%token _EXLAMATION_MARK

%%

text 
  : sentence
  | text sentence
  ;
          
sentence 
  : words _DOT                { d_sentences++; }
  | words _QUESTION_MARK      { q_sentences++; }
  | words _EXLAMATION_MARK    { e_sentences++; }
  ;

words 
  : _CAPITAL_WORD
  | words _WORD
  | words _CAPITAL_WORD    
  ;

%%

int main() {
  yyparse();

  printf("\nObavestajnih recenica: %d", d_sentences);
  printf("\nUpitnih recenica: %d", q_sentences);
  printf("\nUzvicnih recenica: %d\n", e_sentences);
}

int yyerror(char *s) {
  fprintf(stderr, "line %d: SYNTAX ERROR %s\n", yylineno, s);
} 

