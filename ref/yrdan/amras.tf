; ## Linie dodane automagicznie   : tf_ver=1.0.5
; ## 
; ## Wersja pliku                 : 1.0.5
; ## Ostatnia zmiana pliku        : 2004-05-22 12:46:49
; ## Plik pobrany                 : 2004-05-22 14:52:29
; ## 
; ##


;Definicja broni ktora dana postac najczesciej walczy. 
;Zmienic zamiast "topora" na np "miecza"
/if ($(/listvar -s ogolne_broni)=~NULL) \
    /set ogolne_broni=broni %;\
/endif 

;Defincja Temblaka,pochwy,etc.. 
;jezeli bron i temblak sa zdefiniowane przy opuszczaniu i dobywaniu broni
;bedzie ona automatycznie wkladana,wyciagana z temblaka
/if ($(/listvar -s ogolne_temblak)=~NULL) \
;    /set ogolne_temblak=temblaka %;\
/endif 

;Definicja broni uzywanej i wkladanej do temblaka,pochwy,etc..
/if ($(/listvar -s ogolne_bron)=~NULL) \
    /set ogolne_bron=bron %;\
/endif 

;Komendy wykonywane po wejsciu postaci do swiata
/def start=justaw fan-eltharin

;przykladowy def i load :)
;/def ala=/echo ALA
/load hilit.tf
/load bindowania.tf

/def b =\
    /echo ======================================================== %;\
    /f1 /zarabianie %;\
    /f2 /jezyki %;\
    /f3 /organizacyjne %;\
    /f4 /leczenie %;\
    /echo ======================================================== %;\

/def leczenie =\
    /echo ======================================================== %;\
    /af1 Dziurawiec %;\
    /af2 Lak %;\
    /af3 Deliona %;\
    /echo ======================================================== %;\

/alias Deliona opusc bron%;ow%;wez zolty jasny kwiat z jedwabnego woreczka%;zw%;zjedz kwiat%;dobadz broni
/alias Lak opusc bron%;ow%;wez 5 sztywnych smuklych lodyg z jedwabnego woreczka%;zw%;przezuj lodygi%;dobadz broni
/alias Dziurawiec opusc bron%;ow%;wez 5 czterokanciastych rozgalezionych lodyg z zamszowego woreczka%;zw%;rozgryz lodygi%;dobadz broni


/def jezyki =\
    /echo ======================================================== %;\
    /f1 Fan-Eltharin %;\
    /f2 StarszaMowa %;\
    /echo ======================================================== %;\

/alias Fan-Eltharin justaw fan-eltharin
/alias StarszaMowa justaw starsza mowa


/def zarabianie = \
    /echo ======================================================== %;\
    /f1 /paczki  %;\
    /f2 /ziolka2 %;\
    /f3 /ryby2 %;\
    /f4 /organizacyjne %;\
    /echo ======================================================== %;\

/def ryby2 = \
    /load ryby.tf %;\

/def organizacyjne = \
    /echo ======================================================== %;\
    /f1 /napoczatku %;\
    /f2 /campo %;\
    /f3 /lodki %;\
    /f4 /pajaki %;\
    /echo ======================================================== %;\

/def pajaki = \
    /f2 /nl %;\
    /f3 x pajaka %;\
    /f4 wg%%;wez gruczoly %;\

/def lodki = \
    /f2 wskocz do wody%%;podplyn do pnia %;\
    /f3 wespnij sie na lodz%%;wlaz %;\
    /f4 x korsarza %;\

/def napoczatku = \
    zaloz ubrania %;\
    zaloz obraczke %;\
    zaloz wszystkie zbroje %;\
    /op %;\
    zaloz bransolete %;\
    zaloz medalionik %;\
    zepnij ubranie brosza %;\
    przewies torbe przez ramie %;\
    zaloz line %;\
    koumiesc intrygujacy lsniacy kolczyk w lewej brwi %;\
    poprzypnij pochwe na plecach %;\
    open %;\
    /wlk %;\
    /wlm %;\
    przytrocz lampe do pasa %;\
    przytrocz woreczki do pasa %;\
    ow %;\
;    wloz 20 sztywnych smuklych lodyg do woreczka%;\
;    wloz 20 czterokanciastych rozgalezionych lodyg do woreczka%;\
;    wloz 5 zoltych jasnych kwiatow do woreczka%;\
;    wloz czterokanciaste rozgalezione lodygi do zamszowego woreczka%;\
;    wloz zolte jasne kwiaty do jedwabnego woreczka%;\
;    wloz sztywne smukle lodygi do jedwabnego woreczka%;\
    wloz ziola do pierwszego woreczka%;\
    wloz ziola do drugiego woreczka%;\
    wloz ziola do czwartego woreczka%;\
    wloz ziola do trzeciego woreczka%;\
    zw%;\
    obzaloz zawiniatko%;\

