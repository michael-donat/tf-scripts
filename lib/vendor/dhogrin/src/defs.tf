;------------------------------------------------------------------------
;				KALENDARZ				|
;------------------------------------------------------------------------

/def -t'* Nachhexen *' wim1 = /echo -p @{BCGreen} # Wczesna wiosna.
/def -t'* Jahrdrung *' wim2 = /echo -p @{BCGreen} # Wiosna.
/def -t'* Pflugzeit *' wim3 = /echo -p @{BCGreen} # Pozna wiosna.
/def -t'* Sigmarszeit *' lim1 = /echo -p @{BCGreen} # Wczesne lato.
/def -t'* Sommerzeit *' lim2 = /echo -p @{BCGreen} # Lato.
/def -t'* Vorgeheim *' lim3 = /echo -p @{BCGreen} # Pozne lato.
/def -t'* Nachgeheim *' jim1 = /echo -p @{BCGreen} # Wczesna jesien.
/def -t'* Erntezeit *' jim2 = /echo -p @{BCGreen} # Jesien.
/def -t'* Brauzeit *' jim3 = /echo -p @{BCGreen} # Pozna jesien.
/def -t'* Kaltezeit *' zim1 = /echo -p @{BCGreen} # Wczesna zima.
/def -t'* Ulrichszeit *' zim2 = /echo -p @{BCGreen} # Zima.
/def -t'* Vorhexen *' zim3 = /echo -p @{BCGreen} # Pozna zima.

/def -t'* Yule *' zis1 = /echo -p @{BCGreen} # Wczesna zima.
/def -t'* Imbaelk *' zis2 = /echo -p @{BCGreen} # Pozna zima.
/def -t'* Birke *' wis1 = /echo -p @{BCGreen} # Wczesna wiosna.
/def -t'* Blathe *' wis2 = /echo -p @{BCGreen} # Pozna wiosna.
/def -t'* Feainn *' lis1 = /echo -p @{BCGreen} # Wczesne lato.
/def -t'* Lammas *' lis2 = /echo -p @{BCGreen} # Pozne lato.
/def -t'* Velen *' jis1 = /echo -p @{BCGreen} # Wczesna jesien.
/def -t'* Saovine *' jis2 = /echo -p @{BCGreen} # Pozna jesien.


;------------------------------------------------------------------------
;			OCENA I TAKIE TAM				|
;------------------------------------------------------------------------

/def -Fp99999 -mregexp -t'okolo (.*) miedziak(i|ow).' wartosc_trig_1 = /substitute -p %{PL}okolo @{BxCwhite}$[{P1}/24000] mithryli, $[mod({P1},24000)/240] zlota, $[mod({P1},240)/12] srebra i $[mod({P1},12)] miedzi@{n} czyli jakies %{P1} miedzi.%{PR}

/def -Fp99999 -mregexp -t'wartych (.*) miedziakow.' wartosc_trig_2 = /substitute -p %{PL}wartych okolo @{BxCwhite}$[{P1}/24000] mithryli, $[mod({P1},24000)/240] zlota, $[mod({P1},240)/12] srebra i $[mod({P1},12)] miedzi@{n} czyli jakies %{P1} miedzi.%{PR}

/def -Fp99999 -mregexp -t'warte (.*) miedziakow.' wartosc_trig_3 = /substitute -p %{PL}warte okolo @{BxCwhite}$[{P1}/24000] mithryli, $[mod({P1},24000)/240] zlota, $[mod({P1},240)/12] srebra i $[mod({P1},12)] miedzi@{n} czyli jakies %{P1} miedzi.%{PR}


;------------------------------------------------------------------------
;		TRENINGI, GILDIE, UMIEJKI				|
;------------------------------------------------------------------------
/def krolk = \
    wez klucz z ciala%; \
    otworz skrzynie kluczem%; \
    otworz skrzynie%; \
    wez monety ze skrzyni%; \
    wez monety z ciala
/def kuf = \
    wez kluczyk z ciala%; \
    otworz kufer kluczem%; \
    otworz kufer kluczykiem%; \
    otworz kufer%; \
    wez monety z kufra%; \
    wloz kluczyk do kufra
/def szk = \
    wez kluczyk z ciala%; \
    otworz szkatulke kluczem%; \
    otworz szkatulke kluczykiem%; \
    otworz szkatulke%; \
    wez monety ze szkatulki%; \
    wloz kluczyk do szkatulki
/def skr = \
    wez kluczyk z ciala%; \
    otworz szrzynie kluczem%; \
    otworz skrzynie kluczykiem%; \
    otworz skrzynie%; \
    wez monety ze skrzyni%; \
    otworz szrzynke kluczem%; \
    otworz skrzynke kluczykiem%; \
    otworz skrzynke%; \
    wez monety ze skrzynki%; \
    wloz kluczyk do skrzynki%; \
    wloz kluczyk do skrzyni
