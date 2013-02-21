/def dodaj_odmiane = \
	/purge _save_odmiana_*%; \
	/send odmien %{*}%;\
    /def -F -aL -mregexp -t'Odmien <kto/co>?' _save_odmiana_0 = /purge _save_odmiana_*%;\
    \
	/def -Fp1000 -aL -mregexp -t'odmienia sie nastepujaco' _save_odmiana_1 %;\
	\
	/def -Fp1000 -aL -mregexp -t'Mianownik: (.*),$$' 	_save_odmiana_2 = \
        /set mianownik=$$[substr(tolower({L}),0,-1)]%;\
    \
    /def -Fp1000 -aL -mregexp -t'Dopelniacz: (.*),$$'	_save_odmiana_3 = \
        /set dopelniacz=$$[substr(tolower({L}),0,-1)]%;\
    \
    /def -Fp1000 -aL -mregexp -t'Celownik'		_save_odmiana_4 %;\
    \
    /def -Fp1000 -aL -mregexp -t'Biernik: (.*),$$'	_save_odmiana_5 = \
        /set biernik=$$[substr(tolower({L}),0,-1)]%;\
    \
    /def -Fp1000 -aL -mregexp -t'Narzednik: (.*),$$'	_save_odmiana_6 = \
        /set narzednik=$$[substr(tolower({L}),0,-1)]%;\
    \
    /def -Fp1000 -aL -mregexp -t'Miejscownik'		_save_odmiana_7 = \
        /repeat -1 1 /purge _save_odmiana_*%%;/write_odmiana

/def write_odmiana = \
    /echo Mianownik:    %{mianownik}%;\
    /echo Dopelniacz:   %{dopelniacz}%;\
    /echo Biernik:      %{biernik}%;\
    /echo Narzednik:    %{narzednik}%;\
    /if ($(/list _odmiana_%{mianownik})=/"") \
        /echo Saving to file%;\
        /test fwrite(db_odmiana, '/def _odmiana_%{mianownik} = /set _odmiana_%{mianownik}_dopelniacz=%{dopelniacz}%%;/set _odmiana_%{mianownik}_biernik=%{biernik}%%;/set _odmiana_%{mianownik}_narzednik=%{narzednik}')%;\
        /def _odmiana_%{mianownik} = /set _odmiana_%{mianownik}_dopelniacz=%{dopelniacz}%%;/set _odmiana_%{mianownik}_biernik=%{biernik}%%;/set _odmiana_%{mianownik}_narzednik=%{narzednik}%;\
    /else \
        /echo Entry already exists%;\
    /endif%;\

/def odmiana_wyjatki = \
    /if ({*}=/"* ze skrzynia *") \
        /let subject=%{1} %{2} %{3}%;\
    /else \
        /let subject=%;\
    /endif%;\
    /echo %{subject}

/def odmien = \
    /let exception=$(/odmiana_wyjatki %{*})%;\
    /if ({exception}!~NULL) \
        /odmien %{exception}%;\
    /elseif ($(/list _odmiana_%{L})=/"") \
        /dodaj_odmiane %{L}%;\
        /repeat -1 1 /odmien_process %{*}%;\
    /else \
        /odmien_process %{*}%;\
    /endif%;\

/def odmien_process = \
    /_odmiana_%{L} %;\
    /echo%;\
    /echo Odmieniam (kto/co)            : %{*} %;\
    /echo Dopelniacz (nie ma kogo/czego): $(/odmien_M_D %{*}) %;\
    /echo Biernik (zaslon kogo/co)      : $(/odmien_M_B %{*}) %;\
    /echo Narzednik (przed kim/czym)    : $(/odmien_M_N %{*})

; -----------------------------
; MIANOWNIK -> DOPELNIACZ

/def odmien_M_D = \
	/let imie=$[tolower({L})]%;\
    /if ({-L}!~NULL) \
        /_odmien_M_D %{-L}%;\
    /endif %;\
    /retrieve_D %{imie}

