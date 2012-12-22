;/def l = /eval /log -g $ Arkadia.$[ftime("%F")]
/def v = zaslon violle
/def u = zaslon urse
/def kk = zaslon kiliane
/def gz = gzwycofaj sie za %{*}
/def gzk=/gz kiliane
/def gzg=/gz gharkha
/def gzh=/gz hunverta
/def gzr=/gz ravene
/def gzu=/gz urse
/def down=zejdz na dol
/def up=wejdz na mur
/def key_f8=trop

/def zap=odczytaj zapiski o wszystkim
/def tar=poloz zniszczona tarcze%; op%; wez tarcze z plecaka%; zaloz ja%; zp

/def ingw=/load ~/tf/Arkadia/Ingwar/ingw.tf
; Lokacje git: 1, 2, 3, 4, 6, 7, 8, 10, 11, 12

/def -Fp50 -mregexp -t'(Jest .*, (znanym|znana) jako:|Jest to [^ ]+ [^ ]+ (elf|elfka|krasnolud|krasnoludka|gnom|gnomka|ogr|ogrzyca|niziolek|niziolka|polelf|polelfka|mezczyzna|kobieta|halfling|halflina|mutant|mutantka)\.)' _rozdzielenie_opisow_postaci = /echo%; /echo +---------------------------------------------------------------------------------+%; /echo

