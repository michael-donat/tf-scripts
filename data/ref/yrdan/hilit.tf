
; ################################
; PODSWIETLANIE ;-)

; harpie

;Lekko przekrzywiajac glowe zielonopiora szybka harpia wbija w ciebie swoj szklisty, przerazajacy wzrok i bezglosnie porusza swymi zmyslowymi wargami. Tylko dzieki niezlomnej sile woli udaje ci sie oderwac spojrzenie od tych hipnotyzujacych oczu.

; harpie
;Niebieskopiora szybka harpia z naglego zrywu wzbija sie w powietrze, by po chwili opasc blyskawicznie w dol szarpiac i rozrywajac skore na twojej glowie. Fala jasnoczerwonej krwi na moment zalewa ci oczy, a lubiezny grymas maluje sie na ustach niebieskopiorej szybkiej harpii, gdy kilka kropli spryskuje jej wydatny dekolt.
/def -t'*krwi na moment zalewa ci oczy*' harpia_1= /echo -aBCred RANI CIE

;Niespodziewane chlasniecie ostrych szponow zielonopiorej szybkiej harpii rozrywa skore na twoim ciele, gdy trafiaja cie one w lewe ramie. Struzka cieplej krwi wysacza sie ze swiezo otrzymanej, szarpanej rany, a pelen satysfakcji usmiech wykwita na ponetnej twarzy zielonopiorej szybkiej harpii.
/def -t'*rozrywa skore na twoim ciele*' harpia_2 = /echo -aBCred LEKKO RANI CIE

;Z twych ust wydobywa sie przerazliwy krzyk, gdy w chwili krotszej niz uderzenie serca szpony blekitnopiorej zwinnej harpii trafiaja cie w korpus. Poderwane ciosem krople twojej zywoczerwonej krwi zraszaja okolice wraz z twoja przeciwniczka, ktora perfidnym ruchem rozciera posoke po swojej twarzy.
/def -t'Z twych ust wydobywa sie przerazliwy krzyk*' harpia_3 = /echo -aBCred POWAZNIE RANI CIE %; /info

;Nie posiadasz narzedzia odpowiedniego do rozbijania kamieni.

; zywiolaki

/def -aBCbggreen -F -t'*Na twoje szczescie duza czesc impetu uderzenia zostala pochlonieta*' zywiolak_ziemi_wyparowane
/def -aBCbggreen -F -t'*smagajac cie jedynie malymi galazkami.*' zywiolak_ziemi_spec1

; Plonacy wysoki zywiolak ognia przeistacza sie w wirujacy slup ognia i strzela wprost w ciebie. Czujesz, jak ogien buzuje, gdy uderzenie mija cie o wlos po dramatycznym uniku.
/def -t'*uderzenie mija cie o wlos po dramatycznym uniku*' zywiolaki_unik_1 = /echo -aBCbgyellow UNIKASZ

; Z poczatku niewinnie wygladajace, z czasem rozrastaja sie, osiagajac wielkosc kurzych jaj i rozpedzone bombarduja cie! Na twoje szczescie, gradowe kule rozbijaja sie na skorzanej cienkiej kurtce, nie czyniac ci wiekszej krzywdy.
/def -t'*, nie czyniac ci wiekszej krzywdy.' zywiolaki_wyparowany_1 = /echo -aBCgreen WYPAROWANY

;banici - spece

/def -aBCbggreen -F -t'* naciera z dzikim rykiem, lecz zrecznie unikasz nie dosc szybkiego dla ciebie ciosu*' banici_spec1
/def -aBCbgyellow -F -t'* naciera z dzikim rykiem, na cale szczescie tylko nieznacznie raniac cie*' banici_spec2
/def -aBCbgRed -F -t'* naciera z dzikim rykiem, z poteznego zamachu uderzajac cie**, wywolujac na twej twarzy mimowolny grymas bolu.' banici_spec5 = /info
/def -aBCbgRed -F -t'* naciera z dzikim rykiem, z furia uderzajac cie na odlew**, bolesnie cie raniac.' banici_spec3 = /info
/def -aBCbgRed -F -t'* naciera z dzikim rykiem, umiejetnie omija twa obrone i zdradziecko uderza**, paskudnie cie raniac.' banici_spec4 = /info

;-------------

/def -t'*Uciekles komus.' ucikles_komus  = /echo %; /beep %; /echo UCIEKLES UKRYTEMU!!! %; /echo WRACAJ! %; /echo WRACAJ! %; /echo

/def -aBCbggreen -aCred -F -t'*Napelniasz *' napelnianie_hilit
/def -aBCbgcyan -aCred -F -t'*Chowasz *' chowanie_hilit

/def -aBCbgRed -F -t'Ktos [^kiedys]*' ktosiek = /playsnd sounds/uwaga.wav

/def -aBCbgRed -F -t'Powoli zaczyna cie bolec glowa. Czujesz sie raczej niewyraznie.' kacyk_nadchodzi

/def -p9 -P0BCbgmagenta -F -t'sakwa'
/def -p9 -P0BCbgmagenta -F -t'worek'
/def -p9 -P0BCbgmagenta -F -t'plecak'


; kamienie



/def -p9 -P0BCbgmagenta -F -t'obsydian'
/def -p9 -P0BCbgmagenta -F -t'ortoklaz'
/def -p9 -P0BCbgmagenta -F -t'ametyst'
/def -p9 -P0BCbgmagenta -F -t'bursztyn'
/def -p9 -P0BCbgmagenta -F -t'topaz'
/def -p9 -P0BCbgmagenta -F -t'szmaragd'
/def -p9 -P0BCbgmagenta -F -t'diament'
/def -p9 -P0BCbgmagenta -F -t'malachit'
/def -p9 -P0BCbgmagenta -F -t'krysztal'
/def -p9 -P0BCbgmagenta -F -t'per(la|el|ly)'
/def -p9 -P0BCbgmagenta -F -t'cytryn'
/def -p9 -P0BCbgmagenta -F -t'nefryt'
/def -p9 -P0BCbgmagenta -F -t'jaspis'
/def -p9 -P0BCbgmagenta -F -t'fluoryt'
/def -p9 -P0BCbgmagenta -F -t'turkus'
/def -p9 -P0BCbgmagenta -F -t'karneol'
/def -p9 -P0BCbgmagenta -F -t'gagat'
/def -p9 -P0BCbgmagenta -F -t'agat'
/def -p9 -P0BCbgmagenta -F -t'serpentyn'
/def -p9 -P0BCbgmagenta -F -t'kwarc'
/def -p9 -P0BCbgmagenta -F -t'azuryt'
/def -p9 -P0BCbgmagenta -F -t'labrador'
/def -p9 -P0BCbgmagenta -F -t'opal[^f-z] '
/def -p9 -P0BCbgmagenta -F -t'onyks'
/def -p9 -P0BCbgmagenta -F -t'rubin'
/def -p9 -P0BCbgmagenta -F -t'heliodor'
/def -p9 -P0BCbgmagenta -F -t'celestyn'
/def -p9 -P0BCbgmagenta -F -t'turmalin'
/def -p9 -P0BCbgmagenta -F -t'hematyt'
/def -p9 -P0BCbgmagenta -F -t'apatyt'
/def -p9 -P0BCbgmagenta -F -t'szafir'
/def -p9 -P0BCbgmagenta -F -t'granat'
/def -p9 -P0BCbgmagenta -F -t'tytanit'
/def -p9 -P0BCbgmagenta -F -t'chryzopraz'
/def -p9 -P0BCbgmagenta -F -t'rodochrozyt'
/def -p9 -P0BCbgmagenta -F -t'cyrkon'
/def -p9 -P0BCbgmagenta -F -t'spinel'
/def -p9 -P0BCbgmagenta -F -t'piryt'
/def -p9 -P0BCbgmagenta -F -t'aleksandryt'
/def -p9 -P0BCbgmagenta -F -t'iolit'
/def -p9 -P0BCbgmagenta -F -t'rodolit'
/def -p9 -P0BCbgmagenta -F -t'kyanit'
/def -p9 -P0BCbgmagenta -F -t'diopsyd'
/def -p9 -P0BCbgmagenta -F -t'chryzoberyl'
/def -p9 -P0BCbgmagenta -F -t'oliwin'
/def -p9 -P0BCbgmagenta -F -t'almadyn'



