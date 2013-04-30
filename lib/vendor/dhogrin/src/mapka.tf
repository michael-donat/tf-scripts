/def mapset = /set cmd=SET: %{1} %{2}%;/tcsend
/def mapGildia = /mapset 20850 20690
/def -mregexp -t'Sypialnia w gildii Krasnoludow Mahakamu.' _map_teleport_gildia = /mapTeleport 20850 20690
;/def -mregexp -t'Skrzyzowanie ulic Nadbrzeznej i Zbozowej.' _map_teleport_bialymost = /mapTeleport 19430 19930
/def -mregexp -t'Gospoda \'Zacisze\'.' _map_teleport_maribor = /mapTeleport 19870 22390
/def -mregexp -t'Karczma \'Pohulanka\'.' _map_teleport_podmoklalaka = /mapTeleport 18150 21710
/def -mregexp -t'Karczma \'Dom Rybaka\'.' _map_teleport_obawa = /mapTeleport 18030 23550
/def -mregexp -t'Karczma \'U Hermana\'.' _map_teleport_bodrog = /mapTeleport 17950 23410
/def -mregexp -t'Karczma \'Pod Lisem\'.' _map_teleport_wyzima = /mapTeleport 19810 20890
/def -mregexp -t'Karczma \'Pod dzikiem\'.' _map_teleport_bobolacy = /mapTeleport 18970 22430
/def -mregexp -t'Karczma Pod Biala Lza w Eldar.' _map_teleport_eldar = /mapTeleport 23450 18810
/def -mregexp -t'Karczma \'Stary Narakort\'.' _map_teleport_wyzima_2 = /mapTeleport 19810 20810
/def -mregexp -t'Karczma Mlynskie Kolo.' _map_teleport_bialymost = /mapTeleport 19410 19910
/def -mregexp -t'Karczma \'Pod Grabem\' w Grabowej Buchcie.' _map_teleport_grabowa = /mapTeleport 18730 20610
/def -mregexp -t'Karczma \'Pod ostatnim miedziakiem\'.' _map_teleport_rinde_podgrodzie = /mapTeleport 20530 19450
/def -mregexp -t'Karczma \'Pod Kucykiem\'.' _map_teleport_oxenfurt_podgrodzie = /mapTeleport 18810 19190
/def -mregexp -t'Karczma \'\'Pod wesolym studentem\'\'.' _map_teleport_oxenfurt = /mapTeleport 18870 19550
/def -mregexp -t'Karczma Trzy Dzwoneczki.' _map_teleport_oxenfurt_2 = /mapTeleport 18730 19570
/def -mregexp -t'Wnetrze karczmy "Dwa Jelenie".' _map_teleport_osada_mysliwska = /mapTeleport 21350 23090
/def -mregexp -t'Portowa tawerna o milej nazwie Zeza.' _map_teleport_oxenfurt_3 = /mapTeleport 18710 19650
/def -mregexp -t'Winiarnia Biala Dama.' _map_teleport_oxenfurt_4 = /mapTeleport 18770 19350
/def -mregexp -t'Karczma \'Pod Zagnica\'.' _map_teleport_piana_1 = /mapTeleport 18970 19790
/def -mregexp -t'\'W Brzuchu Krakena\'.' _map_teleport_piana_2 = /mapTeleport 18930 19870
/def -mregexp -t'Znana w calym miescie herbaciarnia.' _map_teleport_oxenfurt_5 = /mapTeleport 18650 19390
/def -mregexp -t'Glowna izba \'Karczmy katowskiej\'.' _map_teleport_gelibol_podgrodzie = /mapTeleport 21550 19050

/def -mregexp -t'Podnoze Urwistego Wzgorza.' _map_teleport_mahakam_redcapy = /mapTeleport 21830 21370

/def -mregexp -Fp200 -t' krzyczy: Doplynelismy do przystani po Temerskiej stronie Pontaru! Mozna wysiadac!' _map_teleport_prom_1 = /mapTeleport 19370 20910
/def -mregexp -Fp200 -t' krzyczy: Doplynelismy do przystani opodal Piany! Mozna wysiadac!' _map_teleport_prom_2 = /mapTeleport 19250 19650
/def -mregexp -Fp200 -t' krzyczy: Doplynelismy do przystani w Oxenfurcie na polnocnym brzegu Pontaru! Mozna wysiadac!' _map_teleport_prom_3 = /mapTeleport 18770 19750
/def -mregexp -Fp200 -t' krzyczy: Doplynelismy do przystani w Grabowej Buchcie na poludniowym brzegu Pontaru! Mozna wysiadac!' _map_teleport_prom_4 = /mapTeleport 18750 20510
/def mapTeleport = /if ({mapa}>=0) /mapset %{1} %{2}%; /mapa on%; /endif

