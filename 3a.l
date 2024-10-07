%{
 #include<stdio.h>
 int p=0,n=0,pf=0,nf=0;
%}

%%
[+]?[0-9]+ {p++;}
[-][0-9]+ {n++;}
[+]?[0-9]+[.][0-9]+ {pf++;}
[-][0-9]+[.][0-9]+ {nf++;}
[+]?[0-9]+[.]?[0-9]*[/][+]?[0-9]+[.]?[0-9]* {pf++;}
[-][0-9]+[.]?[0-9]*[/][-][0-9]+[.]?[0-9]* {pf++;}
[+]?[0-9]+[.]?[0-9]*[/][-][0-9]+[.]?[0-9]* {nf++;}
[-][0-9]+[.]?[0-9]*[/][+]?[0-9]+[.]?[0-9]* {nf++;}
. { }
\n {return 0;}
%%

int main()
{
  printf("enter the numbers:\n");
  yylex();
  printf("the number of positive numbers:%d\nthe number of negative numbers:%d\nthe number of positive fractions:%d\nthe number of negative fractions:%d\n",p,n,pf,nf);
  return 0;
}
