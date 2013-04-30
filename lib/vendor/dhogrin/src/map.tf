;------------------------------------------------------------------------
;			   ... LISTY ... 				  |
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
  do drzwi|\
  do gory na most|\
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
  na polnocny-zachod wdrapujac sie na zwalony pien i zeskakujac na druga strone|\
  na poludniowy-wschod wdrapujac sie na zwalony pien i zeskakujac na druga strone|\
  na pomost|\
  na schody|\
  na wyjscie|\
  na zachod, schodzac na plaze|\
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
  przez otwor na zewnatrz|\
  schodami do gory|\
  schodami na dol|\
  schodzisz na dol|\
  sciezka do lasku|\
  sciezka w kierunku ruin|\
  traktem w dol|\
  traktem w gore|\
  w dol schodow|\
  w dol traktem|\
  w gestwine|\
  w glab ciemnosci|\
  w glab otworu|\
  w gore traktem|\
  w kierunku otworu|\
  w strone morza|\
  w strone otworu|\
  w strone skraju torfowiska|\
  za palisade|\
  znikajac w podwojach warowni

/set _map_custom_exits=\
  alkierz|\
  alkowa|\
  altana|\
  arena|\
  bank|\
  barak|\
  barka|\
  biblioteka|\
  brama|\
  brod|\
  brzeg|\
  chata|\
  chatka|\
  dom|\
  domek|\
  drabina|\
  drzwi|\
  furtka|\
  gabinet|\
  ganek|\
  golebnik|\
  gospoda|\
  jaskinia|\
  jaskinie|\
  kamienica|\
  kantyna|\
  kaplica|\
  karcer|\
  karczma|\
  klapa|\
  korytarz|\
  kuchnia|\
  kurhan|\
  kurnik|\
  kuznia|\
  lazaret|\
  lodka|\
  magazyn|\
  mlyn|\
  most|\
  namiot|\
  ogrod|\
  otwor|\
  palac|\
  pawilon|\
  pieczara|\
  pietro|\
  poczta|\
  pokoik|\
  pomost|\
  sala|\
  salon|\
  sciezka|\
  schodki|\
  schody|\
  sklep|\
  spizarnia|\
  stajnia|\
  stodola|\
  stragan|\
  straznica|\
  stryszek|\
  swiatynia|\
  szczelina|\
  taras|\
  targ|\
  ulica|\
  wejscie|\
  wiatrak|\
  wieza|\
  wyjscie|\
  wyrwa|\
  zagroda|\
  zajazd|\
  zanurkuj|\
  zielarnia

/set _map_custom_exits_with_arg=\
  dotknij|\
  obroc|\
  odsun|\
  otworz|\
  pchnij|\
  podnies|\
  przecisnij|\
  przeczolgaj|\
  przedrzyj|\
  przejdz|\
  przeplyn|\
  przeskocz|\
  przesun|\
  przyloz|\
  rozsun|\
  skocz|\
  wdrap|\
  wejdz|\
  wespnij|\
  wskocz|\
  wslizgnij|\
  wyjdz|\
  wynurz|\
  zejdz|\
  zeskocz|\
  zsun

