;------------------------------------------------------------------------
;			   ... ZASLONA ... 				  |
;------------------------------------------------------------------------

/def -mregexp -Fp160 -t'Probujesz zaslonic (.*) przed ciosami (.*), jednak nie jestes w stanie tego uczynic\.' _zaslona_moja_nieudana = \
  /test _walka_show_zaslona("false","Ja", {P1}, {P2})
/def -mregexp -Fp160 -t'Zrecznie zaslaniasz (.*) przed ciosami (.*)\.' _zaslona_moja_udana = \
  /test _walka_show_zaslona("true","Ja", {P1}, {P2})
/def -mregexp -Fp160 -t' zrecznie zaslania (.*) przed ((twoimi) ciosami|ciosami (.*))\.' _zaslona_czyjas_udana = \
  /test _walka_show_zaslona("true",{PL}, {P1}, strcat({P3},{P4}))
/def -mregexp -Fp160 -t' probuje zaslonic (.*) przed ((twoimi) ciosami|ciosami (.*)), jednak nie jest w stanie tego uczynic\.' _zaslona_czyjas_nieudana = \
  /test _walka_show_zaslona("false",{PL}, {P1}, strcat({P3},{P4}))

;------------------------------------------------------------------------
;			   ... WYCOFKA ... 				  |
;------------------------------------------------------------------------

/def -mregexp -Fp160 -t'Unosisz swoja (.*) i szybko przesuwasz sie za (.*), kryjac sie przed atakami (.*)\.' _wycofka_moja_udana = \
  /test _walka_show_wycofka("true","Ja", {P2}, {P3})
/def -mregexp -Fp160 -t'Unosisz swoja (.*) i przesuwasz sie w strone (.*), bezskutecznie probujac skryc sie za [^ ]+ przed atakami (.*)\.' _wycofka_moja_nieudana = \
  /test _walka_show_wycofka("false","Ja", {P2}, {P3})
/def -mregexp -Fp160 -t' unosi swoja (.*) i szybko przesuwa sie za (.*), kryjac sie przed ((twoimi) atakami|atakami (.*))\.' _wycofka_czyjas = \
  /test _walka_show_wycofka("true",{PL}, {P2}, strcat({P4},{P5}))
/def -mregexp -Fp160 -t' unosi swoja (.*) i szybko przesuwa sie w ((twoja) strone|strone (.*)), bezskutecznie probujac skryc sie za [^ ]+ przed ((twoimi) atakami|atakami (.*))\.' _wycofka_czyjas_nieudana = \
  /test _walka_show_wycofka("false",{PL}, {P4-ciebie}, strcat({P6},{P7}))

;------------------------------------------------------------------------
;			   ... PRZELAMANIE ... 				  |
;------------------------------------------------------------------------
  
/def -mregexp -Fp160 -t'Rzucasz sie na (.*) przebijajac sie przez [^ ]+ ochrone\.' _przelamanie_moje_udane = \
  /test _walka_show_przelamanie("true","Ja", {P1})
/def -mregexp -Fp160 -t'Bezskutecznie rzucasz sie na (.*), probujac przebic sie przez [^ ]+ ochrone\.' _przelamanie_moje_nieudane = \
  /test _walka_show_przelamanie("false","Ja", {P1})
/def -mregexp -Fp160 -t' rzuca sie na (.*) przebijajac sie przez [^ ]+ ochrone\.' _przelamanie_czyjes_udane = \
  /test _walka_show_przelamanie("true",{PL}, {P1})
/def -mregexp -Fp160 -t' rzuca sie na (.*), bezskutecznie probujac przebic sie przez [^ ]+ ochrone\.' _przelamanie_czyjes_nieudane = \
  /test _walka_show_przelamanie("false",{PL}, {P1})


;------------------------------------------------------------------------
;			   ... ATAKI ... 				  |
;------------------------------------------------------------------------
  
/def -mregexp -p140 -t'^Atakujesz ([A-za-z ]+)\.$' _walka_ustaw_cel_ataku_1 = \
  /test _walka_show_atak("Ja", {P1})%; \
  /set cel_ataku=$[tolower({P1})]
/def -mregexp -p140 -t'Atakujesz ([A-za-z ]+), lecz ([A-za-z ]+) zagradza ci droge\.$' _walka_ustaw_cel_ataku_2 = \
  /set cel_ataku=$[tolower({P1})]
  

