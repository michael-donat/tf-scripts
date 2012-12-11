; ### Zaslona by Goram ###
; Pare bajerow do druzyny.
; Lapanie i odmienianie druzyny.

/def prz = \
  przestan kryc sie za zaslona%;\
  przelam obrone $(/odmien_M_D $(/odmien_B_M %{*}))%; \
  /zabij %{*}

/set wskazywanie=1
/set rozkazywanie=1

/def rozkazy = /if ({*}=~'on') /set rozkazywanie=1%; /echo -aBCmagenta @ Rozkazywanie WLACZONE @%; /else /set rozkazywanie=0%; /echo -aBCmagenta @ Rozkazywanie wylaczone @%; /endif
/def wskazy = /if ({*}=~'on') /set wskazywanie=1%; /else /set wskazywanie=0%; /endif

/def zzz = zabij %{*}%; rozkaz druzynie zabic %{*}%; wskaz %{*}

/def zabij = \
  zabij %{*}%; \
  /if (wskazywanie>0 & ogolne_leader=~"dhogrin") \
    wskaz %{*}%; \
  /endif%; \
  /if (rozkazywanie>0 & ogolne_leader=~"dhogrin") \
    rozkaz druzynie zabic %{*}%; \
  /endif%; \
  /set cel_ataku=%{*}


/def key_f5 = \
  /zabij %{cel_ataku}

/def key_f6 = \
  /set rozkazywanie=0%; \
  /zabij %{cel_ataku}%; \
  /set rozkazywanie=1
  
; ATAK I PRZELAMYWANIE WSKAZANEGO
;/def -Fp400 -mregexp -t'^Druzyne prowadzi (.*)( i|, w ktorej) oprocz ciebie (jest|sa) w niej jeszcze(|:) (.*)\.$' lap_dowodce1 = \
;  /set dowodca=%{P1}%; /NareperujWskazywanie
;/def -Fp400 -mregexp -t'^Druzyne prowadzi (.*)\, zas ty jestes jej jedynym czlonkiem\.$' lap_dowodce2 = \
;  /set dowodca=%{P1}%; /NareperujWskazywanie
  
;/def NareperujWskazywanie = 
;  /eval \
;    /def -mregexp -Fp500 -t'^(%{dowodca}) wskazuje (.*)\.' _dowodca_wskazal_cel = \
;      /set WskazanyCel=%%%{P2}%%%; \
;      /def key_f1=zabij $$$[tolower({WskazanyCel})] %%%; \
;      /echo -p @{BxCred}              F1 - zabij $$$[tolower({WskazanyCel})]
;      
;      /echo -p @{BxCred}              F2 - przelam obrone $(/odmien_N_M %%{WskazanyCel})%%%; \
;      /def key_ctrl_f1=/prz $(/odmien_N_M %%{WskazanyCel})



/def druzyna = \
  /_zaslony_trigs %;\
  /_zaslony_binds %;\

/def -Fp400 -mregexp -t'^Przewodzisz druzynie, w ktorej oprocz ciebie (jest jeszcze|sa(| w niej) jeszcze:) (.*)\.$' lap_dr_1 = \
        /set drold=%{druzyna}%;\
        /set ogolne_leader=dhogrin%; \
        /set ogolne_leader_bie=dhogrina%; \
        /set ogolne_druzyna=$[tolower({P3-DRUZYNA})] %;\
	/set drtmp=$[replace(", ","|",{P3})]|%;\
	/set drtmp=$[replace(" i ","|", {drtmp})]%;\
	/set drtmp=$[tolower({drtmp})]%;\
	/while (drtmp !~ "") \
		/set _p=$[strstr({drtmp},"|")]%;\
		/set _drtmp=$[substr({drtmp},0,_p)]%;\
		/if (strstr({druzyna},{_drtmp})<0)\
			/adddr $[tolower({_drtmp})]%;\
		/endif%;\
		/set drtmp=$[substr({drtmp},{_p}+1)]%;\
		/done%;\
                /repeat -1 1 /purge _odm_*%;\
		/repeat -1 1 /_zaslony_make%;\
		/repeat -1 1 /_zagubieni_make%;\
		/druzyna

