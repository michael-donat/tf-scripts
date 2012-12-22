; ------------------------------------
; Ustawienia do edycji według potrzeb:
; (mogą być nadpisane w pliku postaci)
; ------------------------------------

; typ klawiatury (standard/mac):
/set ktype=standard

; domyślny czas zmiany lokacji przez autołazika:
/set delay=0

; prefix przed wpisywanymi komendami (przy włączonym ich pokazywaniu - /set kecho on):
/set kprefix=>

; kolor komend wpisywanych przez gracza (edytować nazwę koloru _po_ znaku 'C'):
/set kecho_attr=Cgreen

; kolory:

; kolor główny:
/set kolor_main green

; kolor różnych warningów:
/set kolor_alarm yellow

; kolor sytuacji krytycznych:
/set kolor_crit red

; kolor ataków:
/set kolor_atak red

; kolor informacji wyświetlanych przez skrypty:
/set kolor_info magenta

; kolor walki
/set kolor_fight red

; kolor ciosów własnych
/set kolor_fight_me rgb530

; kolor speców:
/set kolor_spec magenta

; kolor znaków gildiowych:
/set kolor_guild white

; kolor podświetleń chwilowych (/glow):
/set kolor_glow magenta

; kolor mówienia:
/set kolor_speak cyan

; defaultowy tryb ataku:
/set attackmode=1

; ------------------------------------------------------------------------------------------
; Poniższych opcji radzę nie edytować. Może to prowadzić do problemów z działaniem skryptów.
; ------------------------------------------------------------------------------------------
/set ingame=0

/set hiliteattr=BCmagenta
/set wrapspace=2
/set isize=1
/set warn_status=off
/set status_pad=
/set status_height=4

/set pack=off
/set sneak=off
/set hide=off
/set auto=off
/set unnormal=none

/set zar_godzina=?
/set am_czy_pm=?
/set ownkills=0
/set allkills=0
/set poczta_show=none
/set dobadzcmd=dobadz
/eval /set tank=$[decode_attr("nie", "BCgreen")]
/eval /set alarm=$[decode_attr("none", "BCgreen")]
/eval /set nxt_zaslona=$[decode_attr("rdy", "BCgreen")]
/eval /set nxt_order=$[decode_attr("rdy", "BCgreen")]
/eval /set kondycja=$[strcat("[", decode_attr("                     ", "Cbggreen"), "] ")]
/eval /set zmeczenie=$[strcat("[", decode_attr("                    ", "Cbggreen"), "] ")]
/eval /set blokowanko=$[strcat("[", decode_attr("                     ", "Cgreen"), "] ")]
/eval /set warningstat=$[strcat("[", decode_attr("                    ", "Cgreen"), "] ")]

/eval /set status_pad=$[" "]
/eval /set status_line=$[strrep(decode_attr("-", "BCwhite"), columns())]

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

/def -Fp2 -mregexp -t'nie mozesz dalej podazac' zmecz10 = /set zmeczenie=$[decode_attr("[C A L K O W I C I E ]", "BCbgred")]
/def -Fp2 -mregexp -t'Czujesz sie smiertelnie zmeczony' zmecz11 = /set zmeczenie=$[decode_attr("[C A L K O W I C I E ]", "BCbgred")]

/def -Fp2 -mregexp -t'((Jest|Sa) tutaj ([^ ]*) (widoczne|widocznych) (wyjsc|wyjscia|wyjscie): |Trakt wiedzie na |W mroku nocy dostrzegasz .* widoczn(e|ych) wyjsc(|ia|ie): |Trakt rozgalezia sie na |W gestych ciemnosciach dostrzegasz trakt wiodacy na |W gestych ciemnosciach dostrzegasz, ze trakt rozgalezia sie na |Sciezka prowadzi tutaj w .* (kierunkach|kierunku): |Szlak.* tutaj w .* kierunk.*: |Wyjsc.* prowadz.* tutaj w .* (kierunkach|kierunku): |Tunel.* ciagn.* na |Wedrowke przez rozlegle laki mozesz kontynuowac udajac sie na )' widoczne_wyjscia = /_wyjscia_z_lokacji %{PR}

