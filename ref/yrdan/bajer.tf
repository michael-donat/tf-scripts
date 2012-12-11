
/def -aBg -mregexp -Fp8 -t'^(.*) atakuje (.*).' _czy_atakuja_druzyne  =\
/let _kogo=%{P2} %;\
/let _kto=%{P1} %;\
/let m_kogo=$[tolower(%{P2})] %;\
/let m_kto=$[tolower(%{P1})] %;\
/let _ktoD=$(/_odmien_M_D %{_kto}) %;\
/let _wspierani_=$[strcat({ogolne_leader-LEADER},"|",{ogolne_druzyna-DRUZYNA})] %;\
/let _wspierani_b=$[strcat({ogolne_leader_bie-LEADER},"|",{ogolne_druzyna_bie-DRUZYNA})] %;\
;/echo Druzyna: %{_wspierani_b}  ::: wskazano %{_kogo} %;\
/set _czy_atakuje_druzyna=$[regmatch({_wspierani_},{m_kto})] %; \
/set _czy_atakuje_druzyne=$[regmatch({_wspierani_b},{m_kogo})] %; \
/set _czy_wskazal_zle=$[regmatch({zle_wskazania},{_kogo})] %; \
/if (({_czy_atakuje_druzyne}==1) & ({_czy_atakuje_druzyna}==1)) \
;/echo -p @{BCmagenta}         Dzieje sie cos zlego! Druzyna sie napierdziela!  %;\
/echo -p %{_kto} atakuje %{_kogo}. @{BCmagenta} |  Druzyna sie napierdziela! %;\
/endif %;\
/if (({_czy_atakuje_druzyne}==1) & ({_czy_atakuje_druzyna}==0)) \
/echo -p @{BCmagenta} >@{BCgreen} >   q   @{BCmagenta} >@{BCgreen} > @{BCyellow}%{_kto} @{BCwhite}atakuje @{BCyellow}%{_kogo}. @{BCred} <- Druzyne%;\
/alias q /set wyswietl_zaslony 1 %%;/msg Ok, wyswietle ci zaslony %;\
/rstart -0.5 6 /czy_wyswietlic_zaslony %{_kogo} %;\
/rstart -3 1 /unalias q%;\
/else \
/echo  -p %{_kto} atakuje %{_kogo}. %;\
/endif



/def czy_wyswietlic_zaslony =\
/let _kogo=%{*} %;\
/if ({wyswietl_zaslony}==1) \
/set wyswietl_zaslony 0 %;\
/b_zaslon %{_kogo} %;\
/endif



;/ Pomysly na gesty:
;/ Kazdy alias zaczyna sie od slow: gest 
;/ gestkier n - wskazanie na polnoc - popatrz wymownie na polnoc
;/ gestzas  - zaslon mnie - popatrz niespokojnie
;/ gestatak - kogo bedziemy lac - popatrz ze wzgarda
;/ gestatak2 - kogo bedziemy lac 2 - popatrz zawistnie 
;/ gestwidza - machnij reka bezszelestnie - pytasz innych czy cie widza
/
/


/def stan =\
/send stan %;\
/set sprawdzam_stan 1%;\

/def  -a -mregexp -Fp8 -t'Czujesz sie .* i jestes (.*)' _stan_sprawdzam_ =\
/if ({sprawdzam_stan}==1) \
/rstart -0.5 1 powiedz Jestem %{P1} %;\
/set sprawdzam_stan 0 %;\
/endif

/def  -aB -mregexp -Fp8 -t'Nad twoja glowa zbiera sie duza chmura gestego (.*) pylu.' _pyl_ =\
/echo -p @{BCyellow} P Y L @{BCwhite} P Y L @{BCyellow} P Y L @{BCwhite} P Y L @{BCyellow} P Y L @{BCwhite} P Y L %;\
/rstart -30 1 /msg Minelo 30 sekund odkad widziales pyl.

/def gestkier = \
/let _gdzie=%{*} %;\
/send popatrz wymownie na %{_gdzie} 

/def  -aB -mregexp -Fp8 -t'(.*) spoglada wymownie na (.*).' _gest_kier =\
/let _kto=%{P1} %;\
/let _gdzie=%{P2} %;\
/echo -p @{BCyellow}>@{BCwhite}>@{BCyellow}>@{BCwhite}> G E S T @{BCyellow}>@{BCwhite}>@{BCyellow}>@{BCwhite}>  %{_kto} mocno daje do zrozumienia kierunek:  @{nBCbggray}@{BCyellow}%{_gdzie} %;\


/def gestzas = \
/if ({*} =~NULL) \
	/send popatrz niespokojnie na siebie %;\
/else \
	/send popatrz niespokojnie na %{*} %;\
/endif

/def  -aB -mregexp -Fp8 -t'(.*) spoglada niespokojnie na (.*).' _gest_zas =\
/let _kto=%{P1} %;\
/let _kogo=%{P2} %;\
/echo -p @{BCyellow}>@{BCwhite}>@{BCyellow}>@{BCwhite}> G E S T @{BCyellow}>@{BCwhite}>@{BCyellow}>@{BCwhite}>  %{_kto} rozkazal zaslonic:  @{nBCbggray}@{BCyellow}%{_kogo}%;\
/let _kogo=$[tolower(%{_kogo})] %;\
/b_zaslon %{_kogo} %;\


;/if ({_kogo} =~'Ciebie') \
;/echo -p @{BCyellow}>@{BCwhite}>@{BCyellow}>@{BCwhite}> G E S T @{BCyellow}>@{BCwhite}>@{BCyellow}>@{BCwhite}>  %{_kto}%;\
;/else \
;/endif

/def gestatak = \
/if ({*} =~NULL) \
	/msg Nie podales kogo chcesz wyznaczyc na cel ataku! %;\
/else \
	/send popatrz ze wzgarda na %{*} %;\
/endif

/def  -aB -mregexp -Fp8 -t'(.*) spoglada ze wzgarda na (.*).' _gest_atak =\
/let _kto=%{P1} %;\
/let _kogo=%{P2} %;\
/let _kogo=$[tolower(%{_kogo})] %;\
/echo -p @{BCyellow}>@{BCwhite}>@{BCyellow}>@{BCwhite}> G E S T @{BCyellow}>@{BCwhite}>@{BCyellow}>@{BCwhite}>  %{_kto} wyznacza jako cel ataku:  @{nBCbggray}@{BCyellow}%{_kogo} %;\
/b_atak %{_kogo} %;\


/def gestatak2 = \
/if ({*} =~NULL) \
	/msg Nie podales kogo chcesz wyznaczyc na cel drugiego ataku! %;\
/else \
	/send popatrz zawistnie na %{*} %;\
/endif

/def  -aB -mregexp -Fp8 -t'(.*) spoglada zawistnie na (.*).' _gest_atak2 =\
/let _kto=%{P1} %;\
/let _kogo=%{P2} %;\
/let _kogo=$[tolower(%{_kogo})] %;\
/echo -p @{BCyellow}>@{BCwhite}>@{BCyellow}>@{BCwhite}> G E S T @{BCyellow}>@{BCwhite}>@{BCyellow}>@{BCwhite}>  %{_kto} wyznacza jako cel _nastepnego_ ataku:  @{nBCbggray}@{BCyellow}%{_kogo} %;\
/alias dr %{_kogo} %;\


/def gestwidza = \
/send pomachaj reka bezszelestnie %;\

/def kondycja2 = \
/load  /root/tf/arkadia/rindarin/konfig/kondycja.tf %;\
/load  /root/tf/arkadia/rindarin/konfig/tablice.tf %;\
/load  /root/tf/arkadia/rindarin/konfig/odmiana.tf %;\

/def kondycja1 = \
/load  /root/tf/arkadia/statystyka.tf %;\

/def  -aB -mregexp -Fp8 -t'(.*) wydaje ci rozkaz ataku na (.*).' _rozkaz_kogos_udany22w  =\
/let _kogo=$[tolower(%{P2})] %;\
/let _kto=$[tolower(%{P1})] %;\
/let _wspierani_=$[strcat({ogolne_leader-LEADER},"|",{ogolne_druzyna-DRUZYNA})] %;\
/set _czy_wskazal_druzyna=$[regmatch({_wspierani_},{_kto})] %; \
/if (({_czy_wskazal_druzyna}==1) & ({_czy_mozna_juz_lac}==1)) \
/rstart -0.1 1 /sprawdz_rozkaz %{_kogo} %;\
;/echo -p @{BCmagenta}                                   R O Z K A Z   A T A K U %;\
;/echo %;\
;/b_atak %{_kogo} %;\
/endif

/def  -aB -mregexp -Fp8 -t'Na rozkaz (.*) rzucasz sie do ataku' _rozkaz_kogos_udany23w  =\
/set rzucilem_sie 1 %;\
/rstart -3 1 /set rzucilem_sie 0 %;\

/def sprawdz_rozkaz = \
/let _kogo= %{*} %;\
/if ({rzucilem_sie}==0) \
/echo -p @{BCmagenta}                      R O Z K A Z   A T A K U  NA @{BCyellow} $[toupper({_kogo})] %;\
/echo %;\
/b_atak %{_kogo} %;\
/endif