/def -Fp400 -mregexp -t'^Druzyne prowadzi (.*)( i|, w ktorej) oprocz ciebie (jest|sa) w niej jeszcze(|:) (.*)\.$' lap_dr_2 = \
        /set drold=%{druzyna}%;\
        /set drtmp=$[replace(", ","|",{P5})]|%{P1}|%;\
        /set drtmp=$[replace(" i ","|", {drtmp})]%;\
        /set drtmp=$[tolower({drtmp})]%;\
        /set ogolne_druzyna=$[tolower({drtmp-DRUZYNA})] %;\
        /set ogolne_leader=$[tolower({P1})] %;\
        /set ogolne_leader_bie=$[tolower($(/odmien_M_B %{P1}))] %;\
        /while (drtmp !~ "") \
                /set _p=$[strstr({drtmp},"|")]%;\
                /set _drtmp=$[substr({drtmp},0,_p)]%;\
                /if (strstr({druzyna},{_drtmp})<0)\
                        /adddr $[tolower({_drtmp})]%;\
                /endif%;\
                /set drtmp=$[substr({drtmp},{_p}+1)]%;\
                /done%;\
                /repeat -0.5 1 /purge _odm_*%;\
                /repeat -2 1 /_zaslony_make%;\
		 /druzyna

/def -Fp400 -mregexp -t'^Druzyne prowadzi (.*)\, zas ty jestes jej jedynym czlonkiem\.$' lap_dr_3 = \
        /set _drtmp=$[tolower({P1})]%;\
        /set ogolne_leader=$[tolower({P1})] %;\
        /set ogolne_leader_bie=$[tolower($(/odmien_M_B %{P1}))] %;\
;        [tolower($(/odmien_M_D %{*}))]
	/set drold=%{druzyna}%;\
                /if (strstr({druzyna},{_drtmp})<0)\
                /adddr $[tolower({_drtmp})]%;\
                /endif%;\
		/repeat -0.5 1 /purge _odm_*%;\
                /repeat -2 1 /_zaslony_make%;\
                /druzyna

/def -Fp400 -mregexp -ah -t'^Nie jestes w zadnej druzynie\.' del_empty_team = /delzas%;\
	/set druzynad=%;/set druzyna=%;/set druzynab=%;/set druzynan=%;/druzyna%;/set ogolne_leader=leader%;/druzyna


/def adddr = /if ($(/list _odmiana_%{*}*)=/"") \
		/eval odmien %{*}%;\
		/def -agL -Fp999 -mregexp -t'.* odmienia sie nastepujaco:' _odm_1%;\
		/def -agL -Fp999 -mregexp -t'  Mianownik: (.*),' _odm_2 = /if ({druzyna}=~NULL) /set druzyna=$$[tolower({P1})]%%;\
									    /else /set druzyna=%%{druzyna}|$$[tolower({P1})]%%;/endif%;\
		/def -agL -Fp999 -mregexp -t' Dopelniacz: (.*),' _odm_3 = /if ({druzynad}=~NULL) /set druzynad=$$[tolower({P1})]%%;\
									    /else /set druzynad=%%{druzynad}|$$[tolower({P1})]%%;/endif%;\
		/def -agL -Fp999 -mregexp -t'   Celownik: .*,' _odm_4%;\
		/def -agL -Fp999 -mregexp -t'    Biernik: (.*),' _odm_5 = /if ({druzynab}=~NULL) /set druzynab=$$[tolower({P1})]%%;\
									    /else /set druzynab=%%{druzynab}|$$[tolower({P1})]%%;/endif%;\
		/def -agL -Fp999 -mregexp -t'  Narzednik: (.*),' _odm_6 = /if ({druzynan}=~NULL) /set druzynan=$$[tolower({P1})]%%;\
									    /else /set druzynan=%%{druzynan}|$$[tolower({P1})]%%;/endif%;\
		/def -agL -Fp999 -mregexp -t'Miejscownik: .*\.' _odm_7%;\
	    /else \
		  /if ({druzyna}=~NULL) /set druzyna=$[tolower({*})]%; /else /set druzyna=%{druzyna}|$[tolower({*})]%;/endif%;\
		  /if ({druzynad}=~NULL) /set druzynad=$[tolower($(/odmien_M_D %{*}))]%; /else /set druzynad=%{druzynad}|$[tolower($(/odmien_M_D %{*}))]%;/endif%;\
		  /if ({druzynab}=~NULL) /set druzynab=$[tolower($(/odmien_M_B %{*}))]%; /else /set druzynab=%{druzynab}|$[tolower($(/odmien_M_B %{*}))]%;/endif%;\
		  /if ({druzynan}=~NULL) /set druzynan=$[tolower($(/odmien_M_N %{*}))]%; /else /set druzynan=%{druzynan}|$[tolower($(/odmien_M_N %{*}))]%;/endif%;\
	    /endif

