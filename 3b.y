%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
int yylex();
void yyerror(char *s);
%}

%token NUM
%start S
%left '+' '-' 
%left '*' '/'

%%
S:E {printf("the evaluated value is :%d",$$);}
 ;
E:E '+' E {$$=$1+$3;}
 | E '-' E {$$=$1-$3;}
 | E '*' E {$$=$1*$3;}
 | E '/' E {
 if($3!=0)
 $$=$1/$3;
 else
 yyerror("Division by Zero");
 }
 | '(' E ')' {$$=$2;}
 | NUM 
 ;
%%

int main()
{
    printf("enter the expression:\n");
    yyparse();
    return 0;
}

void yyerror(char *s)
{
   printf("error is --> %s",s);
   exit(0);
}

 
