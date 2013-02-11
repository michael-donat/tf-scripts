/isize 1

/require alias.tf
/require spedwalk.tf
/require kbbind.tf
/require map.tf
/require textutil.tf
/require lisp.tf
/require complete.tf
/require relog.tf
/require kbstack.tf
/require at.tf


/set db_odmiana=../data/db/odmiana.db


/def setcolors = \
    /send kolor tekst 250%;\
    /send kolor brak otrzymanych obrazen 240%;\
    /send kolor niskie otrzymane obrazenia 240%;\
    /send kolor srednie otrzymane obrazenia 172%;\
    /send kolor wysokie otrzymane obrazenia 160%;\
    /send kolor brak zadanych obrazen 228%;\
    /send kolor niskie zadane obrazenia 34%;\
    /send kolor srednie zadane obrazenia 34%;\
    /send kolor wysokie zadane obrazenia 34%;\
    /send kolor opisy walki 87