;		  /if ({druzynad}=~NULL) /set druzynad=$$[tolower($$(/odmien_M_D %%{*}))]%%;\
;		  /else /set druzynad=%%{druzynad}|$$[tolower($$(/odmien_M_D %%{*}))]%%;/endif%;\

/def deldr = /if ({*}=~NULL) /set druzynad=%;/set druzyna=%;/set druzynab=%;/set druzynan=%;\
			/echo -p @{BxCred}Lista druzyny zostala wyczyszczona.%;\
		/elseif (strstr({druzyna},{*})>=0) \
		/set delN=$(/odmien_M_N %{*})%;\
                /set delB=$(/odmien_M_B %{*})%;\
                /set delD=$(/odmien_M_D %{*})%;\
		/if ({delN}=~NULL) \
		/else \
		/set druzyna=$[replace({*}, "", {druzyna})]%;\
		/set druzyna=$[replace("||", "|", {druzyna})]%;\
                /set druzynad=$[replace({delD},"",{druzynad})]%;\
                /set druzynad=$[replace("||","|",{druzynad})]%;\
		/set druzynan=$[replace({delN},"",{druzynan})]%;\
 		/set druzynan=$[replace("||","|",{druzynan})]%;\
                /set druzynab=$[replace({delB},"",{druzynab})]%;\
                /set druzynab=$[replace("||","|",{druzynab})]%;\
		/if (substr({druzyna},0,1)=~"|") /set druzyna=$[substr({druzyna},1)]%;/endif%;\
                /if (substr({druzynad},0,1)=~"|") /set druzynad=$[substr({druzynad},1)]%;/endif%;\
                /if (substr({druzynan},0,1)=~"|") /set druzynan=$[substr({druzynan},1)]%;/endif%;\
                /if (substr({druzynab},0,1)=~"|") /set druzynab=$[substr({druzynab},1)]%;/endif%;\
                /if (substr({druzyna},-1,1)=~"|") /set druzyna=$[substr({druzyna},0,-1)]%;/endif%;\
                /if (substr({druzynad},-1,1)=~"|") /set druzynad=$[substr({druzynad},0,-1)]%;/endif%;\
                /if (substr({druzynab},-1,1)=~"|") /set druzynab=$[substr({druzynab},0,-1)]%;/endif%;\
                /if (substr({druzynan},-1,1)=~"|") /set druzynan=$[substr({druzynan},0,-1)]%;/endif%;\
	/endif%;\
        /echo -p @{xBCred}Osoba o imieniu %{*} zostala usunieta z listy druzyny.%;\
	/else /echo -p @{BxCred}Osoba o imieniu %{*} nie byla dodana do listy druzyny.%;\
	/endif
/def w = \
    /echo .---------------------------------------------------------.%;\
    /echo -p |           @{BCmagenta}   ZASLONY NA NUMERYCZNEJ WLACZONE           @{n} |%;\
    /echo '---------------------------------------------------------'%;\
    /bind 7 = /z7%;/bind 0 = wes%;/bind 8 = /z8%;/bind 9 = /z9%;/bind 4 = /z4%;/bind 5 = /z5%;/bind 6 = /z6%;/bind 1 = /z1%;/bind 2 = /z2%;/bind 3 = /z3%;/more off

/def z1 = /eval %%{zasg1}
/def z2 = /eval %%{zasg2}
/def z3 = /eval %%{zasg3}
/def z4 = /eval %%{zasg4}
/def z5 = /eval %%{zasg5}
/def z6 = /eval %%{zasg6}
/def z7 = /eval %%{zasg7}
/def z8 = /eval %%{zasg8}
/def z9 = /eval %%{zasg9}
; przed ciosami (.*)