/def sortowaniedziurawca = \
    otworz sakwe%;wez woreczek z sakwy%;ow%;wloz czterokanciaste rozgalezione lodygi do woreczka%;zamknij woreczek%;wloz woreczek do sakwy %;\

/def sortowanienagietka = \
    otworz sakwe%;wez woreczek z sakwy%;ow%;wloz jasnopomaranczowe kwiaty do woreczka%;zamknij woreczek%;wloz woreczek do sakwy %;\

/def v = \
     kup bilet %;\
     wsiadz na statek %;\
     wejdz na statek %;\
     wskocz na tratwe %;\
     wskocz na prom %;\
     wejdz do dylizansu %;\
     wsiadz do dylizansu %;\
     prom %;\

/def zs = \
     zejdz ze statku %;\
     wyjscie %;\
     zeskocz z tratwy %;\
     brzeg %;\
     zejdz na brzeg %;\

/def ziolka2 = \
    /f1 szukaj ziol %;\
    /f2 otworz woreczek%%;wloz ziola do woreczka%%;zamknij woreczek %;\
    /f3 otworz torbe%%;wloz woreczek do torby%%;zamknij torbe %;\
    /f4 /sprzedajziola %;\
    /f5 otworz torbe%%;zamknij woreczki%%;wloz woreczki do torby%%;zamknij torbe %;\
    /f6 otworz torbe%%;wez woreczek z torby%%;zamknij torbe    

;Campogrotta
/def -P0bCbgwhite,Cred -F -t'Kamienna plyta z przerazliwym zgrzytem zamyka wejscie do grobowca!'=\
    /echo -aBCgreen =============Plyta sie zamyka=========== %;\
    /f1 plyta%;\

;/def -P0bCbgwhite,Cred -F -t'Gabriel wskazuje na wodospad.'=\
;    /echo -aBCgreen =============SPADAMY Z WAZZEN=========== %;\
;    /wodospad


/def -P0bCbgwhite,Cred -F -t'Fantazyjne wrota sa zamkniete.'=\
    /echo -aBCgreen =============Wrota zamkniete=========== %;\
    /f1 otworz wrota%;\


/def -P0bCgreen -t'Widzisz sarkofag prostej konstrukcji, pozbawiony wszelkich zdobien, nawet tabliczki z imieniem. Gladkie sciany sa porosniete mchem, a zamkniete wieko jest lekko popekane.'
/def campo = \
    /f1 plyta %;\
    /f2 ob sarkofag %;\
    /f3 otworz sarkofag%%;zamknij sarkofag %;\
    /f4 x zombiego %;\
    /f5 x drugiego zombiego


;     Zamowienie u Conmara
/alias spodnie zamow ciemnozielone elfie spodnie
/alias plaszcz zamow jedwabny zielonobrazowy plaszcz z kapturem
/alias tunika zamow wygodna jasnozielona tunike
/alias chusta zamow jedwabna blekitna chuste
/alias woreczek zamow niewielki jedwabny woreczek

;   Ekwipunek
/alias dss wez sztylety z sakwy%;dobadz sztyletow
/alias os opusc sztylet%;powsun sztylet do drugiej pochwy
/alias wm wez monety
/alias hel zaloz helm
/alias wbzs wez bronie z sakwy
/alias kom przetrzyj szkielko kompasu%;sprawdz kierunek
/alias sb sprzedaj bronie
/alias open otworz torbe
/alias ot otworz torbe%;ob torbe
/alias zt zamknij torbe
/alias m otworz sakiewke%;wloz monety do sakiewki%;zamknij sakiewke
/alias mo otworz sakiewke%;wez monety z sakiewki
/alias komp przetrzyj szkielko kompasu%;sprawdz kierunek

/def sak = \
    /if ({*}=~NULL) \
       otworz torbe%;ob torbe%;\
    /else \
      otworz torbe%;wez %{*} z torby%;\
    /endif

/def dsak = \
    otworz torbe %;\
    wloz %{*} do torby 

/def pp = \
    przekaz prowadzenie %*

/def pz = \
    przestan zaslaniac %;

;   Drakwald