/set mapa=-1

/def mapa = /if ({*}=~'on') /set mapa=1%; /else /set mapa=0%; /endif
/def mapgo = /if ({mapa}>0) /gogo %{*}%; /else /send %{*}%; /endif%; /set _chce_isc=%{*}
/def mapgoafter = /if ({mapa}>0) /set cmd=GO: %{*}%;/tcsend%; /endif
/def zawroc = \
  /if ({*}=~'wschod') /set ToReturn=zachod%; \
  /elseif ({*}=~'brak') /return%; \
  /elseif ({*}=~'zachod') /set ToReturn=wschod%; \
  /elseif ({*}=~'polnoc') /set ToReturn=poludnie%; \
  /elseif ({*}=~'poludnie') /set ToReturn=polnoc%; \
  /elseif ({*}=~'polnocny-wschod') /set ToReturn=poludniowy-zachod%; \
  /elseif ({*}=~'polnocny-zachod') /set ToReturn=poludniowy-wschod%; \
  /elseif ({*}=~'poludniowy-wschod') /set ToReturn=polnocny-zachod%; \
  /elseif ({*}=~'poludniowy-zachod') /set ToReturn=polnocny-wschod%; \
;  /elseif ({*}=~'gora') /set ToReturn=dol%; \
;  /elseif ({*}=~'dol') /set ToReturn=gora%; \
  /else /return%; \
  /endif%; \
  /mapgoafter %{ToReturn}
  