/set _map_bloker_list=\
  Chcesz wpasc do rozpadliny\? Taka decyzje musisz potwierdzic.|\
  (Czarnowlosa wysoka gnomka|Raila) zagradza ci droge.|\
  Droge zastepuje ci barczysty straznik mowiac: Prosze okazac kwit magazynowy lub wskazac towar do przechowania.|\
  Forsowanie zamknietych drzwi nie jest najlepszym pomyslem.|\
  Geste krzaki i porzucone narzedzia zupelnie blokuja dalsza podroz w tym kierunku. Niestety, musisz zawrocic.|\
  Idziesz na polnocny-zachod, lecz zawracasz zrezygnowany, gdyz przejscie zostalo zasypane.|\
  Idziesz na poludniowy-wschod, lecz zawracasz zrezygnowany, gdyz przejscie zostalo zasypane.|\
  Jestes tak zmeczony, ze nie mozesz dalej podazac w tym kierunku\.|\
  Ktos inny juz to zaczal robic. Otwor nie jest dosc szeroki by udalo sie to dwom osobom na raz.|\
  mezczyzna stoi ci na drodze.|\
   mowi hardo do ciebie: A ty gdzie\? Tam maja wstep tylko mahakamscy kowale.|\
  Moze najpierw wyjdz z wody|\
  Musisz stanac w kolejce i poczekac na audiencje.|\
  Niestety drzwi zdaja sie byc zaryglowane od wewnatrz.|\
  Niestety, wyglada na to, ze wiecej osob niz jedna sie tam nie zmiesci.|\
  Nie dasz rady otworzyc stalowej kraty, musisz sprobowac ja uniesc.|\
  Nie jestes pewny swojej umiejetnosci plywania w tej brudnej rzece...|\
  Nie jestes zbyt pewny swojej umiejetnosci latania...|\
  Nie masz dalej wstepu.|\
  Nie masz jak sie stad wydostac, gdyz klapa w suficie jest zamknieta.|\
  Nie mozesz sie tam udac, gdyz lezysz.|\
  (Nie mozesz sie tam udac, gdyz |)([Op]pierzona skrzydlata bestia|[Ss]krzydlaty lwiopodobny potwor) swoim cielskiem zagradza ci droge( ucieczki|) na |\
  Nie mozesz sie tam udac, gdyz siedzisz|\
  Nie mozesz sie tam udac, gdyz (.*) blokuje ci droge na |\
  Nie mozesz zejsc gdyz klapa jest zamknieta.|\
  (Njalla|Czerwononosa rudowlosa krasnoludka) mowi do ciebie: Gdzie z tym pyskiem sie pchasz, no gdzie?|\
  (Njalla|Czerwononosa rudowlosa krasnoludka) mowi do ciebie: Jeno Smoki moga tam wchodzic, winc si nie pchaj, kaj cie nie zapraszaja.|\
  (Njalla|Czerwononosa rudowlosa krasnoludka) nie podnoszac glowy mamrocze do ciebie niewyraznie: Nawet o tym nie mysl Bratenku, nawet o tym nie mysl.|\
  (Njalla|Czerwononosa rudowlosa krasnoludka) wstaje, bierze zamach i rzuca kuflem w twoja strone, po czym siada za lawa, dajac ci do zrozumienia, ze nie lubi sie powtarzac.|\
  (Njalla|Czerwononosa rudowlosa krasnoludka) zagradza droge wyciagajac nogi tak, ze blokuja przejscie na zaplecze, po czym zasypia w najlepsze|\
  Ochotnik zagradza ci droge\.|\
  Odpadasz od sciany i lecisz w dol, jednak dzieki niewielkiej wysokosci udaje ci sie zgrabnie wyladowac na ziemi.|\
  Odpadasz od sciany i lecisz w dol. Przez chwile spadasz, zaraz jednak uderzasz o ziemie, raniac sie.|\
  Pociagasz za klamke, ale drzwi sa zamkniete.|\
  Podchodzisz pod drzwi na polnocy, ktore nagle otwieraja sie z hukiem i wylatuje przez nie pijany mezczyzna omal na ciebie nie wpadajac. Zaraz potem drzwi zatrzaskuje sie.|\
  Podchodzisz pod drzwi na poludniu, jednak okazuja sie one zamkniete na klucz.|\
  Po chwili wahania decydujesz sie nie schodzic.|\
  Probujesz otworzyc (.*|)(brame|wrota|drzwi|krate|furtke|drzwiczki w bramie|wrota z brazu), ale nie udaje ci sie to\.|\
  Probujesz przekroczyc brame, ale (.*) zastepuje ci droge.|\
  Probujesz sie ruszyc na (.*), jednak pajecze sieci, w ktore sie w miedzy czasie zaplatales, uniemozliwiaja ci to.|\
  Probujesz sie wcisnac do otworu, jednakze ktos najwyrazniej jest juz w srodku, a jest tam zbyt wasko by zmiescily sie tam dwie osoby na raz.|\
  Probujesz wdrapac sie na omszaly pien zagradzajacy droge, lecz na sliskiej korze osuwa ci sie noga i spadasz z powrotem na sciezke.|\
  Probujesz wspiac sie po pniu, ale robisz to zbyt slamazarnie i zjezdzasz z powrotem w dol.|\
  Przygladasz sie uwaznie miejscu, na ktorego chcesz sie wspiac i oceniajac trudnosc wspinaczki stwierdzasz ze najpierw musisz troche odpoczac.|\
  Smok zagradza ci przejscie do pieczary.|\
  Szarpiesz energicznie za klamke, lecz drzwi stawiaja opor.|\
  Troll zagradza ci droge\.|\
  Troll zastawia Ci wejscie.|\
  Tylko czlonkowie Stowarzyszenia Polelfow moga tam wejsc.|\
  Uuups... droga sie skonczyla... Najlepiej bedzie jak zawrocisz!|\
  Wasaty potezny krasnolud mowi hardo do ciebie. Dokad leziesz. Wara stad komu innemu glowe zawracac.|\
  Wejscie tylko dla glow klanow.|\
  Wydaje ci sie, ze kowal jest bardzo znany z tego, ze nigdy nie ma go w kuzni. W tej wiosce konia nie podkujesz i musisz poszukac gdzie indziej.|\
  (Zapracowana mloda krasnoludka|Frina) mowi twardo: Gdzie sie pcha\?\!|\
   zastawia przejscie do poludniowej nawy|\
  Zbyt wiele rzeczy cie przytlacza, by udalo ci sie z tym wszystkim wgramolic na gore.

  
  
  
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
  /if ({_map_room_id}!~{*}) \
    /_map_send lookup:%{*}%; \
  /endif

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
  
