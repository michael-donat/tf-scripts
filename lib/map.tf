/addworld mapper localhost 23923
/set _map_on=0
/def -ag -hBGTRIG
/def -ag -hACTIVITY

/def mapa = \
  /if ({*}=~'on') \
    /if (is_connected("mapper")==0) \
      /_map_connect%; \
      /if (is_connected("mapper")==0) \
	/set _map_on=0%; \
      	/echo -p @{BCred}[MAP] Brak polaczenia z mapa. :(%; \
      /else \
	/set _map_on=1%; \
	/echo -p @{BCgreen}[MAP] Mapa wlaczona! :)%; \
      /endif%; \
    /else \
      /if ({_map_on}==1) \
	/echo -p @{BCblue}[MAP] Mapa juz jest wlaczona.%; \
      /else \
	/set _map_on=1%; \
	/echo -p @{BCgreen}[MAP] Mapa wlaczona! :)%; \
      /endif%; \
    /endif%; \
  /else \
    /set _map_on=0%; \
    /echo -p @{BCred}[MAP] Mapa wylaczona. :(%; \
  /endif

/def _map_connect = \
  /if (is_connected("mapper")==0) \
    /echo -p @{BCblue}[MAP] Probuje polaczyc sie z mapa..%; \
    /connect -b mapper%; \
  /endif
  
/def -mregexp -h'CONNECT mapper' _map_hooks_connect = \
  /echo -p @{BCgreen}[MAP] Polaczono z mapa! :)
  
