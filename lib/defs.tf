
/def kto_stowarzyszenie = /send zapytaj ore o krasnoludy
/alias kkto /kto_stowarzyszenie

/alias uww uderz w brame

/set container_money_B=swoj plecak
/set container_money_C=swojego plecaka
/set container_valuables_B=swoja sakiewke
/set container_valuables_C=swojej sakiewki

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
/alias koksior /send napij sie z manierki%;/send stan
/alias koksik /get_money%;kup zabojce trolli do buklaka%;/pack_money
/alias koksiorek /get_money%;kup przepalanke do manierki%;/pack_money

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

/alias wns /send kup bilet%;/send -h wejdz na statek
/alias zzs /send -h zejdz ze statku

/def skora = \
    /send powsun dobyta bron do uprzezy%;\
    /send podobadz broni z pochwy%;\
    /send wytnij skore z ciala %{*}%;\
    /send wloz skore do plecaka%;\
    /send poschowaj dobyta bron do pochwy%;\
    /send powyjmij bron z uprzezy%;\
    /send dobadz jej

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

/def -p1 -aCbgred -t'* nie nadaje sie do naprawy.' _naprawa_nogood

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

/def por = \
    porownaj sile z %{*}%;\
    porownaj zrecznosc z %{*}%;\
    porownaj wytrzymalosc z %{*}

/def poczta = \
    /if ({1}=~"+") \
        /set _statusbar_mail=$[decode_attr("[MAIL]", "Cbggreen")]%;\
    /else \
        /set _statusbar_mail=[MAIL]%;\
    /endif

;/def -arCrgb035 -t'*glaz*' glaz1
/def onload = wez glazy%;wloz glazy do worka%;wez glazy%;wloz glazy do drugiego worka%;wez glazy%;wloz glazy do trzeciego worka%;wez glazy%;wloz glazy do plecaka
/def offload = wez glazy z plecaka%;odloz glazy%;wez glazy z worka%;odloz glazy%;wez glazy z drugiego worka%;wez glazy z trzeciego worka%;odloz glazy

/def butyon = wloz grawerowana zbroje do plecaka%;wez buty z plecaka%;zaloz buty
/def butyoff = wloz buty do plecaka%;wez grawerowana zbroje z plecaka%;zaloz zbroje

/def sark = otworz sarkofag%;ob go%;wez wszystko z niego

/def nago = wez worek z plecaka%;odloz go%;wloz wszystkie zbroje do niego
/def nagoo = wez wszystkie zbroje z worka%;zaloz je%;wez worek%;wloz go do plecaka


/def -mregexp -t'(Na two.* ramie.* niespodziewanie.* szczur|Bialy golab pocztowy laduje na twoim ramieniu\\.|Na twoim ramieniu niespodziewanie wyladowal|Masz nowa poczte od (.*)\\.)' new_mail = \
    /poczta +%;/info Poczta od: %{P2-golab}

/def -mregexp -t'(?:Mowisz do|Szepczesz zlowieszczo do) (.*?)(:| w .*):?.*' speach_catch_whom = \
    /set global_speach_target=%{P1}

/alias @ ' do %{global_speach_target} %{*}

/def pp = pobierz paczke %{1}%;wloz paczke do plecaka
/def ppp = wez paczke z plecaka%;ob paczke%;oddaj paczke%;mmm%;wloz paczke do plecaka
/def pppp = zdejmij plecak%;odloz plecak%;wez paczke z plecaka%;ob paczke%;oddaj paczke%;mmm%;wez plecak%;zaloz plecak%;wloz paczke do plecaka

/def container_process = \
    /test $[getopts("a:c:", "")]%;\
    /let list=%{*}%;\
    /let pointer=$[strstr({list},",")] %;\
    /let index=0%;\
    \
    /while ({pointer}!=-1) \
        /let index=$[%{index}+1]%;\
        /let item=$[substr({list},0,{pointer})]%;\
        /let list=$[substr({list},{pointer}+1)]%;\
        /let pointer=$[strstr({list}, ",")]%;\
        /send %{opt_a} %{item} %{opt_c}%;\
     /done%;\

/def dd = /container_process -a'wez' -c'z plecaka' %{*},
/def dp = /container_process -a'wloz' -c'do plecaka' %{*},

/def zbin = przejrzyj depozyt%;wloz wszystkie zbroje do depozytu%;wez buty z depozytu%;zaloz je
/def zbon = przejrzyj depozyt%;wloz buty do depozytu%;wez wszystkie zbroje z depozytu%;zaloz je

/def key_f18 = /zabij mutanta%;rozkaz druzynie zabic mutanta%;przedstaw mutanta
/def key_f19 = /zabij gromgola%;rozkaz druzynie zabic gromgola%;przedstaw gromgola

/def krew = dbb%;podobadz broni z pochwy
/def kreww = poschowaj bron do pochwy%;ddb



/def trof = /send powsun dobyta bron do uprzezy%;/send podobadz broni z pochwy%;/send wytnij trofeum z %{*} ciala%;/send wloz trofea do plecaka%;/send poschowaj dobyta bron do pochwy%;/send powyjmij bron z uprzezy%;/send dobadz jej

/def zdajkosz = wloz amulety do kosza%;wloz buty do kosza%;wloz okulary do kosza

/def wkl = wez wszystko z ciala

/def magiki = \
  /set _przegladamy_magiki=14%; \
  /def -F -aLg -mregexp -t'^$$' __delete_blank_lines %; \
  /def -F -aLg -mregexp -t'(Zauwazasz|Nie ma tutaj|Slucham)' _przegladamy_magiki_catch = \
    /set _przegladamy_magiki=$$[{_przegladamy_magiki}-1]%%; \
    /if ({_przegladamy_magiki} == 0) \
      /purge __delete_blank_lines%%; \
      /purge _przegladamy_magiki_catch%%; \
    /endif%; \
  przejrzyj srebrzyste kosy bojowe %;\
  przejrzyj adamantytowe szpiczaste partyzany%; \
  przejrzyj ogromne ogniste trojzeby%; \
  przejrzyj polprzezroczyste migotliwe dragi%; \
  przejrzyj gwiezdne topory%; \
  przejrzyj misterne obosieczne topory%; \
  przejrzyj kunsztowne mithrylowe topory bojowe%; \
  przejrzyj wielkie runiczne mloty wojenne%; \
  przejrzyj zdobione jasniejace mloty bojowe%; \
  przejrzyj gigantyczne granitowe mloty%; \
  przejrzyj kosciane kilofy%; \
  przejrzyj szkarlatne dlugie talwary%; \
  przejrzyj poszczerbione obureczne miecze%; \
  przejrzyj waskie kunsztowne sihille%; \
  przejrzyj snieznobiale lsniace sztylety

/def port = /eval /echo '%_map_gmcp_location': '%_map_room_id'

/def lap = /load keyboards/lap.tf

/def code = \
    /load code.tf

/alias zdaj ddbb%;wloz bronie do stojaka

/def jedz = mm%;usiadz za stolem%;zamow zupe%;zamow zupe%;zamow zupe%;zamow zupe%;zamow zupe%;zamow zupe%;zamow zupe%;zamow zupe%;zamow zupe%;zamow zupe%;wstan%;mmm