##
### Niech się kulka kręci!
##
/def -mregexp -p200 -t'(Wraz z (.*) podazasz|Podazasz) za (.*) droga w dol\.' _mapka_podazam_za_kims_droga_w_dol = /mapgoafter droga w dol
/def -mregexp -p200 -t'(Wraz z (.*) podazasz|Podazasz) za (.*) traktem w dol\.' _mapka_podazam_za_kims_traktem_w_dol = /mapgoafter traktem w dol
/def -mregexp -p200 -t'(Wraz z (.*) podazasz|Podazasz) za (.*) traktem w gore\.' _mapka_podazam_za_kims_traktem_w_gore = /mapgoafter traktem w gore
/def -mregexp -p200 -t'(Wraz z (.*) podazasz|Podazasz) za (.*) w dol traktem\.' _mapka_podazam_za_kims_w_dol_traktem = /mapgoafter w dol traktem
/def -mregexp -p200 -t'(Wraz z (.*) podazasz|Podazasz) za (.*) w gore traktem\.' _mapka_podazam_za_kims_w_gore_traktem = /mapgoafter w gore traktem
/def -mregexp -p200 -t'(Wraz z (.*) podazasz|Podazasz) za (.*) brodem przez strumien\.' _mapka_podazam_za_kims_brodem_przez_strumien = /mapgoafter brodem przez strumien
/def -mregexp -p200 -t'(Wraz z (.*) podazasz|Podazasz) za (.*) przez most na drugi brzeg rzeki\.' _mapka_podazam_za_kims_przez_most_na_drugi_brzeg_rzeki = /mapgoafter przez most na drugi brzeg rzeki
/def -mregexp -p200 -t'(Wraz z (.*) podazasz|Podazasz) za (.*) brodzac w wodzie na druga strone rzeki\.' _mapka_podazam_za_kims_brodzac_w_wodzie_na_druga_strone_rzeki = /mapgoafter brod
/def -mregexp -p200 -t'(Wraz z (.*) podazasz|Podazasz) za (.*) na zewnatrz straznicy\.' _mapka_podazam_za_kims_na_zewnatrz_straznicy = /mapgoafter na zewnatrz straznicy
/def -mregexp -p200 -t'(Wraz z (.*) podazasz|Podazasz) za (.*) do wnetrza straznicy\.' _mapka_podazam_za_kims_do_wnetrza_straznicy = /mapgoafter do wnetrza straznicy
/def -mregexp -p200 -t'(Wraz z (.*) podazasz|Podazasz) za (.*) po drabinie na gore\.' _mapka_podazam_za_kims_po_drabinie_na_gore = /mapgoafter drabina
/def -mregexp -p200 -t'(Wraz z (.*) podazasz|Podazasz) za (.*) przez klape na dol\.' _mapka_podazam_za_kims_przez_klape_na_dol = /mapgoafter klapa
/def -mregexp -p200 -t'(Wraz z (.*) podazasz|Podazasz) za (.*) przez furtke w palisadzie do wioski\.' _mapka_podazam_za_kims_przez_furtke_w_palisadzie_do_wisoki = /mapgoafter polnoc
/def -mregexp -p200 -t'(Wraz z (.*) podazasz|Podazasz) za (.*) do namiotu\.' _mapka_podazam_za_kims_do_namiotu = /mapgoafter namiot
/def -mregexp -p200 -t'(Wraz z (.*) podazasz|Podazasz) za (.*) schodami do gory\.' _mapka_podazam_za_kims_schodami_do_gory = /mapgoafter schodami do gory
/def -mregexp -p200 -t'(Wraz z (.*) podazasz|Podazasz) za (.*) schodami na dol\.' _mapka_podazam_za_kims_schodami_na_dol = /mapgoafter schodami na dol
/def -mregexp -p200 -t'(Wraz z (.*) podazasz|Podazasz) za (.*) za palisade\.' _mapka_podazam_za_kims_palisade = /mapgoafter poludnie
/def -mregexp -p200 -t'(Wraz z (.*) podazasz|Podazasz) za (.*) w glab ciemnosci\.' _mapka_podazam_za_kims_w_glab_ciemnosci = /mapgoafter w glab ciemnosci
/def -mregexp -p200 -t'(Wraz z (.*) podazasz|Podazasz) za (.*) do karczmy\.' _mapka_podazam_za_kims_do_karczmy = /mapgoafter karczma
/def -mregexp -p200 -t'(Wraz z (.*) podazasz|Podazasz) za (.*) do wyjscia\.' _mapka_podazam_za_kims_do_wyjscia = /mapgoafter wyjscie
/def -mregexp -p200 -t'(Wraz z (.*) podazasz|Podazasz) za (.*) na wyjscie\.' _mapka_podazam_za_kims_na_wyjscie = /mapgoafter wyjscie
/def -mregexp -p200 -t'(Wraz z (.*) podazasz|Podazasz) za (.*) na gore\.' _mapka_podazam_za_kims_na_gore = /mapgoafter gora
/def -mregexp -p100 -t'(Wraz z (.*) podazasz|Podazasz) za (.*) na (.*)\.' _mapka_podazam_za_kims = /mapgoafter %{P4}