/def -mregexp -Fp500 -t'Zrecznie zaslaniasz (.*) przed ciosami (.*)\.' _moja_zaslona = /substitute -p @{BCyellow}     Ja @{n}@{BxCwhite}< @{n}@{BxCred}ZASLANIAM @{n}@{BxCwhite}> @{nBCcyan}%{P1} @{BxCred}przed ciosami @{n}@{BxCgreen}%{P2}.
/def -mregexp -Fp500 -t'Probujesz zaslonic (.*) przed ciosami (.*), jednak nie jestes w stanie tego uczynic\.' _moja_zaslona_nieudana = /substitute -p @{Cyellow}     Ja @{n}@{xCwhite}< @{n}@{xCred}PROBUJE ZASLONIC @{n}@{xCwhite}> @{nCcyan}%{P1} @{xCred}przed ciosami @{n}@{nxCgreen}%{P2}.
/def -mregexp -Fp500 -t'^(?i)Unosisz swoja (.*) i szybko przesuwasz sie za (.*), kryjac sie przed atakami (.*)\.' _wycofanie_moje = \
  /substitute -p @{BCyellow}     Ja @{n}@{BxCwhite}< @{n}@{BxCred}CHOWAM SIE ZA @{n}@{BxCwhite}> @{nBCcyan}%{P2} @{BxCred}przed atakami @{n}@{BxCgreen}%{P3}.
/def -mregexp -Fp500 -t'^(?i)Unosisz swoja (.*) i przesuwasz sie w strone (.*), bezskutecznie probujac skryc sie za [^ ]+ przed atakami (.*)\.' _wycofanie_moje_nieudane = \
  /substitute -p @{Cyellow}     Ja @{n}@{xCwhite}< @{n}@{xCred}PROBUJE SCHOWAC SIE ZA @{n}@{BxCwhite}> @{nCcyan}%{P2} @{xCred}przed atakami @{n}@{nxCgreen}%{P3}.

;/def -mregexp -Fp500 -t' unosi swoja (.*) i szybko przesuwa sie za (.*), kryjac sie przed atakami (.*)\.' _wycofanie = /substitute -p @{Cyellow} %{PL} @{n}@{BxCwhite}< @{n}@{BxCred}CHOWA SIE ZA @{n}@{BxCwhite}> @{nBCcyan}%{P2} @{BxCred}przed atakami @{n}@{nxCgreen}%{P3}.
;/def -mregexp -Fp500 -t' unosi swoja (.*) i przesuwa w strone (.*), bezskutecznie probujac skryc sie przed atakami (.*)\.' _wycofanie_nieudane = /substitute -p @{Cyellow} %{PL} @{n}@{BxCwhite}< @{n}@{BxCred}PROBUJE SCHOWAC SIE ZA @{n}@{BxCwhite}> @{nBCcyan}%{P2} @{BxCred}przed atakami @{n}@{nxCgreen}%{P3}.

/def -mregexp -Fp500 -t'Atakujesz ([A-za-z ]+)\.$' _ustawiam_cel_1 = /set cel_ataku=%{P1}
/def -mregexp -Fp500 -t'Atakujesz ([A-za-z ]+), lecz ([A-za-z ]+) zagradza ci droge\.$' _ustawiam_cel_2 = /set cel_ataku=%{P1}

; TRIGGERY ODPOWIADAJACE ZA PRZYPISYWANIE ZASLON

/set nrzaslony=1

/def _zaslony_make = \
/eval /def -mregexp -Fp10 -t'^(?i)(.*) atakuje (%{druzynab})\.' _zaslona_1 = \
	/substitute -p @{Cyellow}     %%%{P1} @{n}@{BxCwhite}< @{n}@{n}@{BxCred}ATAKUJE @{n}@{BxCwhite}>@{n} @{n}@{nxCgreen}%%%{P2}. \
  	   @{BCwhite}[@{n}@{BCblack}Zaslona: /z%%%{nrzaslony}@{n}@{BCwhite}]%%%;\
	/eval /set zas=$$$(/odmien_M_N %%%{P1})%%%;\
	/eval /set zasg%%%{nrzaslony}=zaslon $$$[tolower({P2})] przed $$$[tolower({zas})]%%%;\
	/eval /set nrzaslony=$$$[{nrzaslony}+1]%%%;\
	/oldnr%%%;\
	/if ({nrzaslony}=10) /set nrzaslony=1%%%;/endif%;\