/def -mregexp -p141 -t'Nikt nie atakuje ' _walka_nikt_nie_atakuje
/def -mregexp -p140 -t'^([A-Za-z ]+) atakuje ([A-Za-z ]+)[.!]' _walka_atak_standard = \
  /test _walka_show_atak({P1},{P2},"")
/def -mregexp -p140 -t'Glosno wyjac z pochylonym nisko lbem, (.*) rzuca sie na (.*), niczym wyglodnialy wilk polujacy na swa ofiare[!.]' _walka_atak_ok = \
  /test _walka_show_atak({P1},{P2},"Ogrza Kompania")
/def -mregexp -p140 -t' przerazliwie ryczac i toczac piane z pyska niczym wsciekly byk atakuje (.*)\.' _walka_atak_zaladek = \
  /test _walka_show_atak({P1},{P2},"Wielki Zoladek?")
/def -mregexp -p140 -t'Z typowym krasnoludzkim zacietrzewieniem (.*) rzuca sie na (.*) nie baczac na to, ze moze niebawem przyjdzie [^ ]+ dolaczyc do swych Przodkow[!.]' _walka_atak_kp = \
  /test _walka_show_atak({P1},{P2},"Kult Przodkow")
/def -mregexp -p140 -t' mruzac oczy w oczekiwaniu plynacej z walki rozkoszy rzuca sie na (.*)[!.]' _walka_atak_mc_sl = \
  /test _walka_show_atak({PL},{P1},"Mutanci Chaosu - Slaanesh")
/def -mregexp -p140 -t' zanoszac sie szalonym smiechem rzuca sie na (.*)[!.]' _walka_atak_mc_rh = \
  /test _walka_show_atak({PL},{P1},"Mutanci Chaosu - Rhasneth")
/def -mregexp -p140 -t' glosno krzyczac: Krew dla Boga Krwi! Czaszki dla Tronu Czaszek! rzuca sie na (.*)[!.]' _walka_atak_mc_kh = \
  /test _walka_show_atak({PL},{P1},"Mutanci Chaosu - Khorne")
/def -mregexp -p140 -t' z pelnym przebieglosci blyskiem w oku rzuca sie na (.*)[!.]' _walka_atak_mc_tz = \
  /test _walka_show_atak({PL},{P1},"Mutanci Chaosu - Tzeentch")
/def -mregexp -p140 -t' przyzywajac chrypiacym glosem imie Nurgla rzuca sie na (.*)[!.]' _walka_atak_mc_nu = \
  /test _walka_show_atak({PL},{P1},"Mutanci Chaosu - Nurgle")
/def -mregexp -p140 -t' wykrzykujac glosno swoja nienawisc rzuca sie na (.*)[!.]' _walka_atak_mc_ma = \
  /test _walka_show_atak({PL},{P1},"Mutanci Chaosu - Malal")
/def -mregexp -p140 -t' wykrzywiajac twarz w okrutnym grymasie rzuca sie na (.*)[!.]' _walka_atak_sc = \
  /test _walka_show_atak({PL},{P1},"Komando Scoia'tael")
/def -mregexp -p140 -t'Przy ogluszajacym akompaniamencie okrzyku bojowego \'von Raugen!\' (.*) rzuca sie na (.*), wiazac [^ ]+ walka!' _walka_atak_vr = \
  /test _walka_show_atak({P1},{P2},"Von Raugen")
/def -mregexp -p140 -t'W oczach (.*) rozpala sie swiety ogien nienawisci i z imieniem Morra na ustach rzuca sie do walki z (.*)[!.]' _walka_atak_morr = \
  /test _walka_show_atak({P1},{P2},"Wyznanie Morra")

;------------------------------------------------------------------------
;			   ... ROZKAZY ... 				  |
;------------------------------------------------------------------------

/def -Fp160 -mregexp -t'Glosno wypowiadasz rozkaz, chyba jednak nikt cie nie zrozumial!' _walka_wydalem_rozkaz_nieudany = \
  /_walka_cooldown_rozkaz 15
/def -Fp160 -mregexp -t'Wydajesz rozkaz ' _walka_wydalem_rozkaz_udany = \
  /_walka_cooldown_rozkaz 15

