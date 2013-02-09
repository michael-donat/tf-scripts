/def -mregexp -p2 -t'^Wyglada(|sz) na kompletnego zoltodzioba\.'                      _poziomy_doswiadczenia_1 = /_sub 1/17@{n}
/def -mregexp -p2 -t'^Wyglada(|sz) na kogos, kto stawia pierwsze kroki\.'             _poziomy_doswiadczenia_2 = /_sub 2/17@{n}
/def -mregexp -p2 -t'^Wyglada(|sz) na kogos, kto jeszcze niewiele widzial\.'          _poziomy_doswiadczenia_3 = /_sub 3/17@{n}
/def -mregexp -p2 -t'^Wyglada(|sz) na kogos, kto niewiele wie o swiecie\.'            _poziomy_doswiadczenia_4 = /_sub 4/17@{n}
/def -mregexp -p2 -t'^Wyglada(|sz) na kogos niedoswiadczonego\.'                      _poziomy_doswiadczenia_5 = /_sub 5/17@{n}
/def -mregexp -p2 -t'^Wyglada(|sz) na kogos, kto widzial juz to i owo\.'              _poziomy_doswiadczenia_6 = /_sub 6/17@{n}
/def -mregexp -p2 -t'^Wyglada(|sz) na kogos, kto pewnie stapa po swiecie\.'           _poziomy_doswiadczenia_7 = /_sub 7/17@{n}
/def -mregexp -p2 -t'^Wyglada(|sz) na kogos, kto niejedno widzial\.'                  _poziomy_doswiadczenia_8 = /_sub 8/17@{n}
/def -mregexp -p2 -t'^Wyglada(|sz) na kogos, kto swoje przezyl\.'                     _poziomy_doswiadczenia_9 = /_sub 9/17@{n}
/def -mregexp -p2 -t'^Wyglada(|sz) na kogos (?!bardzo |wielce )doswiadczonego\.'      _poziomy_doswiadczenia_10= /_sub 10/17@{n}
/def -mregexp -p2 -t'^Wyglada(|sz) na kogos, kto wiele przeszedl\.'                   _poziomy_doswiadczenia_11= /_sub 11/17@{n}
/def -mregexp -p2 -t'^Wyglada(|sz) na kogos, kto widzial kawal swiata\.'              _poziomy_doswiadczenia_12= /_sub 12/17@{n}
/def -mregexp -p2 -t'^Wyglada(|sz) na kogos bardzo doswiadczonego\.'                  _poziomy_doswiadczenia_13= /_sub 13/17@{n}
/def -mregexp -p2 -t'^Wyglada(|sz) na kogos, kto zwiedzil caly swiat\.'               _poziomy_doswiadczenia_14= /_sub 14/17@{n}
/def -mregexp -p2 -t'^Wyglada(|sz) na kogos wielce doswiadczonego\.'                  _poziomy_doswiadczenia_15= /_sub 15/17@{n}
/def -mregexp -p2 -t'^Wyglada(|sz) na kogos, kto widzial i doswiadczyl wszystkiego\.' _poziomy_doswiadczenia_16= /_sub 16/17@{n}
/def -mregexp -p2 -t'^Wyglada(|sz) na osobe owiana legenda\.'                         _poziomy_doswiadczenia_17= /_sub 17/17@{n}

