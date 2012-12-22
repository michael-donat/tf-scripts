/def comp = \
	/send porownaj sile z %{*}%;\
	/send porownaj zrecznosc z %{*} %;\
	/send porownaj wytrzymalosc z %{*}

/def cel = \
	/if ( {*} !~  NULL )\
	  /if (strstr({*}, "|") != -1) \
	      /let n=$[strchr({*}, '|')] %;\
	      /test cel := substr({*}, 0, n) %;\
	      /test celu := substr({*}, n+1) %;\
	  /else \
	      /set cel %{*} %;\
	      /set celu %{*} %;\
	  /endif %;\
	/endif %;\
	/echo -p #@{BC%kolor_info}#@{n}# 1st: @{BC%kolor_info}%cel@{n} (lamanie @{BC%kolor_info}%celu@{n})%;\
	/echo -p #@{BC%kolor_info}#@{n}# 2nd: @{BC%kolor_info}%cel2@{n} (lamanie @{BC%kolor_info}%cel2u@{n})%;\
	/echo -p #@{BC%kolor_info}#@{n}# Typ: @{BC%kolor_info}%opis_ataku@{n}

/def cel2 = \
	/if ( {*} !~  NULL )\
	  /if (strstr({*}, "|") != -1) \
	      /let n=$[strchr({*}, '|')] %;\
	      /test cel2 := substr({*}, 0, n) %;\
	      /test cel2u := substr({*}, n+1) %;\
	  /else \
	      /set cel2 %{*} %;\
	      /set cel2u %{*} %;\
	  /endif %;\
	/endif %;\
	/echo -p #@{BC%kolor_info}#@{n}# 1st: @{BC%kolor_info}%cel@{n} (lamanie @{BC%kolor_info}%celu@{n})%;\
	/echo -p #@{BC%kolor_info}#@{n}# 2nd: @{BC%kolor_info}%cel2@{n} (lamanie @{BC%kolor_info}%cel2u@{n})%;\
	/echo -p #@{BC%kolor_info}#@{n}# Typ: @{BC%kolor_info}%opis_ataku@{n}

/def am = \
	/if ( {1} =~ "1" ) \
		/set attackmode=1 %;\
		/set opis_ataku atak %;\
	/elseif ( {1} =~ "2") \
		/set attackmode=2 %;\
		/set opis_ataku wskazanie - atak %;\
	/elseif ( {1} =~ "3") \
		/set attackmode=3 %;\
		/set opis_ataku atak - wskazanie - rozkaz %;\
	/elseif ( {1} =~ "4") \
		/set attackmode=4 %;\
		/set opis_ataku lamanie - atak - wskazanie - rozkaz %;\
	/elseif ( {1} =~ "5") \
		/set attackmode=5 %;\
		/set opis_ataku atak - przedstawienie - wskazanie - rozkaz %;\
	/elseif ( {1} =~ "6") \
		/set attackmode=6 %;\
		/set opis_ataku lamanie - atak - przedstawienie - wskazanie - rozkaz %;\
	/elseif ( {1} =~ "help" )\
		/echo -p #@{BC%kolor_info}#@{n}# --------------------------------------------------------@{n} %;\
		/echo -p #@{BC%kolor_info}#@{n}# 1:                         atak                         @{n} %;\
		/echo -p #@{BC%kolor_info}#@{n}# 2:                   wskazanie - atak                   @{n} %;\
		/echo -p #@{BC%kolor_info}#@{n}# 3:              atak - wskazanie - rozkaz               @{n} %;\
		/echo -p #@{BC%kolor_info}#@{n}# 4:          lamanie - atak - wskazanie - rozkaz         @{n} %;\
		/echo -p #@{BC%kolor_info}#@{n}# 5:       atak - przedstawienie - wskazanie - rozkaz     @{n} %;\
		/echo -p #@{BC%kolor_info}#@{n}# 6:  lamanie - atak - przedstawienie - wskazanie - rozkaz@{n} %;\
		/echo -p #@{BC%kolor_info}#@{n}# --------------------------------------------------------@{n} %;\
	/else \
		/echo -p #@{BC%kolor_info}#@{n}# Typ ataku: @{BC%kolor_info}%opis_ataku@{n} %;\
	/endif

/alias x \
	/if (strstr({*}, "|") != -1) \
	  /let n=$[strchr({*}, '|')] %;\
	  /test p1 := substr({*}, 0, n) %;\
	  /test p2 := substr({*}, n+1) %;\
	  /_atak %{p1}|%{p2} %;\
	/else \
	  /_atak %{*}|%{*} %;\
	/endif
