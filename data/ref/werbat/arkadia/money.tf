/alias dp_monety /dp monety
/alias sad_monety /sad monety

/def -mglob -p2 -t'*Bierzesz*monet*ciala*' _monety0 = \
	/if ( {pack} =~ "on" )\
		/tbind dp_monety %;\
	/endif

/def -mregexp -Fp2 -t'okolo (.*) miedziak(i|ow).' wartosc_trig_1 = /substitute -p %{PL}okolo @{BC%kolor_info}$[{P1}/24000] mithryli, $[mod({P1},24000)/240] zlota, $[mod({P1},240)/12] srebra i $[mod({P1},12)] miedzi@{n} czyli jakies %{P1} miedzi.%{PR}
/def -mregexp -Fp2 -t'wartych (.*) miedziakow.' wartosc_trig_2 = /substitute -p %{PL}wartych okolo @{BC%kolor_info}$[{P1}/24000] mithryli, $[mod({P1},24000)/240] zlota, $[mod({P1},240)/12] srebra i $[mod({P1},12)] miedzi@{n} czyli jakies %{P1} miedzi.%{PR}
/def -mregexp -Fp2 -t'warte (.*) miedziakow.' wartosc_trig_3 = /substitute -p %{PL}warte okolo @{BC%kolor_info}$[{P1}/24000] mithryli, $[mod({P1},24000)/240] zlota, $[mod({P1},240)/12] srebra i $[mod({P1},12)] miedzi@{n} czyli jakies %{P1} miedzi.%{PR}

; by Reen

/def -mregexp -p2 -t'(co najwyzej|dac( az| tylko| co najwyzej|)|dam ci wiecej niz|dostal(a|)bys) (.*) monet' zbieramy_dane = \
	/set ceny=%{P4} %;\
	/set ceny2=$[replace(" i ", "|", {ceny})] %;\
	/set ceny2=$[replace(" ", "|", {ceny2})] %;\
	/set ceny2=$[replace("zlot", "", {ceny2})] %;\
	/set ceny2=$[replace("miedzian", "", {ceny2})] %;\
	/set ceny2=$[replace("srebrn", "", {ceny2})] %;\
	/set ceny2=$[replace("mithrylow", "", {ceny2})] %;\
	/set ceny2=$[replace("|a", "", {ceny2})] %;\
	/set ceny2=$[replace("|e", "", {ceny2})] %;\
	/set ceny2=$[replace("|ych", "", {ceny2})] %;\
	/set ceny2=$[replace(",", "", {ceny2})] %;\
	/set ceny2=____%{ceny2}| %;\
	/licz %{ceny2}

/def licz = \
	/if (regmatch("____([^|]*)\|([^|]*)\|([^|]*)\|([^|]*)\|",{1})) \
		/set _mithryl=$[expr({_mithryl}+{P1})] %;\
		/set _zloto=$[expr({_zloto}+{P2})] %;\
		/set _srebro=$[expr({_srebro}+{P3})] %;\
		/set _miedz=$[expr({_miedz}+{P4})] %;\
	/elseif (regmatch("____([^|]*)\|([^|]*)\|([^|]*)\|",{1})) \
		/set _mithryl=%{_mithryl} %;\
		/set _zloto=$[expr({_zloto}+{P1})] %;\
		/set _srebro=$[expr({_srebro}+{P2})] %;\
		/set _miedz=$[expr({_miedz}+{P3})] %;\
	/elseif (regmatch("____([^|]*)\|([^|]*)\|",{1})) \
		/set _mithryl=%{_mithryl} %;\
		/set _zloto=%{_zloto} %;\
		/set _srebro=$[expr({_srebro}+{P1})] %;\
		/set _miedz=$[expr({_miedz}+{P2})] %;\
	/elseif (regmatch("____([^|]*)\|",{1})) \
		/set _mithryl=%{_mithryl} %;\
		/set _zloto=%{_zloto} %;\
		/set _srebro=%{_srebro} %;\
		/set _miedz=$[expr({_miedz}+{P1})] %;\
	/else \
		/set _mithryl=%{_mithryl} %;\
		/set _zloto=%{_zloto} %;\
		/set _srebro=%{_srebro} %;\
		/set _miedz=%{_miedz} %;\
	/endif

/def wycen = \
	/czysc_statystyke %;\
	/repeat -1 1 /pokaz_cene %{*} %;\
	/eval wycen %{*} %;\

/def pokaz_cene = \
	/set _srebro_na_zloto=$[expr({_srebro}/20)] %;\
	/set _zloto_zysk=$[expr({_zloto}+{_srebro_na_zloto})] %;\
	/echo -p #@{BC%kolor_info}#@{n}# Sprzedawane: @{BC%kolor_info}%{*}@{n} %;\
	/echo -p #@{BC%kolor_info}#@{n}# Cena sklepu: %{_zloto} zl, %{_srebro} sr, czyli @{BC%kolor_info}%{_zloto_zysk}@{n} zl. %; \
	/if ( {kupiec} =~ "on" )\
		/set _licz_prowizje=$[trunc(expr({_zloto_zysk}*0.10))] %;\
		/set _klient=$[expr({_zloto_zysk}-{_licz_prowizje})] %;\
		/echo -p #@{BC%kolor_info}#@{n}# Dla klienta: @{BC%kolor_info}%{_klient} zl, zysk: @{BC%kolor_info}%{_licz_prowizje}@{n} zl (prowizja: %prowizja\%). %;\
	/endif %;\
	/czysc_statystyke

/def czysc_statystyke = \
	/set _mithryl=0 %;\
	/set _zloto=0 %;\
	/set _srebro=0 %;\
	/set _miedz=0 %;\
	/set _srebro_strata=0 %;\
	/set _srebro_po_stracie=0 %;\
	/set _srebro_na_zloto=0 %;\
	/set _zloto_zysk=0 %;\
	/set _licz_prowizje=0 %;\
	/unset _klient=0

; by Siro
/def ocenkamienie = \
	/def -mregexp -F -t'^(?:> |)(?:Jest tu|Wydaje ci sie|Sa tu).*czyli jakies (.*) miedz.*.' sumujemy_kamurki = \
		/eval /set suma_kamieni=$$[{suma_kamieni} + %%{P1}] %;\
	/def -mregexp -F -t'^(?:> |)Oceniasz.*waz[ay] (.*) gram.*' waga_kamurkow = \
		/eval /set waga_kamieni=$$[{waga_kamieni} + %%{P1}] %;\
	/set suma_kamieni=;; %;\
	/set waga_kamieni=;; %;\
	/send ocen kamienie %;\
	/repeat -1 1 /sumujemy_kamurki_wynik

/def sumujemy_kamurki_wynik = \
	/echo %;\
		/echo -p #@{BC%kolor_info}#@{n}# Wartosc %{suma_kamieni} miedzi czyli okolo @{BC%kolor_info}$[{suma_kamieni}/24000] mithryli, $[mod({suma_kamieni},24000)/240] zlota, $[mod({suma_kamieni},240)/12] srebra i $[mod({suma_kamieni},12)] miedzi@{n}%;\
		/repeat -4 1 /undef sumujemy_kamurki%%;/unset suma_kamieni%%;/unset waga_kamieni