/def -mregexp -PB -Fp2 -t'kompletnie nieskuteczn[aye](?: w parowaniu ciosow|).$$' _skutecznosc_bro1 = /_sub_inside (1/14)
/def -mregexp -PB -Fp2 -t'strasznie nieskuteczn[aye](?: w parowaniu ciosow|).$$'    _skutecznosc_bro2 = /_sub_inside (2/14)
/def -mregexp -PB -Fp2 -t'bardzo nieskuteczn[aye](?: w parowaniu ciosow|).$$'            _skutecznosc_bro3 = /_sub_inside (3/14)
/def -mregexp -PB -Fp2 -t'raczej nieskuteczn[aye](?: w parowaniu ciosow|).$$'            _skutecznosc_bro4 = /_sub_inside (4/14)
/def -mregexp -PB -Fp2 -t'malo skuteczn[aye](?: w parowaniu ciosow|).$$'            _skutecznosc_bro5 = /_sub_inside (5/14)
/def -mregexp -PB -Fp2 -t'niezbyt skuteczn[aye](?: w parowaniu ciosow|).$$'            _skutecznosc_bro6 = /_sub_inside (6/14)
/def -mregexp -PB -Fp2 -t'raczej skuteczn[aye](?: w parowaniu ciosow|).$$'            _skutecznosc_bro7 = /_sub_inside (7/14)
/def -mregexp -PB -Fp2 -t'dosyc skuteczn[aye](?: w parowaniu ciosow|).$$'      _skutecznosc_bro8 = /_sub_inside (8/14)
/def -mregexp -PB -Fp2 -t'calkiem skuteczn[aye](?: w parowaniu ciosow|).$$'            _skutecznosc_bro9 = /_sub_inside (9/14)
/def -mregexp -PB -Fp2 -t'bardzo skuteczn[aye](?: w parowaniu ciosow|).$$'            _skutecznosc_bro10 = /_sub_inside (10/14)
/def -mregexp -PB -Fp2 -t'niezwykle skuteczn[aye](?: w parowaniu ciosow|).$$'            _skutecznosc_bro11 = /_sub_inside (11/14)
/def -mregexp -PB -Fp2 -t'wyjatkowo skuteczn[aye](?: w parowaniu ciosow|).$$'            _skutecznosc_bro12 = /_sub_inside (12/14)
/def -mregexp -PB -Fp2 -t'zabojczo skuteczn[aye](?: w parowaniu ciosow|).$$'            _skutecznosc_bro13 = /_sub_inside (13/14)
/def -mregexp -PB -Fp2 -t'fantastycznie skuteczn[aye](?: w parowaniu ciosow|).$$'            _skutecznosc_bro14 = /_sub_inside (14/14)
/def -mregexp -PB -Fp2 -t'wyjatkowo zle wywazon[aye]'            _wywazenie_bro1 = /_sub_inside (1/14)
/def -mregexp -PB -Fp2 -t'bardzo zle wywazon[aye]'            _wywazenie_bro2 = /_sub_inside (2/14)
/def -mregexp -PB -Fp2 -t'(?<!nie|bardzo )zle wywazon[aye]'            _wywazenie_bro3 = /_sub_inside (3/14)
/def -mregexp -PB -Fp2 -t'bardzo kiepsko wywazon[aye]'            _wywazenie_bro4 = /_sub_inside (4/14)
/def -mregexp -PB -Fp2 -t'(?<!bardzo) kiepsko wywazon[aye]'            _wywazenie_bro5 = /_sub_inside (5/14)
/def -mregexp -PB -Fp2 -t'przyzwoicie wywazon[aye]'            _wywazenie_bro6 = /_sub_inside (6/14)
/def -mregexp -PB -Fp2 -t'srednio wywazon[aye]'            _wywazenie_bro7 = /_sub_inside (7/14)
/def -mregexp -PB -Fp2 -t'niezle wywazon[aye]'            _wywazenie_bro8 = /_sub_inside (8/14)
/def -mregexp -PB -Fp2 -t'dosc dobrze wywazon[aye]'            _wywazenie_bro9 = /_sub_inside (9/14)
/def -mregexp -PB -Fp2 -t'(?<!bardzo |dosc )dobrze wywazon[aye]'   _wywazenie_bro10 = /_sub_inside (10/14)
/def -mregexp -PB -Fp2 -t'bardzo dobrze wywazon[aye]'            _wywazenie_bro11 = /_sub_inside (11/14)
/def -mregexp -PB -Fp2 -t'doskonale wywazon[aye]'            _wywazenie_bro12 = /_sub_inside (12/14)
/def -mregexp -PB -Fp2 -t'perfekcyjnie wywazon[aye]'            _wywazenie_bro13 = /_sub_inside (13/14)
/def -mregexp -PB -Fp2 -t'genialnie wywazon[aye]'            _wywazenie_bro14 = /_sub_inside (14/14)
/def -mregexp -PB -Fp2 -t'wyjatkowo zle przed(?: obrazeniami|)'    _skutecznosc_zbro1 = /_sub_inside (1/12)
/def -mregexp -PB -Fp2 -t'bardzo zle przed(?: obrazeniami|)'       _skutecznosc_zbro2 = /_sub_inside (2/12)
/def -mregexp -PB -Fp2 -t'(?<!nie)zle przed(?: obrazeniami|)'      _skutecznosc_zbro3 = /_sub_inside (3/12)
/def -mregexp -PB -Fp2 -t'bardzo kiepsko przed(?: obrazeniami|)'   _skutecznosc_zbro4 = /_sub_inside (4/12)
/def -mregexp -PB -Fp2 -t'(?<!bardzo )kiepsko przed(?: obrazeniami|)'  _skutecznosc_zbro5 = /_sub_inside (5/12)
/def -mregexp -PB -Fp2 -t'przyzwoicie przed(?: obrazeniami|)'      _skutecznosc_zbro6 = /_sub_inside (6/12)
/def -mregexp -PB -Fp2 -t'niezle przed(?: obrazeniami|)'           _skutecznosc_zbro7 = /_sub_inside (7/12)
/def -mregexp -PB -Fp2 -t'dosc dobrze przed(?: obrazeniami|)'      _skutecznosc_zbro8 = /_sub_inside (8/12)
/def -mregexp -PB -Fp2 -t'(?<!bardzo |dosc )dobrze przed(?: obrazeniami|)' _skutecznosc_zbro9 = /_sub_inside (9/12)
/def -mregexp -PB -Fp2 -t'bardzo dobrze przed(?: obrazeniami|)'     _skutecznosc_zbro10 = /_sub_inside (10/12)
/def -mregexp -PB -Fp2 -t'doskonale przed(?: obrazeniami|)'         _skutecznosc_zbro11 = /_sub_inside (11/12)
/def -mregexp -PB -Fp2 -t'perfekcyjnie przed(?: obrazeniami|)'      _skutecznosc_zbro12 = /_sub_inside (12/12)

