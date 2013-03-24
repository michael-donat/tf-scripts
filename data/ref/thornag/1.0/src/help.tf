; /druzyna
; /kk - kondycja wszystkuch

;-------- TEMP
/def _bind_kb_key_nkpDivide = k wszystkich
/def _bind_kb_key_nkpEquals=ws

/def zaslon = \
    /if ({2} =~ "") \
        /send zaslon %{1}%;\
    /else \
        /send zaslon %{1} przed %{2} %{3} %{4}%;\
    /endif

/alias z /zaslon %{*}
/alias zz /send przestan zaslaniac
/alias zzz /send przestan kryc sie za zaslona
/alias zp /send zaslon przed %{*}
/alias zs /send rozkaz druzynie zaslonic ciebie%; /send popatrz opiekunczo na siebie
/alias zr /send rozkaz druzynie zaslonic %{*}%; /send popatrz opiekunczo na %{*}
/def po = /send popatrz opiekunczo na %{*}

/alias kk k wszystkich
/alias ll zerknij
/alias ls sp
/alias mm wez monety z plecaka
/alias mmm wloz monety do plecaka
/alias wk wez monety z ciala
/alias koks napij sie z buklaka%;stan
/alias koksik kup zabojce trolli do buklaka
/alias mmk otworz sakiewke%;wez kamienie z sakiewki%; wez mithrylowe monety z sakiewki%;zamknij sakiewke
/alias mmmk otworz sakiewke%;wloz kamienie do sakiewki%; wloz mithrylowe monety do sakiewki%;zamknij sakiewke

/alias wk wez monety z ciala%;wez kamienie z ciala
/alias wkk /send wez monety z ciala%;/send wez monety z drugiego ciala%;/send wez monety z trzeciego ciala%;/send wez monety z czwartego ciala%;/send wez monety z piatego ciala%;/send wez monety z szostego ciala

/alias ' jpowiedz %{*}
/alias '' powiedz %{*}

/def wspolny = /alias ' powiedz %%{*}
/def mowa = /alias ' jpowiedz %%{*}

/def naprawa = \
    /send zaloz wszystkie zbroje%;\
    /def -t'Masz na sobie (.*)\.' -mregexp _trigger_equip_napraw = /test _trigger_equip_napraw_execute("%%{P1}")%;\
    /send i

/def _trigger_equip_napraw_execute = \
    /set _stuff_for_fixing=$[strcat(replace(', ','|', replace(' i ','|',{1})), "|") ]%;\
    /set _stuff_for_fixing_pointer=$[strstr({_stuff_for_fixing},"|")] %;\
    /set _stuff_for_fixing_i=0%;\
    \
    /while ({_stuff_for_fixing_pointer}!=-1) \
        /set _stuff_for_fixing_item=$[substr({_stuff_for_fixing},0,{_stuff_for_fixing_pointer})]%;\
        /set _stuff_for_fixing=$[substr({_stuff_for_fixing},{_stuff_for_fixing_pointer}+1)]%;\
        /set _stuff_for_fixing_pointer=$[strstr({_stuff_for_fixing},"|")] %;\
        /send napraw %{_stuff_for_fixing_item}%;\
     /done%;\
     /send naostrz bron%;\
     /purge \_trigger\_equip\_napraw

/def lec = n%; wejdz w szczeline%; e%; e%; ob dostojnego goblina%; w%; w%; s%; s

/def attack_show = \
    /list [0-9]

/def redcapy = \
    /def 1 = /attack pierwszego redcapa%;\
    /def 2 = /attack drugiego redcapa%;\
    /def 3 = /attack trzeciego redcapa%;\
    /def 4 = /attack czwartego redcapa%;\
    /def 5 = /attack piatego redcapa

/def zboje = \
    /def 1 = /attack pierwszego zboja%;\
    /def 2 = /attack drugiego zboja%;\
    /def 3 = /attack trzeciego zboja%;\
    /set target2=pierwszego zboja

/def mahak = \
    /def 1 = /attack oficera%;\
    /def 2 = /attack kobolda%;\
    /def 3 = /attack goblina%;\
    /def 4 = /attack pukacza%;\
    /def 5 = /attack barbegazi%;\
    /def 6 = /attack echinopsa%;\
    /def 7 = /attack trolla

/def kurhan = \
    /def 1 = /attack kosciotrupa%%;/set target2=kosciotrupa%;\
    /def 2 = /attack zombiego%%;/set target2=zombiego%;\
    /def 3 = /attack ozywienca%%;/set target2=ozywienca

