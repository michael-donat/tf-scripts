; Automagicly added line: tf_ver=1.0.8

/def odmien = \
    /echo Odmieniam (kto/co)            : %{*} %;\
    /echo Dopelniach (nie ma kogo/czego): $(/odmien_M_D %{*}) %;\
    /echo Biernik (zaslon kogo/co)      : $(/odmien_M_B %{*}) %;\
    /echo Narzednik (przed kim/czym)    : $(/odmien_M_N %{*})

/def _l_odmien = \
    /let _tmp=$[strcat({-1}, "|")] %;\
    /while /let i=$[strstr({_tmp},"|")] %;/@test i >- 1 %;/do \
        /let _name=$[substr({_tmp},0,i)] %;\
        /let _tmp=$[substr({_tmp},i+1)] %;\
        /let _name=$[substr(strcat({_name}, "\\"), 0, strchr({_name}, "\\"))] %;\
        /let _name=$(/odmien_M_%{1} %{_name}) %;\
        /let _ret_str=$[strcat({_ret_str}, {_name}, "|")] %;\
    /done %;\
    /echo $[substr({_ret_str}, 0, -1)]
    
/def odmien_M_D = \
	/let imie=$[tolower({L})]%;\
    /if ({-L}=~NULL) \
        /let hmmnicnierob=0%;\
    /elseif ({_sprawdzac_} == 0) \
	    /let AMOZEBUIDYN=123%;\
    /else \
        /_odmien_M_D %{-L}%;\
    /endif %;\
    \
	/if ({imie}=~"druzyna" | {imie}=~"leader") \
	    /let nicnierob=asdasd%; \
	/else \
    	    /sprawdz_D %{imie}%;\
	/endif

/def odmien_M_B = \
	/let grzbiet=0%;\
	/unset reszta%;\
	/let imie=$[tolower({L})]%;\
	/if ({imie}=~"") /return%; /endif%;\
	/if ({*}=/ '* ze skrzynia na grzbiecie') /let grzbiet=1%; /let reszta= ze skrzynia na grzbiecie%; /let imie=$[tolower({L5})]%; /endif%;\
;	/echo %{*}%;\
        /if ({-L}=~NULL) \
        	/let hmmnicnierob=0%;\
    /elseif ({_sprawdzac_} == 0) \
	/let AMOZEBUIDYN=123%;\
        /else \
        	/if ({grzbiet}==0) /_odmien_M_B %{-L}%; /endif%;\
        	/if ({grzbiet}==1) /_odmien_M_B %{-L5}%; /endif%;\
        /endif %;\
    	/if ({imie}=~"druzyna" | {imie}=~"leader") \
	    /let nic_nierob=3%; \
	/else \
	    /sprawdz_B %{imie}%;\
	    /if ({reszta}!~"") /echo %{reszta}%; /endif%;\
	/endif

/def odmien_B_M = \
	/let imie=$[tolower({L})]%;\
	/if ({imie}=~"") /return%; /endif%;\
        /if ({-L}=~NULL) \
        	/let hmmnicnierob=0%;\
    /elseif ({_sprawdzac_} == 0) \
	/let AMOZEBUIDYN=123%;\
        /else \
        	/_odmien_B_M %{-L}%;\
        /endif %;\
    	/if ({imie}=~"druzyna" | {imie}=~"leader") \
	    /let nic_nierob=3%; \
	/else \
	    /MojeSprawdz_M %{imie}%;\
	/endif

	
/def odmien_M_N = \
	/let imie=$[tolower({L})]%;\
        /if ({-L}=~NULL) \
        	/let hmmnicnierob=0%;\
    /elseif ({_sprawdzac_} == 0) \
	/let AMOZEBUIDYN=123%;\
        /else \
        	/_odmien_M_N %{-L}%;\
        /endif %;\
	/if ({imie}=~"druzyna" | {imie}=~"leader") \
	    /let nicnierob=123%; \
	/else \
	    /sprawdz_N %{imie}%;\
	/endif

/def sprawdzac = \
    /if ({*} =~ NULL) \
	/echo Uzycie: /sprawdzac on, off?%;\
    /elseif ({*} =~ "on") \
	/set _sprawdzac_=1%;\
	/echo Ok, sprawdzamy odmiane.%;\
    /elseif ({*} =~ "off") \
	/set _sprawdzac_=0%;\
	/echo Nie sprawdzamy odmiany%;\
    /endif
    
/sprawdzac on

/def sprawdz = \
    /if ({*} =~ NULL) \
	/echo Uzycie: /sprawdz [kto, co (odmiana)]%; \
    /elseif ({_sprawdzac_} == 0) \
	/let AMOZEBUIDYN=123%;\
    /else \
    	/if (!getopts("q", "")) /return 0%; /endif %; \
	/if ($(/list _odmiana_%{1})=/"") \
	    /dodaj_odmiane %{*}%;\
	/else \
            /if (!opt_q) \
            /endif %; \
	/endif %; \
    /endif