/def odpornosci_stany = \
	/if ({1} =~ "minimalna") \
	/return 1 %;\
	/elseif ({1} =~"znikoma") \
	/return 2 %;\
	/elseif ({1} =~"niewielka") \
	/return 3 %;\
	/elseif ({1} =~"czesciowa") \
	/return 4 %;\
	/elseif ({1} =~"polowiczna") \
	/return 5 %;\
	/elseif ({1} =~"znaczna") \
	/return 6 %;\
	/elseif ({1} =~"duza") \
	/return 7 %;\
	/elseif ({1} =~"bardzo duza") \
	/return 8 %;\
	/elseif ({1} =~"prawie pelna") \
	/return 9 %;\
	/elseif ({1} =~"calkowita") \
	/return 10 %;\
	/elseif ({1} =~"brak") \
	/return 0 %;\
	/endif

/def odpornosci = \
	/repeat -1 1 /purge __odpornosci_*  %;\
	/repeat -1 1 /unset __odpornosci_* %;\
	/purge __odpornosci_* %;\
	/unset __odpornosci_* %;\
	/def -ag -Fp2 -mregexp -t'^$$' __odpornosci_gag_empty %;\
	/def -ag -Fp2 -mregexp -t'^Obrazenia fizyczne:$$' __odpornosci_gag_fizyczne %;\
	/def -ag -Fp2 -mregexp -t'^Obrazenia od zywiolow:$$' __odpornosci_gag_elemental %;\
	/def -ag -Fp2 -mregexp -t'^Obrazenia magiczne:$$' __odpornosci_gag_magic %;\
	/def -ag -Fp2 -mregexp -t'^Inne:$$' __odpornosci_gag_misc %;\
	/def -ag -Fp2 -mregexp -t'^ +ciete - (.*)' __odpornosci_ciete = \
		/set __odpornosci_ciete_string=%%{P1}%%;\
		/set __odpornosci_ciete_value=$[odpornosci_stany(__odpornosci_ciete_string)] %;\
	/def -ag -Fp2 -mregexp -t'^ +klute - (.*)' __odpornosci_klute = \
		/set __odpornosci_klute_string=%%{P1}%%;\
		/set __odpornosci_klute_value=$[odpornosci_stany(__odpornosci_klute_string)] %;\
	/def -ag -Fp2 -mregexp -t'^ +obuchowe - (.*)' __odpornosci_obuchowe = \
		/set __odpornosci_obuchowe_string=%%{P1}%%;\
		/set __odpornosci_obuchowe_value=$[odpornosci_stany(__odpornosci_obuchowe_string)] %;\
	/def -ag -Fp2 -mregexp -t'^ +bronie niemagiczne - (.*)' __odpornosci_bronieniemagiczne = \
		/set __odpornosci_bronieniemagiczne_string=%%{P1}%%;\
		/set __odpornosci_bronieniemagiczne_value=$[odpornosci_stany(__odpornosci_bronieniemagiczne_string)] %;\
	/def -ag -Fp2 -mregexp -t'^ +ogien - (.*)' __odpornosci_ogien = \
		/set __odpornosci_ogien_string=%%{P1}%%;\
		/set __odpornosci_ogien_value=$[odpornosci_stany(__odpornosci_ogien_string)] %;\
	/def -ag -Fp2 -mregexp -t'^ +powietrze - (.*)' __odpornosci_powietrze = \
		/set __odpornosci_powietrze_string=%%{P1}%%;\
		/set __odpornosci_powietrze_value=$[odpornosci_stany(__odpornosci_powietrze_string)] %;\
	/def -ag -Fp2 -mregexp -t'^ +woda - (.*)' __odpornosci_woda = \
		/set __odpornosci_woda_string=%%{P1}%%;\
		/set __odpornosci_woda_value=$[odpornosci_stany(__odpornosci_woda_string)] %;\
	/def -ag -Fp2 -mregexp -t'^ +ziemia - (.*)' __odpornosci_ziemia = \
		/set __odpornosci_ziemia_string=%%{P1}%%;\
		/set __odpornosci_ziemia_value=$[odpornosci_stany(__odpornosci_ziemia_string)] %;\
	/def -ag -Fp2 -mregexp -t'^ +czysta magia - (.*)' __odpornosci_puremagic = \
		/set __odpornosci_puremagic_string=%%{P1}%%;\
		/set __odpornosci_puremagic_value=$[odpornosci_stany(__odpornosci_puremagic_string)] %;\
	/def -ag -Fp2 -mregexp -t'^ +magia umyslu - (.*)' __odpornosci_mindmagic = \
		/set __odpornosci_mindmagic_string=%%{P1}%%;\
		/set __odpornosci_mindmagic_value=$[odpornosci_stany(__odpornosci_mindmagic_string)] %;\
	/def -ag -Fp2 -mregexp -t'^ +magia zycia - (.*)' __odpornosci_lifemagic = \
		/set __odpornosci_lifemagic_string=%%{P1}%%;\
		/set __odpornosci_lifemagic_value=$[odpornosci_stany(__odpornosci_lifemagic_string)] %;\
	/def -ag -Fp2 -mregexp -t'^ +magia smierci - (.*)' __odpornosci_deathmagic = \
		/set __odpornosci_deathmagic_string=%%{P1}%%;\
		/set __odpornosci_deathmagic_value=$[odpornosci_stany(__odpornosci_deathmagic_string)] %;\
	/def -ag -Fp2 -mregexp -t'^ +elektrycznosc - (.*)' __odpornosci_elektrycznosc = \
		/set __odpornosci_elektrycznosc_string=%%{P1}%%;\
		/set __odpornosci_elektrycznosc_value=$[odpornosci_stany(__odpornosci_elektrycznosc_string)] %;\
	/def -ag -Fp2 -mregexp -t'^ +kwas - (.*)' __odpornosci_kwas = \
		/set __odpornosci_kwas_string=%%{P1}%%;\
		/set __odpornosci_kwas_value=$[odpornosci_stany(__odpornosci_kwas_string)] %;\
	/def -ag -Fp2 -mregexp -t'^ +spaczen - (.*)' __odpornosci_spaczen = \
		/set __odpornosci_spaczen_string=%%{P1}%%;\
		/set __odpornosci_spaczen_value=$[odpornosci_stany(__odpornosci_spaczen_string)] %;\
	/def -ag -Fp2 -mregexp -t'^ +trucizna - (.*)' __odpornosci_trucizna = \
		/set __odpornosci_trucizna_string=%%{P1}%%;\
		/set __odpornosci_trucizna_value=$[odpornosci_stany(__odpornosci_trucizna_string)] %;\
	/def -ag -Fp2 -mregexp -t'^ +zimno - (.*)' __odpornosci_zimno = \
		/set __odpornosci_zimno_string=%%{P1}%%;\
		/set __odpornosci_zimno_value=$[odpornosci_stany(__odpornosci_zimno_string)] %;\
	/send odpornosci %;\
	/echo -p +--------------------------------+--------------------------------+---------------------------------+----------------------------------+@{n}%;\
	/echo -p |			Fizyczne			|			Zywioly			 |			  Magia			  |			   Inne			   |%;\
	/echo -p +--------------------------------+--------------------------------+---------------------------------+----------------------------------+@{n}%;\
	/echo -p |								|								|								 |								  |@{n}%;\
	/let linia=$[strcat("| ","Ciete ",pad(__odpornosci_ciete_string,16)," [",pad(__odpornosci_ciete_value,2),"/10] | Ogien ",pad(__odpornosci_ogien_string,16)," [",pad(__odpornosci_ogien_value,2),"/10] | Czysta ",pad(__odpornosci_puremagic_string,16)," [",pad(__odpornosci_puremagic_value,2),"/10] | Elektrycznosc ",pad(__odpornosci_elektrycznosc_string,10)," [",pad(__odpornosci_elektrycznosc_value,2),"/10] |")] %;\
	/echo -p %{linia} %;\
	/let linia=$[strcat("| ","Klute ",pad(__odpornosci_klute_string,16)," [",pad(__odpornosci_klute_value,2),"/10] | Powietrze ",pad(__odpornosci_powietrze_string,12)," [",pad(__odpornosci_powietrze_value,2),"/10] | Umyslu ",pad(__odpornosci_mindmagic_string,16)," [",pad(__odpornosci_mindmagic_value,2),"/10] | Kwas ",pad(__odpornosci_kwas_string,19)," [",pad(__odpornosci_kwas_value,2),"/10] |")] %;\
	/echo -p %{linia} %;\
	/let linia=$[strcat("| ","Obuchy ",pad(__odpornosci_obuchowe_string,15)," [",pad(__odpornosci_obuchowe_value,2),"/10] | Woda ",pad(__odpornosci_woda_string,17)," [",pad(__odpornosci_woda_value,2),"/10] | Zycia ",pad(__odpornosci_lifemagic_string,17)," [",pad(__odpornosci_lifemagic_value,2),"/10] | Spaczen ",pad(__odpornosci_spaczen_string,16)," [",pad(__odpornosci_spaczen_value,2),"/10] |")] %;\
	/echo -p %{linia} %;\
	/let linia=$[strcat("| ","Niemagiczne ",pad(__odpornosci_bronieniemagiczne_string,10)," [",pad(__odpornosci_bronieniemagiczne_value,2),"/10] | Ziemia ",pad(__odpornosci_ziemia_string,15)," [",pad(__odpornosci_ziemia_value,2),"/10] | Smierci ",pad(__odpornosci_deathmagic_string,15)," [",pad(__odpornosci_deathmagic_value,2),"/10] | Trucizna ",pad(__odpornosci_trucizna_string,15)," [",pad(__odpornosci_trucizna_value,2),"/10] |")] %;\
	/echo -p %{linia} %;\
	/let linia=$[strcat("|                                |                                |                                 | Zimno ",pad(__odpornosci_zimno_string,18)," [",pad(__odpornosci_zimno_value,2),"/10] |")] %;\
	/echo -p %{linia} %;\
	/echo -p +--------------------------------+--------------------------------+---------------------------------+----------------------------------+@{n}

