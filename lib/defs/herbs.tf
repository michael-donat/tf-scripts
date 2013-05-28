/def ziola_sortuj = \
    otworz zamkniety przytroczony woreczek%; \
    wez wszystko z niego%; \
    otworz zamkniety przytroczony woreczek%; \
    wez wszystko z niego%; \
    otworz zamkniety przytroczony woreczek%; \
    wez wszystko z niego%; \
    otworz zamkniety przytroczony woreczek%; \
    wez wszystko z niego%; \
    otworz zamkniety przytroczony woreczek%; \
    wez wszystko z niego%; \
    wloz zolte jasne kwiaty do pierwszego przytroczonego woreczka%; \
    wloz czterokanciaste rozgalezione lodygi do drugiego przytroczonego woreczka%; \
    wloz kremowe owlosione kwiaty do trzeciego przytroczonego woreczka%; \
    wloz drobne ukwiecone galazki do czwartego przytroczonego woreczka%; \
    wloz ziola do trzeciego przytroczonego woreczka%; \
    wloz ziola do czwartego przytroczonego woreczka%; \
    wloz ziola do pierwszego przytroczonego woreczka%; \
    wloz ziola do drugiego przytroczonego woreczka%; \
    wloz ziola do piatego przytroczonego woreczka%; \
    zamknij woreczki

/def ziola_chowaj = \
    otworz %{*} woreczek%;\
    wloz ziola do niego%;\
    zamknij go

/def ziola_woreczki = \
    otworz plecak%; \
    otworz zamkniety przytroczony woreczek%; \
    wez wszystko z niego%; \
    odtrocz otwarty przytroczony woreczek%; \
    wloz go do plecaka%; \
    otworz zamkniety przytroczony woreczek%; \
    wez wszystko z niego%; \
    odtrocz otwarty przytroczony woreczek%; \
    wloz go do plecaka%; \
    otworz zamkniety przytroczony woreczek%; \
    wez wszystko z niego%; \
    odtrocz otwarty przytroczony woreczek%; \
    wloz go do plecaka%; \
    otworz zamkniety przytroczony woreczek%; \
    wez wszystko z niego%; \
    odtrocz otwarty przytroczony woreczek%; \
    wloz go do plecaka%; \
    otworz zamkniety przytroczony woreczek%; \
    wez wszystko z niego%; \
    odtrocz otwarty przytroczony woreczek%; \
    wloz go do plecaka%; \
    przytrocz woreczki%; \
    /ziola_sortuj

/def ziola_sprawdz = \
    zajrzyj do pierwszego przytroczonego woreczka%;\
    zajrzyj do drugiego przytroczonego woreczka%;\
    zajrzyj do trzeciego przytroczonego woreczka%;\
    zajrzyj do czwartego przytroczonego woreczka%;\
    zajrzyj do piatego przytroczonego woreczka%;\

/def dell = \
    przestan walczyc%; \
    opusc bron%; \
    otworz pierwszy przytroczony woreczek%; \
    wez zolty jasny kwiat z niego%; \
    zjedz zolty jasny kwiat%; \
    wloz ziola do niego%;\
    dobadz broni%; \
    zamknij otwarte woreczki

/def dziur = \
    przestan walczyc%; \
    opusc bron%; \
    otworz drugi przytroczony woreczek%; \
    wez cztery czterokanciaste rozgalezione lodygi z niego%; \
    rozgryz czterokanciaste rozgalezione lodygi%; \
    wloz ziola do niego%;\
    dobadz broni%; \
    zamknij otwarte woreczki

/def przel = \
    przestan walczyc%; \
    opusc bron%; \
    otworz trzeci przytroczony woreczek%; \
    wez kremowy owlosiony ususzony kwiat z niego%; \
    sproszkuj kremowy owlosiony ususzony kwiat%; \
    wloz ziola do niego%;\
    dobadz broni%; \
    zamknij otwarte woreczki

/def swietl = \
    opusc bron%; \
    otworz czwarty przytroczony woreczek%; \
    wez drobna ukwiecona galazke z niego%; \
    rozgryz drobna ukwiecona galazke%; \
    wloz ziola do niego%;\
    dobadz broni%; \
    zamknij otwarte woreczki

/def pokrz = \
    opusc bron%; \
    otworz trzeci przytroczony woreczek%; \
    wez kanciasta parzaca lodyge z niego%; \
    zjedz kanciasta parzaca lodyge%; \
    wloz ziola do niego%;\
    dobadz broni%; \
    zamknij otwarte woreczki