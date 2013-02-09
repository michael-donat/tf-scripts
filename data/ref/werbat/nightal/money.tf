/alias dp_monety /dp monety
/alias sad_monety /sad monety

/def -mglob -p2 -t'*Bierzesz*monet*ciala*' _monety0 = \
	/if ( {pack} =~ "on" )\
		/tbind dp_monety %;\
	/endif

/def -ag -mregexp -p2 -t'^(Sa|Wydaje).*(okolo|wart.*) (.*) miedziak' wartosc_trig_1 =\
	/echo -p #@{BC%kolor_info}#@{n}# Wartosc: @{BC%kolor_info}%{P3}@{n} miedzi, czyli okolo @{BC%kolor_info}$[{P3}/10000] platyn, $[mod({P3},10000)/100] zlota, $[mod({P3},100)/10] srebra i $[mod({P3},10)] miedzi.@{n}

; by Reen

/def -mregexp -p2 -t'(co najwyzej|dac( az| tylko| co najwyzej|)|dam ci wiecej niz|dostal(a|)bys) (.*) monet' zbieramy_dane = \
	/set ceny=%{P4} %;\
	/set ceny2=$[replace(" i ", "|", {ceny})] %;\
	/set ceny2=$[replace(" ", "|", {ceny2})] %;\
	/set ceny2=$[replace("zlot", "", {ceny2})] %;\
	/set ceny2=$[replace("miedzian", "", {ceny2})] %;\
	/set ceny2=$[replace("srebrn", "", {ceny2})] %;\
	/set ceny2=$[replace("platynow", "", {ceny2})] %;\
	/set ceny2=$[replace("|a", "", {ceny2})] %;\
	/set ceny2=$[replace("|e", "", {ceny2})] %;\
	/set ceny2=$[replace("|ych", "", {ceny2})] %;\
	/set ceny2=$[replace(",", "", {ceny2})] %;\
	/set ceny2=____%{ceny2}| %;\
	/licz %{ceny2}

/def licz = \
	/if (regmatch("____([^|]*)\|([^|]*)\|([^|]*)\|([^|]*)\|",{1})) \
		/set _plats=$[expr({_plats}+{P1})] %;\
		/set _zloto=$[expr({_zloto}+{P2})] %;\
		/set _srebro=$[expr({_srebro}+{P3})] %;\
		/set _miedz=$[expr({_miedz}+{P4})] %;\
	/elseif (regmatch("____([^|]*)\|([^|]*)\|([^|]*)\|",{1})) \
		/set _plats=%{_plats} %;\
		/set _zloto=$[expr({_zloto}+{P1})] %;\
		/set _srebro=$[expr({_srebro}+{P2})] %;\
		/set _miedz=$[expr({_miedz}+{P3})] %;\
	/elseif (regmatch("____([^|]*)\|([^|]*)\|",{1})) \
		/set _plats=%{_plats} %;\
		/set _zloto=%{_zloto} %;\
		/set _srebro=$[expr({_srebro}+{P1})] %;\
		/set _miedz=$[expr({_miedz}+{P2})] %;\
	/elseif (regmatch("____([^|]*)\|",{1})) \
		/set _plats=%{_plats} %;\
		/set _zloto=%{_zloto} %;\
		/set _srebro=%{_srebro} %;\
		/set _miedz=$[expr({_miedz}+{P1})] %;\
	/else \
		/set _plats=%{_plats} %;\
		/set _zloto=%{_zloto} %;\
		/set _srebro=%{_srebro} %;\
		/set _miedz=%{_miedz} %;\
	/endif

/def wycen = \
	/czysc_statystyke %;\
	/repeat -1 1 /pokaz_cene %{*} %;\
	/eval wycen %{*} %;\

/def pokaz_cene = \
	/set _srebro_na_zloto=$[expr({_srebro}/10)] %;\
	/set _zloto_zysk=$[expr({_zloto}+{_srebro_na_zloto})] %;\
	/echo -p #@{BC%kolor_info}#@{n}# Sprzedawane: @{BC%kolor_info}%{*}@{n} %;\
	/echo -p #@{BC%kolor_info}#@{n}# Cena sklepu: %{_zloto} zl, %{_srebro} sr, czyli @{BC%kolor_info}%{_zloto_zysk}@{n} zl. %; \
	/if ( {kupiec} =~ "on" )\
		/set _licz_prowizje=$[trunc(expr({_zloto_zysk}*{prowizja}))] %;\
		/set _klient=$[expr({_zloto_zysk}-{_licz_prowizje})] %;\
		/echo -p #@{BC%kolor_info}#@{n}# Dla klienta: @{BC%kolor_info}%{_klient} zl, zysk: @{BC%kolor_info}%{_licz_prowizje}@{n} zl (prowizja: %prowizja\%). %;\
	/endif %;\
	/czysc_statystyke

/def czysc_statystyke = \
	/set _plats=0 %;\
	/set _zloto=0 %;\
	/set _srebro=0 %;\
	/set _miedz=0 %;\
	/set _srebro_strata=0 %;\
	/set _srebro_po_stracie=0 %;\
	/set _srebro_na_zloto=0 %;\
	/set _zloto_zysk=0 %;\
	/set _licz_prowizje=0 %;\
	/unset _klient=0