/def retrieve_D = \
    /if ($(/list _odmiana_%{1})=/"") \
        /dodaj_odmiane %{*}%; \
    /else \
        /_odmiana_%{*}%; \
        /eval /echo %%_odmiana_%{1}_dopelniacz%; \
    /endif


/def _odmien_M_D = \
    /while ({#}) \
	    /let dpE=$[substr({1}, -1, 1)] %;\
	    /let dpEE=$[substr({1}, -2, 2)] %;\
		/if (dpEE=~"ka") \
            /let op_B1=$[strcat(substr({1}, 0, -1), 'iej')]%;\
        /elseif (dpE=~"y" | dpE=~"e") \
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

; MIANOWNIK -> DOPELNIACZ
; -----------------------------

; -----------------------------
; MIANOWNIK -> BIERNIK

/def odmien_M_B = \
	/let imie=$[tolower({L})]%;\
    /if ({-L}!~NULL) \
        /_odmien_M_B %{-L}%;\
    /endif %;\
    /retrieve_B %{imie}

/def retrieve_B = \
    /if ($(/list _odmiana_%{1})=/"") \
        /dodaj_odmiane %{*}%; \
    /else \
        /_odmiana_%{*}%; \
        /eval /echo %%_odmiana_%{1}_biernik%; \
    /endif

/def _odmien_M_B = \
    /while ({#}) \
	    /let dpE=$[substr({1}, -1, 1)] %;\
	    /let dpEE=$[substr({1}, -2, 2)] %;\
	    /let dpEEE=$[substr({1}, -3, 3)] %;\
		/if (dpE=~"y") \
		    /let op_B1=$[strcat(substr({1},0,-1),'ego')]%;\
        /elseif (dpE=~"e") \
            /let op_B1=%{1}%;\
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

; MIANOWNIK -> BIERNIK
; -----------------------------

; -----------------------------
; MIANOWNIK -> NARZEDNIK

/def odmien_M_N = \
	/let imie=$[tolower({L})]%;\
    /if ({-L}!~NULL) \
        /_odmien_M_N %{-L}%;\
    /endif %;\
    /retrieve_N %{imie}

/def retrieve_N = \
    /if ($(/list _odmiana_%{1})=/"") \
        /dodaj_odmiane %{*}%; \
    /else \
        /_odmiana_%{*}%; \
        /eval /echo %%_odmiana_%{1}_narzednik%; \
    /endif

/def _odmien_M_N = \
    /while ({#}) \
	    /let dpE=$[substr({1}, -1, 1)] %;\
	    /let dpEE=$[substr({1}, -2, 2)] %;\
	    /let dpEEE=$[substr({1}, -3, 3)] %;\
	    /if (dpEE=~"ie") \
	        /let op_B1=$[strcat(substr({1}, 0, -1), 'm')] %;\
		/elseif (dpE=~"y" | dpE=~"e") \
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

; MIANOWNIK -> NARZEDNIK
; -----------------------------

; -----------------------------
; BIERNIK -> MIANOWNIK

/def odmien_B_M = \
	/let imie=$[tolower({L})]%;\
    /if ({-L}!~NULL) \
        /_odmien_B_M %{-L}%;\
    /endif %;\
    /odmien_find_M_from_B %{imie}

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
        /elseif (dpE=~"e") \
            /let op_B1=%{1} %;\
		/elseif (dpE=~"a") \
		    /let op_B1=%{1} %;\
		/else \
		    /let op_B1=$[substr({1},0,-1)] %;\
		/endif %;\
	    /let op_B=$[strcat(op_B, op_B1, ' ')] %;\
        /shift %;\
	/done %;\
	/echo $[tolower({op_B})]

/def odmien_find_M_from_B = \
    /let patt=*biernik=%{1}*%;\
    /let res=$(/list -s _odmiana_* = %{patt})%;\
    /let res=$[regmatch("_odmiana_(.*)", {res})]%;\
    /echo %{P1}

; BIERNIK -> MIANOWNIK
; -----------------------------