/def zas = \
    /def key_f13 = z %{1}%;\
    /def key_f14 = z %{2}%;\
    /def key_f15 = z %{3}%;\
    /def esc_key_f13 = z %{1} grupa%;\
    /def esc_key_f14 = z %{2} grupa%;\
    /def esc_key_f15 = z %{3} grupa

/def key_f18 = /send stan

/def dell = \
  przestan walczyc%; \
  opusc bron%; \
  otworz drugi przytroczony woreczek%; \
  wez zolty jasny kwiat z niego%; \
  zjedz zolty jasny kwiat%; \
  wloz kwiat do niego%;\
  dobadz broni%; \
  zamknij otwarte woreczki

/def dziur = \
  przestan walczyc%; \
  opusc bron%; \
  otworz pierwszy przytroczony woreczek%; \
  wez cztery czterokanciaste rozgalezione lodygi z niego%; \
  rozgryz czterokanciaste rozgalezione lodygi%; \
  wloz lodygi do niego%;\
  dobadz broni%; \
  zamknij otwarte woreczki

/def ziolka = \
    zajrzyj do pierwszego przytroczonego woreczka%;\
    zajrzyj do drugiego przytroczonego woreczka

/def topor = \
    /send wez tarcze z plecaka%;\
    /send powsun bron drzewcowa do uprzezy%;\
    /send db%;\
    /send zaloz tarcze

/def partka = \
    /send wloz tarcze do plecaka%;\
    /send zatknij topor za pas%;\
    /send ddb


/def -F -t'(.*) (wydaje ci rozkaz ataku na|wskazuje|spoglada morderczo na) (.*)\.' -mregexp _target_set = \
    /if (%{P1} =~ {_team_leader}) \
        /set main_target=$[tolower({P3})]%;\
        /set rozkaz_ataku=%{main_target}%;\
        /if ({wspierak} =~ "on") \
             /repeat $[rand(0, 100)/30.0 * -1] 1 /send zabij %{main_target}%;\
        /endif%;\
    /endif

/def wspierak = \
    /set wspierak=%{1}

/def attack_mode = \
    /set kill_rozkaz_first=off%;\
    /if ({1} == 1) \
        /set kill_wskazanie=off%;\
        /set kill_wzrok=off%;\
        /set kill_rozkaz=off%;\
    /elseif ({1} == 2) \
        /set kill_wskazanie=on%;\
        /set kill_wzrok=on%;\
        /set kill_rozkaz=off%;\
    /elseif ({1} == 3) \
        /set kill_wskazanie=on%;\
        /set kill_wzrok=on%;\
        /set kill_rozkaz=on%;\
    /elseif ({1} == 4) \
        /set kill_rozkaz_first=on%;\
        /set kill_wskazanie=on%;\
        /set kill_wzrok=on%;\
        /set kill_rozkaz=on%;\
    /else \
        /echo Setting atack mode%;\
        /test echo("      1   -   attack only")%;\
        /test echo("      2   -   attack and look/point")%;\
        /test echo("      3   -   attack and look/point and order")%;\
        /test echo("      4   -   look/point and order and then attack")%;\
    /endif

/def attack = \
    /if ({kill_rozkaz_first} =~ "on") \
        /send wskaz %{*}%;\
        /send popatrz morderczo na %{*}%;\
        /send rozkaz druzynie zabic %{*}%;\
        /send zabij %{*}%;\
        /return%;\
    /endif%;\
    /send zabij %{*}%;\
    /if ({kill_wskazanie} =~ "on") \
        /send wskaz %{*}%;\
    /endif%;\
    /if ({kill_wzrok} =~ "on") \
        /send popatrz morderczo na %{*}%;\
    /endif%;\
    /if ({kill_rozkaz} =~ "on") \
        /send rozkaz druzynie zabic %{*}%;\
    /endif%;\

/def 1 = /attack oficera
/def 2 = /attack kobolda
/def 3 = /attack pierwszego goblina

/def key_f1 = /send kill %{main_target}
/def key_esc_f1 = /send przelam obrone %{main_target}

/def -F -p12 -mregexp -t'Atakujesz (.*), lecz .* zagradza ci droge\.' _failed_attack_a = \
    /test _check_is_covered("%{P1}")