; twoja kondycja

;/def -p9 -P0BCGreen    -F -t'Jestes (fizycznie |)w swietnej kondycji'      k1
;/def -p9 -P0BCyellow    -F -t'Jestes (fizycznie |)w dobrym stanie.'         k2
;/def -p9 -P0BCYellow   -F -t'Jestes (fizycznie |)lekko ranny'              k3
;/def -p9 -P0BCYellow   -F -t'Jestes (fizycznie |)ranny'                    k4
;/def -p9 -P0BCbgRed      -F -t'Jestes (fizycznie |)w zlej kondycji'          k5
;/def -p9 -P0BCbgRed      -F -t'Jestes (fizycznie |)ciezko ranny'             k6
;/def -p9 -P0BCbgRed      -F -t'Jestes (fizycznie |)ledwo zywy'               k7

; twoj stan

/def -p9 -P0BCbgRed      -F -t'(J|j)estes (calkowicie |)wycienczon(y|a)'         s2 = /playsnd sounds/uwaga.wav %; /echo !!!!!!!!!!!!!!!
/def -p9 -P0BCRed        -F -t'(J|j)estes (bardzo |troche |)zmeczon(y|a)'        s3
/def -p9 -P0BCRed      -F -t'(J|j)estes (bardzo |nieco |)wyczerpan(y|a)'       s4
/def -p9 -P0BCGreen    -F -t'(J|j)estes (w pelni |)wypoczet(a|y)'              s5

/def -p3 -P0BCRed      -F -t'Chce ci sie (bardzo |)pic'                    s6
/def -p3 -P0BCRed      -F -t'Troche chce ci sie pic'                       s6a
/def -p99 -P0BCGreen   -F -t'Nie chce ci sie pic'                          s7

/def -p9 -P0BCGreen    -F -t'jestes (bardzo n|n)ajedzon(y|a)'               s8
/def -p9 -P0BCRed      -F -t'jestes (bardzo g|g)lodn(y|a)'                  s9

/def -p9 -P0BCGreen    -F -t'Czujesz sie (bardzo b|b)ezpiecznie' s10a1
/def -p9 -P0BCGreen    -F -t'Czujesz sie (bardzo s|s)pokojnie' s10a2
/def -p9 -P0BCYellow   -F -t'Czujesz sie (bardzo n|n)(ieswojo|erwowo)' s10a3
/def -p9 -P0BCbgred    -F -t'Czujesz sie (bardzo p|p)rzerazony' s10a4

/def -p9 -P0BCRed      -F -t'mentalnie (wyczerpan(y|a)|wykonczon(y|a)|u kresu sil).' s12m9
/def -p9 -P0BCyellow   -F -t'mentalnie w zlej kondycji.' s12m6
/def -p9 -P0BCyellow   -F -t'mentalnie (bardzo z|z)meczon(y|a).' s12m5
/def -p9 -P0BCyellow   -F -t'mentalnie oslabion(y|a).' s12m3
/def -p9 -P0BCGreen    -F -t'mentalnie lekko oslabion(y|a).' s11m2
/def -p9 -P0BCGreen    -F -t'mentalnie w pelni sil.' s11m1

;# Dostepne poziomy upicia:
;#   podchmielony, lekko podpity, podpity, wstawiony, mocno wstawiony,
;#   pijany, schlany, napruty, nawalony i pijany jak bela.

/def -p9 -P0BCgreen   -F -t'Jestes trzezw(y|a).' s14p7
/def -p9 -P0BCgreen   -F -t'Jestes podchmielon(y|a).' s14p6
/def -p9 -P0BCgreen   -F -t'Jestes( lekko | )podpit(y|a).' s14p5
/def -p9 -P0BCyellow  -F -t'Jestes( mocno | )wstawion(y|a).' s14p4
/def -p9 -P0BCbgred     -F -t'Jestes pijan(y|a).' s15p3
/def -p9 -P0BCbgred     -F -t'Jestes schlan(y|a).' s15p2
/def -p9 -P0BCbgred     -F -t'Jestes naprut(y|a).' s15p1
/def -p9 -P0BCbgred     -F -t'Jestes nawalon(y|a).' s15p0
/def -p9 -P0BCbgred     -F -t'Jestes pijan(a|y) jak bela.' s15p-0
/def -p9 -aBCbgred      -F -t'*masz**kaca.' s15p-kac

/def -p9 -P0BCRed -F -t'Ciezar twego ekwipunku (wadzi ci troche|jest dosyc klopotliwy|daje ci sie we znaki).' obc1
/def -p9 -P0BCbgRed    -F -t'Twoj ekwipunek jest (wyjatkowo|niemilosiernie) ciezki.' obc2
/def -p9 -P0BCbgRed    -F -t'Twoj ekwipunek prawie przygniata cie do ziemi.' obc3

; postepy

;/def -p9 -P0BCYellow     -F -t'Poczynil(a|e)s (nieznaczne|niewielkie|male|nieduze) postepy'     po1
;/def -p9 -P0BCbgYellow   -F -t'Poczynil(a|e)s (znaczne|bardzo duze|duze|wspaniale|ogromne) postepy'         po2


; kondycja innych

