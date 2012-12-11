; ## Linie dodane automagicznie   : tf_ver=1.1.1
; ## 
; ## Wersja pliku                 : 1.1.1
; ## Ostatnia zmiana pliku        : 2009-01-06 21:07:40
; ## Plik pobrany                 : 2009-01-06 21:08:01
; ## Wersja Tfupdate              : 2.0.1
; ##
; ##

; Ocena przedmiotow.. 
; Najbardziej przydatna kupcom ale kazdemu sie moze przydac
; Automatyczne dawania kasy itp..

/def ?bilans = /bilans help

/def bilans = \
    /if ({*} =~ NULL | {*} =~ 'wyswietl') \
	/_bilans_wyswietl_n %;\
    /elseif ({*} =~ 'all' | {*} =~ 'caly') \
	/_bilans_wyswietl_n all %;\
    /elseif ({*} =~ 'czysc' | {*} =~ 'wyczysc') \
	/_bilans_czysc %;\
    /elseif (regmatch('[0-9]+', {*})) \
	/_bilans_wyswietl_n %{*} %;\
    /else \
	/echo Syntax: /bilans [czysc|wyswietl|caly|xx] %;\
	/echo Gdzie xx liczba \% jaka ma byc obliczona %;\
    /endif

/def bdaj = \
    /if (!regmatch("[0-9]+", {1}) | {2} =~ NULL) \
	/echo Uzycie: /bdaj \% komu %;\
	/echo     np. /bdaj 90 ingwarowi %;\
    /else \
        /let _pd=%{teraz_kasa_plus_mithryli-0}%;\
	/let _zd=%{teraz_kasa_plus_zlota-0}%;\
	/let _sd=%{teraz_kasa_plus_srebra-0} %;\
	/let _md=%{teraz_kasa_plus_miedzi-0} %;\
        /let _pm=%{teraz_kasa_minus_mithryli-0}%;\
	/let _zm=%{teraz_kasa_minus_zlota-0}%;\
	/let _sm=%{teraz_kasa_minus_srebra-0} %;\
	/let _mm=%{teraz_kasa_minus_miedzi-0} %;\
	/let _ps=$[{_pd} - {_pm}]%;\
        /let _zs=$[{_zd} - {_zm}]%;\
	/let _ss=$[{_sd} - {_sm}]%;\
        /let _ms=$[{_md} - {_mm}]%;\
        /let _psp=$[{_ps} * {1} / 100]%;\
	/let _zsp=$[{_zs} * {1} / 100]%;\
        /let _ssp=$[{_ss} * {1} / 100]%;\
	/let _msp=$[{_ms} * {1} / 100]%;\
	/if ({_psp} > 0) \
	    /if ({_psp} == 1) \
		daj %{_psp} mithrylowa monete %{2} %;\
		/echo Daje %{_psp} mithrylowa monete %{2} %;\
	    /elseif (({_psp} - ({_psp} / 10) * 10) < 5 & \
		({_psp} - ({_psp} / 10) * 10) > 1 & \
		({_psp} - ({_psp} / 100) * 100)/10 != 1) \
		daj %{_psp} mithrylowe monety %{2} %;\
		/echo Daje %{_psp} mithrylowe monety %{2} %;\
	    /else \
		daj %{_psp} mithrylowych monet %{2} %;\
		/echo Daje %{_psp} mithrylowych monet %{2} %;\
	    /endif %;\
	/endif %;\
	/if ({_zsp} > 0) \
	    /if ({_zsp} == 1) \
		daj %{_zsp} zlota monete %{2} %;\
		/echo Daje %{_zsp} zlota monete %{2} %;\
	    /elseif (({_zsp} - ({_zsp} / 10) * 10) < 5 & \
		({_zsp} - ({_zsp} / 10) * 10) > 1 & \
		({_zsp} - ({_zsp} / 100) * 100)/10 != 1) \
		daj %{_zsp} zlote monety %{2} %;\
		/echo Daje %{_zsp} zlote monety %{2} %;\
	    /else \
		daj %{_zsp} zlotych monet %{2} %;\
		/echo Daje %{_zsp} zlotych monet %{2} %;\
	    /endif %;\
	/endif %;\
	/if ({_ssp} > 0) \
	    /if ({_ssp} == 1) \
		daj %{_ssp} srebrna monete %{2} %;\
		/echo Daje %{_ssp} srebrna monete %{2} %;\
	    /elseif (({_ssp} - ({_ssp} / 10) * 10) < 5 & \
		({_ssp} - ({_ssp} / 10) * 10) > 1 & \
		({_ssp} - ({_ssp} / 100) * 100)/10 != 1) \
		daj %{_ssp} srebrne monety %{2} %;\
		/echo Daje %{_ssp} srebrne monety %{2} %;\
	    /else \
		daj %{_ssp} srebrnych monet %{2} %;\
		/echo Daje %{_ssp} srebrnych monet %{2} %;\
	    /endif %;\
	/endif %;\
	/if ({_msp} > 0) \
	    /if ({_msp} == 1) \
		daj %{_msp} miedziana monete %{2} %;\
		/echo Daje %{_msp} miedziana monete %{2} %;\
	    /elseif (({_msp} - ({_msp} / 10) * 10) < 5 & \
		({_msp} - ({_msp} / 10) * 10) > 1 & \
		({_msp} - ({_msp} / 100) * 100)/10 != 1) \
		daj %{_msp} miedziane monety %{2} %;\
		/echo Daje %{_msp} miedziane monety %{2} %;\
	    /else \
		daj %{_msp} miedzianych monet %{2} %;\
		/echo Daje %{_msp} miedzianych monet %{2} %;\
	    /endif %;\
	/endif %;\
    /endif