/def -F -p12 -mregexp -t'Probujesz wesprzec .* w walce z (.*), lecz .* zagradza ci droge\.' _failed_support_a = \
    /test _check_is_covered("%{P1}")

/def -F -p12 -mregexp -t'.* zrecznie zaslania (.*) przed twoimi ciosami\.' _combat_event_guard_mine = \
    /test _check_is_covered("%{P1}")

/def _check_is_covered = \
    /let whom=$[tolower({*})]%;\
    /if ({whom} =~ {main_target}) \
        /echo %;\
        /echo %;\
        /echo >>>>>>>>>>>>>>     PRZELAMUJ  %{main_target}      <<<<<<<<<<<<<<<<%;\
        /echo %;\
    /endif


;/def -F -t'hunvert (wskazuje|spoglada morderczo na) (.*)\.' -mregexp _wspierak = \
;    /repeat $[rand(0, 100)/30.0 * -1] 1 /send zabij %{P2}

/def exp_solo = \
    /def _bind_kb_key_nkpEquals = /send nap

/def exp_team = \
    /def _bind_kb_key_nkpEquals = /send ws

/def key_f17 = /send nap

/def -mregexp -p2 -t'Na two.* ramie.* niespodziewanie.* szczur' _poczta_szczur = \
	/set ogolne_poczta=$[strcat({ogolne_poczta},ftime("%H:%M",time()),"szczur","|")] %;\
	/beep 1 %;\
	/status_edit -r1 poczta_show:5:BC%{kolor_alarm} %;\
	/if ({poczta_show} !~ 'none' ) \
		/set poczta_show=MULTI%;\
	/else \
		/set poczta_show=MSG%;\
	/endif

/def -mregexp -p2 -t'Bialy golab pocztowy laduje na twoim ramieniu.' _poczta_golab = \
	/set ogolne_poczta=$[strcat({ogolne_poczta},ftime("%H:%M",time()),"golab","|")] %;\
	/beep 1 %;\
	/status_edit -r1 poczta_show:5:BC%{kolor_alarm} %;\
	/if ({poczta_show} !~ 'none' ) \
		/set poczta_show=MULTI%;\
	/else \
		/set poczta_show=MSG%;\
	/endif

/def -mregexp -p2 -t'Na twoim ramieniu niespodziewanie wyladowal ' _poczta_golab2= \
	/set ogolne_poczta=$[strcat({ogolne_poczta},ftime("%H:%M",time()),"golab","|")] %;\
	/beep 1 %;\
	/status_edit -r1 poczta_show:5:BC%{kolor_alarm} %;\
	/if ({poczta_show} !~ 'none' ) \
		/set poczta_show=MULTI%;\
	/else \
		/set poczta_show=MSG%;\
	/endif


/def -mregexp -Fp2 -t'^Masz nowa poczte od (.*).' _poczta_1 = \
	/set ogolne_poczta=$[strcat({ogolne_poczta},ftime("%H:%M",time()),{P1},"|")] %;\
	/beep 1 %;\
	/if ({poczta_show} !~ 'none' ) \
		/set poczta_show=MULTI%;\
	/else \
		/set poczta_show=MAIL%;\
	/endif %;\
	/status_edit -r1 poczta_show:5:BC%{kolor_alarm}

/alias wns /send kup bilet%;/send wejdz na statek
/alias zzs /send zejdz ze statku

/def -p200 -mregexp -t' przymierza sie do odciecia (.*) drogi ucieczki\.' _blokowanie_wyjscia = /echo%;\
    /substitute -p @{BCred}       > @{BCWhite}> @{BCgreen}> @{BCblue}> @{Cyellow}%{PL} @{Cwhite}przymierza sie do odciecia @{Cblue}%{P1}@{Cwhite} drogi ucieczki @{BCblue}< @{BCgreen}< @{BCwhite}< @{BCred}<%;\ /echo test%;\
    /echo%;\ /echo test2

/def kuf = \
    wez kluczyk z ciala%; \
    otworz kufer kluczem%; \
    otworz kufer kluczykiem%; \
    otworz kufer%; \
    wez monety z kufra%; \
    wloz kluczyk do kufra
/def szk = \
    wez kluczyk z ciala%; \
    otworz szkatulke kluczem%; \
    otworz szkatulke kluczykiem%; \
    otworz szkatulke%; \
    wez monety ze szkatulki%; \
    wloz kluczyk do szkatulki
/def skr = \
    wez kluczyk z ciala%; \
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