;------------------------------------------------------------------------
;			   ... INNE ... 				  |
;------------------------------------------------------------------------  
  
/def -Fp10 -mregexp -t'^(> )*Zabil(a|e)s( [^ ]+)* ([^ ]+)\.$'  _walka_kill_my = \
  /test ++_licznik_%{P4}%;\
  /test ++_sesja_%{P4}%;\
  /test ++_suma_licznik %; \
  /eval /substitute -p %{PL}@{xBCred}%{P0}@{nBCgreen} (%%{_sesja_%P4}/%%{_licznik_%P4}/%%{_suma_licznik})%; \
  /echo Dnia: $[ftime("%d-%m-%Y (%A)",time())] o godzinie: $[ftime("%T",time())]: %P0 %PR %|/writefile -a lista_zabojstw.txt
  
/def -mregexp -p140 -t' (zabil(a|)) (.*)\.' _walka_kill = \
  /substitute -p  @{Cbgred}=====]@{n} @{BCyellow}%{PL} @{CRed}%{P1} @{BCblue}%{P3}@{BCwhite}.
  
/def -agL -Fp160 -mregexp -t' przymierza sie do odciecia (.*) drogi ucieczki\.' _walka_blokowanie_wyjscia = \
  /test _walka_show_blokowanie({PL},{P1})%; \
  /_walka_cooldown_blok 4
  
/def -mregexp -Fp160 -t' wskazuje (.*) jako cel ataku\.' _walka_wskazanie_celu_ataku = \
  /set druzyna_L=$[tolower({PL})]%; \
  /let __kogo=$[tolower({P1})]%; \
  /set cel_ataku=%{__kogo}%; \
  /test _walka_prompt_atak({__kogo}, "cel ataku")
  
/def -mregexp -Fp160 -t'Wskazujesz (.*) jako cel ataku\.' _walka_wskazanie_celu_ataku_moje = \
  /set druzyna_L=%{myName}%; \
  /let __kogo=$[tolower({P1})]%; \
  /set cel_ataku=%{__kogo}


/def -mregexp -Fp160 -t' wskazuje (.*) jako cel obrony\.' _walka_wskazanie_celu_obrony = \
  /set druzyna_L=$[tolower({PL})]%; \
  /let __kogo=$[tolower({P1})]%; \
  /if ({__kogo}=~"siebie") /let __kogo=$(/odmien_M_B %{druzyna_L})%; /endif%; \
  /if ({__kogo}!~"ciebie") /_walka_prompt_zaslona %{__kogo}%; /endif


  
;------------------------------------------------------------------------
;			   ... KOMENDY ... 				  |
;------------------------------------------------------------------------
  
/def zabij = \
  /_zabij %{*}
  
/def _zabij = \
  /let __kogo=%{*}%; \
  zabij %{__kogo}%; \
  /if ({_opcje_walka_rozkazywanie}==1 & {druzyna_L}=~{myName}) \
    rozkaz druzynie zabic %{__kogo}%; \
  /endif%; \
  /if ({_opcje_walka_wskazywanie_celu}==1 & {druzyna_L}=~{myName}) \
    wskaz %{__kogo} jako cel ataku%; \
  /endif%; \
  /if ({_opcje_walka_wskazywanie}==1 & {druzyna_L}=~{myName}) \
    wskaz %{__kogo}%; \
  /endif%; \
  /if ({_opcje_walka_patrzenie}==1 & {druzyna_L}=~{myName}) \
    popatrz morderczo na %{__kogo}%; \
  /endif

/def prz = \
  /_przelam_B %{*}
  
  
/def _przelam_B = \
  /let __kogo_B=%{*}%; \
  /if ({__kogo_B}=~"") \
    /return%; \
  /endif%; \
  /let __kogo_M=$(/odmien_B_M %{__kogo_B})%; \
  /_przelam %{__kogo_M}
  
/def _przelam = \
  /def -Fp150 -ag -n1 -mregexp -t'^Czujesz sie' _zmeczenie_lap_po_lamaniu%; \
  /let __kogo_M=%{*}%; \
  /let __kogo_D=$(/odmien_M_D %{__kogo_M})%; \
  /let __kogo_B=$(/odmien_M_B %{__kogo_M})%; \
  przestan kryc sie za zaslona%; \
  przelam obrone %{__kogo_D}%; \
  zabij %{__kogo_B}
  