;/def -aBCRed        -F -t'* jest rann*' ki1a
;/def -aBCRed        -F -t'* jest lekko rann*' ki1
;/def -aBCRed        -F -t'* jest ciezko rann*' ki12
;/def -aBCRed        -F -t'* jest w zlej kondycji.' ki2
;/def -aBCyellow     -F -t'* jest w dobrym stanie.' ki4
;/def -aBCRed        -F -t'* jest ledwo zyw*' ki3
;/def -aBCwhite      -F -t'* jest w swietnej kondycji*' ki3a


; WALKA


;/def -p9 -P0BCbgred  -F -t'powaznie cie raniac' r8bp  = /playsnd sounds/alarm.wav
;/def -p9 -P0BCbgred  -F -t'raniac cie[^m-z]' r8c  = /playsnd sounds/uwaga.wav
;/def -p9 -P0BCbgred  -F -t'powaznie ran(i|iac) cie[^m-z]'                                  r10p = /playsnd sounds/alarm.wav
;/def -p99 -P0BCred -F -t'(lekko |)rani cie[^m-z]'                                              r10ar = /playsnd sounds/uwaga.wav
;/def -p9 -P0BCbgred  -F -t'rani cie ciezko '                                              r10a = /playsnd sounds/alarm.wav
;/def -p9 -P0BCred  -F -t'musnal cie lekko'                                             r11
;/def -p9 -P0BCbgred  -F -t'puknal cie[^m-z]' r12
;/def -p9 -P0BCbgred  -F -t'zawadzil nia o twoj policzek' r12t
;/def -p9 -P0BCbgred  -F -t'(lekko|bezsilnie|miekko) dotknal cie[^m-z]'                         r13
;/def -p9 -P0BCbgred  -F -t'masakruje cie[^m-z]'                                               r14 = /playsnd sounds/alarm.wav
;/def -p9 -P0BCbgred  -F -t'zamarkowuje cios w twoim kierunku '                            r15
;/def -p9 -P0BCbgred  -F -t'gleboko raniac cie[^m-z]'                                           r16 =  /playsnd sounds/alarm.wav

;/def -p9 -P0BCbgred  -F -t'Zostales zatruty'                                             r17 = /playsnd sounds/uwaga.wav
;/def -p9 -P0BCbgred  -F -t'Czujesz sie gorzej'                                           r18


; i jest niezle :)

/def -p9 -P0BCyellow     -F -t'impet uderzenia wyparowany'                     bp2
/def -p9 -P0BCgreen      -F -t'lecz tobie udaje (je zbic|uniknac)'          bp3
/def -p9 -P0BCyellow     -F -t'lecz udaje ci sie (oslonic|zbic)'          bp3osl
/def -p9 -P0BCyellow     -F -t'tobie udaje sie (go sparowac|oslonic)'          bp3oslpuk
/def -p9 -P0BCGreen      -F -t'probuje cie trafic'                             bp4
/def -p9 -P0BCGreen      -F -t'trafil w powietrze obok ciebie'                 bp5t
/def -p9 -P0BCGreen      -F -t'tobie udaje sie je zbic'                        bp6s



;/def -p9 -P0BCGreen      -F -t'(T|t)rafiasz'             b5
;/def -p9 -P0BCGreen      -F -t'(W|w)yprowadzasz'             br5
;/def -p9 -P0BCGreen      -F -t'(Le(kk|dw)o m|M)uskasz'   b7
;/def -p9 -P0BCGreen      -F -t'((N|n)iezbyt mocno r|(C|c)iezko r|Bardzo ciezko r|Powaznie r|Lekko r|(R|r))anisz' b10
;/def -p9 -P0BCGreen      -F -t'rozcinasz'                b14
;/def -p9 -P0BCGreen      -F -t'tniesz'          	 b15
;/def -p9 -P0BCGreen      -F -t'uderzasz'                 b16
;/def -p9 -P0BCGreen      -F -t'(M|m)asakrujesz'          b17
;/def -p9 -P0BCGreen      -F -t'Robisz krotki wymach'    b17kr


/def -p9 -P0BCGreen      -F -t'Czujesz sie znacznie lepiej' b18


; Viro - juz nie ma

;rapier z ZC

;fatality
;Szybkim cwiercobrotem schodzisz z linii uderzenia plamiastego oszalalego ghula i wykorzystujac dogodna pozycje wyprowadzasz szybkie, dokladnie wymierzone pchniecie, ktore zaglebia ostrze twojego smuklego zdobionego rapiera w ciele przeciwnika. Po krotkiej chwili napawania sie zwyciestwem cofasz klinge pozwalajac martwemu juz cialu osunac sie na ziemie.

;ranisz
;Skracasz dystans szybkim wykrokiem i tnac smuklym zdobionym rapierem na ukos trafiasz koscistego szalonego ghula w korpus koncowka ostrza otwierajac w jego ciele poszarpana rane.

;lekko ranisz
;Przechodzac ze statycznej zastawy do gwaltownego ataku wyprowadzasz blyskawiczne uderzenie. Pchnieciem trafiasz koscistego szalonego ghula w korpus otwierajac koncowka ostrza smuklego zdobionego rapiera krwawiaca rane.

;muskasz
;Mylisz wlochatego ponurego potepienca zawila finta i zachodzac go od lewej strony tniesz na odlew trafiajac przeciwnika w lewe ramie sama koncowka ostrza.

;ranisz
;Omijajac zastawe plamiastego glodnego ghula uderzasz smuklym zdobionym rapierem trafiajac go w prawa noge. Gwaltownym szarpnieciem uwalniasz ostrze pozostawiajac w ciele przeciwnika gleboka rane.

;masakrujesz
;Zataczasz ostrzem smuklego zdobionego rapiera szybki luk i wykorzystujac dezorientacje wlochatego poteznego potepienca celnym pchnieciem trafiasz go w prawe ramie. Napinasz miesnie i gwaltownie wyszarpujesz klinge w bok, pozostawiajac poszarpana, krwawiaca rane.

; ########################
;scimi od zmory

;Markujesz ciecie w glowe wielkiego masywnego trolla swym smuklym lsniacym scimitarem po czym blyskawicznie zmieniasz kierunek ciosu i omijajac zastawe przeciwnika trafiasz w prawe ramie nieznacznie go raniac.
/def -p3 -F -t'*Markujesz**nieznacznie**raniac.' kolor_walka_scimi_lrk_1 =/echo -aBCgreen LEKKO RANISZ SCIMITAREM

;Szybkim zwodem zmylasz przeciwnika i blyskawicznie tniesz wielkiego masywnego trolla samym koncem ostrza smuklego lsniacego scimitara w lewe ramie pozostawiajac lekko krwawiaca rane.
/def -p3 -F -t'*Szybkim zwodem zmylasz**pozostawiajac lekko krwawiaca rane.' kolor_walka_scimi_rk_1 =/echo -aBCgreen RANISZ SCIMITAREM