/def -mregexp -Fp2 -t' ledwo muska ' ldwmsk = \
	/set klew=%PL %;\
	/set kpra=%PR %;\
	/if (regmatch("Nagle", {klew})) \
	/else \
		/set ktobijelewa=$[replace(" ", "_", {klew})] %;\
		/eval /set %{ktobijelewa}_kto_bije=%{klew} %;\
		/eval /set %{ktobijelewa}_kogo_bije=$[strcat(substr({kpra}, 0, strstr({kpra}, " ")))] %;\
	/endif

/def -mregexp -Fp2 -t' lekko rani ' lkrn = \
	/set klew=%PL %;\
	/set kpra=%PR %;\
	/if (regmatch("Nagle", {klew})) \
	/else \
		/set ktobijelewa=$[replace(" ", "_", {klew})] %;\
		/eval /set %{ktobijelewa}_kto_bije=%{klew} %;\
		/eval /set %{ktobijelewa}_kogo_bije=$[strcat(substr({kpra}, 0, strstr({kpra}, " ")))] %;\
	/endif

/def -mregexp -Fp2 -t'(?<!lekko|powaznie|bardzo ciezko) rani ' rni = \
	/set klew=%PL %;\
	/set kpra=%PR %;\
	/if (regmatch("Nagle", {klew})) \
	/else \
		/set ktobijelewa=$[replace(" ", "_", {klew})] %;\
		/eval /set %{ktobijelewa}_kto_bije=%{klew} %;\
		/eval /set %{ktobijelewa}_kogo_bije=$[strcat(substr({kpra}, 0, strstr({kpra}, " ")))] %;\
	/endif