/def _bilans_wyswietl_n = \
    /if ({*} =~ 'all' | {*} =~ 'caly') \
        /let _pd=%{ogolne_kasa_plus_mithryli-0}%;\
	/let _zd=%{ogolne_kasa_plus_zlota-0}%;\
	/let _sd=%{ogolne_kasa_plus_srebra-0} %;\
	/let _md=%{ogolne_kasa_plus_miedzi-0} %;\
        /let _pm=%{ogolne_kasa_minus_mithryli-0}%;\
	/let _zm=%{ogolne_kasa_minus_zlota-0}%;\
	/let _sm=%{ogolne_kasa_minus_srebra-0} %;\
	/let _mm=%{ogolne_kasa_minus_miedzi-0} %;\
    /else \
        /let _pd=%{teraz_kasa_plus_mithryli-0}%;\
	/let _zd=%{teraz_kasa_plus_zlota-0}%;\
	/let _sd=%{teraz_kasa_plus_srebra-0} %;\
	/let _md=%{teraz_kasa_plus_miedzi-0} %;\
        /let _pm=%{teraz_kasa_minus_mithryli-0}%;\
	/let _zm=%{teraz_kasa_minus_zlota-0}%;\
	/let _sm=%{teraz_kasa_minus_srebra-0} %;\
	/let _mm=%{teraz_kasa_minus_miedzi-0} %;\
    /endif %;\
    /let _ps=$[{_pd} - {_pm}]%;\
    /let _zs=$[{_zd} - {_zm}]%;\
    /let _ss=$[{_sd} - {_sm}]%;\
    /let _ms=$[{_md} - {_mm}]%;\
    /echo -p -aCgreen $[strcat("+", strrep("-", 77), "+")] %;\
    /echo -p -aCgreen $[pad("|", 1, "|", 6, "mithryli", 7, "|", 1, "zlota", 7, \
	"|", 1, "srebra", 7, "|", 1, "miedzi", 7, "| --> |", 6, \
	"mithryli", 7, "|", 1, "zlota", 7, "|", 1, "srebra", 7, \
	"|", 1, "miedzi", 7, "|", 1)] %;\
    /echo -p -aCgreen $[pad("|", 1, "+++ |", 6, {_pd}, 8, "|", 1, {_zd}, 7, \
	"|", 1, {_sd}, 7, "|", 1, {_md}, 7, "| --> |", 7, \
	_bilans_zmien("mith", {_pd}, {_zd}, {_sd}, {_md}), 8, "|", 1, \
	_bilans_zmien("zlo", {_pd}, {_zd}, {_sd}, {_md}), 7, "|", 1, \
	_bilans_zmien("sre", {_pd}, {_zd}, {_sd}, {_md}), 7, "|", 1, \
	_bilans_zmien("mie", {_pd}, {_zd}, {_sd}, {_md}), 7, "|", 1)] %;\
    /echo -p -aCgreen $[pad("|", 1, "--- |", 6, {_pm}, 8, "|", 1, {_zm}, 7, \
	"|", 1, {_sm}, 7, "|", 1, {_mm}, 7, "| --> |", 7, \
	_bilans_zmien("mith", {_pm}, {_zm}, {_sm}, {_mm}), 8, "|", 1, \
	_bilans_zmien("zlo", {_pm}, {_zm}, {_sm}, {_mm}), 7, "|", 1, \
	_bilans_zmien("sre", {_pm}, {_zm}, {_sm}, {_mm}), 7, "|", 1, \
	_bilans_zmien("mie", {_pm}, {_zm}, {_sm}, {_mm}), 7, "|", 1)] %;\
    /echo -p -aCgreen $[pad("|", 1, "=== |", 6, {_ps}, 8, "|", 1, {_zs}, 7, \
	"|", 1, {_ss}, 7, "|", 1, {_ms}, 7, "| --> |", 7, \
	_bilans_zmien("mith", {_ps}, {_zs}, {_ss}, {_ms}), 8, "|", 1, \
	_bilans_zmien("zlo", {_ps}, {_zs}, {_ss}, {_ms}), 7, "|", 1, \
	_bilans_zmien("sre", {_ps}, {_zs}, {_ss}, {_ms}), 7, "|", 1, \
	_bilans_zmien("mie", {_ps}, {_zs}, {_ss}, {_ms}), 7, "|", 1)] %;\
    /echo -p -aCgreen $[strcat("+", strrep("-", 77), "+")] %;\
    /if (regmatch("[0-9]+", {*})) \
        /let _psp=$[{_ps} * {*} / 100]%;\
	/let _zsp=$[{_zs} * {*} / 100]%;\
        /let _ssp=$[{_ss} * {*} / 100]%;\
	/let _msp=$[{_ms} * {*} / 100]%;\
	/echo -p -aCgreen $[pad("|", 1, {*}, 3, "% |", 3, {_psp}, 8, "|", 1, {_zsp}, 7, \
	    "|", 1, {_ssp}, 7, "|", 1, {_msp}, 7, "| --> |", 7, \
	    _bilans_zmien("mith", {_psp}, {_zsp}, {_ssp}, {_msp}), 8, "|", 1, \
	    _bilans_zmien("zlo", {_psp}, {_zsp}, {_ssp}, {_msp}), 7, "|", 1, \
	    _bilans_zmien("sre", {_psp}, {_zsp}, {_ssp}, {_msp}), 7, "|", 1, \
	    _bilans_zmien("mie", {_psp}, {_zsp}, {_ssp}, {_msp}), 7, "|", 1)] %;\
        /let _psp=$[{_ps} - {_psp}]%;\
	/let _zsp=$[{_zs} - {_zsp}]%;\
        /let _ssp=$[{_ss} - {_ssp}]%;\
	/let _msp=$[{_ms} - {_msp}]%;\
	/echo -p -aCgreen $[pad("|", 1, 100 - {*}, 3, "% |", 3, {_psp}, 8, "|", 1, {_zsp}, 7, \
	    "|", 1, {_ssp}, 7, "|", 1, {_msp}, 7, "| --> |", 7, \
	    _bilans_zmien("mith", {_psp}, {_zsp}, {_ssp}, {_msp}), 8, "|", 1, \
	    _bilans_zmien("zlo", {_psp}, {_zsp}, {_ssp}, {_msp}), 7, "|", 1, \
	    _bilans_zmien("sre", {_psp}, {_zsp}, {_ssp}, {_msp}), 7, "|", 1, \
	    _bilans_zmien("mie", {_psp}, {_zsp}, {_ssp}, {_msp}), 7, "|", 1)] %;\
	/echo -p -aCgreen $[strcat("+", strrep("-", 77), "+")] %;\
    /endif

 	