/def -aL -mregexp -t'set:(.*):(.*)' _map_set = \
  /set _map_%{P1}=%{P2}
  
/def -aL -mregexp -t'room:id:(.*)' _map_room_id = \
  /set _map_room_id=%{P1}
  

;------------------------------------------------------------------------
;			   ... PORUSZANIE SIE ... 			  |
;------------------------------------------------------------------------  
  
/eval /def -q -mregexp -h'SEND ^(?:|przemknij (?:sie |)(?:z druzyna |))(%{_map_standard_exits})$$' _map_hooks_ide = \
  /_map_go exit:%%{P1}

/eval /def -q -mregexp -h'SEND ^(%{_map_custom_exits})$$' _map_hooks_customy = \
  /_map_go custom:%%{P1}

/eval /def -q -mregexp -h'SEND ^((%{_map_custom_exits_with_arg})( .*|))$$' _map_hooks_customy_2 = \
  /_map_go custom:%%{P1}
  
;------------------------------------------------------------------------
;		   ... NIECH SIE KULKA KRECI! ... 			  |
;------------------------------------------------------------------------

/eval /def -mregexp -Fp500 -t'(Wraz z (.*) podazasz|Podazasz)(?:| skradajac sie) za (.*) (%{_map_follows_list})\.' _map_podazam_za_kims_rozne = /_map_go follow:%%{P4}
/def -mregexp -Fp500 -t'(Wraz z (.*) podazasz|Podazasz)(?:| skradajac sie) za (.*) na gore\.' _map_podazam_za_kims_gora = /_map_go exit:gora
/def -mregexp -Fp500 -t'(Wraz z (.*) podazasz|Podazasz)(?:| skradajac sie) za (.*) na (dol|polnoc|poludnie|wschod|zachod|polnocny-wschod|polnocny-zachod|poludniowy-wschod|poludniowy-zachod)\.' _map_podazam_za_kims_standard = /_map_go exit:%{P4}

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
/set _map_room_wiatrak=edc37566-a949-11e2-97ca-9c4e368dac0c
/set _map_room_pustynia_rozpadlina=a1e5a884-8992-11e2-bebe-9c4e368dac0c

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
/def -mregexp -Fp500 -t'Mimo rozpaczliwej proby zlapania sie czegos, momentalnie pokonujesz te kilkanascie stop, ciezko uderzajac o ziemie.' _map_teleport_wiatrak = /_map_teleport %{_map_room_wiatrak}
/def -mregexp -Fp500 -t'Rozpadlina ciagnie sie na polnoc, a szczelina w scianie prowadzi w dol.' _map_teleport_pustynia_rozpadlina = /_map_teleport %{_map_room_pustynia_rozpadlina}