;Zataczasz bronia szybka osemke nadajac glowni predkosc, po czym tniesz z polobrotu w groznego czarnego orka trafiajac go prosto w glowe. Slyszysz jak klinga lsniacego smuklego scimitara zgrzyta o kosc, a katem oka zauwazasz warkocz posoki ciagnacy sie za ostrzem.
/def -p3 -F -t'*Zataczasz bronia szybka osemke**warkocz posoki ciagnacy sie za ostrzem.' kolor_walka_scimi_prk_1 =/echo -aBCgreen POWAZNIE RANISZ SCIMITAREM

;Dopadasz szybkim skokiem do wielkiego masywnego trolla wykonujac potezne pchniecie swoim smuklym lsniacym scimitarem w korpus, przeciwnik stara sie zejsc z drogi ciosu lecz jest zbyt wolny. Czujesz jak klinga wbija sie gleboko w cialo. Gdy wyszarpujesz bron uwalniajac ostrze z ciezkiej rany, ktora wlasnie zadales tryska na ziemie fontanna krwi.
/def -p3 -F -t'*Dopadasz szybkim skokiem**z ciezkiej rany, ktora wlasnie zadales tryska na ziemie fontanna krwi.' kolor_walka_scimi_crk_1 =/echo -aBCgreen CIEZKO RANISZ SCIMITAREM

;Bierzesz potezny zamach i z impetem przebijasz zastawe chwiejnego wyjacego potepienca wrazajac ostrze smuklego lsniacego scimitara gleboko w korpus tnac kosci, sciegna i uwalniajac fontanne tryskajacej na boki krwi.
/def -p3 -F -t'*Bierzesz potezny**uwalniajac fontanne tryskajacej na boki krwi.' kolor_walka_scimi_masak_1 =/echo -aBCgreen MASAKRUJESZ SCIMITAREM

;Podrywasz bron do szalenczego mlynca, z glosnym sykiem tnac powietrze dekoncentrujac tym uwage groznego czarnego orka. Blyskawicznym wypadem przerywasz ten zwodniczy pokaz wyprowadzajac fantastyczne ciecie swoim smuklym lsniacym scimitarem prosto w glowe, ktora przy odglosie glosnego mlasniecia odrywa sie od tulowia. Zataczajac tuz przed upadkiem kilka kregow w powietrzu chlapi /czy_obrazenia%; /echo -aBCgreen FATALITY SCIMITAREM

;Skrecasz sie w piruecie nadajac ped ostrzu smuklego lsniacego scimitara, ktore z sykiem rozcina powietrze prawie trafiajac w wielkiego masywnego trolla.
/def -p3 -F -t'*Skrecasz sie w piruecie nadajac**rozcina powietrze prawie trafiajac*' kolor_walka_scimi_chybienie_1 = /echo -aBCred CHYBIASZ SCIMITAREM

;##############

; Rapier Chapa
/def -p3 -F -t'*wyprowadza udane**, zadajac ci lekka rane.' kolor_walka_rap_lrc_1 =/echo -aBCbgred LEKKO RANI CIE

/def -p3 -F -t'*Wyprowadzasz udane**, zadajac**lekka rane.' kolor_walka_rap_lrk_1 =/echo -aBCgreen LEKKO RANISZ RAPIEREM

/def -p3 -F -t'*Wyprowadzasz udane**, zadajac**powazna rane.' kolor_walka_rap_prk_1 =/echo -aBCgreen POWAZNIE RANISZ RAPIEREM

/def -p3 -F -t'*Blyskawicznym**prostego smuklego rapiera trafiasz **, zadajac**powazna rane.' kolor_walka_rap_prk_2 =/echo -aBCgreen POWAZNIE RANISZ RAPIEREM

/def -p3 -F -t'*Wykonujac potezny zamach prostym smuklym rapierem tniesz gleboko**, zostawiajac**na ciele paskudna, krwawiaca rane.' kolor_walka_rap_msk_1 =/echo -aBCgreen MASAKRUJESZ RAPIEREM

/def -p3 -F -t'*Robiac szybki wypad w przod, wyprowadzasz swoim prostym smuklym rapierem celne**, ciezko raniac*' kolor_walka_rap_crk_1 =/echo -aBCgreen CIEZKO RANISZ RAPIEREM

/def -p3 -F -t'*Zdecydowanym, szybkim**swojego prostego smuklego rapiera przebijasz na wylot**. Po ostrzu splywa waska struzka krwi.' kolor_walka_rap_fatk_1 =/echo -aBCgreen WYKONCZ GO!

/def -p3 -F -t'*Zamaszystym, mocnym cieciem swojego prostego smuklego rapiera powodujesz fontanne krwi, cieknaca z paskudnej, glebokiej rany na ciele**.' kolor_walka_rap_msk_2 =/echo -aBCgreen MASAKRUJESZ RAPIEREM

;Celnym pchnieciem trafiasz siwowlosego poteznego ozywienca w korpus, lecz twoja bron nie czyniac zadnej szkody kluje powietrze miedzy koscmi.
/def -p3 -F -t'*trafiasz**nie czyniac**zadnej*.' kolor_walka_rap_bezobr_1 = /echo -aBCred NIESKUTECZNY



;##################
; gadak
;################## 

;Zwracasz ostrze kruczoczarnego misternego miecza w kierunku szalonego trupiobladego zwierzoczleka. Krotkim wymachem trafiasz go w glowe rozcinajac skore i pozostawiajac niewielka rane, z ktorej wyplywa waska struzka krwi.
/def -p3 -F -t'*Zwracasz ostrze kruczoczarnego misternego miecza w kierunku**pozostawiajac niewielka rane, z ktorej wyplywa waska struzka krwi.' kolor_walka_gadak_lrk_1 = /echo -aBCgreen LEKKO RANISZ SMOCZYM MIECZEM

;Unosisz kruczoczarny misterny miecz lekko do gory i wykonujesz efektowne ciecie. Krawedz opadajacego z duza predkoscia ostrza trafia w nogi krepego rudobrodego krasnoluda pozostawiajac tam paskudna, gleboka rane, z ktorej niemal natychmiast zaczyna sie saczyc ciemna, gesta krew.
/def -p3 -F -t'*Unosisz kruczoczarny misterny miecz**natychmiast zaczyna sie saczyc ciemna, gesta krew.' kolor_walka_gadak_rk_1 = /echo -aBCgreen RANISZ SMOCZYM MIECZEM