;/load test/druzyny.ark
/load test/cereminial.tf
/load test/formacje.tf
/load test/kalendarz.ark
/load test/najmysuby.ark
/load test/odmiana.tf

/set rzucilem_sie 0
/set _czy_mozna_juz_lac 1 
/set _czy_mozna_juz_scatakowac 1
/set rozkazuje 0
/set przelamuje 0
/set czy_scatakowal 0
/set przestaje 0 
;/rstart -15 1 /send opcje przyjmowanie -   wylaczam bo nie ma mcekow

/alias wee /dwesprzyj 


/def _set_wrog = \
    /if (!{_wrog_bind_on}) \
        /set _wrog_bind_on=1 %;\
        /rstart -60 1 /unset _wrog_bind_on %;\
        /let _kogo=$(/_odmien_M_B %{*}) %;\
        /set ogolne_bindy_f1 /_zabij %{_kogo} %%;/_zabij %{_kogo}%%;wskaz %{_kogo}%%;rozkaz druzynie zaatakowac %{_kogo}%;\
	/set ogolne_bindy_f2 przelam obrone %{_kogo}%;\
	/set ogolne_bindy_f3 gzatak na %{_kogo}%;\
        /set ogolne_bindy_f4 /unset _wrog_bind_on%%; /msg Aktywuje bindowanie nowego wroga. %{*} juz mnie nie interesuje. %%; /set ogolne_bindy_f1 /msg Brak akcji. %%; /set ogolne_bindy_f4 /msg Brak akcji. %%; /set ogolne_bindy_af1 /msg -e @{B}    PUSTO ! ! !@{n} %%; /set ogolne_bindy_f4 /msg Bindowanie aktywne.%;\
;        /echo -p -aCgreen Od teraz @{B}"F3"@{n} aktywuje czujnosc i podbinduje nowego wroga. %;\
/echo -p  @{nBCbgred}@{BCyellow}                 @{nBCbggreen}@{BCwhite}   Atakuj  %{_kogo}    @{nBCbgred}@{BCyellow}                 @{nBCbgred}@{BCyellow} %;\
/echo -p @{nBCbgwhite}@{BCblue}     F1 Atak     @{nBCbgred}@{BCyellow}    F2 Lam obrone   @{nBCbgwhite}@{BCblue}   F3 Z ukrycia   @{nBCbggreen}@{BCwhite}     F4 Zmiana celu     @{nBCbgblack}@{BCmagenta} %;\
    /endif

; dodana komenda dla miecznika /dwesprzyj ktora gzwspiera kazdego z druzyny. Alias na ta komende 'wee'
; dodana komenda /rozkazuj sprawia, ze po uzyciu aliasu 'zz' rozkazemy atak, lub tez nie.
; dodana komenda /przelamuj dziala jak wyzej. Standardowo sa wlaczone. wylaczenie dziala przez /przelamuj
; wlaczenie przez /przelamuj 1.
; standardowo przyjmowanie przedmiotow wylaczone, jak przedmiot probuje podac ktos z druzyny
; to nasza postac kiwnie glowa i automatycznie wlaczy przyjmowanie
; po 20 sekundach samo sie wylaczy. zabezpieczone przed floodem


/alias test /itrigger Barczysty uwazny mezczyzna rzuca sie na Noorfa przebijajac sie przez jego ochrone. %;\
/itrigger Barczysty uwazny mezczyzna rzuca sie na Kilvara przebijajac sie przez jego ochrone. %;\
/itrigger Barczysty uwazny mezczyzna rzuca sie na Marco przebijajac sie przez jego ochrone. %;\
/itrigger Barczysty uwazny mezczyzna rzuca sie na Urisiela przebijajac sie przez jego ochrone. %;\



;Komendy wykonywane po wejsciu postaci do swiata
/def start= wzw%;poprzypnij pochwe w pasie%;zawiaz chuste na lewym ramieniu%;jpowiedz Hm.%;przytrocz woreczek do pasa%;\
przytrocz drugi woreczek do pasa%;\
przytrocz trzeci woreczek do pasa%;\
przytrocz czwarty woreczek do pasa%;\
przytrocz piaty woreczek do pasa%;\

; =================================================
; DEFY I ALIASY
; =================================================

/def zw = zaloz wszystko


/def del = otworz woreczek%;opusc bron%;wez zolty kwiat z woreczka%;zjedz kwiat%;zamknij woreczek%;nadobadz wszystkich broni

/def del2 = otworz drugi woreczek%;wez zolty kwiat z go%;opusc bron%;zjedz kwiat%;zamknij woreczki%;nadobadz wszystkich broni

/def law = otworz trzeci woreczek%;wez piec kwiatostanow z go%;opusc bron%;przyloz piec kwiatostanow%;zamknij woreczki%;nadobadz wszystkich broni

/def law2 = otworz drugi woreczek%;wez piec kwiatostanow z go%;opusc bron%;przyloz piec kwiatostanow%;zamknij woreczki%;nadobadz wszystkich broni

/def dzi= otworz piaty woreczek%;wez piec czterokanciastych lodyg z go%;przestan atakowac wszystkich%;opusc bron%;rozgryz piec czterokanciastych lodyg%;zamknij woreczki%;nadobadz wszystkich broni

/def dzi2 = otworz czwarty woreczek%;wez piec czterokanciastych lodyg z go%;opusc bron%;rozgryz piec czterokanciastych lodyg%;zamknij woreczki%;nadobadz wszystkich broni

/alias wezw otworz woreczki%;wez ziola z woreczka%;wez ziola z drugiego woreczka%;wez ziola z trzeciego woreczka%;wez ziola z czwartego woreczka%;wez ziola z piatego woreczka%;wez ziola z szostego woreczka%;wez ziola z siodmego woreczka%;zamknij woreczki

;/alias we wee%;wesprzyj
/alias we wesprzyj

/alias wzw otworz woreczki%;\
wloz zolte kwiaty do woreczka%;\
wloz fioletowe kwiatostany do drugiego woreczka%;\
wloz fioletowe kwiatostany do trzeciego woreczka%;\
wloz czterokanciaste lodygi do piatego woreczka%;\
wloz czterokanciaste lodygi do czwartego woreczka%;\
wloz ziola do woreczka%;\
wloz ziola do drugiego woreczka%;\
wloz ziola do trzeciego woreczka%;\
wloz ziola do czwartego woreczka%;\
wloz ziola do piatego woreczka%;\
zamknij woreczki

/alias owo otworz woreczki%;ob pierwszy woreczek%;ob drugi woreczek%;zamknij woreczki

/def zll = \
wez wszystkie zbroje z plecaka%;\
zaloz wszystko%;\

/def wll = \
wloz wszystkie zbroje do plecaka%;\
zdejmij plecak%;\
	
/alias nawyt nawytnij trofeum z ciala%;nawytnij trofeum z drugiego ciala%;nawytnij trofeum z trzeciego ciala%;nawytnij trofeum z czwartego ciala%;nawytnij trofeum z piatego ciala


/alias wy wez bron ze swojego plecaka%;nadobadz wszystkich broni

/def wyt = wytnij nerke z ciala%;wytnij nerke z ciala%;wytnij oko z ciala%;wytnij oko z ciala%;wytnij nos z ciala%;wytnij ucho z ciala%;wytnij serce z ciala%;wytnij nerke z drugiego ciala%;wytnij nerke z drugiego ciala%;wytnij oko z drugiego ciala%;wytnij oko z drugiego ciala%;wytnij nos z drugiego ciala%;wytnij ucho z drugiego ciala%;wytnij serce z drugiego ciala%;wytnij nerke z trzeciego ciala%;wytnij nerke z trzeciego ciala%;wytnij oko z trzeciego ciala%;wytnij oko z trzeciego ciala%;wytnij nos z trzeciego ciala%;wytnij ucho z trzeciego ciala%;wytnij serce z trzeciego ciala %;\
;/gagujwycinanie


/def _kondycja = \
kondycja wszystkich %;\
/if (_have_druzyna()) \
/zaa %;\
/endif


/def wez = \
        wez %{*} z ciala%;\
        wez %{*} z drugiego ciala%;\
        wez %{*} z trzeciego ciala%;\
        wez %{*} z czwartego ciala%;\
        wez %{*} z piatego ciala%;\
        wez %{*} z szostego ciala%;\
        wez %{*} z siodmego ciala%;\
        wez %{*} z osmego ciala%;\
	wez %{*} %;\


/def zabij = \
        zabij szostego %{*}%;\
        zabij piatego %{*}%;\
        zabij czwartego %{*}%;\
        zabij trzeciego %{*}%;\
        zabij drugiego %{*}%;\
        zabij pierwszego %{*}%;\