##
### Blokery.
##
/def -mregexp -F -t'Nie mozesz sie tam udac, gdyz lezysz.' _mapka_leze = /zawroc %{_chce_isc}%; /set _chce_isc=brak
/def -mregexp -F -t'Nie mozesz sie tam udac, gdyz siedzisz' _mapka_siedze = /zawroc %{_chce_isc}%; /set _chce_isc=brak
/def -mregexp -F -t'Nie widzisz zadnego wyjscia prowadzacego na (.*)\.' _mapka_nie_ma_wyjscia_ogolne = /zawroc %{P1}
/def -mregexp -F -t'Jestes tak zmeczony, ze nie mozesz dalej podazac w tym kierunku.' _mapka_zmeczylem_sie = /zawroc %{_chce_isc}%; /set _chce_isc=brak
/def -mregexp -F -t'Nie jestes zbyt pewny swojej umiejetnosci latania...' _mapka_mostu_brak = /zawroc %{_chce_isc}%; /set _chce_isc=brak
/def -mregexp -F -t'Troll zagradza ci droge' _mapka_troll_zagradza = /zawroc %{_chce_isc}%; /set _chce_isc=brak
/def -mregexp -F -t'Ruszasz razno na (.*), schodzac z wytyczonego traktu, jednak okazuje sie, ze nie dasz rady isc w tym kierunku.' _mapka_schodze_z_traktu =  /set _chce_isc=%{P1}%; /zawroc %{_chce_isc}%; /set _chce_isc=brak
/def -mregexp -F -t'Probujesz otworzyc dwuskrzydlowa brame, ale nie udaje ci sie to.' _mapka_brama1 =   /zawroc %{_chce_isc}%; /set _chce_isc=brak
/def -mregexp -F -t'Probujesz otworzyc drewniane wrota, ale nie udaje ci sie to.' _mapka_brama2 =   /zawroc %{_chce_isc}%; /set _chce_isc=brak
/def -mregexp -F -t'Probujesz otworzyc drewniane drzwi, ale nie udaje ci sie to.' _mapka_brama3 =   /zawroc %{_chce_isc}%; /set _chce_isc=brak
/def -mregexp -F -t'Forsowanie zamknietych drzwi nie jest najlepszym pomyslem.' _mapka_brama4 =   /zawroc %{_chce_isc}%; /set _chce_isc=brak
/def -mregexp -F -t'Probujesz otworzyc stalowa krate, ale nie udaje ci sie to.' _mapka_brama5 =   /zawroc %{_chce_isc}%; /set _chce_isc=brak
/def -mregexp -F -t'Probujesz otworzyc czerwona brame, ale nie udaje ci sie to.' _mapka_brama6 =   /zawroc %{_chce_isc}%; /set _chce_isc=brak
/def -mregexp -F -t'Probujesz otworzyc kamienne wrota, ale nie udaje ci sie to.' _mapka_brama7 =   /zawroc %{_chce_isc}%; /set _chce_isc=brak
/def -mregexp -F -t'Probujesz otworzyc okute wrota, ale nie udaje ci sie to.' _mapka_brama8 =   /zawroc %{_chce_isc}%; /set _chce_isc=brak
/def -mregexp -F -t'Probujesz otworzyc wrota, ale nie udaje ci sie to.' _mapka_brama9 =   /zawroc %{_chce_isc}%; /set _chce_isc=brak
/def -mregexp -F -t'Probujesz otworzyc niewielka furtke, ale nie udaje ci sie to.' _mapka_brama10 =   /zawroc %{_chce_isc}%; /set _chce_isc=brak
/def -mregexp -F -t'Probujesz otworzyc niskie drzwiczki w bramie, ale nie udaje ci sie to.' _mapka_brama11 =   /zawroc %{_chce_isc}%; /set _chce_isc=brak
/def -mregexp -F -t'Probujesz otworzyc drewniana brame, ale nie udaje ci sie to.' _mapka_brama12 =   /zawroc %{_chce_isc}%; /set _chce_isc=brak