/def -mregexp -Fp2 -t'( powaznie rani | bardzo ciezko rani | masakruje )' reszta = \
	/set klew=%PL %;\
	/set kpra=%PR %;\
	/if (regmatch("Nagle", {klew})) \
	/else \
		/set ktobijelewa=$[replace(" ", "_", {klew})] %;\
		/eval /set %{ktobijelewa}_kto_bije=%{klew} %;\
		/eval /set %{ktobijelewa}_kogo_bije=$[strcat(substr({kpra}, 0, strstr({kpra}, " ")))] %;\
	/endif

/def -mregexp -Fp2 -t'Nagle (.*) wykonuje zamaszysty cios .+ celujac w (.*), lecz .+ zbija go .+' zbitka_czyms = \
	/set ktobijelewa=$[toupper({P1},1)] %;\
	/set ktobijelewa=$[replace(" ", "_", {ktobijelewa})] %;\
	/eval /set %{ktobijelewa}_kto_bije=$[toupper({P1},1)] %;\
	/if (strlen({P2}) > 15) \
		/eval /set %{ktobijelewa}_kogo_bije=$[strcat(substr({P2}, 0, strstr({P2}, " ")))] %;\
	/else \
		/eval /set %{ktobijelewa}_kogo_bije=%P2%;\
	/endif