/def symbol = /if ({*}=~'on') /set symbol=1%; /set sl1=1%; /set sl2=1%; /set sl3=1%; /set sl4=1%; /set sl5=1%; /set sl6=1%; /set sl7=1%; /set sl8=1%; /set sl9=1%; /set sl10=1%; /set sl11=1%; /set sl12=1%; /set sl13=1%; /set sl14=1%; /set sl15=1%; /else /set symbol=0%; /endif
/def -p200 -mregexp -t'Schody prowadzace na zewnatrz wygladaja na dluzsze, niz sie to wydawalo. Gdyby zaszla koniecznosc ucieczki do bedziesz miec do przebycia dluga droge, zanim wydostaniesz sie na otwarta przestrzen. Sciany tego pomieszczenia pokryte sa pajeczynami, zas po zakurzonej podlodze walaja sie resztki jakichs kosci. Na jednej ze scian zauwazasz tez uchwyt, w ktorym zatknieto pochodnie - w tej chwili pozostal po niej tylko marny zweglony kikut.' _symbol_lok_1 = /if ({symbol}==1 & {sl1}==1) /set sl1=0%; /echo -p @{BCGreen} # Lokacja 1 # %; ob sciany%; ob pajeczyny%; ob kosci%; ob uchwyt%; ob kikut%; /endif
/def -p200 -mregexp -t'Gdyby rozlozyc szeroko rece, obie dlonie dotknely by zimnych, kamiennych scian. Korytarz ciagnie sie kilkanascie metrow w glab grobowca. Wedrujac nim nie napotykasz na zadna nisze czy wneke. Sciany ulozone z kamiennych blokow sa rowne i gladkie, choc miejscami naznaczone glebokimi bruzdami pekniec zamaskowanych siatka gestych pajeczyn. Przytlaczajaca atmosfera smierci i rozkladu otacza cie zewszad, a intensywny odor zgnilizny utrudnia oddychanie.' _symbol_lok_2 = /if ({symbol}==1 & {sl2}==1) /set sl2=0%; /echo -p @{BCGreen} # Lokacja 2 # %; ob sciany%; ob bruzdy%; ob pekniecia%; ob pajeczyny%; /endif
/def -p200 -mregexp -t'Stawiasz ostroznie stopy uwazajac by nie potknac sie o lezace wokol kosci i czaszki. Z tego miejsca rozchodza sie trzy korytarze niknace w czelusciach mroku. Jednym z nich dochodzi powiew swiezego powietrza, widocznie tam znajduje sie droga do wyjscia. Probujac przebic wzrokiem ciemnosci spowijajace korytarze, zdaje ci sie ze dostrzegasz setki blyskajacych raz po raz oczu - krwistoczerwonych, upiornych, napawajacych strachem...' _symbol_lok_3 = /if ({symbol}==1 & {sl3}==1) /set sl3=0%; /echo -p @{BCGreen} # Lokacja 3 # %; ob kosci%; ob czaszki%; /endif
/def -p200 -mregexp -t'Wedrujac mrocznymi korytarzami docierasz do miejsca, w ktorym niespodziewanie z mroku wylania sie sciana blokujaca dalsza droge w tym kierunku. Ze stropu zwisaja lepkie, gesto utkane pajeczyny, po ktorych leniwie pelzna odrazajace, opasle pajaki. Kamienne sciany splywaja czarna oleista ciecza, a w powietrzu unosi sie odor smierci i rozpaczy. Twych uszu dobiegaja jezace wlos, upiorne chichoty, przerywane czasem przerazajacymi jekami pelnymi bolu i cierpienia. Czarne macki ciemnosci chwytaja cie za trzewia wykrecajac je z okrucienstwem.' _symbol_lok_4 = /if ({symbol}==1 & {sl4}==1) /set sl4=0%; /echo -p @{BCGreen} # Lokacja 4 # %; ob sciane%; ob pajeczyny%; ob pajaki%; ob sciany%; ob ciecz%; /endif
/def -p200 -mregexp -t'Przemierzajac mroczne korytarze i komnaty docierasz do miejsca, gdzie zatechle przejscie wiodace wglab kurhanu konczy sie nagle w tym miejscu. Dalsza droge blokuje ceglana sciana wymurowana dawno temu prawdopodobnie by zapobiec zbezczeszczeniu grobowca przez rabusiow. A moze, by zatrzymac kogos lub cos w srodku\?.. Atmosfera grozy zageszcza sie z kazdym krokiem przyblizajacym cie do sciany. Przy samej scianie czujesz silny niepokoj choc nie jestes w stanie okreslic tego przyczyny.' _symbol_lok_5 = /if ({symbol}==1 & {sl5}==1) /set sl5=0%; /echo -p @{BCGreen} # Lokacja 5 # %; ob sciane%; /endif
/def -p200 -mregexp -t'Dwa korytarze zbiegaja sie tutaj ze soba tworzac jeden wiodacy dalej, w glab kurhanu. Gladkie sciany z blokow czarnego kamienia wspieraja niski strop. Do scian umocowane sa naznaczone przez czas uchwyty. Lekkie podmuchy zatechlego powietrza, poruszaja gesta siecia postrzepionych pajeczyn zwisajacych ze stropu. Pod jedna ze scian, wsrod walajacych sie wszedzie po posadzce kosci, spoczywa bielejacy juz szkielet, na ktorym wisza resztki ubrania.' _symbol_lok_6 = /if ({symbol}==1 & {sl6}==1) /set sl6=0%; /echo -p @{BCGreen} # Lokacja 6 # %; ob sciany%; ob bloki%; ob uchwyty%; ob pajeczyny%; ob szkielet%; /endif
/def -p200 -mregexp -t'Podazasz dlugim korytarzem, ktorego oba konce nikna w gestych odmetach mroku. Kamienne sciany sa dosc blisko siebie, tworzac ciasne przejscie. Na granicy zasiegu wzroku, zdaje ci sie, ze dostrzegasz blyski zlowrogich, czerwonych slepi utkwione w tobie. Po kamiennej podlodze walaja sie gnijace, blizej nieokreslone resztki istot. Lekkie podmuchy powietrza niosa ze soba odrazajacy smrod stechlizny i rozkladu.' _symbol_lok_7 = /if ({symbol}==1 & {sl7}==1) /set sl7=0%; /echo -p @{BCGreen} # Lokacja 7 # %; ob sciany%; ob podloge%; ob resztki%; /endif
/def -p200 -mregexp -t'W tym miejscu, korytarz rozszerza sie rozgaleziajac na dwie odnogi. Sciany z kamiennych blokow nosza slady uplywu lat. Spekane i pokryte gesta pajeczyna, skrza sie od osiadlej na nich wilgoci. Duszacy odor zgnilizny unosi sie w wilgotnym powietrzu. Panuje tu dziwny chlod... I choc z twych ust nie wydobywa sie nawet najmniejszy obloczek pary, to czujesz jak by mroz przeszywal twe ubranie wdzierajac sie wglab twego ciala.' _symbol_lok_8 = /if ({symbol}==1 & {sl8}==1) /set sl8=0%; /echo -p @{BCGreen} # Lokacja 8 # %; ob sciany%; ob bloki%; ob pajeczyne%; /endif
/def -p200 -mregexp -t'Kierujac sie od schodow w kierunku poludniowym, wkraczasz do niewielkiej sali. Sciany z kamiennych blokow pobruzdzone sa wieloma peknieciami i szczelinami. Strop, znajdujacy sie nie wiecej jak dwa metry nad podlozem, rowniez nie byl oszczedzany przez czas. Liczne rysy znacza na nim uplyw wiekow. Pod sciana, na wprost od wejscia do salki, leza w nieladzie dwie kamienne urny. Podloga usiana jest szczatkami i koscmi, a takze gruzem i pylem z obsypujacych sie scian oraz stropu.' _symbol_lok_9 = /if ({symbol}==1 & {sl9}==1) /set sl9=0%; /echo -p @{BCGreen} # Lokacja 9 # %; ob sale%; ob sciany%; ob bloki%; ob pekniecia%; ob szczeliny%; ob strop%; ob podloze%; ob rysy%; ob sciane%; ob urny%; ob podloge%; ob szczatki%; ob kosci%; ob gruz%; ob pyl%; /endif
/def -p200 -mregexp -t'Podazajac waskim korytarzem, docierasz do nieduzej salki. Rowno ociosane kamienne bloki tworza sciany, na ktorych umieszczone sa metalowe uchwyty niegdys sluzace do mocowania pochodni. Na samym srodku, na kamiennym podescie, spoczywa marmurowy sarkofag. Podloga usiana jest setkami bielejacych kosci, ktore trzeszcza i pekaja jak suche galazki pod twymi stopami. Nieprzenikniona ciemnosc otacza cie zewszad swymi mackami. Nieprzyjemny odor zgnilizny drazni twe nozdrza zmuszajac co chwile do wstrzymywania oddechu.' _symbol_lok_10 = /if ({symbol}==1 & {sl10}==1) /set sl10=0%; /echo -p @{BCGreen} # Lokacja 10 # %; ob uchwyty%; ob podest%; ob sarkofag%; ob kosci%; /endif
/def -p200 -mregexp -t'Korytarz w tym miejscu jest otoczony zewszad blokami czarnego kamienia. Sciany odlegle niecaly metr od siebie, tworza ciasne przejscie wiodace w glab kurhanu. Spowity gesta zaslona mroku, ktora jakby jasniala na jego wschodnim krancu. Stamtad tez czuc jakby swiezsze powietrze. Zapewne gdzies tam znajduje sie wyjscie z tego nieprzyjaznego miejsca. Ze stropu zwisaja geste i lepkie pajeczyny utkane tu przez setki pajakow zamieszkujacych to miejsce. Posadzka uslana jest bielejacymi koscmi roznych istot.' _symbol_lok_11 = /if ({symbol}==1 & {sl11}==1) /set sl11=0%; /echo -p @{BCGreen} # Lokacja 11 # %; ob bloki%; ob strop%; ob kosci%; /endif
/def -p200 -mregexp -t'Kamienne sciany tej salki nie zdolaly sie oprzec silom natury. W paru miejscach wielkie kamienne bloki, z ktorych ulozono sciany, zostaly skruszone i wypchniete przez korzenie drzew rosnacych powyzej, nad grobowcem. Z wielu szczelin wyrastaja grube korzenie i obsypuje sie czarna ziemia. Posadzka jest niemal calkowicie pokryta gruba warstwa ziemi i gruzu i spekanych, kamiennych blokow wypchnietych z obsypujacych sie scian. Na srodku salki znajduja sie drewniane trumny, niektore na w pol otwarte, ziejace czernia i dziwna groza. Powietrze zdaje sie byc geste i niesamowicie duszne, a kazdy kolejny oddech wymaga duzego wysilku.' _symbol_lok_12 = /if ({symbol}==1 & {sl12}==1) /set sl12=0%; /echo -p @{BCGreen} # Lokacja 12 # %; ob sciany%; /endif
/def -p200 -mregexp -t'Przemierzajac mroczne korytarze kurhanu, docierasz do obszernej salki otoczonej scianami z kamiennych blokow pokrytych gruba warstwa pajeczyn migoczacych kropelkami wilgoci. Rowno rozmieszczone metalowe mocowania, niegdys trzymaly pochodnie. Teraz jednak pozostaly w nich zbutwiale kikuty gotowe rozpasc sie w kazdej chwili. Srodek salki zajmuje kamienna trumna zakryta ciezkim wiekiem, otoczona pogruchotanymi koscmi i zmiazdzonymi czaszkami.' _symbol_lok_13 = /if ({symbol}==1 & {sl13}==1) /set sl13=0%; /echo -p @{BCGreen} # Lokacja 13 # %; ob sciany%; ob bloki%; ob pajeczyny%; ob mocowania%; ob kikuty%; ob trumne%; ob wieko%; ob kosci%; ob czaszki%; /endif
/def -p200 -mregexp -t'Sciany tej sali ulozono z wielkich blokow czarnego kamienia. W rownych odstepach zamocowane sa metalowe uchwyty, w ktorych niegdys zatkniete byly pochodnie. Srodek sali zajmuja drewniane trumny ustawione promieniscie wokol wielkiego, ozdobnego swiecznika. Az dziw bierze ze zachowaly sie w tak dobrym stanie pomimo panujacej tu wilgoci i wszelakiego robactwa. W sali panuje nieprzyjemna cisza. Nawet twe kroki po kamiennej posadzce pelnej szczatkow przeroznych istot, nie sa w stanie wywolac tu najmniejszego szmeru. Jest tu tak glucho, ze az huczy ci w glowie.' _symbol_lok_14 = /if ({symbol}==1 & {sl14}==1) /set sl14=0%; /echo -p @{BCGreen} # Lokacja 14 # %; ob bloki%; ob uchwyty%; ob trumny%; ob swiecznik%; ob posadzke%; ob szczatki%; /endif
/def -p200 -mregexp -t'Wedrujac po zatechlych, spowitych gestym mrokiem korytarzach i komnatach wewnatrz tych katakumb, docierasz do tej obszernej sali o kolistym ksztalcie. Na samym srodku sali, spoczywa kamienna plyta w ksztalcie okregum, na niej zas, stoi posag tajemniczej istoty. Oczy posagu poblyskuja upiornym, krwistoczerwonym swiatlem. Wokol stop tajemniczej rzezby, stoja kamienne czary, w ktorych znajduje sie jakas gesta, oleista substancja. Tuz przy wyjsciu z sali, spoczywa nieruchomo bezglowe cialo.' _symbol_lok_15 = /if ({symbol}==1 & {sl15}==1) /set sl15=0%; /echo -p @{BCGreen} # Lokacja 15 # %; ob plyte%; ob okregum%; ob posag%; ob rzezbe%; ob czary%; ob substancje%; ob cialo%; /endif