;------------------------------------------------------------------------
;		   ... TELEPORTY - STATKI (PRO) ...			  |
;------------------------------------------------------------------------  

/set _map_room_statek_bryza=520c3f48-adb0-11e2-a79b-9c4e368dac0c
/set _map_room_statek_bryza_novigrad=9f9f54ec-8c46-11e2-aad8-9c4e368dac0c
/set _map_room_statek_bryza_daevon=a11082f6-89b2-11e2-878b-2af7728612b4
/set _map_room_statek_bryza_blaviken_novigrad=59e92c3e-89df-11e2-9919-9c4e368dac0c
/set _map_room_statek_bryza_blaviken_daevon=5acdbbf6-89df-11e2-9919-9c4e368dac0c

/def -mregexp -Fp500 -t'Poklad feluki \'Bryza Pontaru\'.' _map_teleport_statek_bryza = \
  /_map_teleport %{_map_room_statek_bryza}
/def -mregexp -Fp500 -t'(Flavius|Jasnowlosy sniady elf) krzyczy: Doplynelismy do portu Blaviken w krolestwie Redanii! Mozna wysiadac!' _map_teleport_statek_bryza_1 = \
  /if ({_map_kierunek}=~'Novigrad') \
    /set _map_port=%{_map_room_statek_bryza_blaviken_novigrad}%; \
  /else \
    /set _map_port=%{_map_room_statek_bryza_blaviken_daevon}%; \
  /endif
/def -mregexp -Fp500 -t'(Flavius|Jasnowlosy sniady elf) krzyczy: Doplynelismy do Novigradu w krolestwie Redanii! Mozna wysiadac!' _map_teleport_statek_bryza_2 = \
  /set _map_kierunek=Daevon%; \
  /set _map_port=%{_map_room_statek_bryza_novigrad}
/def -mregexp -Fp500 -t'(Flavius|Jasnowlosy sniady elf) krzyczy: Doplynelismy do Daevon, w krolestwie Kaedwen! Mozna wysiadac!' _map_teleport_statek_bryza_3 = \
  /set _map_kierunek=Novigrad%; \
  /set _map_port=%{_map_room_statek_bryza_daevon}
/def -mregexp -Fp500 -t'Schodzisz z feluki\.' _map_teleport_statek_bryza_schodze = \
  /_map_teleport %{_map_port}

; ---------------------------------

/set _map_room_statek_prom1=914ff610-adbd-11e2-a79b-9c4e368dac0c
/set _map_room_statek_prom1_novigrad=52a3e878-8c38-11e2-9ba5-9c4e368dac0c
/set _map_room_statek_prom1_stocznia=708ed0c4-9e20-11e2-852c-36be4148278d
/set _map_room_statek_prom1_nadrzecze=e305432e-897e-11e2-93e8-9c4e368dac0c
  
/def -mregexp -Fp500 -t'Wchodzisz na szeroki plaskodenny prom.' _map_teleport_statek_prom1 = \
  /_map_teleport %{_map_room_statek_prom1}
