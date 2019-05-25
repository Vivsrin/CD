%{
#include<stdio.h>
int flag=0;
%}
%token ID num
%%
S:S '=' L|R {flag++;}
;
L: '*' R| ID| num;
R:L;
%%
main()
{
printf("enter the expression for the grammar \n S->S=L|R\nL->*R|ID|num\nR->L");
yyparse();
if(flag)
printf("valid expression\n");
else
yyerror();
}
void yyerror()
{
printf("Invalid expression\n");
exit(1);
}