/def clear_mail = /set poczta_show=


/def key_esc_nkp1 = /send zaslon pierwszego czlonka druzyny
/def key_esc_nkp2 = /send zaslon drugiego czlonka druzyny
/def key_esc_nkp3 = /send zaslon trzeciego czlonka druzyny
/def key_esc_nkp4 = /send zaslon czwartego czlonka druzyny
/def key_esc_nkp5 = /send zaslon piatego czlonka druzyny
/def key_esc_nkp6 = /send zaslon szostego czlonka druzyny
/def key_esc_nkp7 = /send zaslon siodmego czlonka druzyny
/def key_esc_nkp8 = /send zaslon osmego czlonka druzyny
/def key_esc_nkp9 = /send zaslon dziewiatego czlonka druzyny


/def key_esc_pgdn = /send dbb
/def key_esc_pgup = /send ddb

/def key_f3 = /send kill %{target2}
/def key_esc_f3 = /send przelam obrone %{target2}

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

/def -t'Solidny kamien.' bacalla_warn = \
    /echo -p @{Cred}........................%;\
    /echo -p @{Cred}BRON BRON BRON BRON BRON%;\
    /echo -p @{Cred}........................

/def zmienworeczek = \
    /send odtrocz przytroczony woreczek%;\
    /send otworz go%;\
    /send wez ziola z niego%;\
    /send odloz go%;\
    /send wez woreczek z plecaka%;\
    /send otworz go%;\
    /send wloz ziola do niego%;\
    /send zamknij go



/def chowajziola = \
    /send otworz woreczek%;\
    /send wloz ziola do niego%;\
    /send zamknij woreczek


/def -mregexp -F -t'.*nosi piekna (zlota|srebrna|miedziana) obrecz( wysadzana (krwawymi rubinami|kosztownymi kamieniami)|)' _wyroznik_stowarzyszenia_OK = /echo -p @{Cbgblue}@{BCwhite}...:: OGR Z OGRZEJ KOMPANII ::...@{n}
/def -mglob -F -t'*szyi, na skorzanym rzemieniu wisi*' _wyroznik_stowarzyszenia_LE = /echo -p @{Cbgblue}@{BCwhite}...:: LESNY ELF ::...@{n}
/def -mregexp -F -t'Nosi (.*) kubraczek, tradycyjny stroj Elfow z Gor Sinych.' _wyroznik_stowarzyszenia_SE = /echo -p @{Cbgblue}@{BCwhite}...:: SINY ELF ::...@{n}
/def -mglob -F -t'*Wzor i kolor kiltu swiadcza o przynaleznosci do Krasnoludow z Gor Kranca Swiata*' _wyroznik_stowarzyszenia_KGKS = /echo -p @{Cbgblue}@{BCwhite}...:: KRASNOLUD GKS ::...@{n}
/def -mglob -F -t'*welniany krasnoludzki kilt*' _wyroznik_stowarzyszenia_KGKS2 = /echo -p @{Cbgblue}@{BCwhite}...:: KRASNOLUD GKS (Bezdomny) ::...@{n}
/def -mregexp -F -t'Klamre (jego|jej) pasa zdobi herb klanu.*' _wyroznik_stowarzyszenia_KM = /echo -p @{Cbgblue}@{BCwhite}...:: KRASNOLUD MAHAKAMU ::...@{n}
/def -mglob -F -t'*oznaka przynaleznosci do Cechu Kupcow Novigradzkich*' _wyroznik_stowarzyszenia_CKN = /echo -p @{Cbgblue}@{BCwhite}...:: KUPIEC NOVIGRADZKI ::...@{n}
/def -mglob -F -t'*jest oznaka przynaleznosci do grona pracownikow najemnych Cechu Kupcow Novigradzkich.' _wyroznik_stowarzyszenia_PHCKN = /echo -p @{Cbgblue}@{BCwhite}...:: PARTNER HANDLOWY CKN ::...@{n}
/def -mglob -F -t'*zamek ze znakiem Stowarzyszenia Gnomich Wynalazcow*' _wyroznik_stowarzyszenia_SGW = /echo -p @{Cbgblue}@{BCwhite}...:: GNOM Z SGW ::...@{n}
/def -mglob -F -t'*ryngraf, na ktorym wyryto*Skorpion*' _wyroznik_stowarzyszenia_WKS = /echo -p @{Cbgblue}@{BCwhite}...:: KOMPANIA SKORPION ::...@{n}
/def -mregexp -F -t'.* skory oznaczajaca (jego|jej) przynaleznosc do osadnikow.*' _wyroznik_stowarzyszenia_Osadnicy = /echo -p @{Cbgblue}@{BCwhite}...:: OSADNIK ::...@{n}
/def -mregexp -F -t'Nosi wiewiorczy ogon (.*) swiadczacy (.*)' _wyroznik_stowarzyszenia_SC = /echo -p @{Cbgblue}@{BCwhite}...:: WIEWIORA ::...@{n}
/def -mglob -F -t'*Przez srodek jego glowy przebiega czub*' _wyroznik_stowarzyszenia_ZT = /echo -p @{Cbgblue}@{BCwhite}...:: ZABOJCA TROLLI ::...@{n}
/def -mglob -F -t'*charakterystyczna dla Stowarzyszenia Polelfow*' _wyroznik_stowarzyszenia_Polelfy = /echo -p @{Cbgblue}@{BCwhite}...::  POLELF/KA ::...@{n}
/def -mregexp -F -t'Przy pasie nosi.*zacieznej piechoty z Ochotniczego Hufca Mahakamu\.' _wyroznik_stowarzyszenia_OHM = /echo -p @{Cbgblue,BCwhite}...:: OHM ::...@{n}
/def -mregexp -F -t'zawiazana .* ze znakiem czarnego gryfa.' _wyroznik_stowarzyszenia_KG = /echo -p @{Cbgblue,BCwhite}...:: NAJEMNIK KG::...
/def -F -mregexp -t'(^Twarz [^ ]+ pocieta jest .* wojownik)' _wyroznik_stowarzyszenia_GL = /echo -p @{Cbgblue,BCwhite}...:: GLADIATOR ::...
/def -F -mregexp -t'(^Jest (kadetem|uczniem|pomocnikiem|mistrzem|gladiatorem) ((|z(|e) )Szkoly [wW]alki von Raugen|(|z )Nulnijskiej Szkoly Gladiatorow))' _wyroznik_stowarzyszenia_GL2 = /echo -p @{Cbgblue,BCwhite}...:: GLADIATOR ::...
/def -F -mregexp -t'nieustepliwe niczym skelliganskie sztormy spojrzenie i twarz wysmagana lodowatymi wichrami swiadcza o tym, ze masz przed soba' _wyroznik_stowarzyszenia_Korsarze = /echo -p @{Cbgblue,BCwhite}...:: KORSARZ ::...


