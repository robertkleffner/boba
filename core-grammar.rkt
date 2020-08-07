#lang brag

program ::= data-constructor* simple-expr

data-constructor ::= term-constructor INTEGER



term-statement-block ::= /"{" simple-expr /"}"

simple-expr ::= word*

@word ::= term-statement-block
       | assign-word
       | let-word
       | let-rec-word
       | handle-word
       | if-word
       | while-word
       | function-literal
       | list-literal
       | vector-literal | slice-literal
       | dictionary-literal
       | record-literal | extension | restriction | selection | update
       | variant-literal | embedding | case-word
       | new-ref | get-ref | put-ref
       | term-variable
       | predicate-name
       | term-constructor
       | operator-name
       | "do"
       | STRING
       | INTEGER
       | DECIMAL
       | CHAR



assign-word ::= /"assign" term-variable* /"in" word



let-word ::= /"local" /"fun" term-variable /"=" simple-expr /"in" word

let-rec-word ::= /"local" /"recursive" (/"fun" term-variable /"=" simple-expr)+ /"in" word



handle-word ::= /"handle" handle-params term-statement-block /"with" /"{" handler* return /"}"

handle-params ::= term-variable*

handler ::= operator-name term-variable* /"=>" simple-expr /";"

@return ::= /"afterward" simple-expr /";"



if-word ::= /"if" term-statement-block term-statement-block

while-word ::= /"while" term-statement-block term-statement-block



function-literal ::= /"(" simple-expr /")"



list-literal ::= /"L[" /"]"

vector-literal ::= /"V[" /"]"

slice-literal ::= /"S[" slice-literal? word ".." word /"]"



dictionary-literal ::= /"D{" /"}"



record-literal ::= /"R{" /"}"

extension ::= /"+" term-variable

restriction ::= /"-" term-variable

selection ::= /"<-" term-variable

update ::= /"->" term-variable



variant-literal ::= /"V{" term-variable /"}"

embedding ::= /"|" term-variable

case-word ::= /"case" /"{" (term-variable /"=>" simple-expr /";")+ /"otherwise" /"=>" simple-expr /";" /"}"



new-ref ::= /"new@"

get-ref ::= /"get@"

put-ref ::= /"put@"



property-name ::= PROPERTY_NAME
operator-name ::= OPERATOR_NAME
predicate-name ::= PREDICATE_NAME
term-variable ::= SMALL_NAME
term-constructor ::= BIG_NAME