/def -p200 -mregexp -t'Dostrzegasz takze niewielki wyrysowany kreda symbol - dokladnie taki, jaki pokazal ci starzec z wioski.' _mam_symbol = /substitute -p %{PL}@{CbgCyan}@{BCRed}%{P0}@{n}%{PR}

/def -p200 -mregexp -t'^(> )?Podkradajac sie na granicy widocznosci zrywasz sie nagle\, by krotkim skokiem dopasc do swej ofiary i (.*) (.*) w (jej|jego) (.*) zadajac (.*) obrazenia\. (.*) otrzasa' lololollo = /substitute -p @{BCred}      > %{P1} ...... %{P2}

/def -p200 -mregexp -t' przymierza sie do odciecia (.*) drogi ucieczki\.' _blokowanie_wyjscia = /substitute -p @{BCred}       > @{BCWhite}> @{BCgreen}> @{BCblue}> @{Cyellow}%{PL} @{Cwhite}przymierza sie do odciecia @{Cblue}%{P1}@{Cwhite} drogi ucieczki @{BCblue}< @{BCgreen}< @{BCwhite}< @{BCred}<

/def -p200 -mregexp -t'Powoli opuszczaja cie wszelkie emocje. Zadne odczucia nie zaklocaja twoich mysli. Bardziej opanowany juz chyba byc nie mozesz.' _jemDelione = /substitute -p @{BCred}      >  @{BCWhite}> @{BCgreen}Z J A D L E M   D E L I O N E @{BCWhite}< @{BCred}<

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