/alias wt wyrwij trofeum z ciala%;wyrwij trofeum z drugiego ciala%;wyrwij trofeum z trzeciego ciala%;wyrwij trofeum z czwartego ciala%;wyrwij trofeum z piatego ciala%;wyrwij trofeum z siodmego ciala%;wyrwij trofeum z osmego ciala%;wyrwij trofeum z dziewiatego ciala%;wyrwij trofeum z dziesiatego ciala
/alias wg wyrwij gruczol z ciala%;wyrwij gruczol z drugiego ciala%;wyrwij gruczol z trzeciego ciala%;wyrwij gruczol z czwartego ciala%;wyrwij gruczol z piatego ciala%;wyrwij gruczol z szostego ciala%;wyrwij gruczol z osmego ciala%;wyrwij gruczol z dziewiatego ciala%;wyrwij gruczol z dziesiatego ciala
/alias gob x goblina%;x drugiego goblina%;x trzeciego goblina%;x czwartego goblina%;x piatego goblina
/alias snot x snotlinga%;x drugiego snotlinga%;x trzeciego snotlinga%;x czwartego snotlinga%;x piatego snotlinga
/alias conmar daj gruczoly conmarowi%;zapytaj conmara o zaplate
/alias naczynie popros o naczynie mocy
/alias naczyniep popros o potezne naczynie mocy
/alias kokon poprowadz rytual zaklinania%;wybierz kokon%;skoncentruj sie

; Walka
/alias xd wskaz %{*}%;rozkaz druzynie zaatakowac %{*}%;zabij %{*}
/alias x zabij %{*}
/alias xtw wskaz %{*}%;zabij %{*}
/alias zd rozkaz druzynie zaslonic amrasa

;   Poruszanie sie
/alias znd zejdz na dol
/alias zzd zejdz z drzewa
/alias znt zejdz na trakt
/alias pd porzuc druzyne
/alias upd usiadz pod drzewem
/alias ung usiadz na glazie
/alias upw usiadz przy strumieniu
/alias ups usiadz przy stole
/alias uj ujawnij sie
/alias uk ukryj sie
/alias wsnd wespnij sie na drzewo
/alias xavier wejdz do kurhanu%;w%;n%;nw%;nw%;n%;nw%;nw%;nw%;n%;ne%;e%;n
/alias xavierout s%;w%;sw%;s%;se%;se%;se%;s%;se%;se%;s%;e%;gora
/alias brok se%;ne%;e%;se%;e%;se%;se%;se%;se%;s%;s%;e%;e%;se%;se%;e%;n
/alias brok2 s%;w%;nw%;nw%;w%;w%;n%;n%;nw%;nw%;nw%;nw%;w%;nw%;w%;sw%;nw
/alias athel nw%;nw%;n%;nw%;n%;n%;n%;ne%;se%;e%;se%;s%;w%;w%;
/alias athelout e%;e%;n%;nw%;w%;nw%;sw%;s%;s%;s%;se%;s%;se%;se%;
/alias zapadka ob sciane%;wcisnij zapadke%;se
/alias pot zaslon %{*} przed trzecim potepiencem
/alias wsng wespnij sie na gore
/alias skn skocz na polnoc
/alias sks skocz na poludnie
/alias ske skocz na wschod
/alias skw skocz na zachod
/alias sknw skocz na polnocny-zachod
/alias skne skocz na polnocny-wschod
/alias skse skocz na poludniowy-wschod
/alias sksw skocz na poludniowy-zachod
/alias plyta przestan walczyc%;przestan walczyc%;przestan walczyc%;przesun kamienna plyte%;zabij zombiego

;   Emocje
/alias pz pokiwaj zgodnie
/alias hm2 namysl sie nad czyms pocierajac podbrodek
/alias wr wzrusz ramionami
/alias ucho podrap sie w ucho
/alias nos podrap sie w nos
/alias wl westchnij lekko
/alias ppo pokiwaj powoli
/alias rr rozloz rece bezradnie
/alias kot zmruz oczy
/alias pgzz pokiwaj ze zrozumieniem
/alias kap1 naciagnij kaptur
/alias kap2 sciagnij kaptur
/alias ukl uklon sie lekko
/alias zn zamrucz niezrozumiale
/alias zm zamrucz markotnie
/alias zsd zasmiej sie dziko
/alias zs zasmiej sie %*
/alias us usmiechnij sie %*
/alias smiech gpsmiech %*
/alias oczy przewroc oczami
/alias czolo zdejmij helm%;otrzyj czolo
/alias ps popatrz smetnie %*
/alias . jpowiedz %*
/alias ppon popatrz powoli na %*
/alias pln popatrz lekko na %*
/alias ppn popatrz przelotnie na %*
/alias pre usmiechnij sie przekornie %*
/alias pwn popatrz wyczekujaco na %*
/alias pyt popatrz pytajaco na %*
/alias pzzn  popatrz z zainteresowaniem na %*
/alias usd usmiechnij sie delikatnie %*
/alias usn usmiechnij sie nieznacznie %*
/alias usmim usmiechnij sie mimowolnie
/alias pnn popatrz niepewnie na %*
/alias nn namysl sie nad czyms %*
/alias pztn popatrz z troska na %*