/def _zz = \
        /let _kogo= %{*} %;\
        /_zabij %{_kogo} %;\
	/_zabij %{_kogo} %;\
	wskaz na %{_kogo} %;\
	/if ({rozkazuje} =~'1') \
	rozkaz druzynie zaatakowac %{_kogo} %;\
	/endif %;\
	/if ({przelamuje} =~'1') \
	/odmiana_b_d %{_kogo} %;\
			/let _kogo=%{_odmiana_b_d} %;\
			przelam obrone %{_kogo} %;\
			/odmiana_b_d  %;\
	/echo przelam obrone %{_kogo} %;\
	/endif %;\
	/set ogolne_bindy_f1 nazabij %{_kogo}%%;nazabij %{_kogo}%%;wskaz na %{_kogo}%%;rozkaz druzynie zaatakowac %{_kogo} %;\
	/emot %;\



/def b_atak = \
        /let _kogo= %{*} %;\
	/echo -p @{BCmagenta}               @{xBCwhite} F1 @{BCmagenta} <==  ATAK || @{xBCwhite} F2 @{BCmagenta} <==  PRZELAM || @{xBCwhite} F3 @{BCmagenta} <==  Z UKRYCIA %;\
	/echo %;\
	/set ogolne_bindy_f1=zabij %{_kogo}%%;zabij %{_kogo}%;\
	/set ogolne_bindy_f2=przelam obrone %{_kogo}%;\
	/set ogolne_bindy_f3=gzatak na %{_kogo}%;\


/def b_zaslon = \
        /let _kogo= %{*} %;\
	/let _kogo=$[tolower(%{_kogo})] %;\
	/echo -p @{BCmagenta}                                   ==> @{xBCwhite} F5 @{BCmagenta} <==  ZASLON @{BCyellow} $[toupper({_kogo})] %;\
	/echo -p @{BCmagenta}                                   ==> @{xBCwhite} F6 @{BCmagenta} <==  ROZKAZ ZASLONY@{BCyellow} $[toupper({_kogo})] %;\
	/set ogolne_bindy_f5=zaslon %{_kogo}%;\
	/set ogolne_bindy_f6=rozkaz druzynie zaslonic %{_kogo}%;\






/def -Fp151 -mregexp -t'rzuca sie na (.*) przebijajac sie przez (.*) ochrone\.$' _przelamanie_ktos_udane=\
	/set _przelamanie_ktos_udane_kogo=%{P1} %;\
	/set _przelamanie_komu_sie_udalo=%{PL} %;\
	/set _przelamanie_komu_sie_udalo_male=$[tolower(%{PL})] %;\
	/let _wspierani_=$[strcat({ogolne_leader-LEADER},"|",{ogolne_druzyna-DRUZYNA})] %;\
      	/let _wspierani_b=$[strcat({ogolne_leader_bie-LEADER},"|",{ogolne_druzyna_bie-DRUZYNA})] %;\
      	/let _wspierani_n=$[strcat({ogolne_leader_nar-LEADER},"|",{ogolne_druzyna_nar-DRUZYNA})] %;\
	/let _przelamanie_ktos_udane_test=$[regmatch(_wspierani_, {_przelamanie_ktos_udane_kogo})] %;\
	/let _przelamanie_ktos_udane_test2=$[regmatch(_wspierani_, {_przelamanie_komu_sie_udalo})] %;\
    /if ({_przelamanie_ktos_udane_kogo}=~"ciebie") /let _przelamanie_kogo_przelamal=***TWOJA*** %;\
        /substitute -p %{_przelamanie_komu_sie_udalo}@{BxCwhite}PRZELAMAL @{BxCred}%{_przelamanie_kogo_przelamal}@{n} @{BxCwhite}OBRONE. @{BxCwhite}<@{n}@{BxCred}<@{BxCwhite}<@{n}@{BxCred}<@{BxCwhite}<@{n}%;\
    /endif %;\
       /if ((regmatch(_wspierani_b, {_przelamanie_ktos_udane_kogo})) & ({_przelamanie_ktos_udane_test2}==0)) \
         /substitute -p >@{BxCyellow}>@{n}>@{BxCyellow}>@{n}>@{BxCyellow}>@{n}>@{BxCyellow}>@{n} @{BxCwhite}%{_przelamanie_komu_sie_udalo}@{n}przelamal obrone ---> @{BxCgreen}$[toupper({_przelamanie_ktos_udane_kogo})]@{n}. <@{BxCyellow}N@{n}<@{BxCyellow}A@{n}<@{BxCyellow}S@{n}<@{BxCyellow}Z@{n}<@{BxCyellow}Y@{n}<@{BxCyellow}C@{n}<@{BxCyellow}H@{n}<%;\
/echo -p @{BCmagenta}                                        PRZELAMALI OBRONE TWOJEJ DRUZYNY%;\
/echo %;\
/b_zaslon $[tolower({_przelamanie_ktos_udane_kogo})] %;\
/endif %;\
/set _czy_wskazal_druzyna=$[regmatch({_wspierani_},{_przelamanie_komu_sie_udalo_male})] %; \
/if ({_czy_wskazal_druzyna}==1) \
/substitute -p >@{BxCred}>@{n}>@{BxCred}>@{n}>@{BxCred}>@{n}>@{BxCred}> @{n}@{BxCyellow}          %{_przelamanie_komu_sie_udalo}@{n}przelamal obrone --->    @{BxCred}$[toupper({_przelamanie_ktos_udane_kogo})]@{n}         <@{BxCred}N@{n}<@{BxCred}A@{n}<@{BxCred}S@{n}<@{BxCred}I@{n}<@{BxCred}!@{n}<@{BxCred}!@{n}<@{BxCred}!@{n}%;\
/echo -p @{BCmagenta}                                   NASI PRZELAMALI OBRONE WROGA !%;\
/echo %;\
/b_atak %{_przelamanie_ktos_udane_kogo} %;\
/endif

;/echo -p @{BCmagenta}                                   ==> @{xBCwhite} /zab i F4 @{BCmagenta}<==  ATAK NA @{BCyellow} %$[toupper({_przelamanie_ktos_udane_kogo})] %;\
;/echo %;\
;/def zab = /_zz %{_przelamanie_ktos_udane_kogo} %;\
;/f4 /_zz %{_przelamanie_ktos_udane_kogo} %;\
;/endif





/def -aBh -F -mregexp -t'^Wskazujesz (.*).' _wskazujesz_do_ataku = \
/let _kogo= %{P1} %;\
/alias roz /drozkaz ataku na %{_kogo}%%;/alias roz /msg -w Pusto %;\
/alias krzyk krzyknij Do ataku na %{_kogo}!%;\


/def -aBh -F -mregexp -t'^(.*) przygotowuje sie do ataku na (.*).' _druzyna_scatakuje = \
/let _kto= %{P1} %;\
/let _kogo= %{P2} %;\
/let _kogo=$[tolower(%{_kogo})] %;\
/set _czy_atakuje_druzyna=$[regmatch({_druzyna_},{_kto})] %; \
/set _czy_wskazujacy_druzyna=$[regmatch({wskazujacy},{_kto})] %; \
/if (({_czy_wskazujacy_druzyna}==1) & ({_czy_mozna_juz_scatakowac}==1)) \
/_opoznij gzatak na %{_kogo}%;\
/set _czy_mozna_juz_scatakowac 0  %; \
/rstart -5 1 /set _czy_mozna_juz_scatakowac 1  %; \
/elseif (({_czy_atakuje_druzyna}==1) & ({_czy_mozna_juz_scatakowac}==1)) \
;/echo -p                           @{nBCbgwhite}@{BCblue}     F1 Walnij z ukrycia %{_kogo}     @{nBCbgred}@{BCyellow}      %{_kto} przygotowuje sie do ataku!!!        @{nBCbgwhite}@{BCblue}      F3 Walnij z ukrycia %{_kogo}     @{nBCbgblack}@{BCmagenta} %;\
	/set ogolne_bindy_f1 /_zabij %{_kogo} %%;/_zabij %{_kogo}%;\
	/set ogolne_bindy_f2 przelam obrone %{_kogo}%;\
	/set ogolne_bindy_f3 gzatak na %{_kogo}%;\
/echo -p @{nBCbggreen}@{BCwhite}        Twoi leja z ukrycia  %{_kogo}        @{nBCbggreen}@{BCwhite}   %;\
/echo -p @{nBCbgwhite}@{BCblue}     F1 Atak     @{nBCbgred}@{BCyellow}    F2  Lam obrone   @{nBCbgwhite}@{BCblue}   F3 Z ukrycia    @{nBCbggreen}@{BCwhite} %;\
/set ogolne_bindy_f3 gzatak na %{_kogo}%;\
/set _czy_mozna_juz_scatakowac 0  %; \
/rstart -5 1 /set _czy_mozna_juz_scatakowac 1  %; \
/endif




/def -aBhg -F -mregexp -t'^(Zrecznie zaslaniasz|Na rozkaz .* zaslaniasz) (.*) przed (.*)' _zaslaniasz_1 = \
/if ({przestaje}==1) \
/_opoznij przestan zaslaniac $[tolower(%{P2})] %;\
/endif %;\
/echo %{P1} %{P2} przed %{P3} [Przestaniesz pod klawiszem a] %;\
/alias a przestan zaslaniac $[tolower(%{P2})] %;\


/alias testuj /itrigger [Kilvar] przygotowuje sie do ataku na duzego brudnego stwora.


/def key_tab = /dokey searchb



