/addworld mapper localhost 23923
/set _map_on=0
/set _map_connected=0

/def mapa = \
  /if ({*}=~'on') \
    /if ({_map_connected}==0) \
      /_map_connect%; \
    /endif%; \
    /set _map_on=1%; \
    /echo -p @{BCgreen}Mapa wlaczona! :)%; \
  /else \
    /set _map_on=0%; \
    /echo -p @{BCred}Mapa wylaczona! :(%; \
  /endif

/def _map_connect = \
  /echo -p @{BCblue}Connectuje do mapy!%; \
  /connect mapper%; \
  /set _map_connected=1

/def _map_send = \
  /if ({_map_on}==1) \
    /send -wmapper %{*}%; \
  /endif
  
/def _map_bloker = \
  /_map_send revert

/def _map_teleport = \
  /_map_send lookup:%{*}
  
/def _map_go = \
  /_map_send navigate:%{*}

;------------------------------------------------------------------------
;			   ... PORUSZANIE SIE ... 			  |
;------------------------------------------------------------------------  

/def -q -mregexp -h'SEND ^(?:|przemknij (?:sie |)(?:z druzyna |))(polnoc|n|poludnie|s|wschod|e|zachod|w|polnocny-wschod|ne|polnocny-zachod|nw|poludniowy-wschod|se|poludniowy-zachod|sw|gora|dol|u|d)$' _map_hooks_ide = \
  /_map_go %{P1}

/def -q -mregexp -h'SEND ^(alkierz|barak|barka|brama|brod|chata|chatka|drabian|drzwi|furtka|ganek|golebnik|jaskinia|jaskinie)$' _mao_hooks_customy = \
  /_map_go %{P1}
  
  
;------------------------------------------------------------------------
;		   ... NIECH SIE KULKA KRECI! ... 			  |
;------------------------------------------------------------------------  
/def -mregexp -p500 -t'(Wraz z (.*) podazasz|Podazasz) za (.*) droga w dol\.' _map_podazam_za_kims_droga_w_dol = /_map_go droga w dol
/def -mregexp -p500 -t'(Wraz z (.*) podazasz|Podazasz) za (.*) traktem w dol\.' _map_podazam_za_kims_traktem_w_dol = /_map_go traktem w dol
/def -mregexp -p500 -t'(Wraz z (.*) podazasz|Podazasz) za (.*) traktem w gore\.' _map_podazam_za_kims_traktem_w_gore = /_map_go traktem w gore
/def -mregexp -p500 -t'(Wraz z (.*) podazasz|Podazasz) za (.*) w dol traktem\.' _map_podazam_za_kims_w_dol_traktem = /_map_go w dol traktem
/def -mregexp -p500 -t'(Wraz z (.*) podazasz|Podazasz) za (.*) w gore traktem\.' _map_podazam_za_kims_w_gore_traktem = /_map_go w gore traktem
/def -mregexp -p500 -t'(Wraz z (.*) podazasz|Podazasz) za (.*) brodem przez strumien\.' _map_podazam_za_kims_brodem_przez_strumien = /_map_go brodem przez strumien
/def -mregexp -p500 -t'(Wraz z (.*) podazasz|Podazasz) za (.*) przez most na drugi brzeg rzeki\.' _map_podazam_za_kims_przez_most_na_drugi_brzeg_rzeki = /_map_go przez most na drugi brzeg rzeki
/def -mregexp -p500 -t'(Wraz z (.*) podazasz|Podazasz) za (.*) brodzac w wodzie na druga strone rzeki\.' _map_podazam_za_kims_brodzac_w_wodzie_na_druga_strone_rzeki = /_map_go brod
/def -mregexp -p500 -t'(Wraz z (.*) podazasz|Podazasz) za (.*) na zewnatrz straznicy\.' _map_podazam_za_kims_na_zewnatrz_straznicy = /_map_go na zewnatrz straznicy
/def -mregexp -p500 -t'(Wraz z (.*) podazasz|Podazasz) za (.*) do wnetrza straznicy\.' _map_podazam_za_kims_do_wnetrza_straznicy = /_map_go do wnetrza straznicy
/def -mregexp -p500 -t'(Wraz z (.*) podazasz|Podazasz) za (.*) po drabinie na gore\.' _map_podazam_za_kims_po_drabinie_na_gore = /_map_go drabina
/def -mregexp -p500 -t'(Wraz z (.*) podazasz|Podazasz) za (.*) przez klape na dol\.' _map_podazam_za_kims_przez_klape_na_dol = /_map_go klapa
/def -mregexp -p500 -t'(Wraz z (.*) podazasz|Podazasz) za (.*) przez furtke w palisadzie do wioski\.' _map_podazam_za_kims_przez_furtke_w_palisadzie_do_wisoki = /_map_go polnoc
/def -mregexp -p500 -t'(Wraz z (.*) podazasz|Podazasz) za (.*) do namiotu\.' _map_podazam_za_kims_do_namiotu = /_map_go namiot
/def -mregexp -p500 -t'(Wraz z (.*) podazasz|Podazasz) za (.*) schodami do gory\.' _map_podazam_za_kims_schodami_do_gory = /_map_go schodami do gory
/def -mregexp -p500 -t'(Wraz z (.*) podazasz|Podazasz) za (.*) schodami na dol\.' _map_podazam_za_kims_schodami_na_dol = /_map_go schodami na dol
/def -mregexp -p500 -t'(Wraz z (.*) podazasz|Podazasz) za (.*) za palisade\.' _map_podazam_za_kims_palisade = /_map_go poludnie
/def -mregexp -p500 -t'(Wraz z (.*) podazasz|Podazasz) za (.*) w glab ciemnosci\.' _map_podazam_za_kims_w_glab_ciemnosci = /_map_go w glab ciemnosci
/def -mregexp -p500 -t'(Wraz z (.*) podazasz|Podazasz) za (.*) do karczmy\.' _map_podazam_za_kims_do_karczmy = /_map_go karczma
/def -mregexp -p500 -t'(Wraz z (.*) podazasz|Podazasz) za (.*) do wyjscia\.' _map_podazam_za_kims_do_wyjscia = /_map_go wyjscie
/def -mregexp -p500 -t'(Wraz z (.*) podazasz|Podazasz) za (.*) na wyjscie\.' _map_podazam_za_kims_na_wyjscie = /_map_go wyjscie
/def -mregexp -p500 -t'(Wraz z (.*) podazasz|Podazasz) za (.*) na gore\.' _map_podazam_za_kims_na_gore = /_map_go gora
/def -mregexp -p400 -t'(Wraz z (.*) podazasz|Podazasz) za (.*) na (.*)\.' _map_podazam_za_kims = /_map_go %{P4}

;------------------------------------------------------------------------
;			   ... TELEPORTY ... 				  |
;------------------------------------------------------------------------  
/def -mregexp -t'Sypialnia w gildii Krasnoludow Mahakamu.' _map_teleport_gildia = /_map_teleport %{_map_room_gildia}
/def -mregexp -t'Gospoda \'Zacisze\'.' _map_teleport_maribor = /_map_teleport %{_map_room_maribor}
/def -mregexp -t'Karczma \'Pohulanka\'.' _map_teleport_podmoklalaka = /_map_teleport %{_map_room_podmoklalaka}
/def -mregexp -t'Karczma \'Dom Rybaka\'.' _map_teleport_obawa = /_map_teleport %{_map_room_obawa}
/def -mregexp -t'Karczma \'U Hermana\'.' _map_teleport_bodrog = /_map_teleport %{_map_room_bodrog}
/def -mregexp -t'Karczma \'Pod Lisem\'.' _map_teleport_wyzima = /_map_teleport %{_map_room_wyzima_1}
/def -mregexp -t'Karczma \'Pod dzikiem\'.' _map_teleport_bobolacy = /_map_teleport %{_map_room_bobolacy}
/def -mregexp -t'Karczma Pod Biala Lza w Eldar.' _map_teleport_eldar = /_map_teleport %{_map_room_eldar}
/def -mregexp -t'Karczma \'Stary Narakort\'.' _map_teleport_wyzima_2 = /_map_teleport %{_map_room_wyzima_2}
/def -mregexp -t'Karczma Mlynskie Kolo.' _map_teleport_bialymost = /_map_teleport %{_map_room_bialymost}
/def -mregexp -t'Karczma \'Pod Grabem\' w Grabowej Buchcie.' _map_teleport_grabowa = /_map_teleport %{_map_room_grabowa}
/def -mregexp -t'Karczma \'Pod ostatnim miedziakiem\'.' _map_teleport_rinde_podgrodzie = /_map_teleport %{_map_room_rinde_podgrodzie}
/def -mregexp -t'Karczma \'Pod Kucykiem\'.' _map_teleport_oxenfurt_podgrodzie = /_map_teleport %{_map_room_oxenfurt_podgrodzie}
/def -mregexp -t'Karczma \'\'Pod wesolym studentem\'\'.' _map_teleport_oxenfurt = /_map_teleport %{_map_room_oxenfurt_1}
/def -mregexp -t'Karczma Trzy Dzwoneczki.' _map_teleport_oxenfurt_2 = /_map_teleport %{_map_room_oxenfurt_2}
/def -mregexp -t'Wnetrze karczmy "Dwa Jelenie".' _map_teleport_osada_mysliwska = /_map_teleport %{_map_room_osadamysliwska}
/def -mregexp -t'Portowa tawerna o milej nazwie Zeza.' _map_teleport_oxenfurt_3 = /_map_teleport %{_map_room_oxenfurt_3}
/def -mregexp -t'Winiarnia Biala Dama.' _map_teleport_oxenfurt_4 = /_map_teleport %{_map_room_oxenfurt_4}
/def -mregexp -t'Karczma \'Pod Zagnica\'.' _map_teleport_piana_1 = /_map_teleport %{_map_room_piana_1}
/def -mregexp -t'\'W Brzuchu Krakena\'.' _map_teleport_piana_2 = /_map_teleport %{_map_room_piana_2}
/def -mregexp -t'Znana w calym miescie herbaciarnia.' _map_teleport_oxenfurt_5 = /_map_teleport %{_map_room_oxenfurt_5}
/def -mregexp -t'Glowna izba \'Karczmy katowskiej\'.' _map_teleport_gelibol_podgrodzie = /_map_teleport %{_map_room_gelibol_podgrodzie}
  
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
/def -mregexp -Fp500 -t'Przygladasz sie uwaznie miejscu, na ktorego chcesz sie wspiac i oceniajac trudnosc wspinaczki stwierdzasz ze najpierw musisz troche odpoczac.' _map_blokery_renegaci_odpoczacz_trza = /_map_go zejdz do doliny
/def -mregexp -Fp500 -t'(Nie mozesz sie tam udac, gdyz |)([Op]pierzona skrzydlata bestia|[Ss]krzydlaty lwiopodobny potwor) swoim cielskiem zagradza ci droge( ucieczki|) na ' _map_blokery_bloker_gryf = /_map_bloker
/def -mregexp -Fp500 -t'(Czarnowlosa wysoka gnomka|Raila) zagradza ci droge.' _map_blokery_bloker_wyzima_periodicus = /_map_bloker
/def -mregexp -Fp500 -t'Moze najpierw wyjdz z wody' _map_blokery_bloker_monsarx_wodospad = /_map_bloker
/def -mregexp -Fp500 -t'Nie jestes pewny swojej umiejetnosci plywania w tej brudnej rzece...' _map_blokery_bloker_oxen_zielarz = /_map_bloker
/def -mregexp -Fp500 -t'Probujesz wdrapac sie na omszaly pien zagradzajacy droge, lecz na sliskiej korze osuwa ci sie noga i spadasz z powrotem na sciezke.' _map_blokery_bloker_lyria_pien = /_map_bloker
/def -mregexp -Fp500 -t'Nie jestes zbyt pewny swojej umiejetnosci latania...' _map_blokery_mostu_brak = /_map_bloker
/def -mregexp -Fp500 -t'Troll zagradza ci droge\.' _map_blokery_troll_zagradza = /_map_bloker


/set _map_room_gildia=ccdea3ee-88c3-11e2-8d6c-9c4e368dac0c