/def -mregexp -Fp2 -t'Nagle (.*) wykonuje zamaszysty cios .+ celujac w (.*), lecz .+ udaje sie go uniknac.' unik_czyjs = \
	/set ktobijelewa=$[toupper({P1},1)] %;\
	/set ktobijelewa=$[replace(" ", "_", {ktobijelewa})] %;\
	/eval /set %{ktobijelewa}_kto_bije=$[toupper({P1},1)] %;\
	/if (strlen({P2}) > 15) \
		/eval /set %{ktobijelewa}_kogo_bije=$[strcat(substr({P2}, 0, strstr({P2}, " ")))] %;\
	/else \
		/eval /set %{ktobijelewa}_kogo_bije=%P2%;\
	/endif

/def -mregexp -Fp2 -t'Nagle (.*) wykonuje zamaszysty cios .+ celujac w (.*), lecz uderzenie zatrzymuje sie na je.+.' zbroja_czyjas = \
	/set ktobijelewa=$[toupper({P1},1)] %;\
	/set ktobijelewa=$[replace(" ", "_", {ktobijelewa})] %;\
	/eval /set %{ktobijelewa}_kto_bije=$[toupper({P1},1)] %;\
	/if (strlen({P2}) > 15) \
		/eval /set %{ktobijelewa}_kogo_bije=$[strcat(substr({P2}, 0, strstr({P2}, " ")))] %;\
	/else \
		/eval /set %{ktobijelewa}_kogo_bije=%P2%;\
	/endif