/eval /def -mregexp -Fp10 -t'^(?i)(.*) koncentruje sie na walce z(|e) (%{druzynan})\.' _zaslona_2 = \
        /substitute -p @{Cyellow}     %%%{P1} @{n}@{BxCwhite}< @{n}@{n}@{BxCred}KONCENTRUJE SIE @{n}@{BxCwhite}>@{BxCred} na walce z @{n}@{nxCgreen}%%%{P3}. \
           @{BCwhite}[@{n}@{BCblack}Zaslona: /z%%%{nrzaslony}@{n}@{BCwhite}]%%%;\
        /eval /set zas=$$$(/odmien_M_N %%%{P1})%%%;\
	 /eval /set zass=$$$(/odmien_N_B %%%{P3})%%%;\
        /eval /set zasg%%%{nrzaslony}=zaslon $$$[tolower({zass})] przed $$$[tolower({zas})]%%%;\
        /eval /set nrzaslony=$$$[{nrzaslony}+1]%%%;\
	/oldnr%%%;\
        /if ({nrzaslony}=10) /set nrzaslony=1%%%;/endif%;\
/eval /def -mregexp -Fp500 -t'^(?i)(%{druzyna}) unosi swoja (.*) i szybko przesuwa sie za (.*), kryjac sie przed atakami (.*)\.' _wycofanie = \
  /substitute -p @{BCyellow}     %%%{P1} @{n}@{BxCwhite}< @{n}@{BxCred}CHOWA SIE ZA @{n}@{BxCwhite}> @{nBCcyan}%%%{P3} @{BxCred}przed atakami @{n}@{BxCgreen}%%%{P4}.%;\
/eval /def -mregexp -Fp500 -t'^(?i)(%{druzyna}) unosi swoja (.*) i przesuwa w strone (.*), bezskutecznie probujac skryc sie przed atakami (.*)\.' _wycofanie_nieudane = \
  /substitute -p @{Cyellow}     %%%{P1} @{n}@{xCwhite}< @{n}@{xCred}PROBUJE SCHOWAC SIE ZA @{n}@{BxCwhite}> @{nCcyan}%%%{P3} @{BxCred}przed atakami @{n}@{nxCgreen}%%%{P4}.%;\
/eval /def -mregexp -Fp10 -t'^(?i)(%{druzyna}) zrecznie zaslania (%{druzynab}|cie) przed ciosami (.*)\.' _zaslona_3 = \
	/substitute -p @{BCyellow}     %%%{P1} @{n}@{BxCwhite}< @{n}@{n}@{BxCred}ZASLANIA @{n}@{BxCwhite}> @{nBCcyan}%%%{P2} @{BxCred}przed \
	  ciosami @{n}@{BxCgreen}%%%{P3}.%;\
/eval /def -mregexp -Fp10 -t'^(?i)(%{druzyna}) probuje zaslonic (%{druzynab}|cie) przed ciosami (.*), jednak\.' _zaslona_3_nieudana = \
	/substitute -p @{Cyellow}     %%%{P1} @{n}@{xCwhite}< @{n}@{n}@{xCred}PROBUJE ZASLONIC @{n}@{xCwhite}> @{nCcyan}%%%{P2} @{xCred}przed \
	  ciosami @{n}@{xCgreen}%%%{P3}.%;\
/eval /def -mregexp -Fp10 -t'^(?i)(.*) zrecznie zaslania (.*) przed ((twoimi) ciosami|ciosami (%{druzynab}))\.' _zaslona_przeciwnikow = \
	/if ({P2}=~{cel_ataku}) \
	  /undef key_f1%%%;\
	  /def key_f1=/prz $$$[tolower({P2})]%%%;\
	/else \
	  /undef key_f3%%%;\
	  /def key_f3=/prz $$$[tolower({P2})]%%%;\
	/endif%%%;\
	/echo -aBCmagenta @----------------------------------------------%%%;\
	/if ({P2}=~{cel_ataku}) \
	  /echo -aBCmagenta | F1 - przelam obrone $$$(/odmien_M_D $$$(/odmien_B_M %%%{P2}))%%%;\
	/else \
	  /echo -aBCmagenta | F3 - przelam obrone $$$(/odmien_M_D $$$(/odmien_B_M %%%{P2}))%%%;\
	/endif%%%;\
	/substitute -p @{BCyellow}     %%%{P1} @{n}@{BxCwhite}< @{n}@{n}@{BxCblue}ZASLANIA @{n}@{BxCwhite}> @{nBCcyan}%%%{P2} @{BxCblue}przed \
	  ciosami @{n}@{BxCgreen}%%%{P4}%%%{P5}.%;\