/def odmien_B_D = \
  ;/test aaa := regmatch('.*_odmiana_(.*)=',$[list('*odmiana*=*krasnoludFAASk*')]), echo("--- %{P0} --- ")%; \
  /def -mregexp -t'/def _odmiana_(.*) = /set .*dopelniacz=(%{*})' taki_tam_regexp = /echo === %{P1}%; \
  /def -mregexp -t'def' taki_tam_regexp2 = /echo === %{P1}%; \
  /list *odmiana*=*krasnoludk*%; \
  /substitute def
  


    
/def rdodaj = \
    /if ({1}=~NULL | {2}=~NULL | {3}=~NULL | {4}=~NULL) \
	/echo Uzycie: /rdodaj imie(mian) imienia(dop) imie(bier) imieniem(narz)%;\
	/echo Np: /rdodaj rindarin rindarina rindarina rindarinem%;\
    /else \
	/if ($(/list _odmiana_%{1})=/"") \
	    /let _mia=%{1}%;\
	    /let _dop=%{2}%;\
	    /let _bie=%{3}%;\
	    /let _nar=%{4}%;\
	    /test fwrite(pliczek, '/def _odmiana_%{_mia} = /set _odmiana_%{_mia}_dopelniacz=%{_dop}%%;/set _odmiana_%{_mia}_biernik=%{_bie}%%;/set _odmiana_%{_mia}_narzednik=%{_nar} ')%;\
	    /def _odmiana_%{_mia} = \
	        /set _odmiana_%{_mia}_dopelniacz=%{_dop}%%;\
	        /set _odmiana_%{_mia}_biernik=%{_bie}%%;\
	        /set _odmiana_%{_mia}_narzednik=%{_nar}%;\
	/endif%;\
    /endif
	        
/def sprawdz_D = \
    /if ({_sprawdzac_} == 0) \
	    /let nic_nie=123%;\
    /else \
	    /if ($(/listvar _odmiana_%{1}*)=/"") \
	        /if ($(/list _odmiana_%{1})=/"") \
        	    /dodaj_odmiane %{*}%; \
	        /else \
		        /_odmiana_%{*}%; \
	            /eval /echo %%_odmiana_%{1}_dopelniacz%; \
	        /endif %; \
        /else \
            /_odmiana_%{*}%;\
		    /eval /echo %%_odmiana_%{1}_dopelniacz%; \
        /endif %;\
    /endif

/def sprawdz_B = \
    /if ({_sprawdzac_} == 0) \
	/let nic_nie=123%;\
    /else \
	/if ($(/listvar _odmiana_%{1}*)=/"") \
	    /if ($(/list _odmiana_%{1})=/"") \
;		/echo -p @{BCmagenta}>> Nie mam tej odmiany << Wcisnij @{nCbgblue}@{BCwhite}alt+s@{nBCmagenta} by dodac!%; \
;		/set ___bind_odmiany=/sprawdz %{*}%;\
		/sprawdz %{*}%;\
	    /else \
		/_odmiana_%{*}%; \
		/eval /echo %%_odmiana_%{1}_biernik%; \
	    /endif%; \
	/else \
	    /eval /echo %%_odmiana_%{1}_biernik%; \
	/endif%;\
    /endif

/def MojeSprawdz_M = \
    /eval /echo %%{_MojaOdmiana_%{1}}
    
    
/def sprawdz_N = \
    /if ({_sprawdzac_} == 0) \
	/let nic_nie=123%;\
    /else \
	/if ($(/listvar _odmiana_%{1}*)=/"") \
	    /if ($(/list _odmiana_%{1})=/"") \
;		/echo -p @{BCmagenta}>> Nie mam tej odmiany << Wcisnij @{Cbgblue}@{BCwhite}alt+s@{n}@{BCmagenta} by dodac!%; \
;		/set ___bind_odmiany=/sprawdz %{*}%;\
		/sprawdz %{*}%;\
	    /else \
		/_odmiana_%{*}%; \
		/eval /echo %%_odmiana_%{1}_narzednik%; \
	    /endif %;\
	/else \
	    /eval /echo %%_odmiana_%{1}_narzednik%; \
	/endif%;\
    /endif

/def -b'^[s' _bind_do_dodawania_odmiany = /eval %{___bind_odmiany}
/set ___bind_odmiany=/sprawdz elf
        
