/visual on

/eval /set statusline=$[strrep(decode_attr("-", "BCwhite"),columns())]
/eval /set spacebreak=$[strrep(' ',columns()-141)]

/def ack = \
	/set alarm=$[decode_attr("none", "BCgreen")] %;\
	/set bindings= %;\
	/undef tempbind 

/def -Fp2 -mregexp -t'tes( fizycznie|) w swietnej kondycji' kon1 = /set kondycja=$[strcat("[", decode_attr("                     ", "Cbggreen"), "] ")]
/def -Fp2 -mregexp -t'tes( fizycznie|) w dobrym stanie' kon2 = /set kondycja=$[strcat("[", decode_attr("                  ", "Cbggreen"), "   ] ")]
/def -Fp2 -mregexp -t'tes( fizycznie|) lekko rann.' kon3 = /set kondycja=$[strcat("[", decode_attr("               ", "Cbggreen"), "      ] ")]
/def -Fp2 -mregexp -t'tes( fizycznie|) rann.' kon4 = /set kondycja=$[strcat("[", decode_attr("            ", "Cbgyellow"), "         ] ")]
/def -Fp2 -mregexp -t'tes( fizycznie|) w zlej kondycji' kon5 = /set kondycja=$[strcat("[", decode_attr("         ", "Cbgyellow"), "            ] ")]
/def -Fp2 -mregexp -t'tes( fizycznie|) ciezko rann.' kon6 = /set kondycja=$[strcat("[", decode_attr("      ", "Cbgred"), "               ] ")]
/def -Fp2 -mregexp -t'tes( fizycznie|) ledwo zyw.' kon7 = /set kondycja=$[strcat("[", decode_attr("      L E D W O      ", "BCbgred"),"]")]

/def -Fp2 -mregexp -t'i jestes w pelni wypoczet.' zmecz0 = /eval /set zmeczenie=$[strcat("[", decode_attr("                    ", "Cbggreen"), "] ")]
/def -Fp2 -mregexp -t'i jestes wypoczet.' zmecz1 = /set zmeczenie=$[strcat("[", decode_attr("                  ", "Cbggreen"), "  ] ")]
/def -Fp2 -mregexp -t'i jestes troche zmeczon.' zmecz2 = /set zmeczenie=$[strcat("[", decode_attr("                ", "Cbggreen"), "    ] ")]
/def -Fp2 -mregexp -t'i jestes zmeczon.' zmecz3 = /set zmeczenie=$[strcat("[", decode_attr("              ", "Cbggreen"), "      ] ")]
/def -Fp2 -mregexp -t'i jestes bardzo zmeczon.' zmecz4 = /set zmeczenie=$[strcat("[", decode_attr("            ", "Cbggreen"), "        ] ")]
/def -Fp2 -mregexp -t'i jestes nieco wyczerpan.' zmecz5 = /set zmeczenie=$[strcat("[", decode_attr("          ", "Cbggreen"), "          ] ")]
/def -Fp2 -mregexp -t'i jestes wyczerpan.' zmecz6 = /set zmeczenie=$[strcat("[", decode_attr("        ", "Cbgyellow"), "            ] ")]
/def -Fp2 -mregexp -t'i jestes bardzo wyczerpan.' zmecz7 = /set zmeczenie=$[strcat("[", decode_attr("      ", "Cbgyellow"), "              ] ")]
/def -Fp2 -mregexp -t'i jestes wycienczon.' zmecz8 = /set zmeczenie=$[strcat("[", decode_attr("    ", "Cbgred"), "                ] ")]
/def -Fp2 -mregexp -t'i jestes calkowicie wycienczon.' zmecz9 = /set zmeczenie=$[strcat("[", decode_attr("C A L K O W I C I E ", "BCbgred"), "]")]