/def -mregexp -h'DISCONNECT mapper' _map_hooks_disconnect = \
  /mapa off%; \
  /echo -p @{BCred}[MAP] Rozlaczano z mapa. :(

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
  /def %{P1} = /send -h %{P2}
 
/def -aL -mregexp -t'exit:custom:(.*)' _map_exit_rebind_custom = \
  /echo _-------- PODPIETO ---> /x = %{P1}%;\
  /def x = /send -h %{P1}

/def -aL -mregexp -t'exit:reset' _map_exit_reset_nolog = \
  /purge _map_location_*
  

;------------------------------------------------------------------------
;			   ... PORUSZANIE SIE ... 			  |
;------------------------------------------------------------------------  
  
/def -q -mregexp -h'SEND ^(?:|przemknij (?:sie |)(?:z druzyna |))(polnoc|n|poludnie|s|wschod|e|zachod|w|polnocny-wschod|ne|polnocny-zachod|nw|poludniowy-wschod|se|poludniowy-zachod|sw|gora|dol|u|d)$' _map_hooks_ide = \
  /_map_go exit:%{P1}

/def -q -mregexp -h'SEND ^(alkierz|altana|dom|barak|barka|brama|brod|chata|chatka|domek|drabina|drzwi|furtka|gabinet|ganek|golebnik|jaskinia|jaskinie|kamienica|kaplica|karczma|klapa|korytarz|kuchnia|kurhan|kurnik|magazyn|mlyn|most|namiot|ogrod|otwor|palac|pawilon|pieczara|pokoik|pomost|sala|schodki|schody|sklep|spizarnia|stajnia|stodola|straznica|stryszek|swiatynia|szczelina|taras|ulica|wejscie|wieza|wyrwa|wyjscie|zagroda|zajazd|zanurkuj|zielarnia)$' _map_hooks_customy = \
  /_map_go custom:%{P1}

/def -q -mregexp -h'SEND ^((obroc|otworz|pchnij|podnies|przecisnij|przeczolgaj|przedrzyj|przejdz|przeplyn|przeskocz|przesun|rozsun|skocz|wdrap|wejdz|wespnij|wslizgnij|wyjdz|wynurz|zejdz|zsun|zeskocz)( .*|))$' _map_hooks_customy_2 = \
  /_map_go custom:%{P1}
  
;------------------------------------------------------------------------
;		   ... NIECH SIE KULKA KRECI! ... 			  |
;------------------------------------------------------------------------

/set _map_standard_exits=\
  n|polnoc|\
  s|poludnie|\
  e|wschod|\
  w|zachod|\
  ne|polnocny-wschod|\
  se|poludniowy-wschod|\
  nw|polnocny-zachod|\
  sw|poludniowy-zachod|\
  u|gora|\
  d|dol

/set _map_follows_list=\
  brodem przez strumien|\
  brodzac w wodzie na druga strone rzeki|\
  do chaty|\
  do karczmy|\
  do namiotu|\
  do otworu|\
  do srodka kurhanu|\
  do wnetrza straznicy|\
  do wnetrza wyrwy|\
  do wyjscia|\
  droga w dol|\
  miedzy skalki|\
  na most|\
  na otwor|\
  na pomost|\
  na wyjscie|\
  na zewnatrz karczmy|\
  na zewnatrz straznicy|\
  opuszczajac podwoje warowni|\
  po schodach na dol|\
  po schodach na gore|\
  przez furtke w palisadzie do wioski|\
  przez klape na dol|po drabinie na gore|\
  przez most na drugi brzeg rzeki|\
  przez otwor|\
  przez otwor na gore|\
  schodami do gory|\
  schodami na dol|\
  schodzisz na dol|\
  sciezka w kierunku ruin|na schody|\
  traktem w dol|\
  traktem w gore|\
  w dol traktem|\
  w glab ciemnosci|\
  w glab otworu|\
  w gore traktem|\
  w kierunku otworu|\
  w strone skraju torfowiska|\
  za palisade|\
  znikajac w podwojach warowni

/eval /def -mregexp -Fp500 -t'(Wraz z (.*) podazasz|Podazasz) za (.*) (%{_map_follows_list})\.' _map_podazam_za_kims_rozne = /_map_go follow:%%{P4}
/def -mregexp -Fp500 -t'(Wraz z (.*) podazasz|Podazasz) za (.*) na gore\.' _map_podazam_za_kims_gora = /_map_go exit:gora
/def -mregexp -Fp500 -t'(Wraz z (.*) podazasz|Podazasz) za (.*) na (dol|polnoc|poludnie|wschod|zachod|polnocny-wschod|polnocny-zachod|poludniowy-wschod|poludniowy-zachod)\.' _map_podazam_za_kims_standard = /_map_go exit:%{P4}

;------------------------------------------------------------------------
;			   ... KOMENDA IDZ ... 				  |
;------------------------------------------------------------------------  

/def _map_idz_catch = \
  /purge _map_idz_move_trigger*%; \
  /eval /def -n1 -mregexp -p500 -t'Ruszasz (niespiesznie|marszem|truchtem|biegiem|szybkim biegiem) (%{_map_follows_list})\\\.' _map_idz_move_trigger_rozne = /_map_go follow:%%%{P2}%%%;  /purge _map_idz_move_trigger*%; \
  /def -n1 -mregexp -p500 -t'Ruszasz (niespiesznie|marszem|truchtem|biegiem|szybkim biegiem) na gore\\.' _map_idz_move_trigger_gora = /_map_go exit:gora%%;  /purge _map_idz_move_trigger*%; \
  /def -n1 -mregexp -p500 -t'Ruszasz (niespiesznie|marszem|truchtem|biegiem|szybkim biegiem) na (dol|polnoc|poludnie|wschod|zachod|polnocny-wschod|polnocny-zachod|poludniowy-wschod|poludniowy-zachod)\\.' _map_idz_move_trigger_standard = /_map_go exit:%%{P2}%%; /purge _map_idz_move_trigger*%; \

/def -mregexp -Fp500 -t'Wykonuje komende \'idz' _map_idz_trigger = \
  /_map_idz_catch  
  
/def -q -mregexp -h'SEND ^idz$' = \
  /_map_idz_catch

/def -mregexp -Fp500 -t'Nie wiesz, w ktorym kierunku masz ruszyc...' _map_idz_wiele_kierunkow = \
  /purge _map_idz_move_trigger*
  
;------------------------------------------------------------------------
;			   ... TELEPORTY ... 				  |
;------------------------------------------------------------------------  
/set _map_room_gildia=ccdea3ee-88c3-11e2-8d6c-9c4e368dac0c
/set _map_room_fandall_karczma=cfd5d49c-88c2-11e2-8d6c-9c4e368dac0c
/set _map_room_blaviken_karczma_1=5121fd7e-89df-11e2-9919-9c4e368dac0c
/set _map_room_blaviken_karczma_2=2e2d7794-89df-11e2-9919-9c4e368dac0c
/set _map_room_wyzima_1=42082528-88fb-11e2-b2a7-9c4e368dac0c
/set _map_room_wyzima_2=4208cdf2-88fb-11e2-b2a7-9c4e368dac0c
/set _map_room_piana_1=9bb32a6e-8b7b-11e2-af6b-9c4e368dac0c
/set _map_room_piana_2=aa7c023c-8b7b-11e2-af6b-9c4e368dac0c
/set _map_room_oxenfurt_podgrodzie=5c4715ea-8b79-11e2-af6b-9c4e368dac0c
/set _map_room_oxenfurt_1=8c56f1c8-8b7a-11e2-af6b-9c4e368dac0c
/set _map_room_oxenfurt_2=71eb300e-8c3f-11e2-a460-9c4e368dac0c
/set _map_room_oxenfurt_4=6fdaef32-8b79-11e2-af6b-9c4e368dac0c
/set _map_room_oxenfurt_5=6e896d88-8b7a-11e2-af6b-9c4e368dac0c
/set _map_room_novigrad_port=5786a2cc-8c38-11e2-9ba5-9c4e368dac0c
/set _map_room_novigrad_1=d7029a3e-8c46-11e2-aad8-9c4e368dac0c
/set _map_room_novigrad_2=0559ff9a-8c46-11e2-aad8-9c4e368dac0c
/set _map_room_novigrad_3=b4b6b7a0-8cad-11e2-b29e-9c4e368dac0c
/set _map_room_osadamysliwska=0e3bb60c-88ff-11e2-80d0-9c4e368dac0c
/set _map_room_mahakam_scianka=fa1d6212-88c0-11e2-8d6c-9c4e368dac0c
/set _map_room_ruiny_poziom_3_4=12caa034-8e7c-11e2-bfe6-9c4e368dac0c
/set _map_room_rinde_1=55e6a31a-89bb-11e2-878b-2af7728612b4
/set _map_room_rinde_2=66ea6750-89bb-11e2-878b-2af7728612b4
/set _map_room_rinde_3=5e111296-89bb-11e2-878b-2af7728612b4
/set _map_room_rinde_4=b83bf6ce-91a8-11e2-9cc7-9c4e368dac0c
/set _map_room_baccala=5f7c0884-9e24-11e2-852c-36be4148278d

/def -mregexp -Fp500 -t'Sypialnia w gildii Krasnoludow Mahakamu.' _map_teleport_gildia = /_map_teleport %{_map_room_gildia}
/def -mregexp -Fp500 -t'Gospoda "Pod kilofem i oskardem".' _map_teleport_fandall_karczma = /_map_teleport %{_map_room_fandall_karczma}
/def -mregexp -Fp500 -t'Karczma \'Pod Tunczykiem\'.' _map_teleport_blaviken_karczma_1 = /_map_teleport %{_map_room_blaviken_karczma_1}
/def -mregexp -Fp500 -t'Karczma \'Zloty Dwor\'.' _map_teleport_blaviken_karczma_2 = /_map_teleport %{_map_room_blaviken_karczma_2}
/def -mregexp -Fp500 -t'Karczma \'Pod Lisem\'.' _map_teleport_wyzima = /_map_teleport %{_map_room_wyzima_1}
/def -mregexp -Fp500 -t'Karczma \'Stary Narakort\'.' _map_teleport_wyzima_2 = /_map_teleport %{_map_room_wyzima_2}
/def -mregexp -Fp500 -t'Karczma \'Pod Zagnica\'.' _map_teleport_piana_1 = /_map_teleport %{_map_room_piana_1}
/def -mregexp -Fp500 -t'\'W Brzuchu Krakena\'.' _map_teleport_piana_2 = /_map_teleport %{_map_room_piana_2}
/def -mregexp -Fp500 -t'Karczma \'Pod Kucykiem\'.' _map_teleport_oxenfurt_podgrodzie = /_map_teleport %{_map_room_oxenfurt_podgrodzie}
/def -mregexp -Fp500 -t'Karczma \'\'Pod wesolym studentem\'\'.' _map_teleport_oxenfurt = /_map_teleport_temp %{_map_room_oxenfurt_1}
/def -mregexp -Fp500 -t'Karczma Trzy Dzwoneczki.' _map_teleport_oxenfurt_2 = /_map_teleport %{_map_room_oxenfurt_2}
/def -mregexp -Fp500 -t'Winiarnia Biala Dama.' _map_teleport_oxenfurt_4 = /_map_teleport %{_map_room_oxenfurt_4}
/def -mregexp -Fp500 -t'Znana w calym miescie herbaciarnia.' _map_teleport_oxenfurt_5 = /_map_teleport %{_map_room_oxenfurt_5}
/def -mregexp -Fp500 -t'Karczma Pod Pegazem.' _map_teleport_novigrad_port = /_map_teleport %{_map_room_novigrad_port}
/def -mregexp -Fp500 -t'Tawerna pod Grotem Wloczni.' _map_teleport_novigrad_1 = /_map_teleport %{_map_room_novigrad_1}
/def -mregexp -Fp500 -t'Karczma \'Siedem Kotow\'.' _map_teleport_novigrad_2 = /_map_teleport %{_map_room_novigrad_2}
/def -mregexp -Fp500 -t'Karczma pod Zlamana Strzala.' _map_teleport_novigrad_3 = /_map_teleport %{_map_room_novigrad_3}
/def -mregexp -Fp500 -t'Wnetrze karczmy "Dwa Jelenie".' _map_teleport_osada_mysliwska = /_map_teleport %{_map_room_osadamysliwska}
/def -mregexp -Fp500 -t'Po polnocnej stronie platformy, powolnym, lecz bezszelestnym ruchem otwiera sie obszerny, regularny otwor prowadzacy na wschod!' _map_teleport_mahakam_scianka = /_map_teleport %{_map_room_mahakam_scianka}
/def -mregexp -Fp500 -t'Nagle czujesz, jak ziemia pod toba zapada sie! Zaczynasz spadac w dol... w dol...' _map_teleport_ruiny_poziom_3_4 = /_map_teleport %{_map_room_ruiny_poziom_3_4}
/def -mregexp -Fp500 -t'Oberza \'Pod Pierwszym Razem\'.' _map_teleport_rinde_1 = /_map_teleport %{_map_room_rinde_1}
/def -mregexp -Fp500 -t'Karczma \'Pijany D`jinn\'.' _map_teleport_rinde_2 = /_map_teleport %{_map_room_rinde_2}
/def -mregexp -Fp500 -t'Zamtuz \'Wstazeczka Rozkoszy\'.' _map_teleport_rinde_3 = /_map_teleport %{_map_room_rinde_3}
/def -mregexp -Fp500 -t'Karczma \'Pod ostatnim miedziakiem\'.' _map_teleport_rinde_4 = /_map_teleport %{_map_room_rinde_4}
/def -mregexp -Fp500 -t'Tawerna \'Pod Czarnym Kotem\'.' _map_teleport_baccala = /_map_teleport %{_map_room_baccala}

;------------------------------------------------------------------------
;		   ... TELEPORTY - STATKI... 				  |
;------------------------------------------------------------------------  
/set _map_room_prom_novi=f4420b80-8c40-11e2-a460-9c4e368dac0c
/set _map_room_prom_stocznia=72526efc-9e20-11e2-852c-36be4148278d
/set _map_room_prom_nadrzecze=2b3f7e2e-8c41-11e2-a460-9c4e368dac0c
/set _map_room_prom_temeria=bbf8f2f0-8cb5-11e2-a793-9c4e368dac0c
/set _map_room_prom_piana=ae9dcc48-8cb5-11e2-a793-9c4e368dac0c
/set _map_room_prom_oxen=5a6fe5d6-9e1f-11e2-852c-36be4148278d
/set _map_room_prom_grabowa=655d90e2-9e1f-11e2-852c-36be4148278d
/set _map_room_statek_blaviken_1=e6c6c674-9e21-11e2-852c-36be4148278d
/set _map_room_statek_novigrad_1=e229c14e-9e20-11e2-852c-36be4148278d
/set _map_room_statek_novigrad_2=453ffdca-9e4e-11e2-a554-9c4e368dac0c
/set _map_room_statek_daevon=84a77adc-9e22-11e2-852c-36be4148278d
/set _map_room_statek_baccala=2244578a-9e4e-11e2-a554-9c4e368dac0c
/set _map_room_statek_rozrog=

/def -mregexp -Fp500 -t' krzyczy: Doplynelismy do wsi Nadrzecze w Temerii! Mozna wysiadac!' _map_teleport_prom_nadrzecze = /_map_teleport %{_map_room_prom_nadrzecze}
/def -mregexp -Fp500 -t' krzyczy: Doplynelismy do Stoczni Novigradzkiej! Mozna wysiadac!' _map_teleport_prom_stocznia = /_map_teleport %{_map_room_prom_stocznia}
/def -mregexp -Fp500 -t' krzyczy: Doplynelismy do przystani pod Novigradem! Mozna wysiadac!' _map_teleport_prom_novi = /_map_teleport %{_map_room_prom_novi}
/def -mregexp -Fp500 -t' krzyczy: Doplynelismy do przystani po Temerskiej stronie Pontaru! Mozna wysiadac!' _map_teleport_prom_temeria = /_map_teleport %{_map_room_prom_temeria}
/def -mregexp -Fp500 -t' krzyczy: Doplynelismy do przystani opodal Piany! Mozna wysiadac!' _map_teleport_prom_piana = /_map_teleport %{_map_room_prom_piana}
/def -mregexp -Fp500 -t' krzyczy: Doplynelismy do przystani w Oxenfurcie na polnocnym brzegu Pontaru! Mozna wysiadac!' _map_teleport_prom_oxen = /_map_teleport %{_map_room_prom_oxen}
/def -mregexp -Fp500 -t' krzyczy: Doplynelismy do przystani w Grabowej Buchcie na poludniowym brzegu Pontaru! Mozna wysiadac!' _map_teleport_prom_grabowa = /_map_teleport %{_map_room_prom_grabowa}
/def -mregexp -Fp500 -t'(Flavius|Jasnowlosy sniady elf) krzyczy: Doplynelismy do portu Blaviken w krolestwie Redanii! Mozna wysiadac!' _map_teleport_statek_blaviken_1 = /_map_teleport %{_map_room_statek_blaviken_1}
/def -mregexp -Fp500 -t'(Flavius|Jasnowlosy sniady elf) krzyczy: Doplynelismy do Novigradu w krolestwie Redanii! Mozna wysiadac!' _map_teleport_statek_novigrad_1 = /_map_teleport %{_map_room_statek_novigrad_1}
/def -mregexp -Fp500 -t'(Charonda|Otyly czerwononosy mezczyzna) krzyczy: Doplynelismy do poludniowego portu Novigradu w krolestwie Redanii! Mozna wysiadac!' _map_teleport_statek_novigrad_2 = /_map_teleport %{_map_room_statek_novigrad_2}
/def -mregexp -Fp500 -t'(Flavius|Jasnowlosy sniady elf) krzyczy: Doplynelismy do Daevon, w krolestwie Kaedwen! Mozna wysiadac!' _map_teleport_statek_daevon = /_map_teleport %{_map_room_statek_daevon}
/def -mregexp -Fp500 -t'(Charonda|Otyly czerwononosy mezczyzna) krzyczy: Doplynelismy do Baccali! Mozna wysiadac!' _map_teleport_statek_baccala = /_map_teleport %{_map_room_statek_baccala}
/def -mregexp -Fp500 -t'(Charonda|Otyly czerwononosy mezczyzna) krzyczy: Doplynelismy do przystani pod twierdza Rozrog! Mozna wysiadac!' _map_teleport_statek_rozrog = /_map_teleport %{_map_room_statek_rozrog}
;------------------------------------------------------------------------
;		   ... TELEPORTY - TODO... 				  |
;------------------------------------------------------------------------  

/def -mregexp -Fp500 -t'Gospoda \'Zacisze\'.' _map_teleport_maribor = /_map_teleport_temp %{_map_room_maribor}
/def -mregexp -Fp500 -t'Karczma \'Pohulanka\'.' _map_teleport_podmoklalaka = /_map_teleport_temp %{_map_room_podmoklalaka}
/def -mregexp -Fp500 -t'Karczma \'Dom Rybaka\'.' _map_teleport_obawa = /_map_teleport_temp %{_map_room_obawa}
/def -mregexp -Fp500 -t'Karczma \'U Hermana\'.' _map_teleport_bodrog = /_map_teleport_temp %{_map_room_bodrog}
/def -mregexp -Fp500 -t'Karczma \'Pod dzikiem\'.' _map_teleport_bobolacy = /_map_teleport_temp %{_map_room_bobolacy}
/def -mregexp -Fp500 -t'Karczma Pod Biala Lza w Eldar.' _map_teleport_eldar = /_map_teleport_temp %{_map_room_eldar}
/def -mregexp -Fp500 -t'Karczma Mlynskie Kolo.' _map_teleport_bialymost = /_map_teleport_temp %{_map_room_bialymost}
/def -mregexp -Fp500 -t'Karczma \'Pod Grabem\' w Grabowej Buchcie.' _map_teleport_grabowa = /_map_teleport_temp %{_map_room_grabowa}
/def -mregexp -Fp500 -t'Karczma \'Pod ostatnim miedziakiem\'.' _map_teleport_rinde_podgrodzie = /_map_teleport_temp %{_map_room_rinde_podgrodzie}
/def -mregexp -Fp500 -t'Portowa tawerna o milej nazwie Zeza.' _map_teleport_oxenfurt_3 = /_map_teleport_temp %{_map_room_oxenfurt_3}
/def -mregexp -Fp500 -t'Glowna izba \'Karczmy katowskiej\'.' _map_teleport_gelibol_podgrodzie = /_map_teleport_temp %{_map_room_gelibol_podgrodzie}
  
;------------------------------------------------------------------------
;			   ... BLOKERY ... 				  |
;------------------------------------------------------------------------  
/def -mregexp -Fp500 -t'Nie mozesz sie tam udac, gdyz lezysz.' _map_blokery_leze = /_map_bloker
/def -mregexp -Fp500 -t'Nie mozesz sie tam udac, gdyz siedzisz' _map_blokery_siedze = /_map_bloker
/def -mregexp -Fp500 -t'Jestes tak zmeczony, ze nie mozesz dalej podazac w tym kierunku\.' _map_blokery_zmeczylem_sie = /_map_bloker
; Zamkniete przejscia
/def -mregexp -Fp500 -t'Probujesz otworzyc (.*|)(brame|wrota|drzwi|krate|furtke|drzwiczki w bramie|wrota z brazu), ale nie udaje ci sie to\.' _map_blokery_bramy = /_map_bloker
/def -mregexp -Fp500 -t'Forsowanie zamknietych drzwi nie jest najlepszym pomyslem.' _map_blokery_brama4 = /_map_bloker
/def -mregexp -Fp500 -t'Nie dasz rady otworzyc stalowej kraty, musisz sprobowac ja uniesc.' _map_blokery_oxen_krata = /_map_bloker
/def -mregexp -Fp500 -t'Podchodzisz pod drzwi na poludniu, jednak okazuja sie one zamkniete na klucz.' _map_blokery_bloker_scala_drzwi = /_map_bloker
; Lokacji chyba brak (defy do wywalenia [chyba ze to w nocy np. pozamykane tylko])
/def -mregexp -Fp500 -t'Podchodzisz pod drzwi na polnocy, ktore nagle otwieraja sie z hukiem i wylatuje przez nie pijany mezczyzna omal na ciebie nie wpadajac. Zaraz potem drzwi zatrzaskuje sie.' _map_blokery_bloker_scala_drzwi_2 = /_map_bloker
/def -mregexp -Fp500 -t'Nie mozesz zejsc gdyz klapa jest zamknieta.' _map_blokery_bloker_wiocha_klapa = /_map_bloker
/def -mregexp -Fp500 -t'Szarpiesz energicznie za klamke, lecz drzwi stawiaja opor.' _map_blokery_bloker_wyzima_swiatynia = /_map_bloker
/def -mregexp -Fp500 -t'Pociagasz za klamke, ale drzwi sa zamkniete.' _map_blokery_bloker_wyzima_grod = /_map_bloker
/def -mregexp -Fp500 -t'Niestety drzwi zdaja sie byc zaryglowane od wewnatrz.' _map_blokery_bloker_anchor = /_map_bloker
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
/def -mregexp -Fp500 -t'Smok zagradza ci przejscie do pieczary.' _map_blokery_smok_zagradza = /_map_bloker
/def -mregexp -Fp500 -t'Idziesz na polnocny-zachod, lecz zawracasz zrezygnowany, gdyz przejscie zostalo zasypane.' _map_bloker_zawalone1 = /_map_bloker
/def -mregexp -Fp500 -t'Idziesz na poludniowy-wschod, lecz zawracasz zrezygnowany, gdyz przejscie zostalo zasypane.' _map_bloker_zawalone2 = /_map_bloker
/def -mregexp -Fp500 -t'Droge zastepuje ci barczysty straznik mowiac: Prosze okazac kwit magazynowy lub wskazac towar do przechowania.' _map_bloker_novigrad_port = /_map_bloker
/def -mregexp -Fp500 -t'Musisz stanac w kolejce i poczekac na audiencje.' _map_bloker_novigrad_audiencja = /_map_bloker
/def -mregexp -Fp500 -t'Probujesz sie wcisnac do otworu, jednakze ktos najwyrazniej jest juz w srodku, a jest tam zbyt wasko by zmiescily sie tam dwie osoby na raz.' _map_bloker_rinde_ruiny = /_map_bloker
/def -mregexp -Fp500 -t'Niestety, wyglada na to, ze wiecej osob niz jedna sie tam nie zmiesci.' _map_bloker_rinde_ruiny_2 = /_map_bloker
/def -mregexp -Fp500 -t'Ktos inny juz to zaczal robic. Otwor nie jest dosc szeroki by udalo sie to dwom osobom na raz.' _map_bloker_rinde_ruiny_3 = /_map_bloker
/def -mregexp -Fp500 -t'Odpadasz od sciany i lecisz w dol, jednak dzieki niewielkiej wysokosci udaje ci sie zgrabnie wyladowac na ziemi.' _map_bloker_rinde_drzewo_1 = /_map_bloker
/def -mregexp -Fp500 -t'Odpadasz od sciany i lecisz w dol. Przez chwile spadasz, zaraz jednak uderzasz o ziemie, raniac sie.' _map_bloker_rinde_drzewo_2 = /_map_bloker
/def -mregexp -Fp500 -t'Po chwili wahania decydujesz sie nie schodzic.' _map_bloker_shekhal_winorosl = /_map_bloker
/def -mregexp -Fp500 -t'Chcesz wpasc do rozpadliny\? Taka decyzje musisz potwierdzic.' _map_bloker_pustynia_rozpadlina = /_map_bloker
/def -mregexp -Fp500 -t'Probujesz wspiac sie po pniu, ale robisz to zbyt slamazarnie i zjezdzasz z powrotem w dol.' _map_bloker_baccala_pien = /_map_bloker
/def -mregexp -Fp500 -t' mezczyzna stoi ci na drodze.$' _map_bloker_straznica = /_map_bloker
/def -mregexp -Fp500 -t'Probujesz sie ruszyc na (.*), jednak pajecze sieci, w ktore sie w miedzy czasie zaplatales, uniemozliwiaja ci to.' _map_bloker_pajaki = /_map_bloker