/def -mregexp -Fp500 -t'(Elich|Dojrzaly markotny mezczyzna) krzyczy: Doplynelismy do wsi Nadrzecze w Temerii! Mozna wysiadac!' _map_teleport_statek_prom1_nadrzecze = \
  /set _map_port=%{_map_room_statek_prom1_nadrzecze}
/def -mregexp -Fp500 -t'(Elich|Dojrzaly markotny mezczyzna) krzyczy: Doplynelismy do Stoczni Novigradzkiej! Mozna wysiadac!' _map_teleport_statek_prom1_stocznia = \
  /set _map_port=%{_map_room_statek_prom1_stocznia}
/def -mregexp -Fp500 -t'(Elich|Dojrzaly markotny mezczyzna) krzyczy: Doplynelismy do przystani pod Novigradem! Mozna wysiadac!' _map_teleport_statek_prom1_novi = \
  /set _map_port=%{_map_room_statek_prom1_novigrad}
/def -mregexp -Fp500 -t'Schodzisz z promu\.' _map_teleport_statek_prom1_schodze = \
  /_map_teleport %{_map_port}
  
; ---------------------------------

/set _map_room_statek_prom2=0bd87592-ae9f-11e2-8f32-d609546a3813
/set _map_room_statek_prom2_temeria=cecd0d20-891e-11e2-9217-9c4e368dac0c
/set _map_room_statek_prom2_okolice_piany=2d65b456-89cc-11e2-9919-9c4e368dac0c
 
/def -mregexp -Fp500 -t'Wchodzisz na szeroki drewniany prom.' _map_teleport_statek_prom2 = \
  /_map_teleport %{_map_room_statek_prom2}
/def -mregexp -Fp500 -t'(Strag|Mlody smutny mezczyna) krzyczy: Doplynelismy do przystani opodal Piany! Mozna wysiadac!' _map_teleport_statek_prom2_okolice_piany = \
  /set _map_port=%{_map_room_statek_prom2_okolice_piany}
/def -mregexp -Fp500 -t'(Strag|Mlody smutny mezczyna) krzyczy: Doplynelismy do przystani po Temerskiej stronie Pontaru! Mozna wysiadac!' _map_teleport_statek_prom2_temeria = \
  /set _map_port=%{_map_room_statek_prom2_temeria}

; ---------------------------------

/set _map_room_statek_prom3=eb39696e-aea2-11e2-8f32-d609546a3813
/set _map_room_statek_prom3_oxenfurt=38265a6c-8b7a-11e2-af6b-9c4e368dac0c
/set _map_room_statek_prom3_grabowa=02032198-897e-11e2-93e8-9c4e368dac0c

/def -mregexp -Fp500 -t'Wchodzisz na duzy solidny prom.' _map_teleport_statek_prom3 = \
  /_map_teleport %{_map_room_statek_prom3}
/def -mregexp -Fp500 -t'(Strag|Mlody smutny mezczyna) krzyczy: Doplynelismy do przystani w Oxenfurcie na polnocnym brzegu Pontaru! Mozna wysiadac!' _map_teleport_statek_prom3_oxenfurt = \
  /set _map_port=%{_map_room_statek_prom3_oxenfurt}
/def -mregexp -Fp500 -t'(Strag|Mlody smutny mezczyna) krzyczy: Doplynelismy do przystani w Grabowej Buchcie na poludniowym brzegu Pontaru! Mozna wysiadac!' _map_teleport_statek_prom3_grabowa = \
  /set _map_port=%{_map_room_statek_prom3_grabowa}

; ---------------------------------

/set _map_room_statek_szkuta1=26c6cb46-adf6-11e2-be89-9c4e368dac0c
/set _map_room_statek_szkuta1_novigrad=5aa87836-8c38-11e2-9ba5-9c4e368dac0c
/set _map_room_statek_szkuta1_oxenfurt=6c9c14e4-8b7a-11e2-af6b-9c4e368dac0c
/set _map_room_statek_szkuta1_bialy_most=3194f3c0-8b7f-11e2-af6b-9c4e368dac0c