/def -Fp2 -mregexp -t'nie mozesz dalej podazac' zmecz10 = /set zmeczenie=$[strcat("[", decode_attr("C A L K O W I C I E ", "BCbgred"), "]")]
/def -Fp2 -mregexp -t'Czujesz sie smiertelnie zmeczony' zmecz11 = /set zmeczenie=$[strcat("[", decode_attr("C A L K O W I C I E ", "BCbgred"), "]")]

/def -Fp2 -mregexp -t'((Jest|Sa) tutaj ([^ ]*) (widoczne|widocznych) (wyjsc|wyjscia|wyjscie): |Trakt wiedzie na |W mroku nocy dostrzegasz .* widoczn(e|ych) wyjsc(|ia|ie): |Trakt rozgalezia sie na |W gestych ciemnosciach dostrzegasz trakt wiodacy na |W gestych ciemnosciach dostrzegasz, ze trakt rozgalezia sie na |Sciezka prowadzi tutaj w .* (kierunkach|kierunku): |Szlak.* tutaj w .* kierunk.*: |Wyjsc.* prowadz.* tutaj w .* (kierunkach|kierunku): |Tunel.* ciagn.* na |Wedrowke przez rozlegle laki mozesz kontynuowac udajac sie na |W panujacym tu polmroku zauwazasz .*: |Wedrujac po gorach zauwazasz, ze jedyne widoczne wyjscia stad prowadza na |W trudnym gorskim terenie udaje ci sie spostrzec jedno jedyne wyjscie prowadzace na |Gorski teren nie nalezy do zbyt przyjaznych, lecz udaje ci sie spostrzec wyjscia prowadzace na )' widoczne_wyjscia = /_wyjscia_z_lokacji %{PR}

/def -mregexp -Fp2 -t'podazasz za ' _nie_rysuj = /set lwlast=druzyna