/def _first = /result {1}
/def _all_but_first = /result {-1}
/def _wyjscia_z_lokacji = \
	/quote -S /unset `/listvar -s czy_kierunek_jest* %;\
	/let w_z_l_input=%{*}%;\
	/let w_z_l=$[replace(". Mozna jednak z niego zejsc i udac sie na ", " ", {w_z_l_input})] %;\
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
		/elseif ({w_zn}=~"wyjscie") /set czy_kierunek_jest_inne=X%;\
		/elseif ({w_zn}=~"drzwi") /set czy_kierunek_jest_inne=X%;\
		/elseif ({w_zn}=~"drzwiczki") /set czy_kierunek_jest_inne=X%;\
		/elseif ({w_zn}=~"most") /set czy_kierunek_jest_inne=X%;\
		/elseif ({w_zn}=~"schody") /set czy_kierunek_jest_inne=X%;\
		/elseif ({w_zn}=~"furta") /set czy_kierunek_jest_inne=X%;\
		/elseif ({w_zn}=~"ulica") /set czy_kierunek_jest_inne=X%;\
		/elseif ({w_zn}=~"sklep") /set czy_kierunek_jest_inne=X%;\
		/elseif ({w_zn}=~"prom") /set czy_kierunek_jest_inne=X%;\
		/elseif ({w_zn}=~"kaplica") /set czy_kierunek_jest_inne=X%;\
		/elseif ({w_zn}=~"karczma") /set czy_kierunek_jest_inne=X%;\
		/elseif ({w_zn}=~"schodki") /set czy_kierunek_jest_inne=X%;\
		/elseif ({w_zn}=~"mlyn") /set czy_kierunek_jest_inne=X%;\
		/elseif ({w_zn}=~"piekarnia") /set czy_kierunek_jest_inne=X%;\
		/elseif ({w_zn}=~"trakt") /set czy_kierunek_jest_inne=X%;\
		/elseif ({w_zn}=~"jaskinia") /set czy_kierunek_jest_inne=X%;\
		/elseif ({w_zn}=~"szopa") /set czy_kierunek_jest_inne=X%;\
		/elseif ({w_zn}=~"barak") /set czy_kierunek_jest_inne=X%;\
		/elseif ({w_zn}=~"wrota") /set czy_kierunek_jest_inne=X%;\
		/elseif ({w_zn}=~"brama") /set czy_kierunek_jest_inne=X%;\
		/elseif ({w_zn}=~"wejscie") /set czy_kierunek_jest_inne=X%;\
		/elseif ({w_zn}=~"ganek") /set czy_kierunek_jest_inne=X%;\
		/elseif ({w_zn}=~"chata") /set czy_kierunek_jest_inne=X%;\
		/else \
			/let w_zn_t=?%; \
		/endif%; \
		/let wyjscia_z_lokacji_t=%{wyjscia_z_lokacji_t} %{w_zn_t} %; \
		/let w_z_l=$(/_all_but_first %{w_z_l})%; \
		/set idzna_ile_wyjsc=$[{idzna_ile_wyjsc} + 1]%; \
	/done%; \
	/set wyjscia_z_lokacji=%{wyjscia_z_lokacji_t}

/def -mregexp -Fp2 -t'(Zrecznie zaslaniasz|Nie udaje ci sie zaslonic|Probujesz zaslonic|Na rozkaz .* (zaslaniasz|probujesz zaslonic)|Rzucasz sie na|Bezskutecznie rzucasz sie na)' = \
	/_odliczaj_zaslone

/def -mregexp -Fp2 -t'(Wydajesz rozkaz|Niestety, nikt nie|Glosno wypowiadasz rozkaz)' = \
	/_odliczaj_rozkaz

/def -mregexp -Fp2 -t'przymierza sie do odciecia ci drogi ucieczki' = \
	/_odliczaj_blok

/def -mregexp -Fp2 -t'Przymierzasz sie do odciecia' = \
	/_odliczaj_blok_self

/def -mregexp -Fp2 -t'zajmuje pozycje umozliwiajaca odciecie ci drogi ucieczki.' _blok = /set blokowanko=$[strcat("[", decode_attr("Z A B L O K O W A N O", "BCbgred"), "] ")]
/def -mregexp -Fp2 -t'Zajmujesz pozycje umozliwiajaca odciecie' _blok_self = /set blokowanko=$[strcat("[", decode_attr("! B L O K U J E S Z !", "BCgreen"), "] ")]
/def -mregexp -Fp2 -t'(Udaje ci sie ominac | omija twoj nieskuteczny )' _blok_off0 = /set blokowanko=$[strcat("[", decode_attr("                     ", "Cgreen"), "] ")]
/def -mregexp -Fp2 -t'Uciekl.s .+' _blok_off1 = /set blokowanko=$[strcat("[", decode_attr("                     ", "Cgreen"), "] ")]
/def -mregexp -Fp2 -t'przestaje.* odcinac .*ucieczki' _blok_off2 = /set blokowanko=$[strcat("[", decode_attr("                     ", "Cgreen"), "] ")]

/def -mregexp -Fp2 -t'(probujesz|muskasz|ranisz|masakrujesz) .* (noga|stopa|lokciem|piescia|kolanem)' _bez_broni = \
	/set alarm=$[decode_attr("WALKA BEZ BRONI","BCyellow")]

/def -mregexp -Fp2 -t'(Powoli osuwasz sie na ziemie|Potem robi sie ciemno|Sila uderzania zamroczyla cie|czujesz, ze tracisz przytomnosc|Nagle czujesz jak na glowe spada ci ciezki sznur|Nagle czujesz, ze tracisz kontrole nad swym cialem| wali cie na odlew)' _stun = \
	/set warningstat=$[strcat("[", decode_attr(" --* OGLUSZENIE *-- ", "BCbgblue"), "] ")]

/def -mregexp -p2 -t'(Powoli dochodzisz do siebie|Czujesz jak slabosc po zadanym ciosie w glowe mija|Udaje ci sie uwolnic z sieci|Powoli odzyskujesz swobode ruchow)' _nostun = \
	/set warningstat=$[strcat("[", decode_attr("                    ", "Cgreen"), "] ")]

/def -mregexp -Fp2 -t'.* wytraca ci (.*) z (rak|reki)' _wytracenie = \
	/set warningstat=$[strcat("[", decode_attr(" --* WYTRACENIE *-- ", "BCbgred"), "] ")]

/def -mregexp -Fp2 -t'Uderzenie jest tak silne, ze bezwiednie puszczasz' _wytracenie_parowanie = \
	/set warningstat=$[strcat("[", decode_attr(" --* WYTRACENIE *-- ", "BCbgred"), "] ")]

/def -mregexp -Fp2 -t'zakleszczajac lewakiem twoj .* Czujesz potezne szarpniecie' _wytracenie_lewak = \
	/set warningstat=$[strcat("[", decode_attr(" --* WYTRACENIE *-- ", "BCbgred"), "] ")]

/def -mregexp -p2 -t'lecac lagodnym lukiem, laduje na ziemi obok ciebie' _wytracenie_ozywek = \
	/set warningstat=$[strcat("[", decode_attr(" DOBADZ BRONI -- F2 ", "BCbgblue"), "] ")] %;\
	/def key_f2 = dobadz broni %%; /set warningstat=$[strcat("[", decode_attr("                    ", "Cgreen"), "] ")] %%; /set alarm=$[decode_attr("none", "BCgreen")]

/def -mregexp -p2 -t'Bol .* staje sie mniej odczuwalny.' _wytracenie_off = \
	/set warningstat=$[strcat("[", decode_attr(" DOBADZ BRONI -- F2 ", "BCbgblue"), "] ")] %;\
	/def key_f2 = dobadz broni %%; /set warningstat=$[strcat("[", decode_attr("                    ", "Cgreen"), "] ")] %%; /set alarm=$[decode_attr("none", "BCgreen")]

/def -mregexp -p2 -t'Na rozkaz .* rzucasz sie.*' _no_atak = \
	/set rozkaz_ataku=

/def _odliczaj_zaslone = \
	/set nxt_zaslona=$[strcat(decode_attr("4", "BCred"))]%;\
	/repeat -00:00:01.25 1 /set nxt_zaslona=$$[strcat(decode_attr("3", "BCred"))]%;\
	/repeat -00:00:02.35 1 /set nxt_zaslona=$$[strcat(decode_attr("2", "BCyellow"))]%;\
	/repeat -00:00:03.45 1 /set nxt_zaslona=$$[strcat(decode_attr("1", "BCyellow"))]%;\
	/repeat -00:00:04.58 1 /set nxt_zaslona=$$[strcat(decode_attr("rdy", "BCgreen"))]

/def _odliczaj_rozkaz = \
	/set nxt_order=$[strcat(decode_attr("4", "BCred"))]%;\
	/repeat -00:00:01 1 /set nxt_order=$$[strcat(decode_attr("3", "BCred"))]%;\
	/repeat -00:00:02.40 1 /set nxt_order=$$[strcat(decode_attr("2", "BCyellow"))]%;\
	/repeat -00:00:03.50 1 /set nxt_order=$$[strcat(decode_attr("1", "BCred"))]%;\
	/repeat -00:00:04.60 1 /set nxt_order=$$[strcat(decode_attr("rdy", "BCgreen"))]

/def _odliczaj_blok = \
	/set blokowanko=$[strcat("[", decode_attr("                     ", "Cbgred"), "] ")]%;\
	/repeat -00:00:01 1 /set blokowanko=$$[strcat("[", decode_attr("                ", "Cbgred"), "     ] ")]%;\
	/repeat -00:00:02.40 1 /set blokowanko=$$[strcat("[", decode_attr("           ", "Cbgred"), "          ] ")]%;\
	/repeat -00:00:03.50 1 /set blokowanko=$$[strcat("[", decode_attr("      ", "Cbgred"), "               ] ")]%;\
	/repeat -00:00:04.60 1 /set blokowanko=$$[strcat("[", decode_attr(" ", "Cbgred"), "                    ] ")]

/def _odliczaj_blok_self = \
	/repeat -00:00:01 1 /set blokowanko=$$[strcat("[", decode_attr("      ", "Cbggreen"), "               ] ")]%;\
	/repeat -00:00:02.40 1 /set blokowanko=$$[strcat("[", decode_attr("          ", "Cbggreen"), "           ] ")]%;\
	/repeat -00:00:03.50 1 /set blokowanko=$$[strcat("[", decode_attr("               ", "Cbggreen"), "      ] ")]%;\
	/repeat -00:00:04.60 1 /set blokowanko=$$[strcat("[", decode_attr("                    ", "Cbggreen"), " ] ")]

/eval /status_add -c -r0 statusline::

/eval /status_add -c -r1 "[  " czy_kierunek_jest_nw:1 czy_kierunek_jest_n:1 czy_kierunek_jest_ne:2 czy_kierunek_jest_u:1 " ] "::
/eval /status_add -r1 "K: ":: kondycja:24
/eval /status_add -r1 "Z: ":: zmeczenie:23
/eval /status_add -r1 "Hide: ":: hide:3:BC%kolor_main
/eval /status_add -r1 " Sneak: ":: sneak:4:BC%kolor_main
/eval /status_add -r1 "Mail: ":: poczta_show:5:BC%kolor_main

/eval /status_add -c -r2 "[  ":: czy_kierunek_jest_w:1  "#":1:BC%kolor_alarm czy_kierunek_jest_e:2 czy_kierunek_jest_d:1 " ] "::
/eval /status_add -r2 "B: ":: blokowanko:24
/eval /status_add -r2 "W: ":: warningstat:23
/eval /status_add -r2 "Zasl: ":: nxt_zaslona:4
/eval /status_add -r2 "Order: ":: nxt_order:4
/eval /status_add -r2 "Warn: ":: alarm:20

/eval /status_add -c -r3 "[  ":: czy_kierunek_jest_sw:1 czy_kierunek_jest_s:1 czy_kierunek_jest_se:2 czy_kierunek_jest_inne:1 " ] "::
/eval /status_add -r3 "R: [ ":: rozkaz_ataku:46:BC%kolor_alarm
/eval /status_add -r3 "]  Bind: ":: bindings:35:BC%kolor_info
/eval /status_add -r3 spacebreak::
/eval /status_add -r3 ownkills:3:BC%kolor_main
/eval /status_add -r3 "/ ":: allkills:3:BC%kolor_main
