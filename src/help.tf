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

/alias kk k wszystkich
/alias ll zerknij
/alias ls sp
/alias mm wez monety z plecaka
/alias mmm wloz monety do plecaka
/alias wk wez monety z ciala
/alias koks napij sie z buklaka%;stan

/alias ' jpowiedz %{*}
/alias '' powiedz %{*}

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
    /def 1 = /attack pierwszego redcapa

/def mahak = \
    /def 1 = /attack oficera%;\
    /def 2 = /attack kobolda%;\
    /def 3 = /attack goblina%;\
    /def 4 = /attack pukacza%;\
    /def 5 = /attack barbegazi%;\
    /def 6 = /attack echinopsa%\
    /def 7 = /attack trolla

/def kurhan = \
    /def 1 = /attack kosciotrupa%;\
    /def 2 = /attack zombi%;\
    /def 3 = /attack ozywienca

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
  otworz pierwszy przytroczony woreczek%; \
  wez zolty jasny kwiat z niego%; \
  zjedz zolty jasny kwiat%; \
  wloz kwiat do niego%;\
  dobadz broni%; \
  zamknij otwarte woreczki

/def dziur = \
  przestan walczyc%; \
  opusc bron%; \
  otworz przytroczony woreczek%; \
  wez cztery czterokanciaste rozgalezione lodygi z niego%; \
  rozgryz czterokanciaste rozgalezione lodygi%; \
  wloz lodygi do niego%;\
  dobadz broni%; \
  zamknij otwarte woreczki

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