;------------------------------------------------------------------------
;		TRENINGI, GILDIE, UMIEJKI				|
;------------------------------------------------------------------------
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
    
/def ubranko = \
;    otworz pierwszy woreczek%; \
;    otworz drugi woreczek%; \
;    otworz trzeci woreczek%; \
;    otworz czwarty woreczek%; \
;    otworz piaty woreczek%; \
;    wloz zolte jasne kwiaty do pierwszego woreczka%; \
;    wloz czterokanciaste rozgalezione lodygi do drugiego woreczka%; \
;    wloz kremowe owlosione kwiaty do trzeciego woreczka%; \
;    wloz drobne ukwiecone galazki do czwartego woreczka%; \
;    wloz ziola do pierwszego woreczka%; \
;    wloz ziola do drugiego woreczka%; \
;    wloz ziola do trzeciego woreczka%; \
;    wloz ziola do czwartego woreczka%; \
;    wloz ziola do piatego woreczka%; \
    zamknij woreczki%; \
    koumiesc czarny kolczyk w prawym uchu%; \
    zaloz pas%; \
    przytrocz woreczki do pasa%; \
    otworz plecak%; \
    zaloz plecak%; \
    wm%; \
;    zatknij topor za pas%; \
;    zatknij topor za pas%; \
;    wyszarpnij topor zza pasa%; \
    dobadz topora%; \
    zaloz ubrania%; \
    zaloz wszystkie zbroje%; \
    zaloz sygnet%; \
    zaloz naszyjnik%; \
    zaloz pierscienie%; \
    obzaloz mapnik%; \
    napelnij plecak%; \
    wloz kamienie do plecaka%; \
    zamknij plecak
    
