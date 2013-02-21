
/def kto_stowarzyszenie = /send zapytaj ore o krasnoludy
/alias kkto /kto_stowarzyszenie

/set container_money_B=plecak
/set container_money_C=plecaka
/set container_valuables_B=sakiewke
/set container_valuables_C=sakiewki

/def get_money = /send wez %{*} monety z %{container_money_C}
/def pack_money = /send wloz %{*} monety do %{container_money_C}
/def get_valuables = /send otworz %{container_valuables_B}%;/send wez mithrylowe monety z %{container_valuables_C}%;/send wez kamienie z %{container_valuables_C}%;/send zamknij %{container_valuables_B}
/def pack_valuables = /send otworz %{container_valuables_B}%;/send wloz mithrylowe monety do %{container_valuables_C}%;/send wloz kamienie do %{container_valuables_C}%;/send zamknij %{container_valuables_B}
/alias mm /get_money
/alias mmm /pack_money
/alias mmk /get_valuables
/alias mmmk /pack_valuables

/alias pij /send napij sie do syta
/alias koks /send napij sie z buklaka%;/send stan
/alias koksik /get_money%;kup zabojce trolli do buklaka%;/pack_money

/def read_board = \
    /if ({1} == 1) \
        /send ob tablice%;\
    /elseif ({1} == 2) \
        /send przeczataj tablice%;\
    /elseif ({1} == 3) \
        /send ob tabliczke%;\
    /elseif ({1} == 4) \
        /send przeczytaj tabliczke%;\
    /endif

/alias t1 /read_board 1
/alias t2 /read_board 2
/alias t3 /read_board 3
/alias t4 /read_board 4

/alias czyt /send przeczytaj %{*}

/alias kk k wszystkich
/alias ll zerknij
/alias ls sp

/alias wk wez monety z ciala%;wez kamienie z ciala
/alias wkk \
    /send wez monety z ciala%;/send wez monety z drugiego ciala%;/send wez monety z trzeciego ciala%;/send wez monety z czwartego ciala%;/send wez monety z piatego ciala%;/send wez monety z szostego ciala%;\
    /send wez kamienie z ciala%;/send wez kamienie z drugiego ciala%;/send wez kamienie z trzeciego ciala%;/send wez kamienie z czwartego ciala%;/send wez kamienie z piatego ciala%;/send wez kamienie z szostego ciala

/alias ' jpowiedz %{*}
/def wspolny = /alias ' powiedz %%{*}
/def krasnoludzki = /alias ' jpowiedz %%{*}

/alias wns /send kup bilet%;/send wejdz na statek
/alias zzs /send zejdz ze statku

/def skora = \
    /send powsun bron do uprzezy%;\
    /send wez noz z plecaka%;\
    /send dobadz noza%;\
    /send wytnij skore z ciala %{*}%;\
    /send wloz skore do plecaka%;\
    /send wloz noz do plecaka%;\
    /send ddb

/def ocen = \
    /set ocen_count=0%;\
    /send ocen %{*}

 /def -p1 -aBCmagenta -mglob -t'Oceniasz starannie *' ocena_hook = \
    /set ocen_count=$[{ocen_count}+1]%;\
    /substitute %{ocen_count} %{*}

/alias ocen /ocen %{*}

/def klaus = \
    /send wez monety z plecaka%;\
    /send zaplac za leczenie%;\
    /send zdejmij wszystko%;\
    /send dbb%;\
    /send usiadz na kozetce

/def klauss = \
    /send zaloz fartuch%;\
    /send zaloz pas%;\
    /send zaloz wszystko%;\
    /send ddb%;\
    /send zepnij plaszcz spinka%;\
    /send wloz monety do plecaka

/def -p5 -F -aCred -t'* nie nadaje sie do naprawy.' _naprawa_nogood

/def dbz = \
    wez bron drzewcowa z plecaka%;\
    wez bron z uprzezy%;\
    wloz ja do plecaka%;\
    dbb

/alias dbz /dbz

/def skrotin=przecisnij sie przez otwor%; przecisnij sie na zachod%; przecisnij sie na poludniowy-zachod%; przecisnij sie na poludniowy-wschod
/def skrotout=przecisnij sie przez otwor%; przecisnij sie na polnocny-wschod%; przecisnij sie na wschod%; przecisnij sie na poludniowy-zachod

/def krolken = wk%;wez klucz z ciala%;otworz skrzynie kluczem%;otworz skrzynie%;wez monety z skrzyni%;odloz klucz

/def gnis = /zabij poteznego dostojnego goblina

/def szczelina = przecisnij sie przez szczeline%;wejdz w szczeline
/def krata = podnies krate

/def srebro = \
    wez kluczyk z ciala%; \
    otworz kufer kluczem%; \
    otworz kufer kluczykiem%; \
    otworz kufer%; \
    wez monety z kufra%; \
    wloz kluczyk do kufra%;\
    otworz szkatulke kluczem%; \
    otworz szkatulke kluczykiem%; \
    otworz szkatulke%; \
    wez monety ze szkatulki%; \
    wloz kluczyk do szkatulki%;\
    otworz szrzynie kluczem%; \
    otworz skrzynie kluczykiem%; \
    otworz skrzynie%; \
    wez monety ze skrzyni%; \
    otworz szrzynke kluczem%; \
    otworz skrzynke kluczykiem%; \
    otworz skrzynke%; \
    wez monety ze skrzynki%; \
    wloz kluczyk do skrzynki%; \
    wloz kluczyk do skrzyni