/eval /def -mregexp -Fp10 -t'^(?i)(.*) probuje zaslonic (.*) przed ((twoimi) ciosami|ciosami (%{druzynab})), jednak nie jest w stanie tego uczynic\.' _zaslona_przeciwnikow_nieudana = \
	/substitute -p @{Cyellow}     %%%{P1} @{n}@{xCwhite}< @{n}@{n}@{xCblue}PROBUJE ZASLONIC @{n}@{xCwhite}> @{nCcyan}%%%{P2} @{xCblue}przed \
	  ciosami @{n}@{nxCgreen}%%%{P4}%%%{P5}.%;\
/eval /def -mregexp -Fp10 -t'^(?i)(.*) probuje zaatakowac (%{druzynab}|ciebie)(, lecz|, ale| ale| lecz) (%{druzyna}) zagradza (mu|jej) droge\.' _zaslona_4 = \
	/substitute -p @{Cyellow}     %%%{P1} @{n}@{BxCwhite}< @{n}@{n}@{BxCred}PROBUJE ZAATAKOWAC > \
	  @{nBCcyan}%%%{P2}@{BxCred}%%%{P3}@{n}@{nxCgreen} %%%{P4} @{BxCred}zagradza %%%{P5} droge.@{n} \
	  @{BCwhite}[@{n}@{BCblack}Zaslona: /z%%%{nrzaslony}@{n}@{BCwhite}]%%%;\
	/eval /set zas=$$$(/odmien_M_N %%%{P1})%%%;\
	/eval /set zass=$$$(/odmien_M_B %%%{P4})%%%;\
        /eval /set zasg%%%{nrzaslony}=zaslon $$$[tolower({zass})] przed $$$[tolower({zas})]%%%;\
        /eval /set nrzaslony=$$$[{nrzaslony}+1]%%%;\
	/oldnr%%%;\
        /if ({nrzaslony}=10) /set nrzaslony=1%%%;/endif%;\
/eval /def -mregexp -Fp10 -t'^(%{druzyna}) rzuca sie na (.*) przebijajac sie przez (je(go|j)) ochrone.' _zaslona_5 = \
	/set mcx=$$$[tolower({P2})]%%%;\
	/if ({P2}=~{cel_ataku}) \
	  /undef key_f2%%%;\
	  /def key_f2=/zabij $$$[tolower({P2})]%%%;\
	/else \
	  /undef key_f4%%%;\
	  /def key_f4=/zabij $$$[tolower({P2})]%%%;\
	/endif%%%;\
	/echo %%%;\
	/repeat -0.001 1 /echo%%%;\
	/substitute -p @{Cbgblue}@{BCgreen}-------------<@{BCbggreen}@{BCblue} %%%{P1}@{Cbgblue}@{BCgreen} rzuca sie na @{BCbggreen}@{BCblue}%%%{P2}\
	@{Cbgblue}@{BCgreen}, przebijajac sie przez %%%{P3} ochrone! @{BCbggreen}@{BCblue}@{Cbgblue}@{BCgreen}>------------%%%;\
	/echo -aBCmagenta @----------------------------------------------%%%;\
	/if ({P2}=~{cel_ataku}) \
	  /echo -aBCmagenta | F2 - zabij $$$[tolower({P2})]%%%;\
	/else \
	  /echo -aBCmagenta | F4 - zabij $$$[tolower({P2})]%%%;\
	/endif %;\