/def who=zapytaj dostojna piwnooka krasnoludke o krasnoludy
    

/def drdol = \
    opusc bron%; \
    zejdz po drabinie%; \
    dobadz jednorecznego topora    

/def drgora = \
    opusc bron%; \
    wejdz po drabinie%; \
    dobadz jednorecznego topora

/def bil = \
    kup bilet%; \
    wejdz na statek
   
/def sc = \
    zastukaj w sciane

/def [ = stan
/def ] = /k
/def gnom = \
    wez pancerz%; s%; s%; s%; drzwiczki%; sprzedaj pancerz%; wyjscie%; n%; n%; n%;
    

;------------------------------------------------------------------------
;			CHODZENIE NA NUMERYCZNEJ			|
;------------------------------------------------------------------------

/def m = \
    /echo .---------------------------------------------------------.%;\
    /echo -p |          @{BCgreen}   CHODZENIE NA NUMERYCZNEJ WLACZONE          @{n} |%;\
    /echo '---------------------------------------------------------'%;\
    /bind 7 = nw%;/bind 8 = n%;/bind 0 = /go%;/bind 9 = ne%;/bind 4 = w%;/bind 5 = sp%;/bind 6 = e%;/bind 1 = sw%;/bind 2 = s%;/bind 3 = se%;/bind - = u%;/bind + = d%;/more off