/def _odmien_M_D = \
    /while ({#}) \
	    /let dpE=$[substr({1}, -1, 1)] %;\
	    /let dpEE=$[substr({1}, -2, 2)] %;\
		/if (dpEE=~"ka") \
                	/let op_B1=$[strcat(substr({1}, 0, -1), 'iej')]%;\
                /elseif (dpE=~"y") \
                	/let op_B1=$[strcat(substr({1}, 0, -1), 'ego')]%;\
                /elseif (dpE=~"i") \
                	/let op_B1=$[strcat(substr({1}, 0, -1), 'iego')]%;\
                /elseif (dpE=~"a") \
                	/let op_B1=$[strcat(substr({1}, 0, -1), 'ej')]%;\
                /else \
		    /let op_B1=$[strcat({1},'a')] %;\
		/endif %;\
	    /let op_B=$[strcat(op_B, op_B1, ' ')] %;\
        /shift %;\
	/done %;\
    /echo $[tolower({op_B})]

/def _odmien_M_B = \
    /while ({#}) \
	    /let dpE=$[substr({1}, -1, 1)] %;\
	    /let dpEE=$[substr({1}, -2, 2)] %;\
	    /let dpEEE=$[substr({1}, -3, 3)] %;\
		/if (dpE=~"y") \
		    /let op_B1=$[strcat(substr({1},0,-1),'ego')]%;\
		/elseif (dpE=~"i") \
		    /let op_B1=$[strcat(substr({1},0,-1),'iego')]%;\
		/elseif (dpE=~"a") \
		    /let op_B1=%{1} %;\
		/else \
		    /let op_B1=$[strcat({1},'a')] %;\
		/endif %;\
	    /let op_B=$[strcat(op_B, op_B1, ' ')] %;\
        /shift %;\
	/done %;\
	/echo $[tolower({op_B})]

/def _odmien_B_M = \
    /while ({#}) \
	    /let dpE=$[substr({1}, -1, 1)] %;\
	    /let dpEE=$[substr({1}, -2, 2)] %;\
	    /let dpEEE=$[substr({1}, -3, 3)] %;\
	    /let dpEEEE=$[substr({1}, -4, 4)] %;\
		/if (dpEEEE=~"iego") \
		    /let op_B1=$[strcat(substr({1},0,-4),'i')]%;\
		/elseif (dpEEE=~"ego") \
		    /let op_B1=$[strcat(substr({1},0,-3),'y')]%;\
		/elseif (dpE=~"a") \
		    /let op_B1=%{1} %;\
		/else \
		    /let op_B1=$[substr({1},0,-1)] %;\
		/endif %;\
	    /let op_B=$[strcat(op_B, op_B1, ' ')] %;\
        /shift %;\
	/done %;\
	/echo $[tolower({op_B})]	
	
/def _odmien_M_N = \
    /while ({#}) \
	    /let dpE=$[substr({1}, -1, 1)] %;\
	    /let dpEE=$[substr({1}, -2, 2)] %;\
	    /let dpEEE=$[substr({1}, -3, 3)] %;\
		/if (dpE=~"y" | dpE=~"e") \
		    /let op_B1=$[strcat(substr({1}, 0, -1), 'ym')] %;\
		/elseif (dpE=~"i") \
		    /let op_B1=$[strcat(substr({1}, 0, -1), 'im')] %;\
		/elseif (dpE=~"a") \
		    /let op_B1=%{1} %;\
		/else \
			/let op_B1=$[strcat({1},'em')] %;\
		/endif %;\
	    /let op_B=$[strcat(op_B, op_B1, ' ')] %;\
        /shift %;\
	/done %;\
	/echo $[tolower({op_B})]

/def odmien_N_B = \
        /let imie=%{L}%; \
        /let opis=%{-L}%; \
        /unset _odmieniony_opis %; \
        /unset _odmieniony_imie %; \
        /if ({opis}!~NULL) \
                /odmien_N_B_opis %{opis}%; \
        /endif %; \
        /if ({imie}!~NULL) \
                /odmien_N_B_imie %{imie}%; \
        /endif %; \
        /echo %{_odmieniony_opis}%{_odmieniony_imie}

/def odmien_N_B_opis = \
        /while ({#}) \
                /let dpEE=$[substr({1}, -2, 2)] %; \
                /if (dpEE=~"im") \
                        /let op_B1=$[strcat(substr({1}, 0, -1), 'ego')] %; \
                /elseif (dpEE=~"ym") \
                        /let op_B1=$[strcat(substr({1}, 0, -2), 'ego')] %; \
                /else \
                        /let op_B1=%{1}%; \
                /endif %; \
                /let op_B=$[strcat(op_B, op_B1, ' ')] %; \
                /shift%; \
                /done %; \
        /echo %{op_B}
/def odmien_N_B_imie = \
        /while ({#}) \
                /let spolgloski={b|c|d|e|f|g|h|i|j|k|l|m|n|o|p|r|s|t|u|v|w|x|y|z}%; \
                /let dpE=$[substr({1}, -1, 1)] %; \
                /let dpEE=$[substr({1}, -2, 2)] %; \
                /let dpEEE=$[substr({1}, -3, 3)] %; \
                /let dpEEEE=$[substr({1}, -4, 4)] %; \
                /if (dpEEE=~"iem") \
                        /let op_B1=$[strcat(substr({1}, 0, -3), 'a')] %; \
                /elseif (dpEE=~"em") \
                        /let op_B1=$[strcat(substr({1}, 0, -2), 'a')] %; \
                /elseif (dpEE=~"ym") \
                        /let op_B1=$[strcat(substr({1}, 0, -2), 'ego')] %; \
		/elseif (dpE=~"a") \
                        /let op_B1=$[strcat(substr({1}, 0, -1), 'e')] %; \
                /elseif (dpEEE=~"rro") \
                        /let op_B1=$[strcat(substr({1}, 0, -1), 'a')] %; \
                /elseif (dpEEEE=~"ergo") \
                        /let op_B1=$[strcat(substr({1}, 0, -1), 'a')] %; \
                /elseif (dpEE=~"im") \
                        /let op_B1=$[strcat(substr({1}, 0, -1), 'ego')] %; \
                /elseif (dpE !/ {spolgloski}) \
                        /let op_B1=$[strcat({1}, 'a')]%; \
                /else \
                        /let op_B1=%{1}%; \
                /endif %; \
                /let op_B=$[strcat(op_B, op_B1, ' ')] %; \
                /shift%; \
                /done %; \
        /echo %{op_B}


;poczatek, 28/10/2004, 18:00:42
;koniec    30/10/2004, 13:36:42
;data koncowej zmiany skryptu odmiany, czyli:
; - przymiotniki odmienia automatycznie,
; - imiona i rasy sa przechowane w pliku ~/.tf/baza_odmiany.db
; chyba dziala :P 30/10/2004, 16:13:31
;autor, rindarin


/set pliczek=~/tf/moje/baza_odmiany.db
/eval /load %{pliczek}

/def dodaj_odmiane = \
	/purge _save_odmiana_*%; \
	odmien %{*}%;\
        /def -F -aLg -mregexp -t'Odmien <kto/co>?' _save_odmiana_0 = \
                /purge _save_odmiana_*%;\
	/def -Fp1000 -agL -mregexp -t'odmienia sie nastepujaco' _save_odmiana_1 %;\
	/def -Fp1000 -agL -mregexp -t'Mianownik: (.*),$$' 	_save_odmiana_2 = \
        	/set mianownik=$$[substr(tolower({L}),0,-1)]%;\
        /def -Fp1000 -agL -mregexp -t'Dopelniacz: (.*),$$'	_save_odmiana_3 = \
        	/set dopelniacz=$$[substr(tolower({L}),0,-1)]%;\
        /def -Fp1000 -agL -mregexp -t'Celownik'		_save_odmiana_4 %;\
        /def -Fp1000 -agL -mregexp -t'Biernik: (.*),$$'	_save_odmiana_5 = \
        	/set biernik=$$[substr(tolower({L}),0,-1)]%;\
        /def -Fp1000 -agL -mregexp -t'Narzednik: (.*),$$'	_save_odmiana_6 = \
        	/set narzednik=$$[substr(tolower({L}),0,-1)]%;\
        /def -Fp1000 -agL -mregexp -t'Miejscownik'		_save_odmiana_7 = \
        	/repeat -1 1 /purge _save_odmiana_*%%;\
                /sejvuj_dane%%;
 
/def sejvuj_dane = \
	/test fwrite(pliczek, '/def _odmiana_%{mianownik} = /set _odmiana_%{mianownik}_dopelniacz=%{dopelniacz}%%;/set _odmiana_%{mianownik}_biernik=%{biernik}%%;/set _odmiana_%{mianownik}_narzednik=%{narzednik}')%;\
 	/set _odmiana_%{mianownik}_dopelniacz=%{dopelniacz}%;\
	/set _odmiana_%{mianownik}_biernik=%{biernik}%;\
        /set _odmiana_%{mianownik}_narzednik=%{narzednik}%;\
        /def _odmiana_%{mianownik} = \
        	/set _odmiana_%{mianownik}_dopelniacz=%{dopelniacz}%%;\
 		/set _odmiana_%{mianownik}_biernik=%{biernik}%%;\
        	/set _odmiana_%{mianownik}_narzednik=%{narzednik}

; ==== To jest Gorama ;) ====

/def -mregexp -aCrgb235 -Fp700 -t'przedstawia (.*) (slowami|jako)\:$' add_odmiana_ps = \
	/def -mregexp -aCrgb335 -Fp700 -t'^([A-Z][^ ,]*)(,| ).*(%{rasy}|mutant|mutantka|demon|czlowiek|vran)\.' _add_tmp_odm = \
		/sprawdz $$[tolower({P1})]%%;\
		/purge _add_tmp_odm