/alias x1 /_atak %{cel}|%{celu}
/alias x2 /_atak drugiego %{cel}|drugiego %{celu}
/alias x3 /_atak trzeciego %{cel}|trzeciego %{celu}
/alias x4 /_atak czwartego %{cel}|czwartego %{celu}
/alias x5 /_atak piatego %{cel}|piatego %{celu}
/alias x6 /_atak szostego %{cel}|szostego %{celu}
/alias c1 /_atak %{cel2}|%{cel2u}
/alias c2 /_atak drugiego %{cel2}|drugiego %{cel2u}
/alias c3 /_atak trzeciego %{cel2}|trzeciego %{cel2u}
/alias c4 /_atak czwartego %{cel2}|czwartego %{cel2u}
/alias c5 /_atak piatego %{cel2}|piatego %{cel2u}
/alias c6 /_atak szostego %{cel2}|szostego %{cel2u}
/alias v1 przelam obrone %{celu}
/alias v2 przelam obrone drugiego %{celu}
/alias v3 przelam obrone trzeciego %{celu}
/alias v4 przelam obrone czwartego %{celu}
/alias v5 przelam obrone piatego %{celu}
/alias v6 przelam obrone szostego %{celu}
/alias b1 przelam obrone %{cel2u}
/alias b2 przelam obrone drugiego %{cel2u}
/alias b3 przelam obrone trzeciego %{cel2u}
/alias b4 przelam obrone czwartego %{cel2u}
/alias b5 przelam obrone piatego %{cel2u}
/alias b6 przelam obrone szostego %{cel2u}

/def _war_binds = \
	/def key_f9 = /_atak %%{cel}|%%{celu} %;\
	/def key_f10 = /_atak %%{cel2}|%{cel2u} %;\
	/def key_esc_f9 = /send przelam obrone %%{celu} %;\
	/def key_esc_f10 = /send przelam obrone %%{cel2u} %;\
	/def key_f11 = /send przestan walczyc %;\
	/if ( {ktype} =~ "mac" ) \
		/def key_f16 = /_atak %%{cel}|%%{celu} %;\
		/def key_f17 = /_atak %%{cel2}|%%{cel2u} %;\
		/def key_esc_f16 = /send przelam obrone %%{celu} %;\
		/def key_esc_f17 = /send przelam obrone %%{cel2u} %;\
		/def key_f18 = /send przestan walczyc %;\
	/endif	
/_war_binds

/def -mregexp -Fp2 -t'.* wydaje ci rozkaz ataku na (.*).' _order_atak = \
	/set atakowany=$[tolower({P1})] %;\
	/echo %;\
	/echo -p @{BC%kolor_atak}>>> ROZKAZ ATAKU NA @{n}%atakowany@{BC%kolor_atak} <<<@{n} %;\
	/echo %;\
	/set rozkaz_ataku=%{atakowany} %;\
	/def -b'[' _atakporozkazie = zabij %atakowany %%; /set rozkaz_ataku= %;\
	/def -b']' =  przelam obrone %atakowany

/def -mregexp -Fp2 -t'(.*) wydaje .*rozkaz zasloniecia (.*).' _order_zaslona = \
	/echo %;\
	/echo -p @{BC%kolor_atak}>>> @{n}%P1@{BC%kolor_atak} chce zasloniecia @{n}%P2@{BC%kolor_atak} <<< %;\
	/echo

/def -mregexp -Fp2 -t'Atakujesz' atakujesz = /beep 1 %; /sneak off
/def -mregexp -Fp2 -t' atakuje ' atakuje_ktos = /beep 1
/def -mregexp -Fp2 -t' probuje zaatakowac .* droge' atakuje_ktos_z_zaslona = /beep 1
/def -mregexp -Fp2 -t' przebijajac sie przez (jego|jej) ' atakuje_przebicie = /beep 1

/def -mregexp -Fp2 -t'.* atakuj(e|a) cie(!|bie!)' mnie_atakuja0 = /beep 1 %; /sneak off
/def -mregexp -Fp2 -t'stajesz na.*drodze' mnie_atakuja1 = /beep 1 %; /sneak off
/def -mregexp -Fp2 -t'przebijajac sie przez twoja' mnie_atakuja2 = /beep 1 %; /sneak off

/def -mregexp -Fp2 -t'powaznie [a-z]+ cie ' cios_warn0 = /beep 1
/def -mregexp -Fp2 -t'bardzo ciezko rani.* cie ' cios_warn1 = /beep 1
/def -mregexp -Fp2 -t'masakruj.* cie ' cios_warn2 = /beep 1