/def medytuj = \
    stan%; \
    usiadz%; \
    c%; \
    medytuj%; \
    ocen sile%; \
    ocen zrecznosc%; \
    ocen wytrzymalosc%; \
    ocen inteligencje%; \
    ocen madrosc%; \
    ocen odwage%; \
    powstan%; \
    stan

;------------------------------------------------------------------------
;			ZIOLA		      				  |
;------------------------------------------------------------------------    
    
/def WymienWoreczki = \
    otworz plecak%; \
    otworz zamkniety przytroczony woreczek%; \
    wez wszystko z niego%; \
    odtrocz otwarty przytroczony woreczek%; \
    wloz go do plecaka%; \
    otworz zamkniety przytroczony woreczek%; \
    wez wszystko z niego%; \
    odtrocz otwarty przytroczony woreczek%; \
    wloz go do plecaka%; \
    otworz zamkniety przytroczony woreczek%; \
    wez wszystko z niego%; \
    odtrocz otwarty przytroczony woreczek%; \
    wloz go do plecaka%; \
    otworz zamkniety przytroczony woreczek%; \
    wez wszystko z niego%; \
    odtrocz otwarty przytroczony woreczek%; \
    wloz go do plecaka%; \
    otworz zamkniety przytroczony woreczek%; \
    wez wszystko z niego%; \
    odtrocz otwarty przytroczony woreczek%; \
    wloz go do plecaka%; \
    przytrocz woreczki%; \
    /SortujZiola

/def SortujZiola = \
    otworz zamkniety przytroczony woreczek%; \
    wez wszystko z niego%; \
    otworz zamkniety przytroczony woreczek%; \
    wez wszystko z niego%; \
    otworz zamkniety przytroczony woreczek%; \
    wez wszystko z niego%; \
    otworz zamkniety przytroczony woreczek%; \
    wez wszystko z niego%; \
    otworz zamkniety przytroczony woreczek%; \
    wez wszystko z niego%; \
    wloz zolte jasne kwiaty do pierwszego przytroczonego woreczka%; \
    wloz czterokanciaste rozgalezione lodygi do drugiego przytroczonego woreczka%; \
    wloz kremowe owlosione kwiaty do trzeciego przytroczonego woreczka%; \
    wloz drobne ukwiecone galazki do czwartego przytroczonego woreczka%; \
    wloz ziola do pierwszego przytroczonego woreczka%; \
    wloz ziola do drugiego przytroczonego woreczka%; \
    wloz ziola do trzeciego przytroczonego woreczka%; \
    wloz ziola do czwartego przytroczonego woreczka%; \
    wloz ziola do piatego przytroczonego woreczka%; \
    zamknij woreczki

    
    
/def k = \
    /purge __delete_blank_lines%; \
    /def -F -aLg -n2 -mregexp -t'^$$' __delete_blank_lines %; \
    /def -Fp150 -ag -n1 -mregexp -t'^Czujesz sie' _zmeczenie_lap_po_kondycji = \
      /echo '---------------------------------------------------------'%%; \
      /echo%%; \
      /purge __delete_blank_lines%; \
    /echo%;\
    /echo .---------------------------------------------------------.%;\
    k%; \
    zmeczenie
    
/def -Fp50 -mregexp -t'(Jest .*, (znanym|znana) jako:|Jest to [^ ]+ [^ ]+ (elf|elfka|krasnolud|krasnoludka|gnom|gnomka|ogr|ogrzyca|niziolek|niziolka|polelf|polelfka|mezczyzna|kobieta|halfling|halflinka|mutant|mutantka)\.)' _rozdzielenie_opisow_postaci = /echo%; /echo +---------------------------------------------------------------------------------+%; /echo

/def comp = \
    /if ({*}=/"* i *") \
      /let _kim_=%{*} %;\
    /else \
      /let _kim_=z %{*-mezczyzna} %;\
    /endif %;\
    porownaj sile %{_kim_} %;\
    porownaj zrecznosc %{_kim_} %;\
    porownaj wytrzymalosc %{_kim_}
    
/def who=zapytaj dostojna piwnooka krasnoludke o krasnoludy

/def bil = \
    kup bilet%; \
    wejdz na statek
   
/def sc = \
    zastukaj w sciane
    
/def top=opusc sztylet%; dobadz topora
/def szt=opusc topor%; dobadz sztyletu
/def tru=nacisnij przycisk sztyletu

/def -q -mregexp -h'SEND ^ostatnio (.*)' _senduje_ostatnio = /echo -p  @{BCblue}Ostatnio: $[toupper({P1},1)]

/def zap=odczytaj zapiski o wszystkim
/def tar=poloz zniszczona tarcze%; op%; wez tarcze z plecaka%; zaloz ja%; zp