;------------------------------------------------------------------------
;				EKWIPUNEK				|
;------------------------------------------------------------------------
/def -p10 -mregexp -F -aBCgreen -t'Ma(|sz) na sobie .*(.)$' _masz_przy_sobie_1 =\
    /if ({P2}!~".") \
      /def -p10 -F -aBCgreen -t"*" _masz_przy_sobie_1a %;\
      /def -p15 -1 -mregexp -F -aBCgreen -t"\\\\.$$" _masz_przy_sobie_1b=/purge _masz_przy_sobie_1a %;\
    /endif
/def -p20 -mregexp -F -aCgreen -t'Masz przy sobie .*([^\\.]|\\.)$' _masz_przy_sobie_2 =\
    /if ({P1}!~".") \
      /def -p20 -F -aCgreen -t"*" _masz_przy_sobie_2a %;\
      /def -p25 -1 -mregexp -F -aCgreen -t"\\\\.$$" _masz_przy_sobie_2b=/purge _masz_przy_sobie_2a %;\
    /endif
/def -p10 -F -aBCmagenta -mregexp -t'Trzyma(|sz) ' _masz_przy_sobie_4

;------------------------------------------------------------------------
;			POZIOMY DOSWIADCZENIA				|
;------------------------------------------------------------------------
;/def -p4 -mregexp -F -t'((Wyglada na|Wygladasz na) (kompletnego zoltodzioba.))'		_poziomy_graczy1 = /substitute -p %{P2} @{BxCwhite}%{P3}[1/13] @{n}%{P5}%{PR}
;/def -p4 -mregexp -F -t'((Wyglada na kogos, kto|Wygladasz na kogos, kto) (stawia pierwsze kroki.))'		_poziomy_graczy2 = /substitute -p %{P2} @{BxCwhite}%{P3}[2/13] @{n}%{P5}%{PR}
;/def -p4 -mregexp -F -t'((Wyglada na kogos, kto|Wygladasz na kogos, kto) (jeszcze niewiele widzial.))'		_poziomy_graczy3 = /substitute -p %{P2} @{BxCwhite}%{P3}[3/13] @{n}%{P5}%{PR}
;/def -p4 -mregexp -F -t'((Wyglada na kogos, kto|Wygladasz na kogos, kto) (niewiele wie o swiecie.))' 		_poziomy_graczy4 = /substitute -p %{P2} @{BxCwhite}%{P3}[4/13] @{n}%{P5}%{PR}
/def -p4 -mregexp -F -t'((Wyglada na kogos|Wygladasz na kogos) (niedoswiadczonego.))' 		_poziomy_graczy5 = /substitute -p %{P2} @{BxCwhite}%{P3} [1/13] @{n}%{P5}%{PR}
/def -p4 -mregexp -F -t'((Wyglada na kogos, kto|Wygladasz na kogos, kto) (widzial juz to i owo.))' 		_poziomy_graczy6 = /substitute -p %{P2} @{BxCwhite}%{P3} [2/13] @{n}%{P5}%{PR}
/def -p4 -mregexp -F -t'((Wyglada na kogos, kto|Wygladasz na kogos, kto) (pewnie stapa po swiecie.))'		_poziomy_graczy7 = /substitute -p %{P2} @{BxCwhite}%{P3} [3/13] @{n}%{P5}%{PR}
/def -p4 -mregexp -F -t'((Wyglada na kogos, kto|Wygladasz na kogos, kto) (niejedno widzial.))'			_poziomy_graczy8 = /substitute -p %{P2} @{BxCwhite}%{P3} [4/13] @{n}%{P5}%{PR}
/def -p4 -mregexp -F -t'((Wyglada na kogos, kto|Wygladasz na kogos, kto) (swoje przezyl.))' 			_poziomy_graczy9 = /substitute -p %{P2} @{BxCwhite}%{P3} [5/13] @{n}%{P5}%{PR}
/def -p4 -mregexp -F -t'((Wyglada na|Wygladasz na) (kogos doswiadczonego.))'		 	_poziomy_graczy10 = /substitute -p %{P2} @{BxCwhite}%{P3} [6/13] @{n}%{P5}%{PR}
/def -p4 -mregexp -F -t'((Wyglada na kogos, kto|Wygladasz na kogos, kto) (wiele przeszedl.))' 			_poziomy_graczy11 = /substitute -p %{P2} @{BxCwhite}%{P3} [7/13] @{n}%{P5}%{PR}
/def -p4 -mregexp -F -t'((Wyglada na kogos, kto|Wygladasz na kogos, kto) (widzial kawal swiata.))'		_poziomy_graczy12 = /substitute -p %{P2} @{BxCwhite}%{P3} [8/13] @{n}%{P5}%{PR}
/def -p4 -mregexp -F -t'((Wyglada na kogos|Wygladasz na kogos) (bardzo doswiadczonego.))' 		_poziomy_graczy13 = /substitute -p %{P2} @{BxCwhite}%{P3} [9/13] @{n}%{P5}%{PR}
/def -p4 -mregexp -F -t'((Wyglada na kogos, kto|Wygladasz na kogos, kto) (zwiedzil caly swiat.))' 		_poziomy_graczy14 = /substitute -p %{P2} @{BxCwhite}%{P3} [10/13] @{n}%{P5}%{PR}
/def -p4 -mregexp -F -t'((Wyglada na kogos|Wygladasz na kogos) (wielce doswiadczonego.))' 		_poziomy_graczy15 = /substitute -p %{P2} @{BxCwhite}%{P3} [11/13] @{n}%{P5}%{PR}
/def -p4 -mregexp -F -t'((Wyglada na kogos, kto|Wygladasz na kogos, kto) (widzial i doswiadczyl wszystkiego.))'	_poziomy_graczy16 = /substitute -p %{P2} @{BxCwhite}%{P3} [12/13] @{n}%{P5}%{PR}
/def -p4 -mregexp -F -t'((Wyglada na|Wygladasz na) (osobe owiana legenda.))' 		_poziomy_graczy17 = /substitute -p %{P2} @{BxCwhite}%{P3} [13/13] @{n}%{P5}%{PR}

/def dbz = \
    wez bron drzewcowa z plecaka%;\
    wez bron z uprzezy%;\
    wloz ja do plecaka%;\
    dbb

/alias dbz /dbz