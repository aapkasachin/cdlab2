%{
 #include "y.tab.c"
 #include<stdlib.h>
 extern int yylval;
%}

%%
"+" {return '+';}
"-" {return '-';}
"*" {return '*';}
"/" {return '/';}
[0-9]+ {yylval=atoi(yytext);return NUM;}
. {return yytext[0];}
\n {return 0;}
%%

int yywrap()
{
  return 1;
}