/def -mregexp -F -t'Nie dasz rady otworzyc stalowej kraty, musisz sprobowac ja uniesc.' _mapka_oxen_krata =   /zawroc %{_chce_isc}%; /set _chce_isc=brak
/def -mregexp -F -t'Przygladasz sie uwaznie miejscu, na ktorego chcesz sie wspiac i oceniajac trudnosc wspinaczki stwierdzasz ze najpierw musisz troche odpoczac.' _mapka_renegaci_odpoczacz_trza = /mapgoafter zejdz do doliny
/def -mregexp -F -t'Opierzona skrzydlata bestia swoim cielskiem zagradza ci droge na .*\.' _mapka_bloker_gryf = /zawroc %{_chce_isc}%; /set _chce_isc=brak
/def -mregexp -Fp200 -t'Wasaty potezny krasnolud mowi hardo do ciebie. Dokad leziesz. Wara stad komu innemu glowe zawracac.' _mapka_bloker_zwiadowca = /zawroc %{_chce_isc}%; /set _chce_isc=brak
/def -mregexp -Fp200 -t'(Zapracowana mloda krasnoludka|Frina) mowi twardo: Gdzie sie pcha\?\!' _mapka_bloker_frina = /zawroc %{_chce_isc}%; /set _chce_isc=brak
/def -mregexp -Fp200 -t'(Njalla|Czerwononosa rudowlosa krasnoludka) wstaje, bierze zamach i rzuca kuflem w twoja strone, po czym siada za lawa, dajac ci do zrozumienia, ze nie lubi sie powtarzac.' _mapka_bloker_smoczyca = /zawroc %{_chce_isc}%; /set _chce_isc=brak
/def -mregexp -Fp200 -t'(Njalla|Czerwononosa rudowlosa krasnoludka) zagradza droge wyciagajac nogi tak, ze blokuja przejscie na zaplecze, po czym zasypia w najlepsze' _mapka_bloker_smoczyca2 = /zawroc %{_chce_isc}%; /set _chce_isc=brak
/def -mregexp -Fp200 -t'(Njalla|Czerwononosa rudowlosa krasnoludka) mowi do ciebie: Gdzie z tym pyskiem sie pchasz, no gdzie?' _mapka_bloker_smoczyca3 = /zawroc %{_chce_isc}%; /set _chce_isc=brak
/def -mregexp -Fp200 -t'(Njalla|Czerwononosa rudowlosa krasnoludka) nie podnoszac glowy mamrocze do ciebie niewyraznie: Nawet o tym nie mysl Bratenku, nawet o tym nie mysl.' _mapka_bloker_smoczyca4 = /zawroc %{_chce_isc}%; /set _chce_isc=brak
/def -mregexp -Fp200 -t'(Njalla|Czerwononosa rudowlosa krasnoludka) mowi do ciebie: Jeno Smoki moga tam wchodzic, winc si nie pchaj, kaj cie nie zapraszaja.' _mapka_bloker_smoczyca5 = /zawroc %{_chce_isc}%; /set _chce_isc=brak   
/def -mregexp -Fp700 -t'mowi hardo do ciebie: A ty gdzie\? Tam maja wstep tylko mahakamscy kowale.' _mapka_bloker_kowale = /zawroc %{_chce_isc}%; /set _chce_isc=brak
/def -mregexp -F -t'Wejscie tylko dla glow klanow.' _mapka_bloker_głowy =   /zawroc %{_chce_isc}%; /set _chce_isc=brak
/def -mregexp -F -t'Idziesz na polnocny-zachod, lecz zawracasz zrezygnowany, gdyz przejscie zostalo zasypane.' _mapka_bloker_zawalone1 = /zawroc %{_chce_isc}%; /set _chce_isc=brak
/def -mregexp -F -t'Idziesz na poludniowy-wschod, lecz zawracasz zrezygnowany, gdyz przejscie zostalo zasypane.' _mapka_bloker_zawalone2 = /zawroc %{_chce_isc}%; /set _chce_isc=brak
/def -mregexp -F -t'Niestety drzwi zdaja sie byc zaryglowane od wewnatrz.' _mapka_bloker_anchor = /zawroc %{_chce_isc}%; /set _chce_isc=brak
/def -mregexp -F -t'Szarpiesz energicznie za klamke, lecz drzwi stawiaja opor.' _mapka_bloker_wyzima_swiatynia = /zawroc %{_chce_isc}%; /set _chce_isc=brak
/def -mregexp -F -t'Pociagasz za klamke, ale drzwi sa zamkniete.' _mapka_bloker_wyzima_grod = /zawroc %{_chce_isc}%; /set _chce_isc=brak
/def -mregexp -F -t'(Czarnowlosa wysoka gnomka|Raila) zagradza ci droge.' _mapka_bloker_wyzima_periodicus = /zawroc %{_chce_isc}%; /set _chce_isc=brak
/def -mregexp -F -t'Moze najpierw wyjdz z wody' _mapka_bloker_monsarx_wodospad = /zawroc %{_chce_isc}%; /set _chce_isc=brak
/def -mregexp -F -t'Nie mozesz zejsc gdyz klapa jest zamknieta.' _mapka_bloker_wiocha_klapa = /zawroc %{_chce_isc}%; /set _chce_isc=brak
/def -mregexp -F -t'Dalsza podroz sciezka jest niemozliwa, gdyz przewrocony pojazd i porastajaca go roslinnosc zupelnie blokuje przejscie.' _mapka_bloker_dworek = /zawroc %{_chce_isc}%; /set _chce_isc=brak
/def -mregexp -F -t'Geste krzaki i porzucone narzedzia zupelnie blokuja dalsza podroz w tym kierunku. Niestety, musisz zawrocic.' _mapka_bloker_dworek_2 = /zawroc %{_chce_isc}%; /set _chce_isc=brak
/def -mregexp -F -t'Nie jestes pewny swojej umiejetnosci plywania w tej brudnej rzece...' _mapka_bloker_oxen_zielarz = /zawroc %{_chce_isc}%; /set _chce_isc=brak
/def -mregexp -F -t'Probujesz wdrapac sie na omszaly pien zagradzajacy droge, lecz na sliskiej korze osuwa ci sie noga i spadasz z powrotem na sciezke.' _mapka_bloker_lyria_pien = /zawroc %{_chce_isc}%; /set _chce_isc=brak
/def -mregexp -F -t'Podchodzisz pod drzwi na poludniu, jednak okazuja sie one zamkniete na klucz.' _mapka_bloker_scala_drzwi = /zawroc %{_chce_isc}%; /set _chce_isc=brak
/def -mregexp -F -t'Podchodzisz pod drzwi na polnocy, ktore nagle otwieraja sie z hukiem i wylatuje przez nie pijany mezczyzna omal na ciebie nie wpadajac. Zaraz potem drzwi zatrzaskuje sie.' _mapka_bloker_scala_drzwi_2 = /zawroc %{_chce_isc}%; /set _chce_isc=brak
##
### Komenda idź.
##