;    Ziola
;/alias wzdw otworz jedwabny woreczek%;wloz ziola do jedwabnego woreczka%;zamknij jedwabny woreczek
;/alias wzdw2 otworz woreczek%;wloz ziola do woreczka%;zamknij woreczek
;/alias wwdt wloz woreczek do torby

;Sortowania ziol i sprzedaz

;/def ziolaout = \
;     otworz sakwe %;\
;     ow %;\
;     wez ziola z woreczka %;\
;     /repeat -0 10  wez woreczek z sakwy%%;otworz go%%;wez ziola z niego %%;\

/alias zw zamknij woreczki
/alias ow otworz woreczki

;/def sortowanie = \
;    otworz woreczki %;\
;    wloz fioletowe zwarte kwiatostany do pierwszego woreczka %;\
;    wloz czterokanciaste rozgalezione lodygi do pierwszego woreczka %;\
;    zamknij pierwszy woreczek %;\
;    sprzedaj ziola %;\
;
;    wloz pierwszy woreczek do sakwy %;\
;    wloz macznistoowlosione szarawe rosliny do pierwszego woreczka %;\
;    wloz zolte jasne kwiaty do pierwszego woreczka %;\
;    zamknij pierwszy woreczek %;\
;    wloz pierwszy woreczek do sakwy %;\

/alias wsn wskaz na polnoc
/alias wss wskaz na poludnie
/alias wse wskaz na wschod
/alias wsw wskaz na zachod
/alias wsnw wskaz na polnocny zachod
/alias wsne wskaz na polnocny wschod
/alias wsse wskaz na poludniowy wschod
/alias wssw wskaz na poludniowy zachod





; Zaznaczenia
;TW
/def -P0bCbggreen,Cblue -F -t'Auglenn'
/def -P0bCbggreen,Cblue -F -t'Wolfsabe'
/def -P0bCbggreen,Cblue -F -t'Aellien'
/def -P0bCbggreen,Cblue -F -t'Mol'
/def -P0bCbggreen,Cblue -F -t'Ennyen'
/def -P0bCbggreen,Cblue -F -t'Dirian'
/def -P0bCbggreen,Cblue -F -t'Gileadrael'
/def -P0bCbggreen,Cblue -F -t'Nazaal'
/def -P0bCbggreen,Cblue -F -t'Evin'
/def -P0bCbggreen,Cblue -F -t'Hakatri'
;przyjaciele
/def -P0bCbgblue,Cyellow -F -t'Tahir'
/def -P0bCbgblue,Cyellow -F -t'Torchi'
/def -P0bCbgblue,Cyellow -F -t'Nuadhu'
/def -P0bCbgblue,Cyellow -F -t'Asghart'
/def -P0bCbgblue,Cyellow -F -t'Silkathas'
/def -P0bCbgblue,Cyellow -F -t'Kilvar'
/def -P0bCbgblue,Cyellow -F -t'Leshiya'
;Menlakh
/def -P0bCbgred,Cyellow -F -t'Xion'
/def -P0bCbgred,Cyellow -F -t'Iluke'
/def -P0bCbgred,Cyellow -F -t'Rosse'
/def -P0bCbgred,Cyellow -F -t'Aesanel'
/def -P0bCbgred,Cyellow -F -t'Rika'
/def -P0bCbgred,Cyellow -F -t'Vinzt'
/def -P0bCbgred,Cyellow -F -t'Gabriel'
/def -P0bCbgred,Cyellow -F -t'Gilanel'
/def -P0bCbgred,Cyellow -F -t'Viliander'
/def -P0bCbgred,Cyellow -F -t'Gvynneal'
/def -P0bCbgred,Cyellow -F -t'Lorelai'

/def -aB -t'*daje ci*' _dajeci
/def -Fp1 -aBCred -t'Do pasa ma*'
/def -Fp1 -aBCblue -t'Nosi*'
/def -P0bCbgred,Cyellow -F -t'otwart(e|y)'

/def oc = /def -mregexp -ag -t"^[^(Wyglada na)] *" ocenaGag%;ocen %{1}%;/repeat -1 1 /undef ocenaGag


/alias ruiny wcisnij plaskorzezbe%;u%;u%;przesun plyte%;otwor%;u%;przesun plyte%;n%;e%;e%;otworz klape%;n%;w
/alias run n%;n%;e%;e%;e%;e%;e%;e%;e%;e%;e%;n%;ne%;w