/def _zaslon = \
  /let __kogo=%{*}%; \
  zaslon %{__kogo}
  
/def _order_zaslona = \
  /let __kogo=%{*}%; \
  rozkaz druzynie zaslonic %{__kogo}%; \
  wskaz %{__kogo} jako cel obrony
  
/def _set_key = \
  /let __key=%{1}%; \
  /let __action=%{2}%; \
  /purge key_%{__key}%; \
  /def key_%{__key}=%{__action}

;------------------------------------------------------------------------
;			   ... KOLORKI ... 				  |
;------------------------------------------------------------------------  
  
/set color_evil=red
/set color_neutral=magenta
/set color_good=blue

;------------------------------------------------------------------------
;			   ... PROMPTY ... 				  |
;------------------------------------------------------------------------

/def _walka_prompt_przelamanie_M = \
  /let __kogo=$(/odmien_M_B %{*})%; \
  /_walka_prompt_przelamanie %{__kogo}

/def _walka_prompt_przelamanie = \
  /let __kogo_B=$[tolower({*})]%; \
  /let __kogo_M=$(/odmien_B_M %{__kogo_B})%; \
  /let __kogo_D=$(/odmien_M_D %{__kogo_M})%; \
  /if ({__kogo_B}=~{cel_ataku}) \
    /let __key1=F1%; \
    /let __key2=F2%; \
  /else \
    /let __key1=F3%; \
    /let __key2=F4%; \
  /endif%; \
  /_walka_prompt_header%; \
  /test _set_key({__key1}, "/_przelam %{__kogo_M}")%; \
  /test _walka_prompt_line("%{__key1} - przelam obrone %{__kogo_D}")%; \
  /if ({druzyna_L}=~{myName}) \
    /test _set_key({__key2}, "/_zabij %{__kogo_B}")%; \
    /test _walka_prompt_line("%{__key2} - rozkaz zaatakowac %{__kogo_B}")%; \
  /endif
  
/def _walka_prompt_atak = \
  /let __kogo_B=$[tolower({1})]%; \
  /let __realKogo_B=$[tolower({2})]%; \
  /if ({__kogo_B}=~{cel_ataku}) \
    /let __key1=F2%; \
  /else \
    /let __key1=F4%; \
  /endif%; \
  /_walka_prompt_header%; \
  /if ({__realKogo_B}!~"") \
    /let __realSufix= (%{__realKogo_B})%; \
  /else \
    /let __realKogo_B=%{__kogo_B}%; \
  /endif%; \
  /test _set_key({__key1}, "/_zabij %{__realKogo_B}")%; \
  /if ({druzyna_L}=~{myName}) \
    /test _walka_prompt_line("%{__key1} - rozkaz zaatakowac %{__kogo_B}")%; \
  /else \
    /test _walka_prompt_line("%{__key1} - zabij %{__kogo_B}%{__realSufix}")%; \
  /endif

/def _walka_prompt_zaslona = \
  /let __kogo_B=$[tolower({*})]%; \
  /let __key1=F5%; \
  /let __key2=F6%; \
  /_walka_prompt_header%; \
  /if ({__kogo_B}!~"ciebie") \
    /test _set_key({__key1}, "/_zaslon %{__kogo_B}")%; \
    /test _walka_prompt_line("%{__key1} - zaslon %{__kogo_B}")%; \
  /endif%; \
  /if ({druzyna_L}=~{myName}) \
    /test _set_key({__key2}, "/_order_zaslona %{__kogo_B}")%; \
    /test _walka_prompt_line("%{__key2} - rozkaz zaslonic %{__kogo_B}")%; \
  /endif
  
/def _walka_prompt_header = \
  /echo -aBCmagenta @----------------------------------------------

/def _walka_prompt_line = \
  /echo -aBCmagenta | %{1}

;------------------------------------------------------------------------
;			   ... BLOKOWANIE ... 				  |
;------------------------------------------------------------------------
  