/def mp = \
    /echo .---------------------------------------------------------.%;\
    /echo -p |         @{BCgreen}   PRZEMYKANIE NA NUMERYCZNEJ WLACZONE         @{n} |%;\
    /echo '---------------------------------------------------------'%;\
    /bind 7 = przemknij nw%;/bind 8 = przemknij n%;/bind 0 = przemknij /go%;/bind 9 = przemknij ne%;/bind 4 = przemknij w%;/bind 5 = sp%;/bind 6 = przemknij e%;/bind 1 = przemknij sw%;/bind 2 = przemknij s%;/bind 3 = przemknij se%;/bind - = przemknij u%;/bind + = przemknij d%;/more off


/def t = \
    /echo .---------------------------------------------------------.%;\
    /echo -p |      @{BCred}       CHODZENIE NA NUMERYCZNEJ WYLACZONE     @{n}     |%;\
    /echo '---------------------------------------------------------'%;\
    /unbind 7%;/unbind 8%;/unbind 9%;/unbind 4%;/unbind 5%;/unbind 6%;/unbind 1%;/unbind 2%;/unbind 3%;/unbind 0%;/unbind -%;/unbind +%;/more off




;-----------------------------------------------------------------------------
;                          UMIEJETNOSCI                                      |
;-----------------------------------------------------------------------------
/def um = \
    /if ({*}=~NULL) \
      umiejetnosci bojowe %;\
      umiejetnosci ogolne %;\
      umiejetnosci zlodziejskie %;\
      umiejetnosci magiczne %;\
      umiejetnosci specjalne %;\
      /set _umiejetnosci_i=6 %;\
      /let _um_ktore=Bojowe Ogolne Zlodziejskie Magiczne Specjalne %;\
    /else \
      /if ({*}=~"wszystkie") \
        umiejetnosci %;\
        /let _um_ktore=Wszystkie %;\
      /else \
        umiejetnosci %{*} %;\
        /let _um_ktore=%{*} %;\
      /endif %;\
      /set _umiejetnosci_i=2 %;\
    /endif %;\
    /set umiejetnosci=%;\
    /def -p6 -ag -mregexp -t':( )*([^ ]*)( )*(.*):( )*([^ ]*)' _um_trig_1= \
      /set umiejetnosci=%%{umiejetnosci}%%{PL}|%%{P2}#%%{P4}|%%{P6}#%;\
    /def -p5 -ag -mregexp -t':( )*([^ ]*)( )*$$' _um_trig_2= \
      /set umiejetnosci=%%{umiejetnosci}%%{PL}|%%{P2}#@%%;\
      /test --_umiejetnosci_i %%;\
      /if ({_umiejetnosci_i}==1) \
        /purge _um_trig_* %%;\
        /_um_wyswietl %{_um_ktore} %%;\
      /endif %;\
    /def -p5 -ag -mregexp -t'^($$|Nieznana kategoria. Masz do wyboru:)' _um_trig_3= \
      /set umiejetnosci=%%{umiejetnosci}@%%;\
      /test --_umiejetnosci_i %%;\
      /if ({_umiejetnosci_i}==1) \
        /purge _um_trig_* %%;\
        /_um_wyswietl %{_um_ktore} %%;\
      /endif

  
/def _um_wyswietl = \
    /let i=%;\
    /let linia=%;\
    /let cc=1%; \
;    /if ({*}=~NULL) \
;      /let um_i=Bojowe %;\
;    /else \
;      /let um_i=$[strcat(toupper(substr({*},0,1)),substr({*},1))] %;\
;    /endif %;\
;  /echo %{um_i} %;\
    /_echo +-=====================================+=====================================-+%;\
    /while /let i=$[strstr(umiejetnosci,"@")]%; /@test i > 0%; /do \
