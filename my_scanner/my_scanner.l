%{
    #include "my_scanner_token.h"
%}
DIGIT [0-9]
LETTER [a-zA-Z]
%%

[" "|\t|\n] /* skip whitespace */
{DIGIT}+  {return TOKEN_NUMBER_INT;}
[DIGIT].[DIGIT+]    {return TOKEN_NUMBER_FLOAT;}
'{LETTER}'  {return TOKEN_LETTER_CHAR;}
int     {return TOKEN_INT;}
float   {return TOKEN_FLOAT;}
char    {return TOKEN_CHAR;}
if      {return TOKEN_IF;}
else    {return TOKEN_ELSE;}
for     {return TOKEN_FOR;}
while   {return TOKEN_WHILE;}
["//"|"/*"|"*/"]      {return TOKEN_COMMENT;}
["||"]   {return TOKEN_OR;}
\&&      {return TOKEN_AND;}
\=       {return TOKEN_ASSIGN;}
\==      {return TOKEN_EQUAL;}
\%       {return TOKEN_MOD;}
\!=      {return TOKEN_NOTEQUAL;}
\<       {return TOKEN_LESS;}
\>       {return TOKEN_GRATER;}
\<=      {return TOKEN_LESSEQUAL;}
\>=      {return TOKEN_GRATEREQUAL;}
\++    {return TOKEN_INCREASE;}
\--    {return TOKEN_REDUCE;}
\+     {return TOKEN_ADD;}  
\-     {return TOKEN_SUB;}
\*     {return TOKEN_MULTIPLICATION;}
("/")  {return TOKEN_DIVISION;}
{LETTER}+({DIGIT}|{LETTER}|_)* {return TOKEN_IDENT;}
.      {return TOKEN_ERROR;}
%%

int yywrap() {return 1;}