/def _bilans_wyswietl = \
    /echo -p -aCgreen Otrzymales : @{B}%{teraz_kasa_plus_mithryli-0} mithryli, %{teraz_kasa_plus_zlota-0} zlota, %{teraz_kasa_plus_srebra-0} srebra i %{teraz_kasa_plus_miedzi-0} miedzi@{n} czyli jakies $[{teraz_kasa_plus_mithryli} * 24000 + {teraz_kasa_plus_zlota} * 240 + {teraz_kasa_plus_srebra} * 12 + {teraz_kasa_plus_miedzi}] miedzi. %;\
    /echo -p -aCgreen Wydales    : @{B}%{teraz_kasa_minus_mithryli-0} mithryli, %{teraz_kasa_minus_zlota-0} zlota, %{teraz_kasa_minus_srebra-0} srebra i %{teraz_kasa_minus_miedzi-0} miedzi@{n} czyli jakies $[{teraz_kasa_minus_mithryli} * 24000 + {teraz_kasa_minus_zlota} * 240 + {teraz_kasa_minus_srebra} * 12 + {teraz_kasa_minus_miedzi}] miedzi. %;\
    /echo -p -aCgreen Bilans     : @{B}$[{teraz_kasa_plus_mithryli} - {teraz_kasa_minus_mithryli}] mithryli, $[{teraz_kasa_plus_zlota} - {teraz_kasa_minus_zlota}] zlota, $[{teraz_kasa_plus_srebra} - {teraz_kasa_minus_srebra}] srebra i $[{teraz_kasa_plus_miedzi} - {teraz_kasa_minus_miedzi}] miedzi@{n} czyli jakies $[({teraz_kasa_plus_mithryli} - {teraz_kasa_minus_mithryli}) * 24000 + ({teraz_kasa_plus_zlota} - {teraz_kasa_minus_zlota}) * 240 + ({teraz_kasa_plus_srebra} - {teraz_kasa_minus_srebra}) * 12 + {teraz_kasa_plus_miedzi} - {teraz_kasa_minus_miedzi}] miedzi.