;Wykonujesz obszerny zamach wyprostowana w lokciu reka. Sprawnie manewrujac nadgarstkiem mijasz obrone umiesnionego przygarbionego trolla i trafiasz go w korpus. Twarz twojego przeciwnika wykrzywia grymas bolu gdy rozpedzone, niczym nie zatrzymane ostrze kruczoczarnego misternego miecza zaglebiajac sie w jego cialo tnie napotkane na swej drodze tkanki.
/def -p3 -F -t'*Wykonujesz obszerny zamach wyprostowana w lokciu reka.**cialo tnie napotkane na swej drodze tkanki.' kolor_walka_gadak_prk_1 = /echo -aBCgreen POWAZNIE RANISZ SMOCZYM MIECZEM

;Blyskawicznie opuszczasz i cofasz do tylu reke dzierzaca kruczoczarny misterny miecz i w dogodnej chwili zakreslasz bronia niewielki luk prowadzac ja w kierunku wysokiego smierdzacego orka. Rozpedzone ostrze dosiega przeciwnika i rozcinajac od dolu jego cialo pozostawia za soba tryskajaca krwia fontanne.
/def -p3 -F -t'*Blyskawicznie opuszczasz i cofasz do tylu reke dzierzaca kruczoczarny misterny miecz**pozostawia za soba tryskajaca krwia fontanne.' kolor_walka_gadak_bcrk_1 = /echo -aBCgreen BARDZO CIEZKO RANISZ SMOCZYM MIECZEM

;Unosisz kruczoczarny misterny miecz wysoko do gory skad wyprowadzasz blyskawiczne ciecie. Precyzyjnie wymierzony cios uderza w korpus przygarbionego niebezpiecznego potepienca pozostawiajac rane, w ktorej zaglebia sie krawedz lsniacego ostrza. Struga krwi rozlewa sie po ciele twojego przeciwnika, ktory z widocznym wysilkiem utrzymuje sie na nogach.
/def -p3 -F -t'*Unosisz kruczoczarny misterny miecz wysoko do gory**z widocznym wysilkiem utrzymuje sie na nogach.' kolor_walka_gadak_mask_1 = /echo -aBCgreen MASAKRUJESZ SMOCZYM MIECZEM


;Wykonujesz zamaszyste ciecie niemal w calosci zaglebiajac glownie swego kruczoczarnego misternego mieczaw ciele otylego kolczastego zwierzoczleka, ktory nie mogac dluzej utrzymac sie na nogach bezwladnie osuwa sie na ziemie. Przyklekasz nad przeciwnikiem, z ktorego ust, przy kazdym oddechu wydobywa sie glosne charczenie, unosisz skierowany ostrzem w dol miecz i w chwili, gdy z impetem przeszywasz cialo wroga przybijajac je do podloza klejnoty na rekojesci miecza rozblyskuja oslepiajacym, czerwonym swiatlem.
/def -p3 -F -t'*Wykonujesz zamaszyste ciecie niemal w calosci zaglebiajac**klejnoty na rekojesci miecza rozblyskuja oslepiajacym, czerwonym swiatlem.' kolor_walka_gadak_fatk_1 = /echo -aBCgreen FATALITY SMOCZYM MIECZEM!

;chybienie
;Bierzesz mocny zamach i wyprowadzasz szybki cios probujac trafic w glowe ponurego rudobrodego krasnoluda, jednak ostrze kruczoczarnego misternego miecza mija cel przecinajac z glosnym swistem powietrze tuz obok niego.
/def -p3 -F -t'*Bierzesz mocny zamach i wyprowadzasz szybki cios**mija cel przecinajac z glosnym swistem powietrze tuz obok *' kolor_walka_gadak_chybienie_1 = /echo -aBCred CHYBIASZ SMOCZYM MIECZEM

;Nagle kamienie na rekojesci miecza zaczynaja iskrzyc purpurowym swiatlem, zas jego ostrze pokrywa pajeczyna mieniacych sie na czerwono, pulsujacych zylek. Zdaja sie one plynac lekko po czarnej stali, z kazdym ruchem blask od nich bijacy staje sie coraz bardziej intensywny by w koncu wystrzelic miriada jaskrawoczerwonych, swietlistych okruchow. Czujesz przyjemne mrowienie gdy jakas magiczna sila przenika przez twoje cialo
/def -p9 -F -t'Nagle kamienie na rekojesci miecza zaczynaja iskrzyc purpurowym*' gadak_spec = /echo -aBCred SMOCZY MIECZ DZIALA!!!!!!!

;elfia misterna wlocznia


; Blyszczak - juz nie ma

; ork

/def -p9 -P0BCbgred  -F -t'rana pali zywym ogniem.' specorkowy = /playsnd sounds/uwaga.wav %;/czy_obrazenia

; troll

;Z rozprutego brzucha wielkiego starego trolla tryska strumien zielonkawej, zracej substancji trafiajac prosto w ciebie! Czujesz okropny, paralizujacy bol...
/def -p9 -P0BCbgred  -F -t'trafiajac prosto w ciebie! Czujesz okropny, paralizujacy bol' smierc_trolla = /playsnd sounds/uwaga.wav

; Szczerbiec
;/def -p9 -P0BCbgwhite    -F -t'(P|p)oszczerbiony obureczny miecz'      sz1
;/def -p9 -P0BCbgGreen    -F -t'zataczasz nim szeroki luk'              sz2
;/def -p9 -P0BCbgGreen    -F -t'kaleczac (go|ja) przy tym dotkliwie'    sz4
;/def -p9 -P0BCbgGreen    -F -t'(lekko|dotkliwie) (go|ja) raniac'       sz5
;/def -p9 -P0BCbgGreen    -F -t'zadajac (mu|jej) nieznaczne obrazenia'  sz6
;/def -p9 -P0BCbgGreen    -F -t'poteznym uderzeniem masakrujesz'        sz7

; Lamia

;/def -p9 -P0BCWhite    -F -t'Ma novigradzka lamie przypieta do pasa.'        lam1
;/def -p9 -P0BCbgred    -F -t'przymierza sie by uderzyc ciebie'               lam2
;/def -p9 -P0BCbgred    -F -t'zaplatales sie, unieruchamiajac sobie rece'     lam3
;/def -p9 -P0BCbgred    -F -t'Twoje nieudolne smagniecie novigradzka czarna lamia chybia' lam4
;/def -p9 -P0BCbgred    -F -t'zrywajac platy skory'                           lam5
;/def -p9 -P0BCbgred    -F -t'wyrzucajac w gore kawalki ciala i skory'        lam6

; informacje i ostrzezenia

