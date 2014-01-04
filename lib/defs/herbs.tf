/def przelot_susz = otworz trzeci przytroczony woreczek%;wez kremowe kwiaty z niego%;wloz ususzone kremowe kwiaty do niego%;zamknij woreczki
/def przelot_chowaj = otworz trzeci przytroczony woreczek%;wloz ususzone kwiaty do niego%;zamknij woreczki

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
    otworz pierwszy odtroczony woreczek%;\
    wez wszystko z niego%; \
    otworz drugi odtroczony woreczek%;\
    wez wszystko z niego%; \
    otworz trzeci odtroczony woreczek%;\
    wez wszystko z niego%; \
    otworz czwarty odtroczony woreczek%;\
    wez ziola z niego%;\
    wloz zolte jasne kwiaty do pierwszego przytroczonego woreczka%; \
    wloz zolte jasne kwiaty do pierwszego odtroczonego woreczka%; \
    wloz czterokanciaste rozgalezione lodygi do drugiego przytroczonego woreczka%; \
    wloz czterokanciaste rozgalezione lodygi do drugiego odtroczonego woreczka%; \
    wloz kremowe owlosione kwiaty do trzeciego przytroczonego woreczka%; \
    wloz drobne ukwiecone galazki do czwartego przytroczonego woreczka%; \
    wloz kanciaste parzace lodygi do piatego przytroczonego woreczka%; \
    wloz ziola do trzeciego przytroczonego woreczka%; \
    wloz ziola do czwartego przytroczonego woreczka%; \
    wloz ziola do pierwszego przytroczonego woreczka%; \
    wloz ziola do drugiego przytroczonego woreczka%; \
    wloz ziola do piatego przytroczonego woreczka%; \
    wloz ziola do pierwszego odtroczonego woreczka%; \
    wloz ziola do drugiego odtroczonego woreczka%; \
    wloz ziola do trzeciego odtroczonego woreczka%; \
    wloz ziola do czwartego odtroczonego woreczka%; \
    zamknij woreczki

/def ziola_chowaj = \
    otworz %{*} przytroczony woreczek%;\
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
    /echo PIERWSZY PAS%;\
    zajrzyj do pierwszego przytroczonego woreczka%;\
    /echo DRUGI PAS%;\
    zajrzyj do drugiego przytroczonego woreczka%;\
    /echo TRZECI PAS%;\
    zajrzyj do trzeciego przytroczonego woreczka%;\
    /echo CZWARTY PAS%;\
    zajrzyj do czwartego przytroczonego woreczka%;\
    /echo PIATY PAS%;\
    zajrzyj do piatego przytroczonego woreczka%;\
    /echo PIERWSZY RECE%;\
    zajrzyj do pierwszego odtroczonego woreczka%;\
    /echo DRUGI RECE%;\
    zajrzyj do drugiego odtroczonego woreczka%;\
    /echo TRZECI RECE%;\
    zajrzyj do trzeciego odtroczonego woreczka%;\
    /echo CZWARTY RECE%;\
    zajrzyj do czwartego odtroczonego woreczka

/def ziolo_daj = \
    /let woreczek=%{1}%;\
    /let ziolo=%{-2}%;\
    /let komu=%{2}%;\
    /if ({woreczek}=~1) \
        /let woreczek pierwszy%;\
    /elseif ({woreczek}=~2) \
        /let woreczek drugi%;\
    /elseif ({woreczek}=~3) \
        /let woreczek trzeci%;\
    /elseif ({woreczek}=~4) \
        /let woreczek czwarty%;\
    /else \
        /let woreczek piaty%;\
    /endif%;\
    /send otworz %{woreczek} przytroczony woreczek%;\
    /send wez %{ziolo} z niego%;\
    /send zamknij woreczki%;\
    /send daj %{ziolo} %{komu}%;\

/def ziolo_daj_zapas = \
    /let woreczek=%{1}%;\
    /let ziolo=%{-2}%;\
    /let komu=%{2}%;\
    /if ({woreczek}=~1) \
        /let woreczek pierwszy%;\
    /elseif ({woreczek}=~2) \
        /let woreczek drugi%;\
    /elseif ({woreczek}=~3) \
        /let woreczek trzeci%;\
    /elseif ({woreczek}=~4) \
        /let woreczek czwarty%;\
    /else \
        /let woreczek piaty%;\
    /endif%;\
    /send otworz %{woreczek} odtroczony woreczek%;\
    /send wez %{ziolo} z niego%;\
    /send zamknij woreczki%;\
    /send daj %{ziolo} %{komu}%;\

/def ziolo = \
    /let woreczek=%{1}%;\
    /let ziolo=%{-2}%;\
    /let co=%{2}%;\
    /if ({woreczek}=~1) \
        /let woreczek pierwszy%;\
    /elseif ({woreczek}=~2) \
        /let woreczek drugi%;\
    /elseif ({woreczek}=~3) \
        /let woreczek trzeci%;\
    /elseif ({woreczek}=~4) \
        /let woreczek czwarty%;\
    /else \
        /let woreczek piaty%;\
    /endif%;\
    \
    /send otworz %{woreczek} przytroczony woreczek%;\
    /send wez %{ziolo} z niego%;\
    /send zamknij woreczki%;\
    /if ({co}!~NULL) \
        /send %{co} %{ziolo}%;\
    /endif

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
    otworz piaty przytroczony woreczek%; \
    wez kanciasta parzaca lodyge z niego%; \
    zjedz kanciasta parzaca lodyge%; \
    wloz ziola do niego%;\
    dobadz broni%; \
    zamknij otwarte woreczki


/def -Fp200 -mregexp -t'([Dd]robn(ych|e|y) ukwiecon(e|a|ych) galaz(ek|ka|ki|))([ .,])' _ziolo_Swietlik = /substitute -p %{PL}%{P1} @{BxCgreen}(Swietlik [zjedz = +spost])@{n}%{P5}%{PR}