/def _walka_show_blokowanie = \
  /let __kto=%{1}%; \
  /let __komu=%{2}%; \
  /echo%; \
  /echo%; \
  /echo -p @{BCred}       > @{BCWhite}> @{BCgreen}> @{BCblue}> @{Cyellow}%{__kto} @{Cwhite}przymierza sie do odciecia @{Cblue}%{__komu}@{Cwhite} drogi ucieczki @{BCblue}< @{BCgreen}< @{BCwhite}< @{BCred}<%;\
  /echo%; \
  /echo%; \
  /repeat -0.2 5 /beep

;------------------------------------------------------------------------
;			   ... ATAK ... 				  |
;------------------------------------------------------------------------
  
/def _walka_show_atak = \
  /let __kto=%{1}%; \
  /let __kogo=%{2}%; \
  /let __komentarz=%{3}%; \
  /if ({__komentarz}!~"") \
    /let __komentarz1= (%{__komentarz})%; \
  /endif%; \
  /if (_is_team_member_B(tolower({__kogo}))) \
    /let __przedkim=$(/odmien_M_N %{__kto})%; \
    /let __zaslona= $[_walka_dynamiczna_zaslona_show({__kogo}, {__przedkim})]%; \
  /endif%; \
  /test substitute(strcat("    @{Cbgblue}=]@{nBCyellow} ",{__kto},"@{Cwhite} atakuje @{Cblue}",{__kogo},"@{Cwhite}.", {__komentarz1}, {__zaslona}),"",1)%; \
  /test _walka_ktokogo_set({__kto}, {__kogo})

;------------------------------------------------------------------------
;			   ... PRZELAMANIE ... 				  |
;------------------------------------------------------------------------    
    
/def _walka_show_przelamanie = \
  /let __success=%{1}%; \
  /let __kto=%{2}%; \
  /let __kogo=%{3}%; \
  /if ({__kto}=~"Ja") \
    /_walka_cooldown_szyk 5%; \
  /endif%; \
  /if ({__kto}=~"Ja" | _is_team_member(tolower({__kto}))) \
    /let __color=%{color_good}%; \
    /if ({__success}=~"true" & !({__kto}=~"Ja" & ({druzyna_M}=~"" | {druzyna_L}!~{myName}))) /test _walka_prompt_atak({__kogo})%; /endif%; \
  /elseif ({__kogo}=~"ciebie" | _is_team_member_B(tolower({__kogo}))) \
    /let __color=%{color_evil}%; \
    /if ({__success}=~"true" & !({__kogo}=~"ciebie" & {druzyna_L}!~{myName})) /_walka_prompt_zaslona %{__kogo}%; /endif%; \
  /else \
    /let __color=%{color_neutral}%; \
  /endif%; \
  /if ({__success}=~"false") \
    /test substitute(strcat("@{Cyellow}     ",{__kto}," @{Cwhite}< @{C",{__color},"}proba przelamania @{Cwhite}> @{Ccyan}",{__kogo},"."),"",1) %;\
  /else \
    /test substitute(strcat("@{Cbg",{__color},"}@{BCyellow}     ",{__kto}," @{BCwhite}< PRZELAMANIE > @{BCcyan}",{__kogo},"."),"",1) %;\
  /endif
 
;------------------------------------------------------------------------
;			   ... WYCOFKA ... 				  |
;------------------------------------------------------------------------
  
/def _walka_show_wycofka = \
  /let __success=%{1}%; \
  /let __kto=%{2}%; \
  /let __za_kogo=%{3}%; \
  /let __przed_kim=%{4}%; \
  /if ({__kto}=~"Ja") \
    /_walka_cooldown_szyk 10%; \
  /elseif ({__za_kogo}=~"ciebie") \
    /_walka_cooldown_szyk 5%; \
  /endif%; \
  /if ({__kto}=~"Ja" | _is_team_member(tolower({__kto}))) \
    /let __color=%{color_good}%; \
  /elseif ({__przed_kim}=~"twoimi" | _is_team_member_D(tolower({__przed_kim}))) \
    /let __color=%{color_evil}%; \
    /if ({__success}=~"true") /_walka_prompt_przelamanie_M %{__kto}%; /endif%; \
  /else \
    /let __color=%{color_neutral}%; \
  /endif%; \
  /if ({__success}=~"false") \
    /test substitute(strcat("@{Cyellow}     ",{__kto}," @{Cwhite}< @{C",{__color},"}proba wycofki za @{Cwhite}> @{Ccyan}",{__za_kogo},"@{C",{__color},"} przed ciosami @{Cgreen}",{__przed_kim},"."),"",1) %;\
  /else \
    /test substitute(strcat("@{BCyellow}     ",{__kto}," @{BCwhite}< @{BC",{__color},"}WYCOFKA ZA @{BCwhite}> @{BCcyan}",{__za_kogo},"@{BC",{__color},"} przed ciosami @{BCgreen}",{__przed_kim},"."),"",1) %;\
  /endif
  
