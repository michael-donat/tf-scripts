/def -mregexp -Fp3 -t'ledwo zyw.' _sub_ledwo = /substitute -p %{PL}@{BCwhite}@{Cbgred}$[toupper({P0})]@{n}%{PR}

/def _sub = \
	/return substitute(strcat(decode_attr(strcat({PL}, {P0}, {PR}, " [", {1}, "] "))))

/def _sub_inside = \
	/return substitute(strcat({PL}, {P0}, " ", {*}, {PR})) %;\

/def -mregexp -Fp2 -t'(przybywaja|podazaja) (z(e|)|na) [wzpgd]' _liczenie_teamow = \
	/let _ile=%{PL} %; \
	/let _ile=$[replace("##", " ", replace(" ", "_",replace(", ", "##", replace(" i ", "##", {_ile}))))]%; \
	/podlicz_team %{_ile}%; \
	/substitute -p [@{BC%kolor_info}%{_il_wr}@{n}] %{PL}%{P0}%{PR}%;\
	/unset _il_wr

/def podlicz_team = \
	/while ({#}) \
		/test ++_il_wr%; \
		/shift%; \
	/done

/def -mregexp -Fp2 -t' atakuje (.*)[!.]' ktos_atakuje = \
	/if ({P1} =~ "cie") \
		/eval /set kpra=cie %;\
	/elseif ({P1} =~ "ciebie") \
		/eval /set kpra=cie %;\
	/else \
		/set kpra=%P1%;\
	/endif %;\
	/set klew=%PL %;\
	/set ktobijelewa=$[replace(" ", "_", {klew})] %;\
	/eval /set %{ktobijelewa}_kto_bije=%{klew} %;\
	/eval /set %{ktobijelewa}_kogo_bije=%{kpra}

/def -ag -mregexp -Fp2 -t' (?<!ze )jest (w swietnej kondycji|w dobrym stanie|lekko rann.|rann.|w zlej kondycji|ciezko rann.|ledwo zyw.)\\.' kondycja_ktos = \
	/if ({PL} =/ "\[*\]*") \
		/set lalala=$[substr({PL}, 7)]%;\
		/set ktokondycjalewa=$[replace(" ", "_", {lalala})] %;\
		/set ktokondycjalewa_check=$(/eval /eval /echo $$[%{ktokondycjalewa}_kto_bije]) %;\
		/if ({lalala} =~ {ktokondycjalewa_check}) \
			/set kogonaparza=$(/eval /eval /echo $$[%{ktokondycjalewa}_kogo_bije]) %;\
			/if ({kogonaparza} =~ "cie" ) \
				/echo -p $[strcat({PL}, {P0}, "@{BCwhite} >>>@{nBCred}>>> CIEBIE!@{n}")] %;\
			/elseif ({kogonaparza} =~ "ciebie" ) \
				/echo -p $[strcat({PL}, {P0}, "@{BCwhite} >>>@{nBCred}>>> CIEBIE!@{n}")] %;\
			/else \
				/echo -p $[strcat({PL}, {P0}, "@{BCwhite} >>>>>> @{n}", {kogonaparza})] %;\
			/endif %;\
		/else \
			/echo -p $[strcat({PL}, {P0})] %;\
		/endif %;\
	/else \
		/set ktokondycjalewa=$[replace(" ", "_", {PL})] %;\
		/set ktokondycjalewa_check=$(/eval /eval /echo $$[%{ktokondycjalewa}_kto_bije]) %;\
		/if ({PL} =~ {ktokondycjalewa_check}) \
			/set kogonaparza=$(/eval /eval /echo $$[%{ktokondycjalewa}_kogo_bije]) %;\
			/if ({kogonaparza} =~ "cie" ) \
				/echo -p $[strcat({PL}, {P0}, "@{BCwhite} >>>@{nBCred}>>> CIEBIE!@{n}")] %;\
			/elseif ({kogonaparza} =~ "ciebie" ) \
				/echo -p $[strcat({PL}, {P0}, "@{BCwhite} >>>@{nBCred}>>> CIEBIE!@{n}")] %;\
			/else \
				/echo -p $[strcat({PL}, {P0}, "@{BCwhite} >>>>>> @{n}", {kogonaparza})] %;\
			/endif %;\
		/else \
			/echo -p $[strcat({PL}, {P0})] %;\
		/endif %;\
	/endif

/def -mregexp -Fp2 -t' probuje trafic ' prbtrf = \
	/set klew=%PL %;\
	/set kpra=%PR %;\
	/set ktobijelewa=$[replace(" ", "_", {klew})] %;\
	/eval /set %{ktobijelewa}_kto_bije=%{klew} %;\
	/eval /set %{ktobijelewa}_kogo_bije=$[strcat(substr({kpra}, 0, strstr({kpra}, " ")))]

/def -mregexp -Fp2 -t' probuje cie trafic ' prbtrf1 = \
	/set klew=%PL %;\
	/set kpra=%PR %;\
	/set ktobijelewa=$[replace(" ", "_", {klew})] %;\
	/eval /set %{ktobijelewa}_kto_bije=%{klew} %;\
	/eval /set %{ktobijelewa}_kogo_bije=cie

/def -mregexp -Fp2 -t' wykonuje .+ mierzac w (.*), lecz ' oslona = \
	/set ktobijelewa=$[replace(" ", "_", {PL})] %;\
	/eval /set %{ktobijelewa}_kto_bije=%PL %;\
	/if (strlen({P1}) > 15) \
		/eval /set %{ktobijelewa}_kogo_bije=$[strcat(substr({P1}, 0, strstr({P1}, " ")))] %;\
	/else \
		/eval /set %{ktobijelewa}_kogo_bije=%P1%;\
	/endif

/def  -mregexp -Fp2 -t' wyprowadza szybkie pchniecie .+ w (.*), lecz .*je z linii ataku .+' zbitka_czyms2 = \
	/set ktobijelewa=$[replace(" ", "_", {PL})] %;\
	/eval /set %{ktobijelewa}_kto_bije=%PL %;\
	/if (strlen({P1}) > 15) \
		/eval /set %{ktobijelewa}_kogo_bije=$[strcat(substr({P1}, 0, strstr({P1}, " ")))] %;\
	/else \
		/eval /set %{ktobijelewa}_kogo_bije=%P1%;\
	/endif

/def -mregexp -p2 -t'(Podazasz za|Wraz z .* podazasz za| przybywa.* za toba) ' czysc_tank = \
	/quote -S /unset `/listvar -s *_kto_bije%;\
	/quote -S /unset `/listvar -s *_kogo_bije%;\
	/nf

/def -mregexp -Fp2 -t' (polegl(a|o|)|umarl(a|o|))\\.' ktos_zdedzil_unset = \
	/echo -p @{BC%kolor_alarm}>>>>>>****** ZGON ******<<<<<<@{n} %;\
	/set ktoumarllewa=$[replace(" ", "_", {PL})] %;\
	/quote -S /unset `/listvar -s %{ktoumarllewa}_kto_bije%;\
	/quote -S /unset `/listvar -s %{ktoumarllewa}_kogo_bije
;;	/lc

/def nf = /quote -S /unset `/listvar -s *_k*_bije

/def typo =\
	/let n=$[strchr({*}, '|')]%;\
	/test param1 := substr({*}, 0, n) %;\
	/test param2 := substr({*}, n+1) %;\
	/echo -p @{BCyellow}###@{n} Zdefiniowana podmiana: @{B}%{param1}@{n} => @{B}%{param2}@{n} %;\
	/def -mregexp -h'SEND %{param1}'\
	typo_%{1} = /send $$[strcat ({PL}, '%{param2}', replace('%{param1}', '%{param2}', {PR}))]