/def _bilans_wyswietl_all = \
    /echo -p -aCgreen Otrzymales : @{B}%{ogolne_kasa_plus_mithryli-0} mithryli, %{ogolne_kasa_plus_zlota-0} zlota, %{ogolne_kasa_plus_srebra-0} srebra i %{ogolne_kasa_plus_miedzi-0} miedzi@{n} czyli jakies $[{ogolne_kasa_plus_mithryli} * 24000 + {ogolne_kasa_plus_zlota} * 240 + {ogolne_kasa_plus_srebra} * 12 + {ogolne_kasa_plus_miedzi}] miedzi. %;\
    /echo -p -aCgreen Wydales    : @{B}%{ogolne_kasa_minus_mithryli-0} mithryli, %{ogolne_kasa_minus_zlota-0} zlota, %{ogolne_kasa_minus_srebra-0} srebra i %{ogolne_kasa_minus_miedzi-0} miedzi@{n} czyli jakies $[{ogolne_kasa_minus_mithryli} * 24000 + {ogolne_kasa_minus_zlota} * 240 + {ogolne_kasa_minus_srebra} * 12 + {ogolne_kasa_minus_miedzi}] miedzi. %;\
    /echo -p -aCgreen Bilans     : @{B}$[{ogolne_kasa_plus_mithryli} - {ogolne_kasa_minus_mithryli}] mithryli, $[{ogolne_kasa_plus_zlota} - {ogolne_kasa_minus_zlota}] zlota, $[{ogolne_kasa_plus_srebra} - {ogolne_kasa_minus_srebra}] srebra i $[{ogolne_kasa_plus_miedzi} - {ogolne_kasa_minus_miedzi}] miedzi@{n} czyli jakies $[({ogolne_kasa_plus_mithryli} - {ogolne_kasa_minus_mithryli}) * 24000 + ({ogolne_kasa_plus_zlota} - {ogolne_kasa_minus_zlota}) * 240 + ({ogolne_kasa_plus_srebra} - {ogolne_kasa_minus_srebra}) * 12 + {ogolne_kasa_plus_miedzi} - {ogolne_kasa_minus_miedzi}] miedzi.

