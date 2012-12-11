; ## Linie dodane automagicznie   : tf_ver=1.1.6
; ## 
; ## Wersja pliku                 : 1.1.6
; ## Ostatnia zmiana pliku        : 2009-01-06 21:07:40
; ## Plik pobrany                 : 2009-01-06 21:07:59
; ## Wersja Tfupdate              : 2.0.1
; ##
; ##
;------------------------------------------------------------------------------
;|                        Wyswietlanie wrogow                                 |
;------------------------------------------------------------------------------

;/def cw = \
;    /quote -S /unset `/listvar -s _wrogowie_bind* %;\
;    /echo Wyczyszczone!! Gotowym do walki!!

/def wrogowie = \
    /if ({1}=/'{wyswietl|pokaz|}') \
      /_wrogowie_wyswietl %;\
    /elseif ({1}=/'{dodaj|add|+}' & {2}!~NULL) \
      /echo Zmienila sie nazwa funkcji teraz stosuj /wrogowie+ %;\
    /elseif ({1}=/'{usun|rem|-}' & {2}!~NULL) \
      /wrogowie- %{-1} %;\
    /elseif ({1}=~'czysc') \
      /_wrogowie_czysc %;\
    /elseif ({1}=~'pomoc') \
      /?wrogowie %;\
    /else \
      /msg Zla skladnia polecam komende @{B}"/pomoc wrogowie"@{n}. %;\
    /endif

/def _wrogowie_wyswietl = \
    /if ({ogolne_wrogowie}=~NULL) \
        /msg Nie masz aktualnie zadnych wrogow... Ale nudaa... Nic tylko sie pochlastac. %;\
    /else \
        /msg Twoi wrogowie: %;\
        /let _wrogowie_=%{ogolne_wrogowie} %;\
        /while /let i=$[strstr(_wrogowie_,"^")]%; /@test i > 0%; /do \
    	    /let _wrog=$[substr(_wrogowie_, 0, i)] %;\
	    /let _ii=$[strrchr(_wrog,"#")] %;\
    	    /let _wrogowie_mutacje=$[substr(_wrog,_ii+1)] %;\
    	    /let _wrog=$[substr(_wrog, 0, _ii)] %;\
	    /let _ii=$[strrchr(_wrog,"#")] %;\
    	    /let _wrogowie_opis=$[substr(_wrog,_ii+1)] %;\
    	    /let _wrog=$[substr(_wrog, 0, _ii)] %;\
	    /let _ii=$[strrchr(_wrog,"#")] %;\
    	    /let _wrogowie_imie=$[substr(_wrog,_ii+1)] %;\
    	    /let _wrog=$[substr(_wrog, 0, _ii)] %;\
	    /let _ii=$[strrchr(_wrog,"#")] %;\
	    /let _wrogowie_bie=$[substr(_wrog,_ii+1)] %;\
    	    /let _wrogowie_mia=$[substr(_wrog,0,_ii)] %;\
	    /if ({_wrogowie_mutacje}) \
		/let _wrogowie_mutacje=Mutant :%;\
	    /else \
		/let _wrogowie_mutacje=:%;\
	    /endif %;\
    	    /echo -p $[pad("@{BCred}", 0, _wrogowie_mutacje, 10, "@{BCwhite}", 0, _wrogowie_mia, 40, "@{nCgreen} - @{B}", 3, _wrogowie_opis, 0)] %;\
;	    /if (strlen({_wrogowie_bie})) \
;		/echo -p $[pad("@{Cgreen}", 0,"Atakuje :", 10, "@{Cwhite}", 0, _wrogowie_bie, 40)] %;\
;	    /endif %;\
    	    /let _wrogowie_=$[substr(_wrogowie_,i+1)] %;\
        /done %;\
    /endif


/def wrogowie+ = \
    /if (!getopts("b:o:i:m", "")) /return 0%; /endif%; \
    /let _wrogowie_mia=%{*} %;\
    /let _wrogowie_opis=%{opt_o-Wrog} %;\
    /let _wrogowie_imie=%{opt_i} %;\
    /if ({_wrogowie_mia} =~ NULL) \
        /msg Brak opisu w mianowniku.. %;\
        /return %;\
    /endif %;\
    /if (opt_b) \
        /msg Nie potrzeba podawac biernika. TF juz sam go potrafi wymyslic. %;\
    /endif %;\
    /if /test (strstr(ogolne_wrogowie,strcat(_wrogowie_mia,'#'))!=-1) %; /then \
      /wrogowie- -q %{_wrogowie_mia} %;\
      /msg @{B}%{_wrogowie_mia}@{nCgreen} juz byl wiec zostal usuniety i zapisany na nowo za: @{B}%{_wrogowie_opis}@{nCgreen}. %;\
    /else \
      /msg @{B}%{_wrogowie_mia}@{nCgreen} zapisany na liste wrogow za: @{B}%{_wrogowie_opis}@{nCgreen}. %;\
    /endif %;\
    /set ogolne_wrogowie=$[strcat(ogolne_wrogowie, _wrogowie_mia, "##", _wrogowie_imie, "#",_wrogowie_opis, "#", opt_m, "^")] %;\
    /_wrogowie_zrob_trigi

/def wrogowie- = \
    /if (!getopts("q", "")) /return 0%; /endif%; \
    /let _ii=$[strstr(ogolne_wrogowie, strcat({*}, "#"))] %;\
    /if (_ii > -1) \
	/let _wrogowie_pocz=$[substr(ogolne_wrogowie,0, _ii)] %;\
	/let _wrogowie_koni=$[substr(ogolne_wrogowie,strstr(ogolne_wrogowie,"^", _ii)+1)] %;\
	/set ogolne_wrogowie=$[strcat(_wrogowie_pocz, _wrogowie_koni)] %;\
	/if ({opt_q} == 0) \
    	    /msg @{B}%{*}@{nCgreen} zostal usuniety z listy. %;\
        /endif %;\
	/_wrogowie_zrob_trigi %;\
    /else \
        /msg @{B}%{*}@{nCgreen} nie figuruje na liscie wrogow... %;\
    /endif

;/def wc = /_wrogowie_czysc
/def _wrogowie_czysc = \
    /msg Lista wrogow zostala wyczyszczona. %;\
    /set ogolne_wrogowie= %;\
    /_wrogowie_zrob_trigi

/def _wrogowie_zrob_trigi = \
    /purge _wrogowie_trig_* %;\
    /let _wrogowie_=%{ogolne_wrogowie} %;\
    /let ii=0 %;\
    /let _wrogowie_=%{ogolne_wrogowie} %;\
    /while /let i=$[strstr(_wrogowie_,"^")]%; /@test i > 0%; /do \
    	/let _wrog=$[substr(_wrogowie_, 0, i)] %;\
        /let _ii=$[strrchr(_wrog,"#")] %;\
    	/let _wrogowie_mutacje=$[substr(_wrog,_ii+1)] %;\
    	/let _wrog=$[substr(_wrog, 0, _ii)] %;\
        /let _ii=$[strrchr(_wrog,"#")] %;\
    	/let _wrogowie_opis=$[substr(_wrog,_ii+1)] %;\
    	/let _wrog=$[substr(_wrog, 0, _ii)] %;\
        /let _ii=$[strrchr(_wrog,"#")] %;\
    	/let _wrogowie_imie=$[tolower(substr(_wrog,_ii+1))] %;\
;        /let _wrogowie_imie=$[strcat("[", toupper(substr(_wrogowie_imie, 0, 1)), tolower(substr(_wrogowie_imie, 0, 1)), "]", substr(_wrogowie_imie, 1))] %;\
    	/let _wrog=$[substr(_wrog, 0, _ii)] %;\
        /let _ii=$[strrchr(_wrog,"#")] %;\
        /let _wrogowie_bie=$[substr(_wrog,_ii+1)] %;\
    	/let _wrogowie_mia=$[tolower(substr(_wrog,0,_ii))] %;\
;        /let _wrogowie_mia=$[strcat("[", toupper(substr(_wrogowie_mia, 0, 1)), tolower(substr(_wrogowie_mia, 0, 1)), "]", substr(_wrogowie_mia, 1))] %;\
        /if ({_wrogowie_mutacje}) \
            /let _ii=$[strrchr(_wrogowie_mia," ") + 1] %;\
            /let _rasa=$[strcat("(?:", substr(_wrogowie_mia, _ii), "|mutant(?:ka|))")] %;\
            /let _wrogowie_mia=$[strcat(substr(_wrogowie_mia, 0, _ii), _rasa)] %;\
        /endif %;\
        /if (strlen(_wrogowie_imie) > 2) \
            /let _wrogowie_mia=$[strcat(_wrogowie_mia, "|", _wrogowie_imie)] %;\
        /endif %;\
    	/let _wrogowie_=$[substr(_wrogowie_,i+1)] %;\
        /test ++ii %;\
;	/echo %{_wrogowie_mia} %;\
        /def -Fp220 -mregexp -t'(%{_wrogowie_mia})([ .,]|\$)' _wrogowie_trig_%{ii} = \
            /return _wrogowie_seen("%{_wrogowie_opis}") %;\
    /done

/def _wrogowie_seen = \
    /_set_wrog %{P1} %;\
    /return substitute(strcat({PL}, {P1}, " @{BCwhite}(@{BCred}!!@{nBCwhite}", {1}, "@{BCred}!!@{nBCwhite})@{n}", {P2}, {PR}))

;/mecho on
/_wrogowie_zrob_trigi
;/mecho off

/def ?wrogowie = \
/echo -p -aCgreen +-======================== @{BCwhite}Arkadia ver %{tf_version} @{BCmagenta}Pomoc @{nCgreen}==========================-+ %; \
/echo -p -aCgreen | @{BCyellow}Wrogowie!@{nCgreen}                                                                   | %; \
/echo -p -aCgreen | @{BCwhite}Dostepne komendy :@{nCgreen}                                                          | %; \
/echo -p -aCgreen | /wrogowie                   - Podstawka                                     | %; \
/echo -p -aCgreen |   [wyswietl]                - Wyswietla wrogow                              | %; \
;/echo -p -aCgreen |  [+|dodaj] <opis" za "co>   - Dodawanie wrogow                              | %; \
;/echo -p -aCgreen |                               np: /wrogowie + Ingwar za Bicie sklepikarzy   | %; \
;/echo -p -aCgreen |  [-|usun] <opis>            - Usuwanie wrogow                               | %; \
;/echo -p -aCgreen |                               np: /wrogowie - Ingwar                        | %; \
/echo -p -aCgreen |   [czysc]                   - Usuwa wszystkich wrogow                       | %; \
/echo -p -aCgreen |   [pomoc]                   - To co wlasnie ogladasz                        | %; \
/echo -p -aCgreen | /wrogowie+ -mobi <opis>     - Dodawanie                                     | %; \
/echo -p -aCgreen |   -m       dodaje nazwy mutant/demon                                        | %; \
/echo -p -aCgreen |   -o"opis" ustawia dodatkowy ops za co go scigamy                           | %; \
/echo -p -aCgreen |   -b"bier" opis w bierniku do podbindowywania                               | %; \
/echo -p -aCgreen |   -i"imie" opcjonalne imie jesli mozemy kogos znac                          | %; \
/echo -p -aCgreen |   /wrogowie+ -m -i"Uorg" -b"malego tepego ogra" -o"Bill mnie" maly tepy ogr | %; \
/echo -p -aCgreen | /wrogowie- <opis>           - Usuwanie                                      | %; \
;/echo -p -aCgreen | /cw                         - czyszczenie bidow bo sie zapychaja :(         | %; \
/echo -p -aCgreen |                                                                             | %; \
/echo -p -aCgreen +-===========================================================================-+

;------------------------------------------------------------------------------
;|                        Wyswietlanie dziwnych rzeczy                        |
;------------------------------------------------------------------------------
; komenda identyczna z zaznacz tyle ze zapisuje na innej liscie i mniej po 
; oczach bije..

/def zaznacz = \
    /if ({1}=/'{wyswietl|pokaz|}') \
      /_zaznacz_wyswietl %;\
    /elseif ({1}=/'{dodaj|add|+}' & {2}!~NULL) \
      /_zaznacz_dodaj %{-1} %;\
    /elseif ({1}=/'{usun|rem|-}' & {2}!~NULL) \
      /_zaznacz_usun %{-1} %;\
    /elseif ({1}=~'czysc') \
      /_zaznacz_czysc %;\
    /elseif ({1}=~'pomoc') \
      /?zaznacz %;\
    /else \
      /echo -p -aCgreen Zla skladnia polecam komende @{B}"/pomoc zaznacz"@{n}. %;\
    /endif

/def _zaznacz_wyswietl = \
    /if ({ogolne_zaznacz}=~NULL) \
      /echo -p -aCgreen Nic nie jest zaznaczane!! %;\
    /else \
      /echo -p -aCgreen Twoje zaznaczenia: %;\
      /let _zaznacz_=%{ogolne_zaznacz} %;\
      /while /let i=$[strstr(_zaznacz_,"|")]%; /@test i > 0%; /do \
        /let _zaznacz_nazwa=$[strcat(substr(_zaznacz_,0,strstr(_zaznacz_,"#")))] %;\
        /let _zaznacz_opis=$[substr(_zaznacz_,strstr(_zaznacz_,"#")+1,i-strstr(_zaznacz_,"#")-1)] %;\
        /echo -p @{B}$[pad({_zaznacz_nazwa},40)]@{nCgreen} jako: @{B}%{_zaznacz_opis}@{nCgreen}. %;\
        /let _zaznacz_=$[substr({_zaznacz_},i+1)] %;\
      /done %;\
    /endif

/def _zaznacz_dodaj = \
    /if /let i=$[strstr({*}," za ")] %; /@test i!=-1 %; /then \
      /let _zaznacz_nazwa=$[substr({*},0,i)] %;\
      /let _zaznacz_opis=$[substr({*},i+4)] %;\
    /elseif /let i=$[strstr({*},"#")] %; /@test i!=-1 %; /then \
      /let _zaznacz_nazwa=$[substr({*},0,i)] %;\
      /let _zaznacz_opis=$[substr({*},i+1)] %;\
    /else \
      /let _zaznacz_nazwa=%{*} %;\
      /let _zaznacz_opis=Cos %;\
    /endif %;\
    /if /test (strstr(ogolne_zaznacz,strcat(_zaznacz_nazwa,'#'))!=-1) %; /then \
      /_zaznacz_usun2 %{_zaznacz_nazwa} %;\
      /echo -p @{B}%{_zaznacz_nazwa}@{nCgreen} juz byl wiec zostal usuniety i zapisany na nowo jako: @{B}%{_zaznacz_opis}@{nCgreen}. %;\
    /else \
      /echo -p @{B}%{_zaznacz_nazwa}@{nCgreen} zapisany na liste zaznaczen jako: @{B}%{_zaznacz_opis}@{nCgreen}. %;\
    /endif %;\
    /set ogolne_zaznacz=%{ogolne_zaznacz}%{_zaznacz_nazwa}#%{_zaznacz_opis}| %;\
    /_zaznacz_zrob_trigi

/def _zaznacz_usun = \
    /if /test (strstr(ogolne_zaznacz,strcat({*},'#'))!=-1) %; /then \
      /_zaznacz_usun2 %{*} %;\
      /echo -p @{B}%{*}@{nCgreen} zostal usuniety z listy zaznaczen. %;\
      /_zaznacz_zrob_trigi %;\
    /else \
      /echo -p @{B}%{*}@{nCgreen} nie figuruje na liscie zaznaczen... %;\
    /endif

/def _zaznacz_usun2 = \
    /let _zaznacz_pocz=$[substr(ogolne_zaznacz,0,strstr(ogolne_zaznacz,{*}))] %;\
    /let _zaznacz_koni=$[substr(ogolne_zaznacz,strstr(substr(ogolne_zaznacz,strstr(ogolne_zaznacz,{*})),"|")+1+strstr(ogolne_zaznacz,{*}))] %;\
    /set ogolne_zaznacz=$[strcat(_zaznacz_pocz,_zaznacz_koni)]

/def _zaznacz_czysc = \
    /echo -p -aCgreen Lista zaznaczen zostala wyczyszczona. %;\
    /set ogolne_zaznacz= %;\
    /_zaznacz_zrob_trigi

/def _zaznacz_zrob_trigi = \
    /purge _zaznacz_trig_* %;\
    /let _zaznacz_=%{ogolne_zaznacz} %;\
    /let ii=0 %;\
    /while /let i=$[strstr(_zaznacz_,"|")]%; /@test i > 0%; /do \
      /let _zaznacz_nazwa=$[strcat("[",toupper(substr(_zaznacz_,0,1)),tolower(substr(_zaznacz_,0,1)),"]",substr(_zaznacz_,1,strstr(_zaznacz_,"#")-1))] %;\
      /let _zaznacz_opis=$[substr(_zaznacz_,strstr(_zaznacz_,"#")+1,i-strstr(_zaznacz_,"#")-1)] %;\
      /def -Fp190 -mregexp -t'(%{_zaznacz_nazwa})(( \\\\(.*\\\\))|([ .,]))' _zaznacz_trig_%{ii} = /substitute -p %%{PL}%%{P1} @{BxCwhite}(@{BxCyellow}!@{BxCwhite}%{_zaznacz_opis}@{BxCyellow}!@{BxCwhite})%%{P3}@{n}%%{P4}%%{PR} %;\
      /let _zaznacz_=$[substr({_zaznacz_},i+1)] %;\
      /test ++ii %;\
    /done

/_zaznacz_zrob_trigi

/def ?zaznacz = \
/echo -p -aCgreen +-======================== @{BCwhite}Arkadia ver %{tf_version} @{BCmagenta}Pomoc @{nCgreen}==========================-+ %; \
/echo -p -aCgreen | @{BCyellow}zaznacz!@{nCgreen}                                                                   | %; \
/echo -p -aCgreen | @{BCwhite}Dostepne komendy :@{nCgreen}                                                          | %; \
/echo -p -aCgreen | /zaznacz                    - Podstawka                                     | %; \
/echo -p -aCgreen |  [wyswietl]                 - Wyswietla zaznaczen                           | %; \
/echo -p -aCgreen |  [+|dodaj] <opis (za|#) co> - Dodawanie zaznaczen                           | %; \
/echo -p -aCgreen |                               np: /zaznacz + Ingwar # Swenson               | %; \
/echo -p -aCgreen |  [-|usun] <opis>            - Usuwanie zaznaczen                            | %; \
/echo -p -aCgreen |                               np: /zaznacz - Ingwar                         | %; \
/echo -p -aCgreen |  [czysc]                    - Usuwa wszystkie zaznaczenia                   | %; \
/echo -p -aCgreen |  [pomoc]                    - To co wlasnie ogladasz                        | %; \
/echo -p -aCgreen |                                                                             | %; \
/echo -p -aCgreen +-===========================================================================-+





