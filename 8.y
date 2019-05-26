%{
#include<stdio.h>

%}

%token id num 
%left '<' '>' "=" '!'
%left '+' '-'
%left '/' '*' '%'
%left "++" "--"
%left '(' ')'
%nonassoc UMINUS

%%
stmt : relexp {printf(" Valid\n");}
;
relexp : '(' relexp ')'
| relexp '<' relexp {printf("LT\t");$$=$1<$3;printf(" Result=%d\n",$$);}
| relexp '>' relexp {printf("GT\t");$$=$1>$3;printf(" Result=%d\n",$$);}
| relexp '>' '=' relexp {printf("GTE\t");$$=$1>=$3;printf(" Result=%d\n",$$);}
| relexp '<' '=' relexp {printf("LTE\t");$$=$1<=$3;printf(" Result=%d\n",$$);}
| relexp '=' '=' relexp {printf("EQ\t");$$=$1==$3;printf(" Result=%d\n",$$);}
| relexp '!' '=' relexp {printf("NEQ\t");$$=$1!=$3;printf(" Result=%d\n",$$);}
| exp
;
exp : '(' exp ')' 
| '+''+' exp {printf("Unary plus prefix");$$=$3+1;}
| exp '+''+' {printf("Unary plus postfix");}
| '-''-' exp {printf("Unary minus prefix");$$=$3-1;}
| exp '-''-' {printf("Unary minus postfix");}
| exp '+' exp {$$=$1+$3;}
| exp '-' exp {$$=$1-$3;}
| exp '*' exp {$$=$1*$3;}
| exp '/' exp {if($3==0) printf("Division by zero"); else $$=$1/$3;}
| exp '%' exp {$$=$1%$3;}
| id
| num
;
%%

int main (){
printf("Enter an arithmetic expression\n");
yyparse();
}
int yyerror() {
printf("Invalid exp\n");
exit(1);
}