/def -mregexp -Fp500 -t'Wchodzisz na stara niewielka szkute\.' _map_teleport_statek_szkuta1 = \
  /_map_teleport %{_map_room_statek_szkuta1}
/def -mregexp -Fp500 -t'(Pluskolec|Chudy zdenerwowany mezczyzna) krzyczy: Doplynelismy do poludniowego portu Novigradu w krolestwie Redanii! Mozna wysiadac!' _map_teleport_statek_szkuta1_novigrad = \
  /set _map_port=%{_map_room_statek_szkuta1_novigrad}
/def -mregexp -Fp500 -t'(Pluskolec|Chudy zdenerwowany mezczyzna) krzyczy: Doplynelismy do Oxenfurtu! Mozna wysiadac!' _map_teleport_statek_szkuta1_oxenfurt = \
  /set _map_port=%{_map_room_statek_szkuta1_oxenfurt}
/def -mregexp -Fp500 -t'(Pluskolec|Chudy zdenerwowany mezczyzna) krzyczy: Doplynelismy do Bialego Mostu! Mozna wysiadac!' _map_teleport_statek_szkuta1_bialymost = \
  /set _map_port=%{_map_room_statek_szkuta1_bialy_most}
/def -mregexp -Fp500 -t'Schodzisz ze szkuty\.' _map_teleport_statek_szkuta1_schodze = \
  /_map_teleport %{_map_port}

; ---------------------------------

/set _map_room_statek_zaglowiec1=e2f954f4-aea6-11e2-8f32-d609546a3813
/set _map_room_statek_zaglowiec1_novigrad=5b14bc8a-8c38-11e2-9ba5-9c4e368dac0c
/set _map_room_statek_zaglowiec1_rozrog_novigrad=
/set _map_room_statek_zaglowiec1_rozrog_baccala=
/set _map_room_statek_zaglowiec1_baccala=2162cc54-9e24-11e2-852c-36be4148278d

/def -mregexp -Fp500 -t'Wchodzisz na dwumasztowy nilfgaardzki statek.' _map_teleport_statek_zaglowiec1 = \
  /_map_teleport %{_map_room_statek_zaglowiec1}
/def -mregexp -Fp500 -t'(Charonda|Otyly czerwononosy mezczyzna) krzyczy: Doplynelismy do poludniowego portu Novigradu w krolestwie Redanii! Mozna wysiadac!' _map_teleport_statek_zaglowiec1_novigrad = \
  /set _map_port=%{_map_room_statek_zaglowiec1_novigrad}%; \
  /set _map_kierunek=Baccala
/def -mregexp -Fp500 -t'(Charonda|Otyly czerwononosy mezczyzna) krzyczy: Doplynelismy do Baccali! Mozna wysiadac!' _map_teleport_statek_zaglowiec1_baccala = \
  /set _map_port=%{_map_room_statek_zaglowiec1_baccala}%; \
  /set _map_kierunek=Novigrad
/def -mregexp -Fp500 -t'(Charonda|Otyly czerwononosy mezczyzna) krzyczy: Doplynelismy do przystani pod twierdza Rozrog! Mozna wysiadac!' _map_teleport_statek_zaglowiec1_rozrog = \
  /if ({_map_kierunek}=~'Novigrad') \
    /set _map_port=%{_map_room_statek_zaglowiec1_rozrog_novigrad}%; \
  /else \
    /set _map_port=%{_map_room_statek_zaglowiec1_rozrog_baccala}%; \
  /endif
/def -mregexp -Fp500 -t'Schodzisz ze statku\.' _map_teleport_statek_zaglowiec1_schodze = \
  /_map_teleport %{_map_port}
 
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

/eval /def -mregexp -Fp500 -t'%{_map_bloker_list}' _map_blokery = /_map_bloker