/eval /def -mregexp -Fp10 -t' rzuca sie na (%{druzynab}) przebijajac sie przez (je(go|j)) ochrone.' _zaslona_wrogowie_przebijaja_naszych = \
	/set mcx=$$$[tolower({P1})]%%%;\
	/undef key_f5%%%;\
	/undef key_f6%%%;\
	/def key_f5=zaslon $$$[tolower({P1})]%%%;\
	/def key_f6=rozkaz druzynie zaslonic $$$[tolower({P1})]%%%;\
	/echo %%%;\
	/repeat -0.001 1 /echo%%%;\
	/substitute -p @{Cbgred}@{BCgreen}-------------<@{BCbggreen}@{BCred} %%%{PL}@{Cbgred}@{BCgreen} rzuca sie na @{BCbggreen}@{BCred}%%%{P1}\
	@{Cbgred}@{BCgreen} przebijajac sie przez %%%{P3} ochrone! @{BCbggreen}@{BCred}@{Cbgred}@{BCgreen}>------------%%%;\
	/echo -aBCmagenta @----------------------------------------------%%%;\
	/echo -aBCmagenta | F5 - zaslon $$$[tolower({P1})]%%%;\
	/echo -aBCmagenta | F6 - rozkaz druzynie zaslonic $$$[tolower({P1})]%;\
/eval /def -Fp100 -mregexp -t'(%{druzyna}) rzuca sie na (.*), bezskutecznie probujac przebic sie przez jego ochrone.' _zaslona_6 = \
        /substitute -p @{BxCwhite}!!! @{BxCred}%%%{P1}@{nCred} PROBOWAL PRZELAMAC OCHRONE @{h}%%%{P2}. @{BCblue}@{BxCwhite}!!!%%%;\
	/set przel=$$$[tolower({P2})]%;\
/eval /def -Fp100 -mregexp -P2xCgreen -t'(%{druzyna}) (ledwo muska|(lekko|powaznie|bardzo ciezko|)(| )rani|masakruje) ' _zaslona_7 %;\
/eval /def -Fp80 -mregexp -P1xCyellow -t' (ledwo muska|(lekko|powaznie|bardzo ciezko|)(| )rani|masakruje) (%{druzynab}) .*\, trafiajac ' _zaslona_8%;\
	/eval /def -Fp250 -mregexp -t'((%{druzyna}) atakuje (.*)\.)' _zaslona_11 = \
		/set mcx=$$$[tolower({P3})]%%%;\
		/substitute -p @{Cbgrgb115}@{BCwhite}------> %%%{P1} <------%;

/def delzas=/purge _zaslona_*
/delzas
/def oldnr = /set oldnrzaslony=$[{nrzaslony}-1]
;/eval /def -mregexp -Fp100 -P1B -t'((.*) zrecznie zaslania (.*) przed ciosami (.*)\.)' _zaslona_nodr_col


/def _zagubieni_make = \
  /def -mregexp -t' (przybywaja|przybywa) za toba' _przybywajaca_linia = /set przybyli=%%{PL}%%; \
    /set przybyli=$$[replace(" i ", "|", {przybyli})]|%%; \
    /set przybyli=$$[replace(", ","|", {przybyli})]%%; \
    /set przybyli=$$[tolower({przybyli})]%%; \
    /set przybyliTemp=$$[{przybyli}]%%; \
    /set LostToCheck=$$[{druzyna}]|%%; \
    /CheckIfSome1Lost%%; \
    
/def CheckIfSome1Lost = \
  /set Zagubieni=%; \
  /set IluPrzybylo=0%; \
  /set IluBrakuje=0%; \
  /while (LostToCheck !~ "") \
	      /set _pp=$[strstr({LostToCheck},"|")]%;\
	      /set OneLostGuy=$[substr({LostToCheck},0,_pp)]%;\
	      /if (strstr({przybyli},{OneLostGuy})<0)\
		      /addtl $[tolower({OneLostGuy})]%;\
	      /endif%;\
	      /set LostToCheck=$[substr({LostToCheck},{_pp}+1)]%;\
	      /done%;\
  /while (przybyliTemp !~ "") \
	      /set _pp=$[strstr({przybyliTemp},"|")]%;\
	      /set IluPrzybylo=$[{IluPrzybylo}+1]%; \
	      /set przybyliTemp=$[substr({przybyliTemp},{_pp}+1)]%;\
	      /done%;\
   /if (Zagubieni !~ NULL) /echo -p @{}           @{BCred}BRAKUJE %{IluBrakuje}: @{BCblue}%{Zagubieni}%; /endif

/def addtl = \
  /set IluBrakuje=$[{IluBrakuje}+1]%; \
  /set Brakujacy=$[toupper({*},1)]%; \
  /if ({Zagubieni}=~NULL) /set Zagubieni=$[{Brakujacy}]%; \
  /else /set Zagubieni=%{Zagubieni}, $[{Brakujacy}]%; \
  /endif