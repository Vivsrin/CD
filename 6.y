%{
#include<stdio.h>
#include<stdlib.h>
%}
%token id num arop
%%
stmt: expn {printf("statement accepted");};
expn:expn arop expn{
switch($2){
case '+':$$=$1+$3;
break;
case '-':$$=$1-$3;
break;
case '*':$$=$1/$3;
break;
case '/':$$=$1/$3;
break;
}
printf("result of the expression: %d\n",$$);};
expn: expn arop {printf("Invalid syntax:right operand missing");};
expn: arop expn {printf("Invalid syntax:left operand missong");};
%% void main(){
printf("Enter expression");
yyparse();
}
yyerror(){
exit(1);
}