/def -Fp2 -mregexp -P -t'(skradajac sie | )(przybywa|podaza)(ja|) (z|ze|na) ' _przybywanie_licz= \
        /let _ile=%{PL} %;\
        /let _ile=$[replace("##", " ", replace(" ", "_",replace(", ", "##", replace(" i ", "##", replace("[","", replace("]","", {_ile}))))))] %;\
        /podlicz__ %{_ile}%;\
        /substitute -p @{nCblue}[ @{nBCwhite}%{_il_wr}@{nCblue} ] @{n}%PL%P1@{nBCgreen}%P2%P3 @{n}%P4 %PR%;\
        /unset _il_wr

/def podlicz__= \
     /while ({#}) \
             /test ++_il_wr%; \
                 /shift%; \
     /done

/def sendgg = \
    /msg Sending gg notify %;\
  /quote -S -decho !"python2.5 /home/sprox/ggnotifier/bin/gg-notifier.py %{*}"




/def emot = \
/let _var=$[rand(0,70)] %; \
/if (!_var) \
        /let _emot=powiedz do wroga Z przyjemnoscia cie zmasakruje. %; \
    /elseif (_var == 1) \
        /let _emot=krzyknij Arrrrgghhh!!%; \
    /elseif (_var == 2) \
        /let _emot=nasplun wrogowi %; \
    /elseif (_var == 3) \
        /let _emot=naryknij %; \
    /elseif (_var == 4) \
        /let _emot=szepnij wrogowi Gin poczwaro! %; \
    /elseif (_var == 5) \
        /let _emot=popatrz spokojnie na wroga %; \
    /elseif (_var == 6) \
        /let _emot=powiedz do wroga No coz.. pora umierac...%; \
    /elseif (_var == 7) \
        /let _emot=krzyknij Gotow na smierc pod sztandarem Czarnego Gryfa! %; \
    /elseif (_var == 8) \
        /let _emot=zarechocz nerwowo%; \
    /elseif (_var == 9) \
        /let _emot=rozejrzyj sie ponuro%; \
    /elseif (_var == 10) \
        /let _emot=szepnij wrogowi Nie boj sie. Smierc ponoc boli tylko chwilke.%; \
    /elseif (_var == 11) \
        /let _emot=powiedz do wroga Trudno...%; \
    /elseif (_var == 12) \
        /let _emot=powiedz Snotlinskie lajno.%; \
    /elseif (_var == 13) \
        /let _emot=szepnij wrogowi Cmierdziuch, lepij zwiwaj! %; \
    /elseif (_var == 14) \
        /let _emot=powiedz do wroga Zobaczysz co to walka! %; \
    /elseif (_var == 15) \
        /let _emot=nawzrusz %; \
    /else \
        /let _emot=%;\
    /endif %; \
; /echo %{_emot}%;\
%{_emot}%;\




;/alias kk /_kondycja

/alias zz /_zz %{*}




/def -aB -mregexp -Fp8 -t'^(.*) bezskutecznie probuje dac ci (.*)' _probuja_ci_dac  =\
/let _kto=$[tolower(%{P1})] %;\
/let _druzyna_=$[strcat({ogolne_leader-LEADER},"|",{ogolne_druzyna-DRUZYNA})] %;\
/set _czy_daje_druzyna=$[regmatch({_druzyna_},{_kto})] %; \
/if ({_czy_daje_druzyna}==1) \
	/if ({_czy_flood}==0) \
		/echo -p @{B}       @{nBCblue}         $[toupper({_kto})]    probuje ci cos dac! %;\
		/_opoznij opcje przyjmowanie + %;\
		/_opoznij /_opoznij kiwnij %;\
		/repeat -0:0:20.5 1 /set _czy_flood 0 %;\
		/repeat -0:0:20.5 1 opcje przyjmowanie - %;\
		/set _czy_flood 1 %;\
	/endif %;\
/endif




/def -aB -mregexp -Fp8 -t'Przygotowujesz sie do ataku na (.*).' _laduj_scatak =\
/set czy_scatakowal 1 %;\
popatrz niechetnie na $[tolower(%{P1})] %;\

/def -aB -mregexp -Fp8 -t'Najswiezsze prowadza na (.*)' _gdzie_tropy =\
/f1 powiedz Slady na $[tolower(%{P1})] %;\

      

/def -aB -mregexp -Fp8 -t'Najswiezsze zostaly pozostawione prawdopodobnie przez (.*) i prowadza na (.*).' _gdzie_tropy2 =\
/f1 powiedz Slady zostawione przez %{P1} na $[tolower(%{P2})] %;\

/def -aB -mregexp -Fp8 -t'(polegl|[Uu]ciekl)' _laduj_scatak2 =\
/if ({czy_scatakowal}==1) \
/rstop /scatak0 %;\
/rstop /scatak15 %;\
/rstop /scatak5%;\
/rstop /dodaj_sekunde %;\
/rstart -30.5 1 /scatak0 %;\
/rstart -15 1 /scatak15 %;\
/rstart -25 1 /scatak5%;\
/endif

/def -a -mregexp -Fp8 -t'(Rezygnujesz z wykorzystania ataku z zaskoczenia.|Nie widzac nigdzie .* rezygnujesz z wyprowadzenia ciosu.|Koncentrujesz sie|Wspierasz|Ok.|wspiera|Nie jestes juz schowany.|Juz walczysz|Ledwo muskasz|Lekko ranisz|Ranisz)' _przerwij_scatak =\
/rstop /scatak0 %;\
/rstop /scatak15 %;\
/rstop /scatak5%;\


/def scatak5 = \
/echo -p @{BCgreen}[5 sekund] Atak z ukrycia. %;\

/def scatak15 = \
/echo -p @{BCgreen}[15 sekund] Atak z ukrycia. %;\

/def scatak0 = \
/echo -p @{BCgreen}                          	Atak z ukrycia w gotowy.%;\
/set czy_scatakowal 0

/def moznaprzemykac = \
/echo -p @{BCgreen}                          	Mozna przemknac dalej [5].%;\

/def moznaprzemykac10 = \
/echo -p @{BCgreen}                          	Mozna przemknac dalej [10].%;\

/alias pp /przemknij %{*}
/def przemknij = \
/if ({*} =~NULL) \
/rstop /moznaprzemykac%;\
/rstart -5 1 /moznaprzemykac%;\
/rstop /moznaprzemykac10%;\
/rstart -10 1 /moznaprzemykac10%;\
/else \
/let _gdzie= %{*} %;\
/send przemknij %{_gdzie} %;\
/msg Przemykam sie na %{_gdzie} %;\
/rstop /moznaprzemykac%;\
/rstart -5 1 /moznaprzemykac%;\
/rstop /moznaprzemykac10%;\
/rstart -10 1 /moznaprzemykac10%;\
/endif

;unosi reke do gory, wskazujac bojowego wyszkolonego mezczyzne jako cel ataku.


 
/def -aB -mregexp -Fp8 -t'^(.*) (wskazuje|unosi reke do gory, wskazujac) (.*).' _wskazuje_do_ataku  =\
/let _kogo=$[replace(" jako cel ataku", "", {P3})] %;\
/let _kogo=$[tolower(%{P3})] %;\
/let _kto=$[tolower(%{P1})] %;\
/let _ktoD=$(/_odmien_M_D %{_kto}) %;\
/let _wspierani_=$[strcat({ogolne_leader-LEADER},"|",{ogolne_druzyna-DRUZYNA})] %;\
/let _wspierani_b=$[strcat({ogolne_leader_bie-LEADER},"|",{ogolne_druzyna_bie-DRUZYNA})] %;\
;/echo Wspierani: %{_wspierani_b}  ::: wskazano %{_kogo} %;\
/set _czy_wskazal_druzyna=$[regmatch({_wspierani_},{_kto})] %; \
/set _czy_wskazal_druzyne=$[regmatch({_wspierani_b},{_kogo})] %; \
/set _czy_wskazal_zle=$[regmatch({zle_wskazania},{_kogo})] %; \
/set zle_wskazania wschod|zachod|polnoc|poludnie|cialo|pochodnie|dol|gore|lampe|olej|ciebie|siebie|napiersnik|kirys|miecz|naramienniki|nagolenniki|nareczaki|naramiennik|plaszcz|helm|monet|nieokreslony|topor|sztylet|strumyk|strumien|chleb|buklak|maczuge|korbacz %;\
/if (({_czy_wskazal_druzyne}==0) & ({_czy_wskazal_zle}==0)) \
;	/msg !!!!!!!!!!!! test zakonczony z powodzeniem %;\
	/if ({wskazujacy} =~'nikt') \
		/if (({_czy_wskazal_druzyna}==1) & ({_czy_mozna_juz_lac}==1)) \
/echo -p @{BCmagenta}                  R O Z K A Z   A T A K U  NA @{BCyellow} $[toupper({_kogo})] %;\
			/b_atak %{_kogo} %;\
			/repeat -0:0:3.5 1 /set _czy_mozna_juz_lac 1 %;\
			/set _czy_mozna_juz_lac 0 %;\
		/endif %;\
	/elseif ({_kto} =~ {wskazujacy}) \
		/if ({_czy_mozna_juz_lac}==1) \
			/msg Wskazujacy wskazuje : %{_kogo}  F1 F1 :) %;\
			/czy_przerwac_atak %{_kogo} %;\
;			/_opoznij nazabij %{_kogo}  %;\
;			/_opoznij nazabij %{_kogo}  %;\
;			/if ({przelamuje} =~'1') \
;				/odmiana_b_d %{_kogo} %;\
;				/let _kogo=%{_odmiana_b_d} %;\
;				/_opoznij przelam obrone %{_kogo} %;\
				/odmiana_b_d  %;\
;			/endif %;\
			/repeat -0:0:3.0 1 /set _czy_mozna_juz_lac 1 %;\
			/set _czy_mozna_juz_lac 0 %;\
		/elseif ({_czy_mozna_juz_lac}==0) \
;			/msg $[toupper({wskazujacy})] flooduje!! %;\
		/endif %;\
	/endif %;\
/else \
/endif %;\

/set przerwac 0

/def czy_przerwac_atak = \
/let _kogo= %{*} %;\
/set ogolne_bindy_f1=/set przerwac 1 %%;/msg Ok, przerywam!%;\
/rstart -1.5 1 /atakuj_wroga %{_kogo}%;\

/def atakuj_wroga =\
;/msg ooooo %;\
;/echo przerwac : %{przerwac}%;\
/let _kogo= %{*} %;\
/if ({przerwac}==0) \
			/msg Wiec nie przerywam ataku na : %{_kogo} %;\
			/_opoznij nazabij %{_kogo}  %;\
			/_opoznij nazabij %{_kogo}  %;\
			/if ({przelamuje} =~'1') \
				/odmiana_b_d %{_kogo} %;\
				/let _kogo=%{_odmiana_b_d} %;\
				/_opoznij przelam obrone %{_kogo} %;\
				/odmiana_b_d  %;\
			/endif %;\
/endif %;\
/set przerwac 0 %;\






/def drzwie = \
zapukaj do drzwi%;e%;zamknij drzwi%;zarygluj drzwi

/def drzwiw =\
odrygluj drzwi%;otworz drzwi%;w%;zamknij drzwi

/def run =\
odrygluj drzwi%;otworz drzwi%;w%;zamknij drzwi%;sw%;w%;nw%;w%;w%;w%;w%;%;w%;sw%;s%;s%;s%;s%;s%;s%;s%;sw%;sw%;s%;sw%;w%;n%;\


/def zielarz = kup 10 lawend%;kup 10 dziurawcow%;kup 10 delion
 
/def  -aB -mregexp -Fp8 -t'^(Nie atakujac juz|Blyskawicznym susem dopadasz|Raptownie rzucasz sie na|Wyprzedzajac nieudolny atak|Ubiegajac reakcje|Uprzedzajac reakcje|Momentalnie doskakujesz do|Dziko hallakujac w ulamku sekundy|Z dzikim krzykiem wpadasz na).' _koloruj_scatak  =\
/echo -p @{B}       @{nBCmagenta}                      Uderzyles z ukrycia! %;\

/def  -aBg -mregexp -Fp8 -t'^(.*) macha reka (strofujaco|opiekunczo).' _przestan_zaslaniac  =\
/let _kto=$[tolower(%{P1})] %;\
/let emocja=%{P2} %;\
/let _kogo=$(/_odmien_M_B %{_kto}) %;\
/let _druzyna_=$[strcat({ogolne_leader-LEADER},"|",{ogolne_druzyna-DRUZYNA})] %;\
/set _czy_macha_druzyna=$[regmatch({_druzyna_},{_kto})] %; \
/if ({_czy_macha_druzyna}==1) \
        /if ({emocja} =~ "strofujaco") \
        	/msg $[toupper({_kto})] nie chce byc zaslaniany. Alias 'aa' zalatwi sprawe. %;\
        	/alias aa przestan zaslaniac %{_kogo}%;\
        /elseif ({emocja} =~ "opiekunczo") \
   		/echo -p @{B}       @{nBCblue}  	     $[toupper({_kto})]    P R O S I   O   Z A S L O N E! %;\
		/b_zaslon %{_kogo}%;\
	/endif %;\
/endif

/def  -aB -mregexp -Fp8 -t'^(.*) (blyskawicznym spojrzeniem (.*) wykrzykuje kilka krotkich slow.|przyklada palec do ust i szybko wygwizduje krotki, wysoki sygnal.)' obrona_gladow_wzywana =\
/echo -p @{nBCbgred}@{BCwhite}%{P1}   @{nBCbgblack}@{BCmagenta}  wezwal obroncow. %;\

/def  -aB -mregexp -Fp8 -t'^Kilku uzbrojonych mezczyzn o podejrzanej fizjonomii wychodzi zza rogu.' obrona_gladow_in =\
/echo -p @{nBCbgblue}@{BCred}     OBRONA GLADOW @{nBCbgred}@{BCwhite}   UWAGA ! ! ! %;\
/echo -p @{nBCbgblue}@{BCred}     OBRONA GLADOW @{nBCbgred}@{BCwhite}   UWAGA ! ! ! %;\
/echo -p @{nBCbgblue}@{BCred}     OBRONA GLADOW @{nBCbgred}@{BCwhite}   UWAGA ! ! ! %;\

/def  -aBg -mregexp -Fp8 -t'^(Ruszasz do przodu, w pol kroku wyprowadzajac|Nie zwazajac na nic rozpoczynasz|Poprawiasz chwyt na swym|Niespodziewanie skrecasz|Wyrzucasz do przodu) .* (ledwo zacina|ktore bolesnie zacina|ktore zacina|ktore plytko tnie|ktore tnie|ktore z potworna moca tnie|ktore gleboko tnie|ktore niemalze rozcina|jakims cudem nie dosiega|zeslizguje sie) ([^.]*)' _spec_tipka  =\
/if ({P2} =~ "jakims cudem nie dosiega") \
/echo -p @{B}@{BCwhite}[0 / 7] @{nBCred} Specujesz   --- >>   @{nBCbgred}@{BCwhite}%{P2}   @{nBCbgblack}@{BCmagenta}   %{P3}. %;\
/elseif ({P2} =~ "zeslizguje sie") \
/echo -p @{B}@{BCwhite}[0 / 7] @{nBCred} Specujesz   --- >>   @{nBCbggreen}@{BCwhite}%{P2}   @{nBCbgblack}@{BCmagenta}   %{P3}. %;\
/elseif ({P2} =~ "ledwo zacina") \
/echo -p @{B}@{BCwhite}[1 / 7] @{nBCred} Specujesz   --- >>   @{nBCbggreen}@{BCwhite}%{P2}   @{nBCbgblack}@{BCmagenta}   %{P3}. %;\
/elseif ({P2} =~ "ktore bolesnie zacina") \
/echo -p @{B}@{BCwhite}[2 / 7] @{nBCred} Specujesz   --- >>   @{nBCbggreen}@{BCwhite}%{P2}   @{nBCbgblack}@{BCmagenta}   %{P3}. %;\
/elseif ({P2} =~ "ktore plytko tnie") \
/echo -p @{B}@{BCwhite}[3 / 7] @{nBCred} Specujesz   --- >>   @{nBCbggreen}@{BCwhite}%{P2}   @{nBCbgblack}@{BCred}   %{P3}. %;\
/elseif ({P2} =~ "ktore tnie") \
/echo -p @{B}@{BCwhite}[4 / 7] @{nBCred} Specujesz   --- >>   @{nBCbggreen}@{BCwhite}%{P2}   @{nBCbgblack}@{BCmagenta}   %{P3}. %;\
/elseif ({P2} =~ "ktore gleboko tnie") \
/echo -p @{B}@{BCwhite}[5 / 7] @{nBCred} Specujesz   --- >>   @{nBCbggreen}@{BCwhite}%{P2}   @{nBCbgblack}@{BCmagenta}   %{P3}. %;\
/elseif ({P2} =~ "ktore niemalze rozcina") \
/echo -p @{B}@{BCwhite}[6 / 7] @{nBCred} Specujesz   --- >>   @{nBCbggreen}@{BCwhite}%{P2}   @{nBCbgblack}@{BCmagenta}   %{P3}. %;\
/elseif ({P2} =~ "ktore z potworna moca tnie") \
/echo -p @{B}@{BCwhite}[7 / 7] @{nBCred} Specujesz   --- >>   @{nBCbggreen}@{BCwhite}%{P2}   @{nBCbgblack}@{BCmagenta}   %{P3}. %;\
/endif


/def  -aBg -mregexp -Fp7 -t'^(Ruszasz do przodu, w pol kroku wyprowadzajac|Nie zwazajac na nic rozpoczynasz|Poprawiasz chwyt na swym|Niespodziewanie skrecasz|Wyrzucasz do przodu) .* (Odpowiednio przenoszac ciezar ciala|Wykorzystujac dynamike ciosu|Przykleknawszy na jedno kolano|Korzystajac z dogodnego ustawienia) .* (lekko raniac|muskajac|(?<!lekko )raniac|kaleczac) (.*) (samym sztychem broni).' _spec_tipka2  =\
   	/echo -p @{B}@{nBCred}         W drugiego   -- >>   @{nBCbggreen}@{BCwhite}%{P3}   @{nBCbgblack}@{BCyellow}   %{P4} %;\
/let _kogo=$[tolower({P4})] %;\


;Zurwen wydaje ci rozkaz zasloniecia jego samego.



/def  -agB -mregexp -Fp8 -t'(.*) (rozpoczyna oburacz potezny mlyniec|rusza do przodu, w pol kroku wyprowadzajac|poprawia chwyt na swym|niespodziewanie skreca|wyrzuca do przodu) .* (ledwo zacina|ktore zacina|ktore plytko tnie|z potworna moca tnie|ktore tnie|ktore gleboko tnie|ktore bolesnie zacina|ktore niemalze rozcina|jakims cudem nie dosiega|ktore jednak zeslizguje sie|ktore tylko cudem) ([^.]*).' _spec_miecznika  =\
/if ({P3} =~ "jakims cudem nie dosiega") \
/echo -p @{B}@{BCyellow}%{P1} specuje @{BCwhite}[0 / 7]  --- >>   @{BCred}%{P3}   @{nBCbgblack}@{BCmagenta}   %{P4}. %;\
/elseif ({P3} =~ "ktore jednak zeslizguje sie") \
/echo -p @{B}@{BCyellow}%{P1} specuje @{BCwhite}[0 / 7]  --- >>   @{BCred}%{P3}   @{nBCbgblack}@{BCmagenta}   %{P4}. %;\
/elseif ({P3} =~ "ledwo zacina") \
/echo -p @{B}@{BCyellow}%{P1} specuje @{BCwhite}[1 / 7]  --- >>   @{nBCbgred}@{BCwhite}%{P3}   @{nBCbgblack}@{BCmagenta}   %{P4}. %;\
/elseif ({P3} =~ "ktore bolesnie zacina") \
/echo -p @{B}@{BCyellow}%{P1} specuje @{BCwhite}[2 / 7]  --- >>   @{BCgreen}%{P3}   @{nBCbgblack}@{BCmagenta}   %{P4}. %;\
/elseif ({P3} =~ "ktore plytko tnie") \
/echo -p @{B}@{BCyellow}%{P1} specuje @{BCwhite}[3 / 7]  --- >>   @{BCgreen}%{P3}   @{nBCbgblack}@{BCmagenta}   %{P4}. %;\
/elseif ({P3} =~ "ktore tnie") \
/echo -p @{B}@{BCyellow}%{P1} specuje @{BCwhite}[4 / 7]  --- >>   @{BCgreen}%{P3}   @{nBCbgblack}@{BCmagenta}   %{P4}. %;\
/elseif ({P3} =~ "ktore gleboko tnie") \
/echo -p @{B}@{BCyellow}%{P1} specuje @{BCwhite}[5 / 7]  --- >>   @{BCgreen}%{P3}   @{nBCbgblack}@{BCmagenta}   %{P4}. %;\
/elseif ({P3} =~ "ktore niemalze rozcina") \
/echo -p @{B}@{BCyellow}%{P1} specuje @{BCwhite}[6 / 7]  --- >>   @{BCgreen}%{P3}   @{nBCbgblack}@{BCmagenta}   %{P4}. %;\
/elseif ({P3} =~ "z potworna moca tnie") \
/echo -p @{B}@{BCyellow}%{P1} specuje @{BCwhite}[7 / 7]  --- >>   @{BCgreen}%{P3}   @{nBCbgblack}@{BCmagenta}   %{P4}. %;\
/else \
/echo -p @{B}@{BCwhite}  B L A D %{P3} %;\
/endif


       
/def  -aBg -mregexp -Fp7 -t'^(.*) (rozpoczyna oburacz potezny mlyniec|rusza do przodu, w pol kroku wyprowadzajac|poprawia chwyt na swym|niespodziewanie skreca|wyrzuca do przodu) .* (Odpowiednio przenoszac ciezar ciala|Wykorzystujac dynamike ciosu|Przykleknawszy na jedno kolano|Korzystajac z dogodnego ustawienia) .* (lekko raniac|muskajac|(?<!lekko )raniac|kaleczac) (.*) (samym sztychem broni).' _spec_miecznika2  =\
   	/echo -p @{B}@{nBCred}@{BCyellow}%{P1} drugiego          -- >>   @{BCwhite}%{P4}   @{nBCbgblack}@{BCyellow}   %{P5} %;\






/def -aB -mregexp -Fp8 -t'^Oczy (.*) zachodza woalem rytualnego (.*) ' _Tw_atak  =\
/echo -p @{B}       @{nBCred}            TW TW TW ATAKUJE        !!!! %;\
/echo -p @{B}       @{nBCred}            TW TW TW ATAKUJE        !!!! %;\
/echo -p @{B}       @{nBCred}            TW TW TW ATAKUJE        !!!! %;\
/beep 

;/def -aB -mregexp -Fp8 -t'^(.*) atakuje (.*)' _atak_atak  =\
;/echo -p @{B}       @{nBCred}            ATAKUJE        !!!! %;\
;/if ({ogolne_wspieranie}==0) /beep %;\
;/endif
;dzwiek odpala sie tylko przy wlaczonym wspieraniu

/def -aB -mregexp -Fp8 -t'^Placyk w polnocnej czesci miasta.' _plac_nuln  =\
/echo -p @{B}       @{nBCblue}            P L A C Y K  W  N U L N!       !!!! %;\
/echo -p @{B} %;\






/def -aB -mregexp -Fp8 -t'^(Glosno wypowiadasz rozkaz,|Niestety, nikt nie wykonal twego) .*' _rozkaz_nieudany  =\
/echo -p @{nBCbgred}@{BCwhite}     Rozkaz Nieudany      @{nBCbgwhite}@{BCred}     Rozkaz Nieudany     @{nBCbgred}@{BCwhite}     Rozkaz Nieudany      @{nBCbgred}@{BCwhite}%;\
/rstart -5 1 /echo -p @{BCgreen}                                            Mozesz znow rozkazywac!%;\

/def  -aB -mregexp -Fp8 -t'^(Na twoj rozkaz .*|Na rozkaz .*)' _rozkaz_udany  =\
/if ({pokaz} =~'1') \
/echo -p @{nBCbggreen}@{BCwhite}     Rozkaz udany   Rozkaz udany   Rozkaz udany Rozkaz udany   Rozkaz udany%;\
/set pokaz 0 %;\
/endif %;\
/rstart -4 1 /echo -p @{BCgreen}                                            Mozesz znow rozkazywac!%;\
/rstart -1 1 /set pokaz 1 %;\







/def  -aB -mregexp -Fp8 -t'^(.*) wydaje ci rozkaz zasloniecia jego samego.' _rozkaz_kogos_udany2w  =\
/let _kto=$[tolower(%{P1})] %;\
/let _kto=$(/_odmien_M_B %{_kto}) %;\
/let _wspierani_=$[strcat({ogolne_leader-LEADER},"|",{ogolne_druzyna-DRUZYNA})] %;\
/set _czy_wskazal_druzyna=$[regmatch({_wspierani_},{_kto})] %; \
/if ({_czy_wskazal_druzyna}==1) \
/echo -p @{BCmagenta}                                   P R O S I  O   Z A S L O N E%;\
/echo %;\
/echo -p @{BCmagenta}                                   ==> @{xBCwhite} xx i F3 @{BCmagenta}<==  ZASLON @{BCyellow} %{_kto} %;\
/echo %;\
/alias xx zaslon %{_kto} %;\
/f3 zaslon %{_kto} %;\
/endif


/def  -aB -mregexp -Fp8 -t'^Rzucasz sie na (.*) przebijajac sie przez *' _przelamanie_udane  =\
/let _kogo=$[replace("mezczyzny", "mezczyzne", {P1})] %;\
/let _kogo=$[tolower(%{_kogo})] %;\
/echo -p @{BCmagenta}                                   P R Z E L A M A L E S   $[toupper({_kogo})] %;\
/echo %;\
/echo -p @{BCmagenta}                                   ==> @{xBCwhite} /zab i F1 @{BCmagenta}<==  ATAK NA @{BCyellow} %$[toupper({_kogo})] %;\
/echo %;\
/def zab = /_zz %{_kogo} %;\
/f1 /_zz %{_kogo} %;\



/def  -aB -mregexp -Fp8 -t'(.*) bierze szeroki zamach .* i wali (.*) na odlew. Ten cios przeciwnik jest jeszcze w stanie ustac, .*' _ogluszenie_udane  =\
/let _kto=%{P1} %;\
/rstop /dodaj_sekunde %;\
/let _kogo=$[tolower(%{P2})] %;\
/echo -p @{BCmagenta}                         %{_kto}  oglusza specem   $[toupper({_kogo})] %;\
/echo -p @{BCmagenta}                            Alias zab - zablokuj    | Alias zabb - zabij %;\
/alias zab zablokuj %{_kogo} %;\
/alias zabb zz %{_kogo} %;\
/set sekundy_ogluszenia 0 %;\
/rstart -0.01 20000 /dodaj_sekunde %;\

/def dodaj_sekunde = \
/set sekundy_ogluszenia=$[sekundy_ogluszenia+0.01]%;\
;/echo sekundy : %{sekundy_ogluszenia} %;\

/def  -aB -mregexp -Fp8 -t'(.*) powoli dochodzi do siebie' _ogluszenie_udane_koniec  =\
/let _kto=%{P1} %;\
/rstop /dodaj_sekunde %;\
;/echo %{sekundy_ogluszenia} %;\
/echo -p @{BCyellow}%{_kto} przestaje byc ogluszony. [ %{sekundy_ogluszenia} ] %;\
/f1 powiedz do gniota Ogluszyles go kolego na : %{sekundy_ogluszenia} %;\


/def drozkaz = \
    /if ({*} =~ NULL) \
        /msg -w Co chcesz rozkazac wszystkim w druzynie? %;\
    /else \
	/_druzyna_powtorz C narozkaz _IMIE_ %{*} %;\
    /endif 

/def dprzedstaw = \
 /_druzyna_powtorz B przedstaw _IMIE_ %{*} %;\
przedstaw sie %{*}

/def dwesprzyj= \
/msg gzWspieram wszystkich w druzynie %;\
/_druzyna_powtorz B gzwesprzyj _IMIE_ %;\
/gagujwsparcie

/def  -aB -mregexp -Fp8 -t'(.*) unoszac prawa dlon wypreza sie przed toba.' _salut_  =\
/let _kto=$[tolower(%{P1})] %;\
/let _kto=$(/_odmien_M_C %{_kto}) %;\
/f1 nasalutuj %{_kto} %;\





/def gagujwsparcie = /def -mregexp -ag -t"Nie jestes w stanie wspomoc *" ocenaGag%;/repeat -1 1 /undef ocenaGag
/def gagujwycinanie = /def -mregexp -ag -t"(Slucham?)*" wycinanieGag%;/repeat -1 1 /undef wycinanieGag


/def spectest = \
/itrigger Nie zwazajac na nic rozpoczynasz oburacz potezny mlyniec mahakamskim kunsztownym mieczem, momentalnie przechodzac do uderzenia, ktore plytko tnie barczystego orka w glowe. Wykorzystujac dynamike ciosu przeciagasz go jeszcze, raniac muskularnego brudnego orka samym sztychem broni. %;\
/itrigger Wyrzucasz do przodu swoj mahakamski kunsztowny miecz, wkladajac cala sile w uderzenie, ktore plytko tnie brutalnego olbrzymiego czarnego orka w nogi. %;\
/itrigger Poprawiasz chwyt na swym mahakamskim kunsztownym mieczu i z szerokiego zamachu wyprowadzasz nim potezne uderzenie, ktore z potworna moca tnie barczystego muskularnego czarnego orka doslownie w pol. Odpowiednio przenoszac ciezar ciala ciagniesz cios dalej, lekko raniac brutalnego brudnego orka samym sztychem broni. %;\
/itrigger Zurwen rusza do przodu, w pol kroku wyprowadzajac oburacz szybkie uderzenie mahakamskim kunsztownym mieczem, ktore jednak zeslizguje sie po wzmacnianej drewnianej tarczy masywnego poteznego czarnego orka. Przykleknawszy na jedno kolano prowadzi cios dalej, lekko raniac krzywonogiego smierdzacego orka samym sztychem broni.


/def atak = \
    /if ({*} =~"1") \
	    /if (%{auto_atak} =~"1") /msg Atak auto byl juz dawno wlaczony! %;\
	    /endif %;\
            /set auto_atak 1 %;\
	    /msg Atak wlaczony! %;\
    /elseif ({*} =~"0") \
           /set auto_atak 0 %;\
	   /msg Atak wylaczony! %;\
    /else \
	   /msg Wpisz '/atak 1' aby atakowac wskazanego lub 0 aby przestac. %;\
   /endif

/def wskazuje = \
    /if ({*} =~NULL) \
	    /msg %{wskazujacy} nie jest wskazujacym ! Wyswietlam wskazania reszty najmow!%;\
	    /set wskazujacy=nikt %;\
    /else \
	   /set wskazujacy=%{*} %;\
	   /set wskazujacy=$[tolower({wskazujacy})] %;\
	   /msg %{*} jest wskazujacym ! Przestaje wyswietlac wskazania innych osob! %;\
   /endif

/def rozkazuj = \
    /if ({*} =~NULL) \
	    /msg Nie rozkazuje po wskazaniu wroga!%;\
	    /set rozkazuje=0 %;\
    /else \
	   /set rozkazuje=1 %;\
	   /msg Po wskazaniu wroga, staram sie wydac rozkaz!%;\
   /endif

/def przelamuj = \
    /if ({*} =~NULL) \
	    /msg Olewam zaslony przeciwnika.!%;\
	    /set przelamuje=0 %;\
    /else \
	   /set przelamuje=1 %;\
	   /msg Staram sie lamac wroga przy ataku.!%;\
   /endif

/def przestawaj = \
    /if ({*} =~NULL) \
	    /msg Nie przestaje zaslaniac%;\
	    /set przestaje=0 %;\
    /else \
	   /set przestaje=1 %;\
	   /msg Puszczam zaslone gdy sie uda zaslonic%;\
   /endif


/def gladtest = \
/itrigger Czujny zarosniety mezczyzna (GL Reindhart) blyskawicznym spojrzeniem lustruje okolice, jak gdyby liczac na dojrzenie kogos znajomego. Po chwili niego spojrzenie zatrzymuje sie, zas on sam wykrzykuje kilka krotkich slow. %;\
/itrigger Czujny zarosniety mezczyzna (GL Reindhart) przyklada palec do ust i szybko wygwizduje krotki, wysoki sygnal.
 



/def -Fp2 -t'*trafia cie * w nogi* wyparowan*' stats_wyparowane_nogi = /dodaj_wyparowane nogi %{L1} 
/def -Fp2 -t'*trafia cie * w lewe ramie* wyparowan*' stats_wyparowane_lramie = /dodaj_wyparowane lramie %{L1}
/def -Fp2 -t'*trafia cie * w prawe ramie* wyparowan*' stats_wyparowane_pramie = /dodaj_wyparowane pramie %{L1}
/def -Fp2 -t'*trafia cie * w korpus* wyparowan*' stats_wyparowane_korpus = /dodaj_wyparowane korpus %{L1}
/def -Fp2 -t'*trafia cie * w glowe* wyparowan*' stats_wyparowane_glowa = /dodaj_wyparowane glowa %{L1}

/def -Fp2 -t'* cie w glowe.' stats_rany_glowa = /test ++glowa_rany
/def -Fp2 -t'* cie w lewe ramie.' stats_rany_lramie = /test ++lramie_rany
/def -Fp2 -t'* cie w prawe ramie.' stats_rany_pramie = /test ++pramie_rany
/def -Fp2 -t'* cie w korpus.' stats_rany_korpus = /test ++korpus_rany
/def -Fp2 -t'* cie w nogi.' stats_rany_nogi = /test ++nogi_rany

/def -Fp2 -t'*udaje ci sie oslonic*' stats_oslona = /test ++oslona_tarcza
/def -Fp2 -t'*tobie udaje sie oslonic*' stats_oslona2 = /test ++oslona_tarcza
/def -Fp2 -t'*wyparowany przez polyskliwa trojkatna tarcze*' stats_oslona3 = /test ++oslona_tarcza
/def -Fp2 -t'*tobie udaje sie uniknac*' stats_unik = /test ++unik
/def -Fp2 -t'*nie udaje sie trafic ciebie*' stats_unik2 = /test ++unik

/def -Fp2 -t'*tobie udaje sie je zbic*' stats_parowanie = /test ++parowanie
/def -Fp2 -t'*, lecz tobie udaje sie zbic je z linii ataku*' = /test ++parowanie
/def -Fp2 -t'*, lecz tobie udaje sie go sparowac *' = /test ++parowanie

/def -Fp2 -t'*dotknal cie w glowe *' stats_rany_glowa2 = /test ++glowa_rany
/def -Fp2 -t'*dotknal cie w lewe ramie *' stats_rany_lramie2 = /test ++lramie_rany
/def -Fp2 -t'*dotknal cie w prawe ramie *' stats_rany_pramie2 = /test ++pramie_rany
/def -Fp2 -t'*dotknal cie w korpus *' stats_rany_korpus2 = /test ++korpus_rany
/def -Fp2 -t'*dotknal cie w nogi *' stats_rany_nogi2 = /test ++nogi_rany

/def dodaj_wyparowane = \
	/let co=$[replace(".","",{2})]%;\
	/test (wyparowane_%{1}_%{co}:=wyparowane_%{1}_%{co} + 1) %;

/def stats_wyparowane = \
	/let j=%{1} %;\
	/let wyp_razem=0 %;\
	/let wyparowane_lista=$(/listvar -s -mglob wyparowane_%{j}_*) %;\
	/let wyparowane_lista=$[strcat(wyparowane_lista," end")]%;\
	/let linia=%;\
	/while /let i=$[strstr(wyparowane_lista," ")]%; /@test i>0 %;/do \
		/let sprzet=$[substr(wyparowane_lista,0,i)] %;\
		/let wyparowane_lista=$[substr(wyparowane_lista,i+1)] %;\
		/let wyp_ile=$(/listvar -v %{sprzet}) %;\
		/let wyp_razem=$[wyp_razem+wyp_ile] %;\
		/let sprzet_nazwa=$[substr(sprzet,strrchr(sprzet,"_")+1)] %;\
		/let linia=$[strcat(linia," ",sprzet_nazwa,":",wyp_ile,"  ")]%;\
	/done %;\
	/let procent=100%;\
	/let x=$(/listvar -v %{j}_rany)%;\
	/let x=$[wyp_razem+x] %;\
	/set wszystkie_parowania=$[wszystkie_parowania+wyp_razem] %;\
	/if ({x}>0) \
		/let procent=$[100*wyp_razem / x ] %;\
	/else \
		/let procent=?%;\
	/endif %;\
	/let linia=$[strcat("| ",pad(j,-6)," ",pad(wyp_razem,5),"/",pad(x,-5)," [",pad(procent,3),"%%]  |",linia)] %;\
	/eval /echo @{C%kolor_info}%{linia}@{n}
 
/def stats =\
	/set wszystkie_parowania=0%;\
	/echo @{C%kolor_info}+----[ Skutecznosc zbroi ]---+-----------[ Wyparowane przez ]---------+@{n}%;\
	/stats_wyparowane glowa %;\
	/stats_wyparowane lramie %;\
	/stats_wyparowane pramie %;\
	/stats_wyparowane korpus %;\
	/stats_wyparowane nogi%;\
	/echo @{C%kolor_info}+----------------------------+----------------------------------------+@{n}%;\
	/test (wszystkie_rany:=glowa_rany+lramie_rany+pramie_rany+korpus_rany+nogi_rany) %;\
	/let x=$[wszystkie_parowania+wszystkie_rany+unik+oslona_tarcza+parowanie] %;\
	/if (x>0) \
		/let p1=$[100*unik / x]%;\
		/let p2=$[100*parowanie / x]%;\
		/let y=$[wszystkie_parowania+unik+oslona_tarcza]%;\
		/let p3=$[100*oslona_tarcza / x]%;\
		/let p4=$[100*y / x]%; \
	/else \
		/let p1=?%;\
		/let p2=?%;\
		/let p3=?%;\
		/let p4=?%;\
	/endif%;\
	/let linia=$[strcat("| ",pad("uniki",-6)," ",pad(unik,5),"/",pad(x,-5)," [",pad(p1,3),"%%]  |")]%;\
	/eval /echo @{C%kolor_info}%{linia}@{n}%;\
	/let linia=$[strcat("| ",pad("zbicia",-6)," ",pad(parowanie,5),"/",pad(x,-5)," [",pad(p2,3),"%%]  |")]%;\
	/eval /echo @{C%kolor_info}%{linia}@{n}%;\
	/let linia=$[strcat("| ",pad("oslona",-6)," ",pad(oslona_tarcza,5),"/",pad(x,-5)," [",pad(p3,3),"%%]  |")] %;\
	/eval /echo @{C%kolor_info}%{linia}@{n}%;\
	/let linia=$[strcat("+----------------------------+")] %;\
	/let linia=$[strcat(linia,"-----( W sumie: ",pad(y,5),"/",pad(x,-5)," [",pad(p4,3),"%%] )----+")] %;\
	/eval /echo @{C%kolor_info}%{linia}@{n}%;\

/def czysc_staty = \
	/quote -S /unset `/listvar -s wyparowane_* %;\
	/quote -S /unset `/listvar -s *_rany %;\
	/quote -S /unset `/listvar -s unik %;\
	/quote -S /unset `/listvar -s oslona_tarcza %;\
	/quote -S /unset `/listvar -s parowanie %;
  


/def kondycja_toggle = \
    /if (!_kondycja_org) \
        /mesg Pokazuje kondycje z napisem. %; \
        /set _kondycja_org=1%;\
    /else \
        /mesg Pokazuje kondycje bez napisu. %; \
        /set _kondycja_org=0%;\
    /endif

/set _kondycja_org=1

/def -F -mregexp -t'^Jestes (w (swietnej kondycji|dobrym stanie|zlej kondycji)|(lekko |ciezko |)rann.|ledwo zyw.)\.$' _kondycja_catch = \
    /set lap_kondycje_innych=1 %; \
    /set _numer_kondycja_last_id=1 %; \
    /repeat -0.1 1 /unset lap_kondycje_innych%; \

/def kondycja_toggle = \
    /if (!_kondycja_org) \
        /mesg Pokazuje kondycje z napisem. %; \
        /set _kondycja_org=1%;\
    /else \
        /mesg Pokazuje kondycje bez napisu. %; \
        /set _kondycja_org=0%;\
    /endif

/set _kondycja_org=1





/def -E(lap_kondycje_innych) -Fp1000 -mregexp -t' jest (w (swietnej kondycji|dobrym stanie|zlej kondycji)|(lekko |ciezko |)rann.|ledwo zyw.)\.$' _kondycja_catch2 = \
    /if ({P1} =~ "w swietnej kondycji") \
        /let _k=7%; \
        /let _kol=BCgreen%; \
    /elseif ({P1} =~ "w dobrym stanie") \
        /let _k=6%; \
        /let _kol=BCgreen%; \
    /elseif ({P1} =/ "lekko rann?") \
        /let _k=5%; \
        /let _kol=Cgreen%; \
    /elseif ({P1} =/ "rann?") \
        /let _k=4%; \
        /let _kol=Cyellow%; \
    /elseif ({P1} =~ "w zlej kondycji") \
        /let _k=3%; \
        /let _kol=BCmagenta%; \
    /elseif ({P1} =/ "ciezko rann?") \
        /let _k=2%; \
        /let _kol=Cred%; \
    /elseif ({P1} =/ "ledwo zyw?") \
        /let _k=1%; \
        /let _kol=BCred%; \
    /else \
        /let _k=0%; \
        /let _kol=h%; \
    /endif %; \
    /let _who=$[replace("(", "", replace(")", "", replace("[", "", replace("]", "", {PL}))))]%; \
    /let _wspierani_=$[strcat({ogolne_leader-LEADER},"|",{ogolne_druzyna-DRUZYNA})] %;\
    /set _czy_to_druzyna=$[regmatch({_wspierani_},tolower(_who))] %; \
    /if ({_czy_to_druzyna}==0) \
;    /msg To nie druzyna! %;\
    /set _kondycja_osoba_%{_numer_kondycja_last_id}=$[tolower(_who)] %; \
    /set _kondycja_osoby_%{_numer_kondycja_last_id}=%_k %; \
    /test ++_numer_kondycja_last_id %;\
    /if (_kondycja_org) \
;   /msg Lalala %;\
;       /substitute -p [$[pad(_numer_kondycja_last_id, -2)]%{_dl}]@{nBCyellow}|@{n%_kol}$[strrep("##", _k)]@{nBCyellow}$[strrep("  ", 7 - _k)]|@{nBCwhite} -[$[pad(_numer_kondycja_last_id, -2)]] $[pad({PL}, -40, strcat("@{n", _kol, "}"), 0, {P1}, -20)]%; \
    /else \
;        /substitute -p [$[pad(_numer_kondycja_last_id, -2)]%{_dl}]@{nBCyellow}|@{n%_kol}$[strrep("##", _k)]@{nBCyellow}$[strrep("  ", 7 - _k)]|@{nBCwhite} -[$[pad(_numer_kondycja_last_id, -2)]] %{PL}.@{n}%; \
    /endif %; \
    /endif %;\
	/set _minimum 7 %;\
	/set i3=1 %;\
;	/rstart -0.1 1 /cos_dziwnego
	

/set czy_flood 0

/alias kkk kk%;/rstart -0.1 1 /cos_dziwnego

/def cos_dziwnego = \
/while (i3 < ({_numer_kondycja_last_id})) \
;	/echo %{i3} %;\
	/set index=$[_numer_kondycja_last_id - i3] %;\
;	/msg %{index} %;\
	/let _kto=$(/eval /echo %%{_kondycja_osoba_%index}) %; \
	/let _kondycja=$(/eval /echo %%{_kondycja_osoby_%index}) %; \
;	/echo Kto: %{_kto}  Kodycja: %{_kondycja} Minimum: %{_minimum}%;\
	/if ({_minimum} >= {_kondycja}) \
		/set _minimum=%{_kondycja} %;\
		/set _index=%{index} %;\
;		/msg Nowe minimum to %{_minimum} o indexie %{_index} %;\
	/endif %;\
	/set i3=$[i3 + 1]%; \
/done %;\
;/if ({_minimum}!=7) \
/let _pociety=$(/eval /echo %%{_kondycja_osoba_%_index}) %; \
;/let _pociety=$(/_odmien_M_B %{_pociety}) %;\
/unset _wrog_bind_on%;\
/echo %; \
/msg Najbardziej pociety jest.. %{_pociety} %;\
/_set_wrog %{_pociety} %;\
/echo %; \
;/endif