;------------------------------------------------------------------------
;			   ... ZASLONA ... 				  |
;------------------------------------------------------------------------  
  
/def _walka_show_zaslona = \
  /let __success=%{1}%; \
  /let __kto=%{2}%; \
  /let __kogo=%{3}%; \
  /let __przed_kim=%{4}%; \
  /if ({__kto}=~"Ja") \
    /_walka_cooldown_szyk 5%; \
  /endif%; \
  /if ({__kogo}=~"cie" | _is_team_member_B(tolower({__kogo}))) \
    /let __color=%{color_good}%; \
  /elseif ({__przed_kim}=~"twoimi" | _is_team_member_D(tolower({__przed_kim}))) \
    /let __color=%{color_evil}%; \
    /if ({__success}=~"true") /_walka_prompt_przelamanie %{__kogo}%; /endif%; \
  /else \
    /let __color=%{color_neutral}%; \
  /endif%; \
  /if ({__success}=~"false") \
    /test substitute(strcat("@{Cyellow}     ",{__kto}," @{Cwhite}< @{C",{__color},"}proba zaslony @{Cwhite}> @{Ccyan}",{__kogo},"@{C",{__color},"} przed ciosami @{Cgreen}",{__przed_kim},"."),"",1) %;\
  /else \
    /test substitute(strcat("@{BCyellow}     ",{__kto}," @{BCwhite}< @{BC",{__color},"}ZASLONA @{BCwhite}> @{BCcyan}",{__kogo},"@{BC",{__color},"} przed ciosami @{BCgreen}",{__przed_kim},"."),"",1) %;\
  /endif


;------------------------------------------------------------------------
;		   ... DYNAMICZNE ZASLONY ... 				  |
;------------------------------------------------------------------------    

/set _walka_dynamiczna_zaslona_nr=1

/eval /def -mregexp -Fp10 -t'^(?i)(.*) atakuje (%{druzynab})\.' _zaslona_1 = \

/def _walka_dynamiczna_zaslona_show = \
  /let __kogo=%{1}%; \
  /let __przedkim=%{2}%; \
  /purge z%{_walka_dynamiczna_zaslona_nr}%; \
  /eval /def z%{_walka_dynamiczna_zaslona_nr} = zaslon $$[tolower({__kogo})] przed $$[tolower({__przedkim})]%; \
  /let __zaslona_text=@{n}@{BCwhite}[@{n}@{BCred}Zaslona@{BCwhite}: /z%{_walka_dynamiczna_zaslona_nr}]%; \
  /_walka_dynamiczna_zaslona_increment%; \
  /return {__zaslona_text}

  
/def _walka_dynamiczna_zaslona_increment = \
  /set _walka_dynamiczna_zaslona_nr=$[{_walka_dynamiczna_zaslona_nr}+1]%; \
  /if ({_walka_dynamiczna_zaslona_nr}==10) \
    /set _walka_dynamiczna_zaslona_nr=1%; \
  /endif

/def lol = \
  /let __result=$[_walka_dynamiczna_zaslona_show("aa", "bb")]%; \
  /echo -p %{__result}
  
/def _walka_dynamiczna_zaslona_update = \
  /purge _walka_koncentruje_sie%; \
  /eval /def -ag -mregexp -Fp10 -t'^(?i)(.*) koncentruje sie na walce z(|e) (%{druzyna_N})\.' _walka_koncentruje_sie = \
    /let __zaslona=$$$[_walka_dynamiczna_zaslona_show($$$(/odmien_N_B %%%{P3}), $$$(/odmien_M_N %%%{P1}))]%%%; \
    /echo -p @{Cyellow}     %%%{P1} @{n}@{BxCwhite}< @{n}@{n}@{BxCred}KONCENTRUJE SIE @{n}@{BxCwhite}>@{BxCred} na walce z @{n}@{nxCgreen}%%%{P3}. %%%{__zaslona}


  