/def -mregexp -F -t'Wykonuje komende \'idz .*\'' _mapka_ide = /set _ide=1
/def -mregexp -F -p200 -t'Ruszasz (niespiesznie|marszem|truchtem|biegiem|szybkim biegiem) na gore.' _mapka_poszedlem_na_gore = /if ({_ide}=1) /mapgoafter gora%; /endif%; /set _ide=0
/def -mregexp -F -p100 -t'Ruszasz (niespiesznie|marszem|truchtem|biegiem|szybkim biegiem) na (.*).' _mapka_poszedlem = /if ({_ide}=1) /mapgoafter %{P2}%; /endif%; /set _ide=0


##
### Aliasy.
##

/alias alkierz /mapgo alkierz
/alias barak /mapgo barak
/alias barka /mapgo barka
/alias brama /mapgo brama
/alias brod /mapgo brod
/alias chata /mapgo chata
/alias chatka /mapgo chatka
/alias drabina /mapgo drabina
/alias drzwi /mapgo drzwi
/alias furtka /mapgo furtka
/alias ganek /mapgo ganek
/alias golebnik /mapgo golebnik
/alias jaskinia /mapgo jaskinia
/alias jaskinie /mapgo jaskinie
/alias kaplica /mapgo kaplica
/alias karczma /mapgo karczma
/alias klapa /mapgo klapa
/alias korytarz /mapgo korytarz
/alias kuchnia /mapgo kuchnia
/alias kurhan /mapgo kurhan
/alias kurnik /mapgo kurnik
/alias mlyn /mapgo mlyn
/alias most /mapgo most
/alias namiot /mapgo namiot
/alias ogrod /mapgo ogrod
/alias otwor /mapgo otwor
/alias palac /mapgo palac
/alias pieczara /mapgo pieczara
/alias przecisnij /mapgo przecisnij %{*}
/alias przejdz /mapgo przejdz %{*}
/alias przeplyn /mapgo przeplyn %{*}
/alias pomost /mapgo pomost
/alias rozsun /mapgo rozsun %{*}
/alias schody /mapgo schody
/alias sklep /mapgo sklep
/alias spizarnia /mapgo spizarnia
/alias stajnia /mapgo stajnia
/alias stodola /mapgo stodola
/alias straznica /mapgo straznica
/alias stryszek /mapgo stryszek
/alias szczelina /mapgo szczelina
/alias taras /mapgo taras
/alias ulica /mapgo ulica
/alias wejdz /mapgo wejdz %{*}
/alias wejscie /mapgo wejscie
/alias wespnij /mapgo wespnij %{*}
/alias wieza /mapgo wieza
/alias wslizgnij /mapgo wslizgnij %{*}
/alias wyj /mapgo wyjscie
/alias wyjdz /mapgo wyjdz %{*}
/alias wyjscie /mapgo wyjscie
/alias wynurz /mapgo wynurz %{*}
/alias zagroda /mapgo zagroda
/alias zajazd /mapgo zajazd
/alias zanurkuj /mapgo zanurkuj
/alias zejdz /mapgo zejdz %{*}
/alias zsun /mapgo zsun %{*}
/alias ob /mapgo ob %{*}