/def -p9 -F -P0BCGreen      -F -t'wspiera '                                 i0
/def -p9 -F -P0BCGreen      -F -t'Juz walczysz'                                 ijw2
/def -p99 -F -P0BCbgGreen   -F -t'wspiera cie w walce'                     i1
/def -p9999 -F -aBCbgRed    -F -t'*atakuje cie!' i_atak = /playsnd sounds/uwaga.wav
/def -p999 -F -P0BCbgRed    -F -t'[^i] atakuje [^cie]' i_atak_2ogolny = /echo xxxxxxxxxxxxxx
/def -p9 -F -P0BCbgRed      -F -t'koncentruje sie na walce z toba.'        i3
/def -p9 -F -P0BCYellow     -F -t'do (c|C)iebie'                              i4
/def -p9 -F -P0BCbgmagenta     -F -t'w panice (umyka|wybiega)' i5 = /ucieczka
/def ucieczka = /playsnd sounds/chicken4.wav
/def -p9 -P0BCYellow     -F -t'Atakujesz '                              i4atakujesz
/def -p9 -aBCbgRed -F -t'*Potwierdz to przez ponowne zaatakowanie.' atakujesz_znajomego

;& {sakwa} == 0

/def -p9 -aBCyellow -F -t'* umarl.' i6au = /lokc
/def -p9 -aBCyellow -F -t'* umarla.' i6auw =/lokc
/def -p9 -aBCyellow -F -t'* polegl.' i6ap =/lokc
/def -p9 -aBCyellow -F -t'* polegla.' i6bp =/lokc
/def -p9 -aBCyellow -F -t'* poleglo.' i6cp =/lokc


; beduini

; Bladolicy kablakonogi mezczyzna wykonuje, jakby od niechcenia, popisowy wymach gladkim wygietym scimitarem, lecz nie trafia nikogo. Nie wydajac sie tym zrazony przechodzi do blyskawicznej ofensywy.
/def -t'*, lecz nie trafia nikogo. Nie wydajac sie tym zrazony*' beduni_1 = /echo -aBCyellow UNIKASZ

/def -p9 -P0BCred -F -t'(zlowro(dzy|gi)|wasa(ty|ci)|skrzywi(eni|ony)|posepn(y|i)|potezn(i|y)|muskularn(i|y)|(sniad|blad)olicy|haczykonos(i|y)|ogromn(i|y)|kablakono(dzy|gi)|te(dzy|gi)|ciemnoo(cy|ki)|kudla(ty|ci))(posepn(i|y)|kudla(ci|ty)|ponur(z|)y|rozleniwi(ieni|ony)|spoc(eni|ony)|kruczowlos(i|y)|kablakono(dzy|gi)|zacie(ci|ty)|kulaw(i|y)|wasa(ci|ty)|ciemnoo(ki|cy)|haczykonos(y|i)|bladolicy) mezczyzn(a|i)' beduini = /set zabij_npca=beduina

;zerrikanki

/def -p9 -P0BCcyan       -F -t' czujn(a|e) kobiet(y|a)' zerrikanka1 = /set zabij_npca=wojowniczke
/def -p9 -P0BCcyan       -F -t' chud(a|e) kobiet(y|a)' zerrikanka2 = /set zabij_npca=wojowniczke
/def -p9 -P0BCcyan       -F -t' wsciekl(a|e) kobiet(y|a)' zerrikanka3 = /set zabij_npca=wojowniczke
/def -p9 -P0BCcyan       -F -t' ponur(a|e) kobiet(y|a)' zerrikanka4 = /set zabij_npca=wojowniczke
/def -p9 -P0BCcyan       -F -t' blad(a|e) kobiet(y|a)' zerrikanka5 = /set zabij_npca=wojowniczke
/def -p9 -P0BCcyan       -F -t' szybk(a|ie) kobiet(y|a)' zerrikanka6 = /set zabij_npca=wojowniczke
/def -p9 -P0BCcyan       -F -t' burkliw(a|e) kobiet(y|a)' zerrikanka7 = /set zabij_npca=wojowniczke
/def -p9 -P0BCcyan       -F -t' grozn(a|e) kobiet(y|a)' zerrikanka8 = /set zabij_npca=wojowniczke
/def -p9 -P0BCcyan       -F -t' zwinn(a|e) kobiet(y|a)' zerrikanka9 = /set zabij_npca=wojowniczke
/def -p9 -P0BCcyan       -F -t' smukl(a|e) kobiet(y|a)' zerrikanka10 = /set zabij_npca=wojowniczke

; DRUCHII


/def -p9 -P0BCred -F -t'(nieustepliwy|wyniosly|zawistny|zimny|gniewny|dostojny|dumny|oschly|majestatyczny|charyzmatyczny|impulsywny|dumny|bezwzgledny|spokojny|niecierpliwy|okrutny|zaniepokojony|brutalny|zniecierpliwiony|porywczy|nerwowy|czujny) (atletyczny|zwinny|blady|muskularny|ozywiony|(bialo|jasno)skory|doswiadczony|wypoczety|silny|szczuply|zreczny|rosly|zmeczony|wysoki|potezny) elf' druchii_opisy =\
  /set zabij_npca=wojownika

; egzekutorzy
; bezwzgledny bialoskory
; majestatyczny jasnoskory
; Gniewny doswiadczony
; Zawistny rosly
; brutalny rosly

; NOMADZI

