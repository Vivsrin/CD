%{
#include<stdio.h>
int flag=0;
%}
%token type ID
%%
D: T ' ' L;
T: type;
L: L ',' ID| ID;
%%
main()
{
printf("enter the expression for the grammar D -> TL\nT -> int | float | long int | double | static int | register int\nL -> L,ID|ID\n");
yyparse();
if(flag)
printf("valid experession\n");
}
else
yyerror();
void yyerror()
{printf("Invalid expression\n");
exit(1);
}
