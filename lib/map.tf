/addworld mapper localhost 23923
/set _map_on=0

/def mapa = \
  /if ({*}=~'on') \
    /if (is_connected("mapper")==0) \
      /_map_connect%; \
      /if (is_connected("mapper")==0) \
	/set _map_on=0%; \
      	/echo -p @{BCred}Brak polaczenia z mapa. :(%; \
      /else \
	/set _map_on=1%; \
	/echo -p @{BCgreen}Mapa wlaczona! :)%; \
      /endif%; \
    /else \
      /if ({_map_on}==1) \
	/echo -p @{BCblue}Mapa juz jest wlaczona.%; \
      /else \
	/set _map_on=1%; \
	/echo -p @{BCgreen}Mapa wlaczona! :)%; \
      /endif%; \
    /endif%; \
  /else \
    /set _map_on=0%; \
    /echo -p @{BCred}Mapa wylaczona. :(%; \
  /endif

/def _map_connect = \
  /if (is_connected("mapper")==0) \
    /echo -p @{BCblue}Probuje polaczyc sie z mapa..%; \
    /connect -b mapper%; \
  /endif
  
/def -mregexp -h'CONNECT mapper' _map_hooks_connect = \
  /echo -p @{BCgreen}Polaczono z mapa! :)
  
/def -mregexp -h'DISCONNECT mapper' _map_hooks_disconnect = \
  /mapa off%; \
  /echo -p @{BCred}Rozlaczano z mapa. :(

/def _map_send = \
  /if ({_map_on}==1) \
    /send -wmapper %{*}%; \
  /endif
  
/def _map_bloker = \
  /_map_send revert

/def _map_teleport = \
  /_map_send lookup:%{*}

/def _map_teleport_temp =
  
/def _map_go = \
  /_map_send navigate:%{*}%; \

/def -aL -mregexp -t'exit:([A-Z]+):(.*)' _map_exit_rebind = \
  /echo _-------- PODPIETO ---> /%{P1} = %{P2}%;\
  /def %{P1} = /send %{P2}
 
/def -aL -mregexp -t'exit:custom:(.*)' _map_exit_rebind_custom = \
  /echo _-------- PODPIETO ---> /x = %{P1}%;\
  /def x = /send %{P1}
  
/def -aL -mregexp -t'exit:reset' _map_exit_reset_nolog

;------------------------------------------------------------------------
;			   ... PORUSZANIE SIE ... 			  |
;------------------------------------------------------------------------  
  
/def -q -mregexp -h'SEND ^(?:|przemknij (?:sie |)(?:z druzyna |))(polnoc|n|poludnie|s|wschod|e|zachod|w|polnocny-wschod|ne|polnocny-zachod|nw|poludniowy-wschod|se|poludniowy-zachod|sw|gora|dol|u|d)$' _map_hooks_ide = \
  /_map_go exit:%{P1}

/def -q -mregexp -h'SEND ^(alkierz|dom|barak|barka|brama|brod|chata|chatka|drabina|drzwi|furtka|ganek|golebnik|jaskinia|jaskinie|kaplica|karczma|klapa|korytarz|kucnia|kurhan|kurnik|mlyn|most|namiot|ogrod|palac|pieczara|pomost|schody|sklep|spizarnia|stajnia|stodola|straznica|stryszek|szczelina|taras|ulica|wejscie|wieza|wyjscie|zagroda|zajazd|zanurkuj)$' _map_hooks_customy = \
  /_map_go custom:%{P1}

/def -q -mregexp -h'SEND ^((przecisnij|przejdz|przeplyn|rozsun|wejdz|wespnij|wslizgnij|wyjdz|wynurz|zejdz|zsun)( .*|))$' _map_hooks_customy_2 = \
  /_map_go custom:%{P1}
  
;------------------------------------------------------------------------
;		   ... NIECH SIE KULKA KRECI! ... 			  |
;------------------------------------------------------------------------

/set _map_standard_exits=n|s|e|w|polnoc|poludnie|wschod|zachod|ne|se|nw|sw|polnocny-wschod|poludniowy-wschod|polnocny-zachod|poludniowy-zachod|u|d|gora|dol
/set _map_follows_list=do wyjscia|na wyjscie|do karczmy|za palisade|do namiotu|przez furtke w palisadzie do wioski|przez klape na dol|po drabinie na gore|brodzac w wodzie na druga strone rzeki|na most|w glab ciemnosci|schodami na dol|schodami do gory|do wnetrza straznicy|na zewnatrz straznicy|przez most na drugi brzeg rzeki|brodem przez strumien|w gore traktem|w dol traktem|traktem w gore|traktem w dol|droga w dol

/eval /def -mregexp -p500 -t'(Wraz z (.*) podazasz|Podazasz) za (.*) (%{_map_follows_list})\.' _map_podazam_za_kims_rozne = /_map_go follow:%%{P4}
/def -mregexp -p500 -t'(Wraz z (.*) podazasz|Podazasz) za (.*) na gore\.' _map_podazam_za_kims_gora = /_map_go exit:gora
/def -mregexp -p500 -t'(Wraz z (.*) podazasz|Podazasz) za (.*) na (dol|polnoc|poludnie|wschod|zachod|polnocny-wschod|polnocny-zachod|poludniowy-wschod|poludniowy-zachod)\.' _map_podazam_za_kims_standard = /_map_go exit:%{P4}

;------------------------------------------------------------------------
;			   ... KOMENDA IDZ ... 				  |
;------------------------------------------------------------------------  

/def _map_idz_catch = \
  /purge _map_idz_move_trigger*%; \
  /eval /def -n1 -mregexp -p500 -t'Ruszasz (niespiesznie|marszem|truchtem|biegiem|szybkim biegiem) (%{_map_follows_list})\.' _map_idz_move_trigger_rozne = /_map_go follow:%%%{P2}%%%;  /purge _map_idz_move_trigger*%; \
  /def -n1 -mregexp -p500 -t'Ruszasz (niespiesznie|marszem|truchtem|biegiem|szybkim biegiem) na gore\.' _map_idz_move_trigger_gora = /_map_go exit:gora%%;  /purge _map_idz_move_trigger*%; \
  /def -n1 -mregexp -p500 -t'Ruszasz (niespiesznie|marszem|truchtem|biegiem|szybkim biegiem) na (dol|polnoc|poludnie|wschod|zachod|polnocny-wschod|polnocny-zachod|poludniowy-wschod|poludniowy-zachod)\.' _map_idz_move_trigger_standard = /_map_go exit:%%{P2}%%;  /purge _map_idz_move_trigger*%; \

/def -mregexp -t'Wykonuje komende \'idz' _map_idz_trigger = \
  /_map_idz_catch  
  
/def -q -mregexp -h'SEND ^idz$' = \
  /_map_idz_catch

/def -mregexp -t'Nie wiesz, w ktorym kierunku masz ruszyc...' _map_idz_wiele_kierunkow = \
  /purge _map_idz_move_trigger*
  
;------------------------------------------------------------------------
;			   ... TELEPORTY ... 				  |
;------------------------------------------------------------------------  
/set _map_room_gildia=ccdea3ee-88c3-11e2-8d6c-9c4e368dac0c
/set _map_room_fandall_karczma=cfd5d49c-88c2-11e2-8d6c-9c4e368dac0c
/set _map_room_blaviken_karczma=5121fd7e-89df-11e2-9919-9c4e368dac0c

/def -mregexp -t'Sypialnia w gildii Krasnoludow Mahakamu.' _map_teleport_gildia = /_map_teleport %{_map_room_gildia}
/def -mregexp -t'Gospoda "Pod kilofem i oskardem".' _map_teleport_fandall_karczma = /_map_teleport %{_map_room_fandall_karczma}
/def -mregexp -t'Karczma \'Pod Tunczykiem\'.' _map_teleport_blaviken_karczma = /_map_teleport %{_map_room_blaviken_karczma}
/def -mregexp -t'Gospoda \'Zacisze\'.' _map_teleport_maribor = /_map_teleport_temp %{_map_room_maribor}
/def -mregexp -t'Karczma \'Pohulanka\'.' _map_teleport_podmoklalaka = /_map_teleport_temp %{_map_room_podmoklalaka}
/def -mregexp -t'Karczma \'Dom Rybaka\'.' _map_teleport_obawa = /_map_teleport_temp %{_map_room_obawa}
/def -mregexp -t'Karczma \'U Hermana\'.' _map_teleport_bodrog = /_map_teleport_temp %{_map_room_bodrog}
/def -mregexp -t'Karczma \'Pod Lisem\'.' _map_teleport_wyzima = /_map_teleport_temp %{_map_room_wyzima_1}
/def -mregexp -t'Karczma \'Stary Narakort\'.' _map_teleport_wyzima_2 = /_map_teleport_temp %{_map_room_wyzima_2}
/def -mregexp -t'Karczma \'Pod dzikiem\'.' _map_teleport_bobolacy = /_map_teleport_temp %{_map_room_bobolacy}
/def -mregexp -t'Karczma Pod Biala Lza w Eldar.' _map_teleport_eldar = /_map_teleport_temp %{_map_room_eldar}
/def -mregexp -t'Karczma Mlynskie Kolo.' _map_teleport_bialymost = /_map_teleport_temp %{_map_room_bialymost}
/def -mregexp -t'Karczma \'Pod Grabem\' w Grabowej Buchcie.' _map_teleport_grabowa = /_map_teleport_temp %{_map_room_grabowa}
/def -mregexp -t'Karczma \'Pod ostatnim miedziakiem\'.' _map_teleport_rinde_podgrodzie = /_map_teleport_temp %{_map_room_rinde_podgrodzie}
/def -mregexp -t'Karczma \'Pod Kucykiem\'.' _map_teleport_oxenfurt_podgrodzie = /_map_teleport_temp %{_map_room_oxenfurt_podgrodzie}
/def -mregexp -t'Karczma \'\'Pod wesolym studentem\'\'.' _map_teleport_oxenfurt = /_map_teleport_temp %{_map_room_oxenfurt_1}
/def -mregexp -t'Karczma Trzy Dzwoneczki.' _map_teleport_oxenfurt_2 = /_map_teleport_temp %{_map_room_oxenfurt_2}
/def -mregexp -t'Portowa tawerna o milej nazwie Zeza.' _map_teleport_oxenfurt_3 = /_map_teleport_temp %{_map_room_oxenfurt_3}
/def -mregexp -t'Winiarnia Biala Dama.' _map_teleport_oxenfurt_4 = /_map_teleport_temp %{_map_room_oxenfurt_4}
/def -mregexp -t'Znana w calym miescie herbaciarnia.' _map_teleport_oxenfurt_5 = /_map_teleport_temp %{_map_room_oxenfurt_5}
/def -mregexp -t'Wnetrze karczmy "Dwa Jelenie".' _map_teleport_osada_mysliwska = /_map_teleport_temp %{_map_room_osadamysliwska}
/def -mregexp -t'Karczma \'Pod Zagnica\'.' _map_teleport_piana_1 = /_map_teleport_temp %{_map_room_piana_1}
/def -mregexp -t'\'W Brzuchu Krakena\'.' _map_teleport_piana_2 = /_map_teleport_temp %{_map_room_piana_2}
/def -mregexp -t'Glowna izba \'Karczmy katowskiej\'.' _map_teleport_gelibol_podgrodzie = /_map_teleport_temp %{_map_room_gelibol_podgrodzie}
  
;------------------------------------------------------------------------
;			   ... BLOKERY ... 				  |
;------------------------------------------------------------------------  
/def -mregexp -Fp500 -t'Nie mozesz sie tam udac, gdyz lezysz.' _map_blokery_leze = /_map_bloker
/def -mregexp -Fp500 -t'Nie mozesz sie tam udac, gdyz siedzisz' _map_blokery_siedze = /_map_bloker
/def -mregexp -Fp500 -t'Jestes tak zmeczony, ze nie mozesz dalej podazac w tym kierunku\.' _map_blokery_zmeczylem_sie = /_map_bloker
; Zamkniete przejscia
/def -mregexp -Fp500 -t'Probujesz otworzyc (.*|)(brame|wrota|drzwi|krate|furtke|drzwiczki w bramie), ale nie udaje ci sie to\.' _map_blokery_bramy = /_map_bloker
/def -mregexp -Fp500 -t'Forsowanie zamknietych drzwi nie jest najlepszym pomyslem.' _map_blokery_brama4 = /_map_bloker
/def -mregexp -Fp500 -t'Nie dasz rady otworzyc stalowej kraty, musisz sprobowac ja uniesc.' _map_blokery_oxen_krata = /_map_bloker
/def -mregexp -Fp500 -t'Podchodzisz pod drzwi na poludniu, jednak okazuja sie one zamkniete na klucz.' _map_blokery_bloker_scala_drzwi = /_map_bloker
; Lokacji chyba brak (defy do wywalenia [chyba ze to w nocy np. pozamykane tylko])
/def -mregexp -Fp500 -t'Podchodzisz pod drzwi na polnocy, ktore nagle otwieraja sie z hukiem i wylatuje przez nie pijany mezczyzna omal na ciebie nie wpadajac. Zaraz potem drzwi zatrzaskuje sie.' _map_blokery_bloker_scala_drzwi_2 = /_map_bloker
/def -mregexp -Fp500 -t'Nie mozesz zejsc gdyz klapa jest zamknieta.' _map_blokery_bloker_wiocha_klapa = /_map_bloker
/def -mregexp -Fp500 -t'Szarpiesz energicznie za klamke, lecz drzwi stawiaja opor.' _map_blokery_bloker_wyzima_swiatynia = /_map_bloker
/def -mregexp -Fp500 -t'Pociagasz za klamke, ale drzwi sa zamkniete.' _map_blokery_bloker_wyzima_grod = /_map_bloker
/def -mregexp -Fp500 -t'Niestety drzwi zdaja sie byc zaryglowane od wewnatrz.' _map_blokery_bloker_anchor = /_map_bloker
/def -mregexp -Fp500 -t'Dalsza podroz sciezka jest niemozliwa, gdyz przewrocony pojazd i porastajaca go roslinnosc zupelnie blokuje przejscie.' _map_blokery_bloker_dworek = /_map_bloker
/def -mregexp -Fp500 -t'Geste krzaki i porzucone narzedzia zupelnie blokuja dalsza podroz w tym kierunku. Niestety, musisz zawrocic.' _map_blokery_bloker_dworek_2 = /_map_bloker
/def -mregexp -Fp500 -t'Uuups... droga sie skonczyla... Najlepiej bedzie jak zawrocisz!' _map_blokery_bloker_koniec_drogi = /_map_bloker
/def -mregexp -Fp500 -t'Wydaje ci sie, ze kowal jest bardzo znany z tego, ze nigdy nie ma go w kuzni. W tej wiosce konia nie podkujesz i musisz poszukac gdzie indziej.' _map_blokery_bloker_kowala_niet = /_map_bloker
; Klanowe pomieszczenia
/def -mregexp -Fp500 -t'Wasaty potezny krasnolud mowi hardo do ciebie. Dokad leziesz. Wara stad komu innemu glowe zawracac.' _map_blokery_bloker_zwiadowca = /_map_bloker
/def -mregexp -Fp500 -t'(Zapracowana mloda krasnoludka|Frina) mowi twardo: Gdzie sie pcha\?\!' _map_blokery_bloker_frina = /_map_bloker
/def -mregexp -Fp500 -t'(Njalla|Czerwononosa rudowlosa krasnoludka) wstaje, bierze zamach i rzuca kuflem w twoja strone, po czym siada za lawa, dajac ci do zrozumienia, ze nie lubi sie powtarzac.' _map_blokery_bloker_smoczyca = /_map_bloker
/def -mregexp -Fp500 -t'(Njalla|Czerwononosa rudowlosa krasnoludka) zagradza droge wyciagajac nogi tak, ze blokuja przejscie na zaplecze, po czym zasypia w najlepsze' _map_blokery_bloker_smoczyca2 = /_map_bloker
/def -mregexp -Fp500 -t'(Njalla|Czerwononosa rudowlosa krasnoludka) mowi do ciebie: Gdzie z tym pyskiem sie pchasz, no gdzie?' _map_blokery_bloker_smoczyca3 = /_map_bloker
/def -mregexp -Fp500 -t'(Njalla|Czerwononosa rudowlosa krasnoludka) nie podnoszac glowy mamrocze do ciebie niewyraznie: Nawet o tym nie mysl Bratenku, nawet o tym nie mysl.' _map_blokery_bloker_smoczyca4 = /_map_bloker
/def -mregexp -Fp500 -t'(Njalla|Czerwononosa rudowlosa krasnoludka) mowi do ciebie: Jeno Smoki moga tam wchodzic, winc si nie pchaj, kaj cie nie zapraszaja.' _map_blokery_bloker_smoczyca5 = /_map_bloker   
/def -mregexp -Fp700 -t'mowi hardo do ciebie: A ty gdzie\? Tam maja wstep tylko mahakamscy kowale.' _map_blokery_bloker_kowale = /_map_bloker
/def -mregexp -Fp500 -t'Wejscie tylko dla glow klanow.' _map_blokery_bloker_głowy = /_map_bloker
; Rozne
/def -mregexp -Fp500 -t'Przygladasz sie uwaznie miejscu, na ktorego chcesz sie wspiac i oceniajac trudnosc wspinaczki stwierdzasz ze najpierw musisz troche odpoczac.' _map_blokery_renegaci_odpoczacz_trza = /_map_bloker
/def -mregexp -Fp500 -t'(Nie mozesz sie tam udac, gdyz |)([Op]pierzona skrzydlata bestia|[Ss]krzydlaty lwiopodobny potwor) swoim cielskiem zagradza ci droge( ucieczki|) na ' _map_blokery_bloker_gryf = /_map_bloker
/def -mregexp -Fp500 -t'(Czarnowlosa wysoka gnomka|Raila) zagradza ci droge.' _map_blokery_bloker_wyzima_periodicus = /_map_bloker
/def -mregexp -Fp500 -t'Moze najpierw wyjdz z wody' _map_blokery_bloker_monsarx_wodospad = /_map_bloker
/def -mregexp -Fp500 -t'Nie jestes pewny swojej umiejetnosci plywania w tej brudnej rzece...' _map_blokery_bloker_oxen_zielarz = /_map_bloker
/def -mregexp -Fp500 -t'Probujesz wdrapac sie na omszaly pien zagradzajacy droge, lecz na sliskiej korze osuwa ci sie noga i spadasz z powrotem na sciezke.' _map_blokery_bloker_lyria_pien = /_map_bloker
/def -mregexp -Fp500 -t'Nie jestes zbyt pewny swojej umiejetnosci latania...' _map_blokery_mostu_brak = /_map_bloker
/def -mregexp -Fp500 -t'Troll zagradza ci droge\.' _map_blokery_troll_zagradza = /_map_bloker