;      /_echo +--------------------( $[pad({1},12)] )-+--------------------------------------+%;\
      /_echo +--------------------------------------+--------------------------------------+%;\
      /shift %;\
      /let um_type=$[substr(umiejetnosci,0,i)]%; \
      /set umiejetnosci=$[substr(umiejetnosci,i+1)]%;\
      /let um_type2=9876543210 %;\
      /while /let i=$[strstr(um_type,"#")]%; /@test i > 0%; /do \
        /let um_name=$[substr(um_type,0,i)]%;\
        /let um_type=$[substr(um_type,i+1)]%;\
        /let j=$[strstr(um_name,"|")]%;\
        /let um_ile=$[substr(um_name,j+1)]%;\
        /if ({um_ile}=~"ledwo") \
          /let ile_num=0 %;\
        /elseif ({um_ile}=~"troche") \
          /let ile_num=1 %;\
        /elseif ({um_ile}=~"pobieznie") \
          /let ile_num=2 %;\
        /elseif ({um_ile}=~"zadowalajaco") \
          /let ile_num=3 %;\
        /elseif ({um_ile}=~"niezle") \
          /let ile_num=4 %;\
        /elseif ({um_ile}=~"dobrze") \
          /let ile_num=5 %;\
        /elseif ({um_ile}=~"znakomicie") \
          /let ile_num=6 %;\
        /elseif ({um_ile}=~"doskonale") \
          /let ile_num=7 %;\
        /elseif ({um_ile}=~"perfekcyjnie") \
          /let ile_num=8 %;\
        /elseif ({um_ile}=~"mistrzowsko") \
          /let ile_num=9 %;\
        /endif %;\
        /let j=$[strstr({um_type2},ile_num)] %;\
        /let um_type2=$[strcat(substr({um_type2},0,j+1),{um_name},"#",substr({um_type2},j+1))]%;\
      /done %;\
      /let i=0 %;\
      /while /@test i < 10 %; /do \
        /let j=$[strstr({um_type2},{i})]%;\
        /let um_type2=$[strcat(substr({um_type2},0,{j}),substr({um_type2},{j}+1))] %;\
        /test ++i %;\
      /done %;\
      /while /let i=$[strstr(um_type2,"#")]%; /@test i > 0%; /do \
        /let um_name=$[substr(um_type2,0,i)]%;\
        /let um_type2=$[substr(um_type2,i+1)]%;\
        /let j=$[strstr(um_name,"|")]%;\
        /let um_ile=$[substr(um_name,j+1)]%;\
        /let um_name=$[substr(um_name,0,j)]%;\
        /let linia=$[strcat(linia,"|",pad(um_name,24),": ",pad(um_ile,12))]%; \
        /if (cc==1) \
          /let cc=2%; \
        /else \
          /echo %{linia}|%; \
          /let cc=1%; \
  	  /let linia=%;\
        /endif%; \
      /done %;\
      /if (linia!~NULL)\
        /echo %{linia}|                        :             |%;\
        /let cc=1%; \
        /let linia=%;\
      /endif %;\
    /done %;\
    /unset umiejetnosci %;\
    /unset _umiejetnosci_i %;\
    /_echo +-=====================================+=====================================-+%;


;------------------------------------------------------------------------
;			WALKA I TAKIE TAM				|
;------------------------------------------------------------------------
/def -F -mregexp -t'Zabiles *' spisz_killa = /echo Dnia: $[ftime("%d-%m-%Y (%A)",time())] o godzinie: $[ftime("%T",time())]: %P0 %PR %|/writefile -a lista_zabojstw.txt

/def kp = \
    /for i 1 5 kopnij pukacza

/def k = \
    /echo%;\
    /echo .---------------------------------------------------------.%;\
    k%;\
    /repeat -0.1 1 /echo '---------------------------------------------------------'%;\
    /repeat -0.1 1 /echo



;/def comp = /comp %{*}
/def comp = \
    /if ({*}=/"* i *") \
      /let _kim_=%{*} %;\
    /else \
      /let _kim_=z %{*-mezczyzna} %;\
    /endif %;\
    porownaj sile %{_kim_} %;\
    porownaj zrecznosc %{_kim_} %;\
    porownaj wytrzymalosc %{_kim_}

;------------------------------------------------------------------------
;				SWIATLO					|
;------------------------------------------------------------------------

/def zl = \
	zapal lampe

/def dl = \
	napelnij lampe olejem

/def zgl = \
	zgas lampe


/def porz = porzuc druzyne

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
;				ZIOLA					|
;------------------------------------------------------------------------

/def sz = \
	szukaj