/def _first = /result {1}
/def _all_but_first = /result {-1}
/def _wyjscia_z_lokacji = \
	/quote -S /unset `/listvar -s czy_kierunek_jest* %;\
	/let w_z_l=%{*}%; \
	/let pnum=%{#}%; \
	/let i=0%; \
	/let w_zn_t=%; \
	/let wyjscia_z_lokacji_t=%; \
	/set idzna_ile_wyjsc=-1%; \
	/if (strstr({w_z_l},".")>=0) \
		/let w_z_l=$[strcat(substr({w_z_l},0,strlen({w_z_l})-1))]%; \
	/endif%; \
	/while /let i=$[i+1]%; /@test i<=pnum%; /do \
		/let w_zn=$(/_first %{w_z_l})%; \
		/if (strstr({w_zn},",")>=0) \
			/let w_zn=$[strcat(substr({w_zn},0,strlen({w_zn})-1))]%; \
		/endif%;\
		/if ({w_zn}=~"polnoc")\
			/if ({lwlast}=~"s")\
				/set czy_kierunek_jest_n=$[decode_attr("|", "BCgreen")]%;\
			/else \
				/set czy_kierunek_jest_n=$[decode_attr("|", "BCyellow")]%;\
			/endif %;\
		/elseif ({w_zn}=~"poludnie")\
			/if ({lwlast}=~"n")\
				/set czy_kierunek_jest_s=$[decode_attr("|", "BCgreen")]%;\
			/else \
				/set czy_kierunek_jest_s=$[decode_attr("|", "BCyellow")]%;\
			/endif %;\
		/elseif ({w_zn}=~"wschod")\
			/if ({lwlast}=~"w")\
				/set czy_kierunek_jest_e=$[decode_attr("-", "BCgreen")]%;\
			/else \
				/set czy_kierunek_jest_e=$[decode_attr("-", "BCyellow")]%;\
			/endif %;\
		/elseif ({w_zn}=~"zachod")\
			/if ({lwlast}=~"e")\
				/set czy_kierunek_jest_w=$[decode_attr("-", "BCgreen")]%;\
			/else \
				/set czy_kierunek_jest_w=$[decode_attr("-", "BCyellow")]%;\
			/endif %;\
		/elseif ({w_zn}=~"polnocny-wschod")\
			/if ({lwlast}=~"sw")\
				/set czy_kierunek_jest_ne=$[decode_attr("/", "BCgreen")]%;\
			/else \
				/set czy_kierunek_jest_ne=$[decode_attr("/", "BCyellow")]%;\
			/endif %;\
		/elseif ({w_zn}=~"polnocny-zachod")\
			/if ({lwlast}=~"se")\
				/set czy_kierunek_jest_nw=$[decode_attr("\\", "BCgreen")]%;\
			/else \
				/set czy_kierunek_jest_nw=$[decode_attr("\\", "BCyellow")]%;\
			/endif %;\
		/elseif ({w_zn}=~"poludniowy-wschod")\
			/if ({lwlast}=~"nw")\
				/set czy_kierunek_jest_se=$[decode_attr("\\", "BCgreen")]%;\
			/else \
				/set czy_kierunek_jest_se=$[decode_attr("\\", "BCyellow")]%;\
			/endif %;\
		/elseif ({w_zn}=~"poludniowy-zachod")\
			/if ({lwlast}=~"ne")\
				/set czy_kierunek_jest_sw=$[decode_attr("/", "BCgreen")]%;\
			/else \
				/set czy_kierunek_jest_sw=$[decode_attr("/", "BCyellow")]%;\
			/endif %;\
		/elseif ({w_zn}=~"gora")\
			/if ({lwlast}=~"d")\
				/set czy_kierunek_jest_u=$[decode_attr("U", "BCgreen")]%;\
			/else \
				/set czy_kierunek_jest_u=$[decode_attr("U", "BCyellow")]%;\
			/endif %;\
		/elseif ({w_zn}=~"dol")\
			/if ({lwlast}=~"u")\
				/set czy_kierunek_jest_d=$[decode_attr("D", "BCgreen")]%;\
			/else \
				/set czy_kierunek_jest_d=$[decode_attr("D", "BCyellow")]%;\
			/endif %;\
		/elseif ({w_zn}=~"wyjscie") /set czy_kierunek_jest_inne=$[decode_attr("X", "BCyellow")]%;\
		/elseif ({w_zn}=~"most") /set czy_kierunek_jest_inne=$[decode_attr("X", "BCyellow")]%;\
		/elseif ({w_zn}=~"drzwi") /set czy_kierunek_jest_inne=$[decode_attr("X", "BCyellow")]%;\
		/elseif ({w_zn}=~"schody") /set czy_kierunek_jest_inne=$[decode_attr("X", "BCyellow")]%;\
		/elseif ({w_zn}=~"targ") /set czy_kierunek_jest_inne=$[decode_attr("X", "BCyellow")]%;\
		/elseif ({w_zn}=~"wieza") /set czy_kierunek_jest_inne=$[decode_attr("X", "BCyellow")]%;\
		/elseif ({w_zn}=~"bank") /set czy_kierunek_jest_inne=$[decode_attr("X", "BCyellow")]%;\
		/elseif ({w_zn}=~"poczta") /set czy_kierunek_jest_inne=$[decode_attr("X", "BCyellow")]%;\
		/elseif ({w_zn}=~"karczma") /set czy_kierunek_jest_inne=$[decode_attr("X", "BCyellow")]%;\
		/elseif ({w_zn}=~"sklep") /set czy_kierunek_jest_inne=$[decode_attr("X", "BCyellow")]%;\
		/elseif ({w_zn}=~"ulica") /set czy_kierunek_jest_inne=$[decode_attr("X", "BCyellow")]%;\
		/elseif ({w_zn}=~"bazar") /set czy_kierunek_jest_inne=$[decode_attr("X", "BCyellow")]%;\
		/elseif ({w_zn}=~"stragan") /set czy_kierunek_jest_inne=$[decode_attr("X", "BCyellow")]%;\
		/elseif ({w_zn}=~"kuznia") /set czy_kierunek_jest_inne=$[decode_attr("X", "BCyellow")]%;\
		/elseif ({w_zn}=~"zaklad") /set czy_kierunek_jest_inne=$[decode_attr("X", "BCyellow")]%;\
		/elseif ({w_zn}=~"piekarnia") /set czy_kierunek_jest_inne=$[decode_attr("X", "BCyellow")]%;\
		/elseif ({w_zn}=~"sala") /set czy_kierunek_jest_inne=$[decode_attr("X", "BCyellow")]%;\
		/elseif ({w_zn}=~"stajnia") /set czy_kierunek_jest_inne=$[decode_attr("X", "BCyellow")]%;\
		/elseif ({w_zn}=~"krzaki") /set czy_kierunek_jest_inne=$[decode_attr("X", "BCyellow")]%;\
		/elseif ({w_zn}=~"drzwiczki") /set czy_kierunek_jest_inne=$[decode_attr("X", "BCyellow")]%;\
		/elseif ({w_zn}=~"schodki") /set czy_kierunek_jest_inne=$[decode_attr("X", "BCyellow")]%;\
		/elseif ({w_zn}=~"sciezka") /set czy_kierunek_jest_inne=$[decode_attr("X", "BCyellow")]%;\
		/elseif ({w_zn}=~"tawerna") /set czy_kierunek_jest_inne=$[decode_attr("X", "BCyellow")]%;\
		/elseif ({w_zn}=~"miasto") /set czy_kierunek_jest_inne=$[decode_attr("X", "BCyellow")]%;\
		/elseif ({w_zn}=~"palac") /set czy_kierunek_jest_inne=$[decode_attr("X", "BCyellow")]%;\
		/elseif ({w_zn}=~"trakt") /set czy_kierunek_jest_inne=$[decode_attr("X", "BCyellow")]%;\
		/elseif ({w_zn}=~"baszta") /set czy_kierunek_jest_inne=$[decode_attr("X", "BCyellow")]%;\
		/elseif ({w_zn}=~"gmach") /set czy_kierunek_jest_inne=$[decode_attr("X", "BCyellow")]%;\
		/elseif ({w_zn}=~"kuchnia") /set czy_kierunek_jest_inne=$[decode_attr("X", "BCyellow")]%;\
		/elseif ({w_zn}=~"wrota") /set czy_kierunek_jest_inne=$[decode_attr("X", "BCyellow")]%;\
		/elseif ({w_zn}=~"swiatynia") /set czy_kierunek_jest_inne=$[decode_attr("X", "BCyellow")]%;\
		/elseif ({w_zn}=~"szpital") /set czy_kierunek_jest_inne=$[decode_attr("X", "BCyellow")]%;\
		/elseif ({w_zn}=~"korytarz") /set czy_kierunek_jest_inne=$[decode_attr("X", "BCyellow")]%;\
		/elseif ({w_zn}=~"zaplecze") /set czy_kierunek_jest_inne=$[decode_attr("X", "BCyellow")]%;\
		/elseif ({w_zn}=~"podworko") /set czy_kierunek_jest_inne=$[decode_attr("X", "BCyellow")]%;\
		/elseif ({w_zn}=~"restauracja") /set czy_kierunek_jest_inne=$[decode_attr("X", "BCyellow")]%;\
		/elseif ({w_zn}=~"komnata") /set czy_kierunek_jest_inne=$[decode_attr("X", "BCyellow")]%;\
		/elseif ({w_zn}=~"faktoria") /set czy_kierunek_jest_inne=$[decode_attr("X", "BCyellow")]%;\
		/elseif ({w_zn}=~"kantorek") /set czy_kierunek_jest_inne=$[decode_attr("X", "BCyellow")]%;\
		/else \
			/let w_zn_t=?%; \
		/endif%; \
		/let wyjscia_z_lokacji_t=%{wyjscia_z_lokacji_t} %{w_zn_t} %; \
		/let w_z_l=$(/_all_but_first %{w_z_l})%; \
		/set idzna_ile_wyjsc=$[{idzna_ile_wyjsc} + 1]%; \
	/done%; \
	/set wyjscia_z_lokacji=%{wyjscia_z_lokacji_t}

/def -mregexp -Fp2 -t'(Zaslaniasz|Nie udaje ci sie zaslonic|Probujesz zaslonic) .* przed ciosami wrogow.' zaslo1 = \
	/_odliczaj_zaslone_5

/def -mregexp -Fp2 -t'(Zaslaniasz|Nie udaje ci sie zaslonic|Probujesz zaslonic) .* przed ciosami (.* .*|[A-Z]*).' zaslo2 = \
	/_odliczaj_zaslone_8

/def -mregexp -Fp2 -t'wypowiadasz rozkaz' = \
	/_odliczaj_rozkaz

/def -mregexp -Fp2 -t'(probujesz|obijasz|siniaczysz) .* (noga|stopa|lokciem|piescia|kolanem)' _bez_broni = \
	/set alarm=$[decode_attr("WALKA BEZ BRONI","BCyellow")]

/def -mregexp -Fp2 -t'(Wystarczy moment nieuwagi, chwila rozproszenia bys nie|Niespodziewanie z gruntu pod twoimi stopami wytryskuje strumien roslinnych pedow oraz korzeni!)' _stun = \
	/set warningstat=$[strcat("[", decode_attr(" --* OGLUSZENIE *-- ", "BCbgblue"), "] ")]

/def -mregexp -p2 -t'(Czujesz, ze paraliz minal|Konczysz paralyze)' _nostun = \
	/set warningstat=$[strcat("[", decode_attr("                    ", "Cgreen"), "] ")]

/def -mregexp -Fp2 -t'skupia na chwile swoj wzrok na tobie' _zniewolenie = \
	/set alarm=$[decode_attr("ODLOZONY SPRZET","BCyellow")]

/def -mregexp -Fp2 -t'wytraca ci ' _wytracenie = \
	/set warningstat=$[strcat("[", decode_attr(" --* WYTRACENIE *-- ", "BCbgred"), "] ")]

/def -mregexp -p2 -t'Czujesz, jak krew w twoch dloniach krazy coraz predzej i odretwienie ustepuje.' _nowytracenie = \
	/set warningstat=$[strcat("[", decode_attr(" DOBADZ BRONI -- F2 ", "BCbgblue"), "] ")] %;\
	/def key_f2 = dobadz broni %%; /set warningstat=$[strcat("[", decode_attr("                    ", "Cgreen"), "] ")] %%; /set alarm=$[decode_attr("none", "BCgreen")]

/def _odliczaj_zaslone_5 = \
	/set nxt_zaslona=$[strcat(decode_attr("5", "BCred"))]%;\
	/repeat -00:00:01 1 /set nxt_zaslona=$$[strcat(decode_attr("4", "BCred"))]%;\
	/repeat -00:00:02 1 /set nxt_zaslona=$$[strcat(decode_attr("3", "BCred"))]%;\
	/repeat -00:00:03 1 /set nxt_zaslona=$$[strcat(decode_attr("2", "BCyellow"))]%;\
	/repeat -00:00:04 1 /set nxt_zaslona=$$[strcat(decode_attr("1", "BCyellow"))]%;\
	/repeat -00:00:05 1 /set nxt_zaslona=$$[strcat(decode_attr("rdy", "BCgreen"))]

/def _odliczaj_zaslone_8 = \
	/set nxt_zaslona=$[strcat(decode_attr("8", "BCred"))]%;\
	/repeat -00:00:01 1 /set nxt_zaslona=$$[strcat(decode_attr("7", "BCred"))]%;\
	/repeat -00:00:02 1 /set nxt_zaslona=$$[strcat(decode_attr("6", "BCred"))]%;\
	/repeat -00:00:03 1 /set nxt_zaslona=$$[strcat(decode_attr("5", "BCred"))]%;\
	/repeat -00:00:04 1 /set nxt_zaslona=$$[strcat(decode_attr("4", "BCred"))]%;\
	/repeat -00:00:05 1 /set nxt_zaslona=$$[strcat(decode_attr("3", "BCyellow"))]%;\
	/repeat -00:00:06 1 /set nxt_zaslona=$$[strcat(decode_attr("2", "BCyellow"))]%;\
	/repeat -00:00:07 1 /set nxt_zaslona=$$[strcat(decode_attr("1", "BCyellow"))]%;\
	/repeat -00:00:08 1 /set nxt_zaslona=$$[strcat(decode_attr("rdy", "BCgreen"))]

/def _odliczaj_rozkaz = \
	/set nxt_order=$[strcat(decode_attr("10", "BCred"))]%;\
	/repeat -00:00:01 1 /set nxt_order=$$[strcat(decode_attr("9", "BCred"))]%;\
	/repeat -00:00:02 1 /set nxt_order=$$[strcat(decode_attr("8", "BCred"))]%;\
	/repeat -00:00:03 1 /set nxt_order=$$[strcat(decode_attr("7", "BCred"))]%;\
	/repeat -00:00:04 1 /set nxt_order=$$[strcat(decode_attr("6", "BCred"))]%;\
	/repeat -00:00:05 1 /set nxt_order=$$[strcat(decode_attr("5", "BCred"))]%;\
	/repeat -00:00:06 1 /set nxt_order=$$[strcat(decode_attr("4", "BCred"))]%;\
	/repeat -00:00:07 1 /set nxt_order=$$[strcat(decode_attr("3", "BCred"))]%;\
	/repeat -00:00:08 1 /set nxt_order=$$[strcat(decode_attr("2", "BCred"))]%;\
	/repeat -00:00:09 1 /set nxt_order=$$[strcat(decode_attr("1", "BCred"))]%;\
	/repeat -00:00:10 1 /set nxt_order=$$[strcat(decode_attr("rdy", "BCgreen"))]

/eval /status_add -c -r0 statusline::

/eval /status_add -c -r1 "[  " czy_kierunek_jest_nw:1 czy_kierunek_jest_n:1 czy_kierunek_jest_ne:2 czy_kierunek_jest_u:1 " ] "::
/eval /status_add -r1 "K: ":: kondycja:24
/eval /status_add -r1 "Z: ":: zmeczenie:22
/eval /status_add -r1 "Hide: ":: hide:3:BC%kolor_main
/eval /status_add -r1 " Sneak: ":: sneak:4:BC%kolor_main
/eval /status_add -r1 "Mail: ":: poczta_show:5:BC%kolor_main
/eval /status_add -r1 spacebreak::
/eval /status_add -r1 "Time: ":: @clock:5:C%kolor_main

/eval /status_add -c -r2 "[  ":: czy_kierunek_jest_w:1  "#":1:BC%kolor_alarm czy_kierunek_jest_e:2 czy_kierunek_jest_d:1 " ] "::
/eval /status_add -r2 "R: [ ":: rozkaz_ataku:46:BC%kolor_alarm
/eval /status_add -r2 "] Zasl: ":: nxt_zaslona:4
/eval /status_add -r2 "Order: ":: nxt_order:4
/eval /status_add -r2 "Warn: ":: alarm:20

/eval /status_add -c -r3 "[  ":: czy_kierunek_jest_sw:1 czy_kierunek_jest_s:1 czy_kierunek_jest_se:2 czy_kierunek_jest_inne:1 " ] "::
/eval /status_add -r3 " ":53
/eval /status_add -r3 "Bind: ":: bindings:35:BC%kolor_info
/eval /status_add -r3 spacebreak::
/eval /status_add -r3 ownkills:3:BC%kolor_main
/eval /status_add -r3 "/ ":: allkills:3:BC%kolor_main