/def -p9 -P0BCcyan       -F -t' oliwkow(i|y) mezczyzn(i|a)' murzyn1 = /set zabij_npca=zboja
/def -p9 -P0BCcyan       -F -t' zol(ci|ty) mezczyzn(i|a)' murzyn2 = /set zabij_npca=zboja
/def -p9 -P0BCcyan       -F -t' bladoskor(zy|y) mezczyzn(i|a)' murzyn3 = /set zabij_npca=zboja
/def -p9 -P0BCcyan       -F -t' czerwonoskor(zy|y) mezczyzn(i|a)' murzyn4 = /set zabij_npca=zboja
/def -p9 -P0BCcyan       -F -t' opal(eni|ony) mezczyzn(i|a)' murzyn5 = /set zabij_npca=zboja
/def -p9 -P0BCcyan       -F -t' czarnoskor(zy|y) mezczyzn(i|a)' murzyn6 = /set zabij_npca=zboja
/def -p9 -P0BCcyan       -F -t' ciemnoskor(zy|y) mezczyzn(i|a)' murzyn7 = /set zabij_npca=zboja
/def -p9 -P0BCcyan       -F -t' smagl(i|y) mezczyzn(i|a)' murzyn8 = /set zabij_npca=zboja
/def -p9 -P0BCcyan       -F -t' metnoo(cy|ki) mezczyzn(i|a)' murzyn9 = /set zabij_npca=zboja
/def -p9 -P0BCcyan       -F -t' szkieletowa(ci|ty) mezczyzn(i|a)' murzyn10 = /set zabij_npca=zboja
/def -p9 -P0BCcyan       -F -t' krzywonos(i|y) mezczyzn(i|a)' murzyn11 = /set zabij_npca=zboja
/def -p9 -P0BCbgRed      -F -t' ozywieniec' ozywieniec = /set zabij_npca=ozywienca
/def -p9 -P0BCcyan       -F -t' zwierzo(czlek|ludzie)' zwierzoczlek = /set zabij_npca=zwierzoczleka
/def -p9 -P0BCcyan       -F -t' pustynny robak' robak = /set zabij_npca=pustynnego robaka
/def -p9 -P0BCcyan       -F -t' widmo' widmo = /set zabij_npca=widmo
/def -p9 -P0BCcyan       -F -t' karzel' i11karzel = /set zabij_npca=karla
/def -p9 -P0BCcyan       -F -t' smoczy ogr' i11smoczyogr = /set zabij_npca=smoczego ogra
/def -p9999 -P0BCred     -F -t'([Ww]iekowy|[Ss]tary) (tajemniczy|zezowaty|potezny|masywny) ork' i11wiekowyork = /set zabij_npca=wiekowego orka
/def -p9 -P0BCcyan       -F -t' reptilion(y|)' i11rept = /set zabij_npca=reptiliona
/def -p9 -P0BCcyan       -F -t' krasnozwierz[^a-z]' i11krasny = /set zabij_npca=krasnozwierza
/def -p9 -P0BCcyan       -F -t' skaven[^a-z]' i11 = /set zabij_npca=skavena
/def -p9 -P0BCcyan       -F -t' ghul[^a-d|^f-z]' i11ghul = /set zabij_npca=ghula
/def -p9 -P0BCcyan       -F -t' ghast[^a-d|^f-z]' i11ghast = /set zabij_npca=ghasta
/def -p9 -P0BCcyan       -F -t' ork[^a-z]' i11ork = /set zabij_npca=orka
/def -p9 -P0BCcyan       -F -t' graveir[^a-z]' i11graveir = /set zabij_npca=graveira
/def -p999 -P0BCred      -F -t' czerwonowlosy hobgoblin' i11hobekczerwony = /set zabij_npca=czerwonowlosego hobgoblina
/def -p9 -P0BCcyan       -F -t' hobgoblin[^a-z]' i11hobek = /set zabij_npca=hobgoblina
/def -p9 -P0BCcyan       -F -t' gargoyla' i11garg = /set zabij_npca=gargoyle
/def -p9 -P0BCcyan       -F -t' strzyga' i11strzyga = /set zabij_npca=strzyge
/def -p10 -P0BCbgred     -F -t' mutan(t|ci)[^a-z]' i11mut = /set zabij_npca=mutanta
/def -p10 -P0BCcyan      -F -t' grzyboczlek[^a-z]' i11grzyb
/def -p10 -P0BCcyan      -F -t' stwor[^a-z]' i11rosl = /set zabij_npca=stwora
;/def -p10 -P0BCcyan     -F -t' goblin[^a-z]' i11gob = /set zabij_npca=goblina
/def -p10 -P0BCcyan      -F -t' pukacz[^a-z]' i11puk = /set zabij_npca=pukacza
/def -p10 -P0BCcyan      -F -t' zmora' i11zmora = /set zabij_npca=zmore
/def -p10 -P0BCcyan      -F -t' kobold[^a-z]' i11kob = /set zabij_npca=kobolda
/def -p10 -P0BCred       -F -t' troll[^a-z]' i11tro = /set zabij_npca=trolla
/def -p10 -P0BCred       -F -t' postawny duzy mezczyzna' szefu_karawany = /set zabij_npca=postawnego duzego czlowieka
/def -p10 -P0BCcyan      -F -t' szkielet[^a-z]' i11szk = /set zabij_npca=szkielet
/def -p10 -P0BCcyan      -F -t' szczurolak[^a-z]' i11szc = /set zabij_npca=szczurolaka
/def -p10 -P0BCred       -F -t' wicht[^a-z]' i11wic = /set zabij_npca=wichta
/def -p10 -P0BCred       -F -t' potepien(iec|cy)' i11potep = /set zabij_npca=potepienca
;/def -p10 -P0BCcyan     -F -t' ambull[^a-z]' i11ambull = /set zabij_npca=ambulla
/def -p10 -P0BCcyan      -F -t' echinops[^a-z]' i11echi = /set zabij_npca=echinopsa
/def -p10 -P0BCcyan      -F -t' zjawa' i11zjawa = /set zabij_npca=zjawe
/def -p10 -P0BCbgred     -F -t' demon[^a-z]' i11dem
/def -p9 -P0BCbgcyan     -F -t' zombi[^a-z]' zombik = /set zabij_npca=zombiego
/def -p9 -P0BCbgcyan     -F -t' klabart[^a-z]' klabart = /set zabij_npca=klabarta
/def -p9 -P0BCbgred      -F -t' amfisbena' i11amfisbena = /set zabij_npca=amfisbene
/def -p9 -P0BCbgred      -F -t' postac[^a-z]' i11postac = /set zabij_npca=postac
/def -p9 -P0BCyellow     -F -t' jaszczurka' i11jaszczurka
/def -p9 -P0BCyellow     -F -t' waz[^a-z]' i11waz
/def -p10 -P0BCbgred     -F -t' zywiolak[^a-z]' i12zywiolak = /set zabij_npca=zywiolaka
/def -p10 -P0BCred       -F -t' harpia[^a-z]' i12harpia = /set zabij_npca=harpie

;"(?<!cial|ciala|cialo) czarn(y|e|ych) ork(i|ow|)"

/def -p9 -P0BCcyan       -F -t'(C|c)ial(o|a)'  i12
;/def -p9 -P0BCcyan       -F -t'szczatk(i|ow)'  i13
/def -p9 -aBCcyan       -F -t'(przy|)dryf(ow|)uje'  i14

;?? /def -p9 -aBCyellow     -F -t'*Chcesz wpasc do rozpadliny?' i15rozp

/def -p9 -P0BCRed        -F -t'blokuje nieprzebyty' i15blokp
/def -p9 -P0BCRed        -F -t'Nie widzisz zadnego wyjscia'             i15
/def -p9 -P0BCRed        -F -t'Gdzie chcesz sie przemknac?'             i15p
/def -p9 -P0BCRed        -F -t'laduje na ziemi obok ciebie'             i16 = /def _f1=wez bron %%; dobadz broni %; /echo -aBCcyan <<< [F1] Podnies i dobadz broni >>>
/def -p9 -P0BCRed        -F -t'rozpada sie!'                            i17a = /playsnd sounds/uwaga.wav
/def -p9 -aBCRed      -t'*dzierzon**peka!'            i17b = /playsnd sounds/blunt02.wav
;/def -p2 -aBCRed         -t'*peka!'                                  i17ba = /playsnd sounds/steelbarrier.wav %; /def _f1=odloz zlamane bronie %%; /sawe bron %%; aa  %; /echo -aBCcyan <<< [F1] Odloz zlamane bronie i dobadz nastepnych! >>>
/def -p2 -aBCRed         -t'*peka!'                                  i17ba = /playsnd sounds/steelbarrier.wav %; odloz zlamane bronie %; /sawe bron %; aa  %; /echo -aBCcyan <<< [F1] Odloz zlamane bronie i dobadz nastepnych! >>>
/def -p9 -P0BCRed        -F -t'oplata (twa noge szczekoczulkiem!|cie macka pasie i trzyma z wielka sila!)' i16bulwa = /def _f1=wyrwij sie %; /echo -aBCcyan <<< [F1] Wyrwij sie! >>>