/def [ = stan

/def pw = przestan walczyc

/def in = \
  otworz piaty przytroczony woreczek%; \
  wloz ziola do niego%; \
  zamknij otwarte woreczki%; \
  otworz czwarty przytroczony woreczek%; \
  wloz ziola do niego%; \
  zamknij otwarte woreczki
  
/def szczel=przecisnij sie przez szczeline
/def krata=podnies krate

/def v = zaslon violle
/def u = zaslon urse
/def kk = zaslon kiliane
/def g = z gharkha
/def h = z hunverta
/def gz = gzwycofaj sie za %{*}
/def gzk=/gz kiliane
/def gzg=/gz gharkha
/def gzh=/gz hunverta
/def gzr=/gz ravene
/def gzu=/gz urse
/def down=zejdz na dol
/def up=wejdz na mur


/def wyp = \
  przestan walczyc%; \
  wyp

/def swietl = \
  opusc bron%; \
  otworz czwarty przytroczony woreczek%; \
  wez drobna ukwiecona galazke z niego%; \
  zamknij otwarte woreczki%; \
  rozgryz drobna ukwiecona galazke%; \
  dobadz jednorecznego topora

/def dell = \
  przestan walczyc%; \
  opusc bron%; \
  otworz pierwszy przytroczony woreczek%; \
  wez zolty jasny kwiat z niego%; \
  zjedz zolty jasny kwiat%; \
  dobadz jednorecznego topora%; \
  zamknij otwarte woreczki
  
/def delln = \
  otworz pierwszy przytroczony woreczek%; \
  wloz zolty jasny kwiat do niego%; \
  zamknij otwarte woreczki
  
/def dziur = \
  przestan walczyc%; \
  opusc bron%; \
  otworz drugi przytroczony woreczek%; \
  wez cztery czterokanciaste rozgalezione lodygi z niego%; \
  rozgryz czterokanciaste rozgalezione lodygi%; \
  dobadz jednorecznego topora%; \
  zamknij otwarte woreczki

/def dziurn = \
  otworz drugi przytroczony woreczek%; \
  wloz czterokanciaste rozgalezione lodygi do niego%; \
  zamknij otwarte woreczki

/def przel = \
  przestan walczyc%; \
  opusc bron%; \
  otworz trzeci przytroczony woreczek%; \
  wez kremowy owlosiony ususzony kwiat z niego%; \
  sproszkuj kremowy owlosiony ususzony kwiat%; \
  dobadz jednorecznego topora%; \
  zamknij otwarte woreczki

/def przeln = \
  otworz drugi przytroczony woreczek%; \
  wloz kremowy owlosiony ususzony kwiat do niego%; \
  zamknij otwarte woreczki

/def skrotin=przecisnij sie przez otwor%; przecisnij sie na zachod%; przecisnij sie na poludniowy-zachod%; przecisnij sie na poludniowy-wschod
/def skrotout=przecisnij sie przez otwor%; przecisnij sie na polnocny-wschod%; przecisnij sie na wschod%; przecisnij sie na poludniowy-zachod

/def ww=monn%; wez wszystkie zbroje%; wez wszystkie bronie
/def www=/ww%; wez wszystko z pierwszego ciala%; wez wszystko z drugiego ciala%; wez wszystko z trzeciego ciala%; wez wszystko z czwartego ciala%; wez wszystko z piatego ciala
/def grab = wez %{*} z pierwszego ciala%; wez %{*} z drugiego ciala%; wez %{*} z trzeciego ciala%; wez %{*} z czwartego ciala%; wez %{*} z piatego ciala%; wez %{*} z szostego ciala
/def -p200 -mregexp -t'Powoli opuszczaja cie wszelkie emocje. Zadne odczucia nie zaklocaja twoich mysli. Bardziej opanowany juz chyba byc nie mozesz.' _jemDelione = /substitute -p @{BCred}      >  @{BCWhite}> @{BCgreen}Z J A D L E M   D E L I O N E @{BCWhite}< @{BCred}<
/def -p200 -mregexp -t'Wraz z koncem dzialania ziola dochodzi do ciebie fakt tego, jak bardzo jestes wyczerpany. Przeforsowanie organizmu rowniez nie wyszlo ci na dobre, twoje miesnie bolesnie daja o sobie znac przy kazdym ruchu.' _koniecDeliony = /substitute -p @{BCred}      >  @{BCWhite}> @{BCgreen}K O N I E C   D E L I O N Y @{BCWhite}< @{BCred}<

/def -p399 -mregexp -t'(Wyglada na to, ze jest w dobrym stanie.)'     kond_broni2

/def -F -mregexp -t'MAPPER sp' _mapper_test = \
  /echo F2 = sp!%; \
  /def key_F2=sp%; \
  /send -wArkadia sp
  
/def -Fp1000 -mregexp -t'^>' _usuwanie_prompta = \
  /substitute %{PR} 

  
/def FBDoIt = /let FBComm %{*}%; /echo -p @{BxCyellow}    *  F2 - %{FBComm}  *%; /def key_f2 = %{FBComm}

/def -F -mregexp -t'Probujesz otworzyc (.*), ale nie udaje ci sie to.' _FastBindBrama = /FBDoIt uderz we wrota