/def _bilans_czysc = \
    /quote -S /unset `/listvar -s teraz_kasa_* %;\
    /echo -p -aCgreen Bilans wyczyszczony!!

/def _bilans_dodaj = \
    /if ({*} =~ NULL) \
	/break %;\
    /elseif ({1} =~'i') \
	/shift %;\
    /elseif (regmatch('[0-9]+ mithryl', strcat({1}, ' ', {2}))) \
	/set teraz_kasa_plus_mithryli=$[{teraz_kasa_plus_mithryli} + {1}] %;\
	/set ogolne_kasa_plus_mithryli=$[{ogolne_kasa_plus_mithryli} + {1}] %;\
	/shift 2 %;\
    /elseif (regmatch('[0-9]+ zlot', strcat({1}, ' ', {2}))) \
	/set teraz_kasa_plus_zlota=$[{teraz_kasa_plus_zlota} + {1}] %;\
	/set ogolne_kasa_plus_zlota=$[{ogolne_kasa_plus_zlota} + {1}] %;\
	/shift 2 %;\
    /elseif (regmatch('[0-9]+ sreb', strcat({1}, ' ', {2}))) \
	/set teraz_kasa_plus_srebra=$[{teraz_kasa_plus_srebra} + {1}] %;\
	/set ogolne_kasa_plus_srebra=$[{ogolne_kasa_plus_srebra} + {1}] %;\
	/shift 2 %;\
    /elseif (regmatch('[0-9]+ miedz', strcat({1}, ' ', {2}))) \
	/set teraz_kasa_plus_miedzi=$[{teraz_kasa_plus_miedzi} + {1}] %;\
	/set ogolne_kasa_plus_miedzi=$[{ogolne_kasa_plus_miedzi} + {1}] %;\
	/shift 2 %;\
    /else \
;	/echo Wystapil blad w liczeniu monet!! Zglos go natychmiast! %;\
	/shift %;\
    /endif %;\
    /_bilans_dodaj %{*}

/def _bilans_odejmij = \
    /if ({*} =~ NULL) \
	/break %;\
    /elseif ({1} =~'i') \
	/shift %;\
    /elseif (regmatch('[0-9]+ mithryl', strcat({1}, ' ', {2}))) \
	/set teraz_kasa_minus_mithryli=$[{teraz_kasa_minus_mithryli} + {1}] %;\
	/set ogolne_kasa_minus_mithryli=$[{ogolne_kasa_minus_mithryli} + {1}] %;\
	/shift 2 %;\
    /elseif (regmatch('[0-9]+ zlot', strcat({1}, ' ', {2}))) \
	/set teraz_kasa_minus_zlota=$[{teraz_kasa_minus_zlota} + {1}] %;\
	/set ogolne_kasa_minus_zlota=$[{ogolne_kasa_minus_zlota} + {1}] %;\
	/shift 2 %;\
    /elseif (regmatch('[0-9]+ sreb', strcat({1}, ' ', {2}))) \
	/set teraz_kasa_minus_srebra=$[{teraz_kasa_minus_srebra} + {1}] %;\
	/set ogolne_kasa_minus_srebra=$[{ogolne_kasa_minus_srebra} + {1}] %;\
	/shift 2 %;\
    /elseif (regmatch('[0-9]+ miedz', strcat({1}, ' ', {2}))) \
	/set teraz_kasa_minus_miedzi=$[{teraz_kasa_minus_miedzi} + {1}] %;\
	/set ogolne_kasa_minus_miedzi=$[{ogolne_kasa_minus_miedzi} + {1}] %;\
	/shift 2 %;\
    /else \
;	/echo Wystapil blad w liczeniu monet!! Zglos go natychmiast! %;\
	/shift %;\
    /endif %;\
    /_bilans_odejmij %{*}
    

/def -Fp10 -F -mregexp -t'^Dostajesz (.*) monet(e|y|)\\.$$' _bilans_trig_plus_1 = \
    /_bilans_dodaj %{P1}
/def -Fp10 -F -mregexp -t'wrecza ci (.*) monet(e|y|)\\.$$' _bilans_trig_plus_2 = \
    /_bilans_dodaj %{P1}

/def -Fp10 -F -mregexp -t'^Placisz ((.*) monet(e|y|))( i dostajesz (.*) monet(e|y|) reszty|)\\.$$' _bilans_trig_minus_1 = \
    /let _P5=%{P5} %;\
    /_bilans_odejmij %{P2} %;\
    /_bilans_dodaj %{_P5}


;/def -p200 -mregexp -t'okolo ([0-9]+) miedziakow\\.' _wartosc_trig_1 = \
;    /substitute -p %{PL}$(/_bilans_podaj_opis_z_miedzi %{P1}).%{PR}
/def -p20 -F -mregexp -t'^Oceniasz, ze .* waz[ya] ([0-9]+) (kilo|)gra(mow|my|m).* objetosc wynosi ([0-9]+) (mili|)litr(ow|y|)\\.$$' _wartosc_trig_1 = \
    /set _wartosc_waga=$[{P1} * ({P2} =/ 'kilo' ? 1000 : 1)]

/def -p20 -F -mregexp -t'(wart[^ ]*)( okolo|) ([0-9]+) miedziak(?:i|ow|a)\\.$$' _wartosc_trig_2 = \
    /substitute -p %{PL}%{P1}$(/_bilans_podaj_opis_z_miedzi %{P3}).

/def _bilans_podaj_opis_z_miedzi = \
    /if ({1} == 0) \
        /result " raczej niewiele" %;\
    /endif %;\
    /let _p=$[{1} / 24000] %;\
    /let _z=$[mod({1},24000) / 240] %;\
    /let _s=$[mod({1},240) / 12] %;\
    /let _m=$[mod({1},12)] %;\
    /let ret=$[""] %;\
    /if ({_p} > 0) \
        /let ret=$[strcat({ret}, " ", {_p}, " mithryli")] %;\
    /endif %;\
    /if ({_z} > 0 & {_p} == 0) \
        /let ret=$[strcat({ret}, " ", {_z}, " zlota")] %;\
    /elseif ({_z} > 0 & {_s} == 0 & {_m} ==0) \
        /let ret=$[strcat({ret}, " i ", {_z}, " zlota")] %;\
    /elseif ({_z} > 0) \
        /let ret=$[strcat({ret}, ", ", {_z}, " zlota")] %;\
    /endif %;\
    /if ({_s} > 0 & {_p} == 0 & {_z} == 0) \
        /let ret=$[strcat({ret}, " ", {_s}, " srebra")] %;\
    /elseif ({_s} > 0 & {_m} == 0) \
        /let ret=$[strcat({ret}, " i ", {_s}, " srebra")] %;\
    /elseif ({_s} > 0) \
        /let ret=$[strcat({ret}, ", ", {_s}, " srebra")] %;\
    /endif %;\
    /if ({_p} == 0 & {_z} == 0 & {_s} ==0) \
        /let ret=$[strcat({ret}, " ", {1}, " miedziakow")] %;\
    /else \
        /if ({_m} > 0) \
            /let ret=$[strcat({ret}, " i ", {_m}, " miedzi")] %;\
        /endif %;\
        /let ret=$[strcat({ret}, ", czyli ", {1}, " miedziakow")] %;\
    /endif %;\
    /if (_wartosc_waga) \
        /let ret=$[strcat({ret}, ", stosunek wagi ", {1} * 1000 / _wartosc_waga)] %;\
        /unset _wartosc_waga %;\
    /endif %;\
    /result ret

/def _bilans_zmien_na_miedz = \
    

/def _bilans_zmien = \
    /let _p=%{2} %;\
    /let _z=%{3} %;\
    /let _s=%{4} %;\
    /let _m=%{5} %;\
    /let suma=$[_p * 24000 + _z * 240 + _s * 12 + _m] %;\
    /let _p=$[suma / 24000] %;\
    /let _z=$[mod(suma,24000) / 240] %;\
    /let _s=$[mod(suma,240) / 12] %;\
    /let _m=$[mod(suma,12)] %;\
    /if ({1} =~ "suma") \
	/result %{suma} %;\
    /elseif ({1} =/ "mit*" | {1} =/ "p*") \
	/result %{_p} %;\
    /elseif ({1} =/ "z*") \
	/result %{_z} %;\
    /elseif ({1} =/ "s*") \
	/result %{_s} %;\
    /elseif ({1} =/ "m*") \
	/result %{_m} %;\
    /else \
	/result %{_p} %{_z} %{_s} %{_m} %;\
    /endif
   

/def bskamienie = \
    /def -1 -t'Umm, co chcesz ocenic?' _bskamienie_koniec = \
        /purge _bskamienie_* %;\
    ocen kamien %;\
    /def -mregexp -t'stosunek wagi (.*).' _bskamienie_trig = \
        /if ({P1} > %{1-10000}) \
            wloz kamien do %{ogolne_plecaka-plecaka} %%;\
        /else \
            odbezpiecz kamien %%;\
            sprzedaj kamien %%;\
;            wloz kamien do drugiego plecaka %%;\
        /endif %%;\
        ocen kamien

;Za zoltawobrazowy bursztyn dostalbys 11 zlotych, 40 srebrnych i 30 miedzianych monet.
/def wycen = \
    odbezpiecz kamienie %;\
    wycen kamienie %;\
    zabezpiecz kamienie %;\
    /_bilans_czysc %;\
    /set _wycen_sum=0 %;\
    /def -t'dostalbys (.*)\\.' _wycena_trig = /_bilans_dodaj %{P1}
    