/def -p9 -P0BCRed        -F -t'Wytezasz wszystkie swoje sily, ale nie udaje ci sie wyrwac.' i16bulwa2 = /def _f1=wyrwij sie %; /echo -aBCcyan <<< [F1] Wyrwij sie! >>>
/def -p9 -P0BCgreen      -F -t'Wytezasz wszystkie sily i udaje ci sie wyrwac z uscisku!' i16bulwa3


/def -p9 -P0BCbgwhite    -F -t'(P|p)olyskliwy smukly espadon'                       i19
;/def -p9 -P0BCbgwhite    -F -t'(W|w)ielki miecz dwureczny' i19wmd

/def -p9 -P0BCYellow     -F -t'przemyka sie'                                        i20
/def -p9 -P0BCYellow     -F -t'traci kontakt z rzeczywistoscia'                     i21
/def -p9 -P0BCYellow     -F -t'odzyskuje kontakt z rzeczywistoscia'                 i21b
/def -p9 -P0BCYellow     -F -t'odnawia kontakt z rzeczywistoscia'                   i21c

/def -p9 -P0BCRed        -F -t' ogr[^a-z]' i24

/def -p1 -P0BCblue -F -t'podaza' podazaprzez

;/def -p1 -P0BCyellow -F -t'(?<!snotling|goblin|ork) przybywa' ktos_przybywa = /set wlamujemy_sie=0 %; /if ({sakwa} == 0) /repeat -1 1 /set sakwa=1 %%; wez %{pojemnik_co} %; kk %; /info %; /endif


/def -p1 -aBCred -t'*wbiega, *' wbiega

; kasa

/def -p9 -F -P0BCwhite      -F -t'miedzian(ych|e|a)'  m1
/def -p9 -F -P0BCwhite      -F -t'srebrn(ych|a|e)'    m2
/def -p9 -F -P0BCwhite      -F -t'zlot(ych|e|a)'      m3
/def -p9 -F -P0BCwhite      -F -t'mithrylow(ych|a|e)' m4
/def -p9 -F -P0BCwhite      -F -t'monet(a|e|y|.|,)'   m5


/def -p9 -P0BCbgRed     -F -t'Jestes tak zmeczony, ze nie mozesz dalej podazac w tym kierunku.' zmeczeniecw
;/def -p9 -arBCmagenta   -F -t'*za twoimi plecami!' kupcyyyy
;/def -p9 -arBCmagenta   -F -t'*wycofuje sie za ciebie.' sigmaaar
;/def -p9 -arBCmagenta   -F -t'*zrecznie cie zaslania*' sigmaar

;/def -p9 -arBCmagenta -F -t'*zaslania**przed ciosami.' zaslona_przezkogos


;/def -aBCmagenta -t'Dajesz [^sie]*' _dajesz
;/def -aBCmagenta -t'*Odkladasz *' _odkladasz
;/def -aBCmagenta -t'Bierzesz *' _bierzesz

/def -aBCblue -t'*Zauwazasz przy nim *' _sprzet_w_ciele



/def -p99 -t'*celujac**lecz pudluje haniebnie!'             _stand_spec_pusty
/def -F -t'Nagle**zamaszysty**lecz pudluje haniebnie!'      _stand_spec_0 = /echo -aBCgreen <<< UNIKASZ! >>>
/def -F -t'*cie**pozostawiajac niewielka rane!'             _stand_spec_1 = /echo -aBCyellow <<< MUSKA CIE >>>
/def -F -t'*rani cie niezbyt mocno!'                        _stand_spec_2 = /echo -aBCyellow <<< LEKKO RANI CIE >>>
/def -F -t'* cie**zostawiajac spora rane!'                   _stand_spec_3 = /echo -aBCbgred <<< RANI CIE! >>> %; /inf
/def -F -t'*rani cie ciezko!'                               _stand_spec_4 = /echo -aBCbgred <<< POWAZNIE RANI CIE! >>> %; /info
/def -F -t'*zostawiajac (na ciele |)krwawa bruzde!'         _stand_spec_5 = /echo -aBCbgred <<< POWAZNIE RANI CIE! >>> %; /info
/def -F -t'*bezlitosnie cie masakruj(e|ac)!'                _stand_spec_6 = /echo -aBCbgred <<< MASAKRUJE CIE!!! >>> %; /echo -aBCcyan <<< [ALT+F6] LECZ SIE! >>> %; /info %; 


/def -p999 -aBCbggreen -F -t'* Zwalniasz sprezyne*' _stiletto_spec

/def -p999 -aBCbgred -F -t'Dostrzegasz niewielkie zaglebienie w piasku, poruszajace sie z duza predkoscia *' _robak_pustynny = /playsnd sounds/uwaga.wav %; /echo <<< UWAGA ROBAL >>>

/def -aBCgreen -t'Masz wrazenie, ze trucizna dostala sie do krwi przeciwnika.' _zatrules

/def -p99 -aBCbggreen  -aBCwhite -t'*Masz wrazenie, ze jestes *' _porownanie_1
/def -p99 -aBCbgred    -aBCwhite -t'*Masz wrazenie, ze jest *' _porownanie_2
/def -p99 -aBCbggreen  -aBCwhite -t'*Wydaje ci sie, ze jestes*' _porownywanie_3
/def -p100 -aBCbgyellow -aBCwhite -t'*Wydaje ci sie, ze jest**rownie *' _porownywanie_3a
/def -p100 -aBCbgyellow -aBCwhite -t'*Masz wrazenie, ze jest**rownie *' _porownywanie_3b
/def -p99 -aBCbgred    -aBCwhite -t'*Wydaje ci sie, ze jest**niz ty.' _porownywanie_4

/def -p9999 -t'*Wydaje ci sie, ze jest wart*' _porownanie_nohilit

/def -p9 -aBCred -F -t'*Nie mozesz tak po prostu wymknac sie z walki.' _przemykanie_walka = /playsnd sounds/uwaga.wav

/def -p999 -aBCred -F -t'*czarna ciezka przylbic*' _spaczone_przylbica_

/def -aBCred -F -t'Nie wmusisz w siebie ani kropelki wiecej.' _napity_

; koniec