;------------------------------------------------------------------------
;			   ... KTO KOGO ... 				  |
;------------------------------------------------------------------------  
  
/def _walka_druzyna_update = \
  /_walka_ktokogo_update%; \
  /_walka_dynamiczna_zaslona_update
  
/def _walka_ktokogo_update = \
  /purge _walka_ktokogo_lap_1%; \
  /eval /def -Fp160 -mregexp -t'^(?i)(([A-Za-z]+ )*[A-Za-z]+) (?:ledwo muska|powaznie rani|lekko rani|bardzo ciezko rani|rani|masakruje|trafia|wykonuje zamaszyste ciecie .* mierzac w|wykonuje zamach .* mierzac w|probuje trafic|wyprowadza szybkie pchniecie .* w) (%{druzyna_B}|cie|ciebie)[ ,.!]' _walka_ktokogo_lap_1 = \
    /test _walka_ktokogo_set({P1}, {P3})
    
/_walka_druzyna_update
 
/def _walka_ktokogo_set = \
  /let __kto=%{1}%; \
  /let __kogo=%{2}%; \
  /if ({__kogo}=~"cie") \
    /let __kogo=ciebie%; \
  /endif%; \
  /let __var_kto=$[_string_to_varname({__kto})]%; \
  /set _walka_ktokogo_lista_%{__var_kto}=%{__kogo}
  
/def _walka_ktokogo_clear = \
  /quote -S /unset `/listvar -s _walka_ktokogo_lista_*

/def -q -h'SEND {sp|spojrz|zerknij}' _zaslony_unset_on_sp = \
  /_walka_ktokogo_clear
;------------------------------------------------------------------------
;			   ... COOLDOWNY ... 				  |
;------------------------------------------------------------------------
  
/set _walka_cooldown_rozkaz_no=0
/set _walka_cooldown_szyk_no=0
/set _walka_cooldown_blok_count=0

/def _walka_cooldown_blok = \
  /if ({_walka_cooldown_blok_count}<=0) \
    /set _walka_cooldown_blok_count=%{1}%; \
    /_walka_cooldown_blok_loop%; \
  /endif

/def _walka_cooldown_rozkaz = \
  /set _walka_cooldown_rozkaz_count=%{1}%; \
  /set _walka_cooldown_rozkaz_no=$[{_walka_cooldown_rozkaz_no}+1]%; \
  /_walka_cooldown_rozkaz_loop %{_walka_cooldown_rozkaz_no}  
  
/def _walka_cooldown_szyk = \
  /set _walka_cooldown_szyk_count=%{1}%; \
  /set _walka_cooldown_szyk_no=$[{_walka_cooldown_szyk_no}+1]%; \
  /_walka_cooldown_szyk_loop %{_walka_cooldown_szyk_no}

/def _walka_cooldown_blok_loop = \
  /if ({_walka_cooldown_blok_count}>=0) \
    /set _statusbar_var_blok=$[strcat("[ ", {_walka_cooldown_blok_count}, " ]")]%; \
    /set _walka_cooldown_blok_count=$[{_walka_cooldown_blok_count}-1]%; \
    /repeat -1 1 /_walka_cooldown_blok_loop%; \
  /endif
  
/def _walka_cooldown_rozkaz_loop = \
  /if ({1}=={_walka_cooldown_rozkaz_no} & {_walka_cooldown_rozkaz_count}>=0) \
    /set _statusbar_var_rozkaz=$[strcat("[ ",(_one_digit({_walka_cooldown_rozkaz_count}))," ]")]%; \
    /set _walka_cooldown_rozkaz_count=$[{_walka_cooldown_rozkaz_count}-1]%; \
    /repeat -1 1 /_walka_cooldown_rozkaz_loop %{1}%; \
  /endif
  
/def _walka_cooldown_szyk_loop = \
  /if ({1}=={_walka_cooldown_szyk_no} & {_walka_cooldown_szyk_count}>=0) \
    /set _statusbar_var_szyk=$[strcat("[ ",(_one_digit({_walka_cooldown_szyk_count}))," ]")]%; \
    /set _walka_cooldown_szyk_count=$[{_walka_cooldown_szyk_count}-1]%; \
    /repeat -1 1 /_walka_cooldown_szyk_loop %{1}%; \
  /endif
