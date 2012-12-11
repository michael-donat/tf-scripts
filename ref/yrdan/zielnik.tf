; ## Linie dodane automagicznie   : tf_ver=1.1.1
; ## 
; ## Wersja pliku                 : 1.1.1
; ## Ostatnia zmiana pliku        : 2005-02-06 21:03:06
; ## Plik pobrany                 : 2005-02-06 21:03:40
; ## Wersja Tfupdate              : 2.0.0 alfa 1
; ##
; ##


; WIELKI ZIELNIK EVINA

; cr. 14 X 2000
; up. 5 XI 2002
; up. 20 VII 2003 by Edith
; up. 3 XII 2003 by Evin


; JESLI JAKIES ZIOLO NIE JEST ROZPOZNAWANE PROSZE WYSLAC MI INFORMACJE I OPIS << evin@o.k.pl >>

; czesciowo uzupelniony na podstawie zielnika Aesanela z  biblioteki w Loren
; podziekowania dla Edith za zmobilizowanie do uaktualnienia :)


/echo -au -aBCgreen << /ziola - spis ziol w zielniku >>
/echo -au -aBCgreen << /nazwaziola -  opis i zastosowanie >>

; JESLI JAKIES ZIOLO NIE JEST ROZPOZNAWANE PROSZE WYSLAC MI INFORMACJE I OPIS << evin@o.k.pl >>

; spis ziol

/def ziolo = /ziola %{*}

/def ziola = \
    /echo %;\
    /echo ZIOLA: %;\
    /echo -au -aBCgreen lecznicze	 %;\
    /echo -au -aBCgreen odtrutki %;\
    /echo -au -aBCgreen regenerujace %;\
    /echo -au -aBCgreen uniwersalne %;\
    /echo -au -aBCblue nieznane %;\
    /echo -au -aBCblue niesprawdzone %;\
    /echo -au -aBCmagenta nietypowe %;\
    /echo -au -aBCyellow obojetne %;\
    /echo -au -aBCred trujace %;\
    /echo -au -aBCwhite wymarle %;\
    /echo wszystkie %;\
    /echo

/def wszystkie= %;\
/lecznicze %;\
/odtrutki %;\
/regenerujace %;\
/uniwersalne %;\
/nieznane %;\
/niesprawdzone %;\
/nietypowe %;\
/obojetne %;\
/trujace %;\
/wymarle %;\
/echo

/def lecznicze= %;\
/echo -au -aBCgreen ZIOLA LECZNICZE %;\
/echo Babka %;\
/echo Mniszek %;\
/echo Szafran %;\
/echo Barwinek %;\
/echo Nagietek %;\
/echo Szczaw %;\
/echo Lawenda %;\
/echo Pierscieniak %;\
/echo Szalwia %;\
/echo SerceKapitana %;\
/echo **************** %;\
/echo Rdest %;\
/echo Mak %;\
/echo Macznica %;\
/echo Pieciornik %;\
/echo Dziurawiec %;\
/echo 

/def regenerujace=\
/echo -au -aBCgreen ZIOLA REGENERUJACE: %;\
/echo Melisa %;\
/echo ********* %;\
/echo Naparstnica %;\
/echo Nostrzyk %;\
/echo Bylica %;\
/echo Kasztanowiec %;\
/echo Przelot %;\
/echo

/def uniwersalne= %;\
/echo -au -aBCgreen ZIOLA UNIWERSALNE: %;\
/echo Arnika %;\
/echo Glog %;\
/echo Mieta %;\
/echo

/def trujace= %;\
/echo -au -aBCred TRUCIZNY I ZIOLA SZKODLIWE: %;\
/echo Oset %;\
/echo Bagiennik %;\
/echo Grabiorog %;\
/echo Pierscieniak %;\
/echo Lulek %;\
/echo Pierscieniak %;\
/echo Muchomor %;\
/echo Sromotnik %;\
/echo Szatan %;\
/echo Stulicha %;\
/echo Stroczek %;\
/echo Szalej %;\
/echo ************* %;\
/echo Kulczyba %;\
/echo Szczwol %;\
/echo Jemiola %;\
/echo Ciemiernik %;\
/echo Bobotrutka %;\
/echo Rojnik %;\
/echo Potoslin %;\
/echo Pokrzyk %;\
/echo Rauwolfia %;\
/echo Kurzyslad %;\
/echo Tojad %;\
/echo Ostrozeczka %;\
/echo Stroiczka %;\
/echo Ciemiezyca %;\
/echo Starzec %;\
/echo Jaskier %;\
/echo

/def odtrutki= %;\
/echo -au -aBCgreen ODTRUTKI: %;\
/echo Ranog %;\
/echo Plucnica %;\
/echo Siezygron %;\
/echo Centuria %;\
/echo *************** %;\
/echo Rumianek %;\
/echo Chaber %;\
/echo BezCzarny %;\
/echo Krzyzownica %;\
/echo Nawloc %;\
/echo

/def nietypowe= %;\
/echo -au -aBCmagenta ZIOLA O DZIALANIU NIETYPOWYM: %;\
/echo Casur %;\
/echo Drath %;\
/echo Deliona %;\
/echo Konopie %;\
/echo Ogorecznik %;\
/echo ************* %;\
/echo Bielun %;\
/echo Deren %;\
/echo Komosa %;\
/echo Wrotycz %;\
/echo Mandragora %;\
/echo Aralia %;\
/echo Kola %;\
/echo Przesl %;\
/echo Lulecznica %;\
/echo Konwalia %;\
/echo Lak %;\
/echo

/echo

/def obojetne= %;\
/echo -au -aBCyellow ZIOLA OBOJETNE: %;\
/echo Roza %;\
/echo Pierscieniak %;\
/echo Borowka %;\
/echo Jagoda %;\
/echo Jezyna %;\
/echo Malina %;\
/echo Maslak %;\
/echo Hubka %;\
/echo Podrzybek %;\
/echo Poziomka %;\
/echo MuchomorCesarski %;\
/echo BorowikKrolewski %;\
/echo Borowik %;\
/echo Drabik %;\
/echo Kozlarz %;\
/echo Trawa %;\
/echo ************** %;\
/echo Urzet %;\
/echo Boldoa %;\
/echo Marzanna %;\
/echo Podbial %;\
/echo Ostrozen %;\
/echo Poziewnik %;\
/echo Sliwa %;\
/echo Bulawinka %;\
/echo Kociomietka %;\
/echo Skrzyp %;\
/echo Cebula %;\
/echo Kruszyna %;\
/echo Hyzop %;\
/echo Lukrecja %;\
/echo Pokrzywa %;\
/echo Janowiec %;\
/echo Lubczyk %;\
/echo

/def nieznane= %;\
/echo -au -aBCblue ZIOLA O NIEZNANYM DZIALANIU: %;\
/echo brak %;\
/echo

/def niesprawdzone= %;\
/echo -au -aBCblue ZIOLA O NIESPRAWDZONYM DZIALANIU: %;\
/echo rosiczka %;\
/echo czeremcha %;\
/echo krasnodrzew %;\
/echo rosiczka %;\
/echo


/def wymarle= %;\
/echo -au -aBCwhite ZIOLA KTORYCH DAWNO NIE WIDZIANO - PRAWDOPODOBNIE WYMARLE GATUNKI. %;\
/echo Tatarak %;\
/echo Krwawnik %;\
/echo Zimowit %;\
/echo Pokrzyk %;\
/echo Piolun %;\
/echo Oman %;\
/echo Naparstnica %;\
/echo Kruszyna %;\
/echo Grzybien %;\
/echo Glistnik %;\
/echo Czarnuszka %;\
/echo Chrzan %;\
/echo Chmiel %;\
/echo BozeDrzewko %;\
/echo Bielun %;\
/echo Adanat %;\
/echo Makownik %;\
/echo

; ROZPOZNAWANIE ZIOL

/def -Fp200 -mregexp -t'([Zz]olt(y|e|ych) jasn(y|e|ych) kwiat(|y|ow))([ .,])' _ziolo_Deliona = /substitute -p %{PL}%{P1} @{BxCgreen}(Deliona)@{n}%{P5}%{PR}
/def deliona = /echo  %; /echo Deliona, Roburus Dei - zolty jasny kwiat. %; /echo Ziolo to wydatnie likwiduje stany nerwowe i nadpobudliwosc.

/def -Fp200 -mregexp -t'([Oo]kraglaw(y|ych|e) aromatyczn(y|e|ych) lisc(|i|ie))([ .,])' _ziolo_mieta = /substitute -p %{PL}%{P1} @{BxCgreen}(Mieta)@{n}%{P5}%{PR}
/def mieta = /echo  %; /echo Mieta, Mentha arvensis - okraglawy aromatyczny lisc. %; /echo Roztarty lisc zdrowie poprawi, powachany zmeczenie usunie, wcierany pomoze na migrene a zjedzony lub przezuty wzmaga trawienie oraz leczy drobne dolegliwosci zoladka.

/def -Fp200 -mregexp -t'([Rr]ozetkowat(y|ych|e) lancetowat(y|e|ych) lisc(|i|ie))([ .,])' _ziolo_babka = /substitute -p %{PL}%{P1} @{BxCgreen}(Babka)@{n}%{P5}%{PR}
/def babka = /echo  %; /echo Babka, Plantago lanceolata - rozetkowaty lancetowaty lisc. %; /echo Przylozony lisc zasklepia rany. 

/def -Fp200 -mregexp -t'([Zz]locistozolt(y|e|ych) kwiat(|y|ow))([ .,])' _ziolo_Mniszek = /substitute -p %{PL}%{P1} @{BxCgreen}(Mniszek)@{n}%{P5}%{PR}
/def mniszek = /echo  %; /echo Mniszek, Tarraxacum officinale - zlocistozolty kwiat. %; /echo Nalezy przezuc badz zjesc aby troszke zdrowia odzyskac.

/def -Fp200 -mregexp -t'([Jj]asnofioletow(y|e|ych) delikatn(y|e|ych) kwiat(|y|ow))([ .,])' _ziolo_Szafran = /substitute -p %{PL}%{P1} @{BxCgreen}(Szafran)@{n}%{P5}%{PR}
/def szafran = /echo  %; /echo Szafran, Crocus sativus - jasnofioletowy delikatny kwiat. %; /echo Ususzony leczy, swiezy ponoc zwieksza wytrzymalosc.

/def -Fp200 -mregexp -t'([Gg]rub(y|e|ego|ych) szaraw(y|e|ego|ych) grzyb(|a|y|ow))([ .,])' _ziolo_BorowikSzatanski = /substitute -p %{PL}%{P1} @{BxCred}(Szatan)@{n}%{P5}%{PR}
/def szatan = /echo  %; /echo Borowik Szatanski,  Boletus calopus - gruby szarawy grzyb. %; /echo Nie polecam do spozycia.

/def -Fp200 -mregexp -t'([Bb]ial(y|e|ych) mal(y|e|ych) kwiat(|y|ow))([ .,])' _ziolo_Glog = /substitute -p %{PL}%{P1} @{BxCgreen}(Glog)@{n}%{P5}%{PR}
/def glog = /echo  %; /echo Glog, Crataegus monogyma - bialy maly kwiat. %; /echo Nalezy przezuc by zdrowie poprawic lub zjesc by zmeczenie usunac.

/def -Fp200 -mregexp -t'([Ss]zarozielon(y|e|ego|ych) gabczast(y|e|ego|ych) porost(|a|y|ow))([ .,])' _ziolo_plucnica = /substitute -p %{PL}%{P1} @{BxCgreen}(Plucnica)@{n}%{P5}%{PR}
/def plucnica = /echo  %; /echo Plucnica, szarozielony gabczasty porost. %; /echo Sproszkowac i jako odtrutke stosowac.

/def -Fp200 -mregexp -t'([Dd]elikatn(y|e|ego|ych) czerwon(y|e|ego|ych) grzyb(|a|y|ow))([ .,])' _ziolo_Muchomor_Czerwony = /substitute -p %{PL}%{P1} @{BxCred}(Muchomor)@{n}%{P5}%{PR}
/def muchomor = /echo  %; /echo Muchomor Czerwony,  Amanita muscaria - delikatny czerwony grzyb. %; /echo Spozyty oslabia umysl.

/def -Fp200 -mregexp -t'([Kk]olczast(a|e|ych) wysuszon(a|e|ych) roslin(a||e|y))([ .,])' _ziolo_Oset = /substitute -p %{PL}%{P1} @{BxCred}(Oset)@{n}%{P5}%{PR}
/def oset = /echo  %; /echo Oset,  Cirusum arvense - kolczasta wysuszona roslina. %; /echo Spozyty lub przezuty potrafi zranic.

/def -Fp200 -mregexp -t'([Ff]ioletow(y|e|ego|ych) lejkowat(y|ego|e|ych) kwiat(|u|y|ow))([ .,])' _ziolo_Bariwnek = /substitute -p %{PL}%{P1} @{BxCgreen}(Barwinek)@{n}%{P5}%{PR}
/def barwinek = /echo  %; /echo Barwinek, Vinca minor - fioletowy lejkowaty kwiat. %; /echo Przylozyc na rane - zjedzenie nie daje zadnego efektu.

/def -Fp200 -mregexp -t'([Jj]asnopomaranczow(y|e|ego|ych) kwiat(|u|y|ow))([ .,])' _ziolo_Nagietek = /substitute -p %{PL}%{P1} @{BxCgreen}(Nagietek)@{n}%{P4}%{PR}
/def nagietek = /echo  %; /echo Nagietek, Callendula officinalis - jasnopomaranczowy kwiat. %; /echo Silne ziolo lecznicze. Przylozyc na rane. Spozycie nie daje pozadanych efektow.

/def -Fp200 -mregexp -t'([Ss]trzalkowat(y|e|ego|ych) aromatyczn(y|ego|e|ych) lisc(|u|y|ow))([ .,])' _ziolo_Szczaw = /substitute -p %{PL}%{P1} @{BxCgreen}(Szczaw)@{n}%{P5}%{PR}
/def szczaw = /echo  %; /echo Szczaw, Rumex acetosella - strzalkowaty aromatyczny lisc. %; /echo Przezuc lisc aby zdrowie odzyskac. Jadalny bez efektow leczniczych.

/def -Fp200 -mregexp -t'([Ff]ioletow(y|e|ego|ych) zwart(y|ego|e|ych) kwiatostan(|u|y|ow))([ .,])' _ziolo_Lawenda = /substitute -p %{PL}%{P1} @{BxCgreen}(Lawenda)@{n}%{P5}%{PR}
/def lawenda = /echo  %; /echo Lawenda, Lavandula officinalis - fioletowy zwarty kwiatostan. %; /echo Przylozyc na rane. Spozywanie podnosi odpornosc na trucizny. Przezucie bez efektow leczniczych.

/def -Fp200 -mregexp -t'([Zz]aostrzon(y|e|ego|ych) podlozn(y|ego|e|ych) lisc(|u|y|ow))([ .,])' _ziolo_SzalwiaLekarska = /substitute -p %{PL}%{P1} @{BxCgreen}(Szalwia)@{n}%{P5}%{PR}
/def szalwia = /echo  %; /echo Szalwia Lekarska, Salvia officinalis - zaostrzony podluzny lisc. %; /echo Zjesc aby poprawe odczuc. Przykladanie bez efektow leczniczych.

/def -Fp200 -mregexp -t'([Mm]al(y|e|ego|ych) czerwon(y|ego|e|ych) kwiat(|u|y|ow))([ .,])' _ziolo_SerceKapitana = /substitute -p %{PL}%{P1} @{BxCgreen}(Serce Kapitana)@{n}%{P5}%{PR}
/def sercekapitana = /echo  %; /echo Serce Kapitana, Cardius capitana - maly czerwony kwiat. %; /echo Przezuc aby natychmiastowa znaczna poprawe zdrowia odczuc. UWAGA! Efekt uboczny: oslabienie pomyslunku oraz zmiejszenie zrecznosci

/def -Fp200 -mregexp -t'([Oo]wlosion(y|e|ego|ych) aromatyczn(y|ego|e|ych)( | ususzon(e |y |ych ))lisc(|u|y|ow))([ .,])' _ziolo_MelisaLekarska = /substitute -p %{PL}%{P1} @{BxCgreen}(Melisa)@{n}%{P6}%{PR}
/def melisa = /echo  %; /echo Melisa Lekarska, Melisa officinalis - owlosiony aromatyczny lisc. %; /echo Swiezo zjedzona lub przezuta regeneruje. Ususzona i wykorzystana tak samo zwieksza odpornosc na trucizny.

/def -Fp200 -mregexp -t'([Zz]locistopomaranczow(y|e|ego|ych) duz(y|ego|e|ych) kwiat(|u|y|ow))([ .,])' _ziolo_Arnika = /substitute -p %{PL}%{P1} @{BxCgreen}(Arnika)@{n}%{P5}%{PR}
/def arnika = /echo  %; /echo Arnika, Arnica montana - zlocistopomaranczowy duzy kwiat. %; /echo Przylozyc by zdrowie poprawic, zjesc by zmeczenie usunac.

/def -Fp200 -mregexp -t'([Zz]oltoszar(y|e|ego|ych) niepozorn(y|ego|e|ych)( | ususzon(e |y |ych ))korzen(|ie|i|ia))([ .,])' _ziolo_Ranog = /substitute -p %{PL}%{P1} @{BxCgreen}(Ranog)@{n}%{P7}%{PR}
/def ranog = /echo  %; /echo Ranog - zoltoszary niepozorny korzen. %; /echo Przezuc by sie odtruc. Leczy rowniez rany. Ususzony takoz.

/def -Fp200 -mregexp -t'([Dd]uz(a|e|ych) granatow(a|e|ych) jagod(|e|y|a))([ .,])' _ziolo_Siezygron = /substitute -p %{PL}%{P1} @{BxCgreen}(Siezygron)@{n}%{P5}%{PR}
/def siezygron = /echo  %; /echo Siezygron - duza granatowa jagoda. %; /echo Rozgryziona pomaga zwalczyc trucizny wszelakie.

/def -Fp200 -mregexp -t'([Bb]rudnobrazow(a|e|ych) cuchnac(a|e|ych) galaz(ka|ki|ek))([ .,])' _ziolo_Bagiennik = /substitute -p %{PL}%{P1} @{BxCred}(Bagiennik)@{n}%{P5}%{PR}
/def bagiennik = /echo  %; /echo Bagiennik znany tez jako Bagno, Ledum palustre - brudnobrazowa cuchnaca galazka. %; /echo Spozyta oslabia wytrzymalosc.

/def -Fp200 -mregexp -t'([Bb]razowaw(y|e|ego|ych) fosforyzujac(y|ego|e|ych) m(ech|chow|chu))([ .,])' _ziolo_Grabiorog = /substitute -p %{PL}%{P1} @{BxCred}(Grabiorog)@{n}%{P5}%{PR}
/def grabiorog = /echo  %; /echo Grabiorog - brazowy fosforyzujacy mech. %; /echo Nieostroznie spozyty zle wplywa na psychike, takoz utrudnia wykorzytanie sil mentalnych.

/def -Fp200 -mregexp -t'([Zz]ielon(y|e|ego|ych) sluzowat(y|e|ego|ych) grzyb(|a|y|ow))([ .,])' _ziolo_Pierscieniak1 = /substitute -p %{PL}%{P1} @{BxCred}(Pierscieniak)@{n}%{P5}%{PR}
/def -Fp200 -mregexp -t'([Jj]asnozielon(y|e|ego|ych) sluzowat(y|e|ego|ych) grzyb(|a|y|ow))([ .,])' _ziolo_Pierscieniak2 = /substitute -p %{PL}%{P1} @{BxCred}(Pierscieniak)@{n}%{P5}%{PR}
/def -Fp200 -mregexp -t'([Cc]iemnoniebieski(|ch|ego) sluzowat(y|e|ego|ych) grzyb(|a|y|ow))([ .,])' _ziolo_Pierscieniak3 = /substitute -p %{PL}%{P1} @{BxCyellow}(Pierscieniak)@{n}%{P5}%{PR}
/def -Fp200 -mregexp -t'([Nn]iebieski(|ch|ego) sluzowat(y|e|ego|ych) grzyb(|a|y|ow))([ .,])' _ziolo_Pierscieniak4 = /substitute -p %{PL}%{P1} @{BxCred}(Pierscieniak)@{n}%{P5}%{PR}
/def -Fp200 -mregexp -t'([Mm]iedzian(y|e|ego|ych) sluzowat(y|e|ego|ych) grzyb(|a|y|ow))([ .,])' _ziolo_Pierscieniak5 = /substitute -p %{PL}%{P1} @{BxCgreen}(Pierscieniak)@{n}%{P5}%{PR}
/def pierscieniak = /echo  %; /echo Pierscieniak, Stropharia careulea i Stropharia eruginosa - jasnozielony, zielony, niebieski lub miedziany sluzowaty grzyb. %; /echo Zielone i niebieskie truja. Ciemnoniebieski nie daje zadnych efektow, miedziany leczy.

/def -Fp200 -mregexp -t'([Bb]rudnozolt(y|e|ego|ych) fioletowo-zylkowan(y|ego|e|ych) kwiat(|u|y|ow))([ .,])' _ziolo_Lulek_Czarny = /substitute -p %{PL}%{P1} @{BxCred}(Lulek)@{n}%{P5}%{PR}
/def lulek = /echo  %; /echo Lulek Czarny, Hyoscyamus niger - brudnozolty fioletowo-zylkowany kwiat. %; /echo Trucizna! Przezuty lub zjedzony powoduje rany na ciele.

/def -Fp200 -mregexp -t'([Dd]elikatn(y|e|ego|ych) jasn(y|e|ego|ych) grzyb(|a|y|ow))([ .,])' _ziolo_Muchomor_Sromotnikowy = /substitute -p %{PL}%{P1} @{BxCred}(Sromotnik)@{n}%{P5}%{PR}
/def sromotnik = /echo  %; /echo Muchomor Sromotnikowy,  Amanita phalloides - delikatny jasny grzyb. %; /echo Wszystkie grzyby sa jadalne. Z tym ze niektore tylko raz. %; /echo Najsilniej trujacy grzyb. W poczatkowej fazie powoduje wymioty oraz slepote.

/def -Fp200 -mregexp -t'([Jj]askrawozolt(y|e|ego|ych) drobn(y|ego|e|ych) kwiat(|u|y|ow))([ .,])' _ziolo_Stulicha = /substitute -p %{PL}%{P1} @{BxCred}(Stulicha)@{n}%{P5}%{PR}
/def stulicha = /echo  %; /echo Stulicha, Descurainia sophia - jaskrawozolty drobny kwiat. %; /echo Trucizna o potrojnym dzialaniu: meczy, rani i oslabia mentalnie.

/def -Fp200 -mregexp -t'([Bb]ial(y|e|ego|ych) zmutowan(y|e|ego|ych) grzyb(ek|kow|ki|ka))([ .,])' _ziolo_Stroczek = /substitute -p %{PL}%{P1} @{BxCred}(Stroczek)@{n}%{P5}%{PR}
/def stroczek = /echo  %; /echo Stroczek,  Merulinus - bialy zmutowany grzybek. %; /echo Trucizna o potrojnym dzialaniu: meczy, rani i oslabia mentalnie.

/def -Fp200 -mregexp -t'([Pp]omaranczow(y|e|ego|ych) mal(y|ego|e|ych) korzen(|ie|i|ia))([ .,])' _ziolo_Szalej = /substitute -p %{PL}%{P1} @{BxCred}(Szalej)@{n}%{P5}%{PR}
/def szalej = /echo  %; /echo Szalej, Cicuta virosa - pomaranczowy maly korzen. %; /echo Trucjace ziolo przypominajace marchewke, meczy, rani oraz bardzo oslabia mentalnie.

/def -Fp200 -mregexp -t'([Mm]azisty(y|e|ego|ych) bulwiast(y|e|ego|ych) grzyb(|a|y|ow))([ .,])' _ziolo_Casur = /substitute -p %{PL}%{P1} @{BxCmagenta}(Casur)@{n}%{P5}%{PR}
/def casur = /echo  %; /echo Casur,  Roburus maximus - mazisty bulwiasty grzyb. %; /echo Zjedzone ziolo zwieksza czasowo sile.

/def -Fp200 -mregexp -t'([Ss]oczyst(y|e|ego|ych) karminow(y|ego|e|ych) m(ech|chow|chu))([ .,])' _ziolo_Drath = /substitute -p %{PL}%{P1} @{BxCmagenta}(Drath)@{n}%{P5}%{PR}
/def drath = /echo  %; /echo Drath, Drathas vulgaris - soczysty karminowy mech. %; /echo Przezuc, aby wytrzymalosc czasowo zwiekszyc.

/def -Fp200 -mregexp -t'([Dd]lug(a|ie|ich) lodyg(a|i|))([ .,])' _ziolo_Konopie = /substitute -p %{PL}%{P1} @{BxCmagenta}(Konopie)@{n}%{P5}%{PR}
/def konopie = /echo  %; /echo Konopie - dluga lodyga. %; /echo Ususzone i spalone ziolo zwieksza ochrone przed magia.

/def -Fp200 -mregexp -t'([Ee]liptyczn(y|e|ego|ych) zaostrzon(y|ego|e|ych) lisc(|ia|ie|i))([ .,])' _ziolo_Ogorecznik = /substitute -p %{PL}%{P1} @{BxCmagenta}(Ogorecznik)@{n}%{P5}%{PR}
/def ogorecznik = /echo  %; /echo Ogorecznik, Borago officinalis - eliptyczny zaostrzony lisc. %; /echo Przezuc aby niesmialosci sie pozbyc.

/def -Fp200 -mregexp -t'([Rr]ozow(y|e|ego|ych) pachnac(y|ego|e|ych) kwiat(|u|y|ow))([ .,])' _ziolo_Roza = /substitute -p %{PL}%{P1} @{BxCyellow}(Roza)@{n}%{P5}%{PR}
/def roza = /echo  %; /echo Roza, Rosa rosa - rozwy pachnacy kwiat. %; /echo Po prostu roza. Nietrujaca aczkolwiek spozycie oczywiscie grozi pokluciem.

/def -Fp200 -mregexp -t'([Tt]ward(y|e|ego|ych) czerwon(y|ego|e|ych) owoc(|e|ow|ami))([ .,])' _ziolo_Borowka = /substitute -p %{PL}%{P1} @{BxCyellow}(Borowka)@{n}%{P5}%{PR}
/def borowka = /echo  %; /echo Borowka, Vaccinium myrtillus - twardy czerwony owoc. %; /echo Ziolo obojetne, jadalne.

/def -Fp200 -mregexp -t'([Mm]al(y|e|ego|ych) fioletow(y|ego|e|ych) owoc(|e|ow|ami))([ .,])' _ziolo_Jagoda = /substitute -p %{PL}%{P1} @{BxCyellow}(Jagoda)@{n}%{P5}%{PR}
/def jagoda = /echo  %; /echo Jagoda - maly fioletowy owoc. %; /echo Ziolo obojetne dla zdrowia ale jadalne i calkiem smaczne.

/def -Fp200 -mregexp -t'([Mm]al(y|e|ego|ych) czarn(y|ego|e|ych) owoc(|e|ow|ami))([ .,])' _ziolo_Jerzyna = /substitute -p %{PL}%{P1} @{BxCyellow}(Jerzyna)@{n}%{P5}%{PR}
/def jerzyna = /echo  %; /echo Jerzyna - maly czarny owoc. %; /echo Ziolo obojetne dla zdrowia ale jadalne i calkiem smaczne.

/def -Fp200 -mregexp -t'([Mm]al(y|e|ego|ych) czerwon(y|ego|e|ych) owoc(|e|ow|ami))([ .,])' _ziolo_Malina = /substitute -p %{PL}%{P1} @{BxCyellow}(Malina)@{n}%{P5}%{PR}
/def malina = /echo  %; /echo Malina, Rubus idaeus - maly czerwony owoc. %; /echo Ziolo obojetne dla zdrowia ale jadalne i calkiem smaczne.

/def -Fp200 -mregexp -t'([Nn]iewielk(i|ie|iego|ich) czerwon(y|ego|e|ych) owoc(|e|ow|ami))([ .,])' _ziolo_Poziomka = /substitute -p %{PL}%{P1} @{BxCyellow}(Poziomka)@{n}%{P5}%{PR}
/def poziomka = /echo  %; /echo Poziomka, Fragaria vesca - niewielki czerwony owoc. %; /echo Ziolo obojetne dla zdrowia ale jadalne i calkiem smaczne.

/def -Fp200 -mregexp -t'([Nn]ieduz(y|e|ego|ych) brazow(y|e|ego|ych) grzyb(|a|y|ow))([ .,])' _ziolo_Maslak = /substitute -p %{PL}%{P1} @{BxCyellow}(Maslak)@{n}%{P5}%{PR}
/def maslak = /echo  %; /echo Maslak Zwyczajny, Ixocomus luteus - nieduzy brazowy grzyb. %; /echo Grzyb jadalny. 

/def -Fp200 -mregexp -t'([Gg]rzyb(i|ie|iego|ich) such(y|e|ego|ych) kapelusz(|e|a|y))([ .,])' _ziolo_Hubka = /substitute -p %{PL}%{P1} @{BxCyellow}(Hubka)@{n}%{P5}%{PR}
/def hubka = /echo  %; /echo Hubka, Fomes fomentarius - grzybi suchy kapelusz. %; /echo Wraz z krzesiwem pomoze rozpalic ogien. 

/def -Fp200 -mregexp -t'([Ss]redni(|e|ego|ch) kasztanowobrazow(y|e|ego|ych) grzyb(|a|y|ow))([ .,])' _ziolo_Podgrzybek_Brunatny = /substitute -p %{PL}%{P1} @{BxCyellow}(Podgrzybek)@{n}%{P5}%{PR}
/def podgrzybek = /echo  %; /echo Podgrzybek Brunatny, Xerocomus chryzenteron - sredni kasztanowobrazowy grzyb. %; /echo Grzyb jadalny. 

/def -Fp200 -mregexp -t'([Mm]iedzianozielon(y|e|ego|ych) fosforyzujac(y|e|ego|ych) grzyb(|a|y|ow))([ .,])' _ziolo_Muchomor_Cesarski = /substitute -p %{PL}%{P1} @{BxCyellow}(Muchomor Cesarski)@{n}%{P5}%{PR}
/def muchomorcesarski = /echo  %; /echo Muchomor Cesarski, Amanita Impera - miedzianozielony fosforyzujacy grzyb. %; /echo Teraz byc moze nieszkodliwy. Kiedys trujacy.

/def -Fp200 -mregexp -t'([Gg]rub(y|e|ego|ych) brazow(y|e|ego|ych) grzyb(|a|y|ow))([ .,])' _ziolo_Borowik_Krolewski = /substitute -p %{PL}%{P1} @{BxCyellow}(Borowik Krolewski)@{n}%{P5}%{PR}
/def borowikkrolewski = /echo  %; /echo Borowik Krolewski, Boletus regius - gruby brazowy grzyb. %; /echo Grzyb jadalny.

/def -Fp200 -mregexp -t'([Ww]ysok(i|ie|iego|ich) jasnobrazow(y|e|ego|ych) grzyb(|a|y|ow))([ .,])' _ziolo_Borowik_Szlachetny = /substitute -p %{PL}%{P1} @{BxCyellow}(Borowik)@{n}%{P5}%{PR}
/def borowik = /echo  %; /echo Borowik Szlachetny, Boletus reticulatus - wysoki jasnobrazowy grzyb. %; /echo Grzyb jadalny.

/def -Fp200 -mregexp -t'([Zz]ielon(e|ych) postrzepion(y|e|ego|ych) galaz(ka|ki|ek|))([ .,])' _ziolo_Drabik_Drzewikowaty = /substitute -p %{PL}%{P1} @{BxCyellow}(Drabik)@{n}%{P5}%{PR}
/def drabik = /echo  %; /echo Drabik Drzewikowaty - zielone postrzepione galazki. %; /echo Mozna zjesc lub przezuc bez specjalnego efektu.

/def -Fp200 -mregexp -t'([Ww]ysok(i|ie|iego|ich) czerwonaw(y|e|ego|ych) grzyb(|a|y|ow))([ .,])' _ziolo_Kozlarz_Czerwony = /substitute -p %{PL}%{P1} @{BxCyellow}(Kozlarz)@{n}%{P5}%{PR}
/def kozlarz = /echo  %; /echo Kozlarz Czerwony, Lecinum aurantiacum - wysoki czerwonawy grzyb. %; /echo Grzyb jadalny.

/def -Fp200 -mregexp -t'([Zz]ielon(e|ych) lancetowat(e|ego|ych) lisci(|e|i))([ .,])' _ziolo_Trawa = /substitute -p %{PL}%{P1} @{BxCyellow}(Trawa)@{n}%{P5}%{PR}
/def trawa = /echo  %; /echo Trawa, Gramineae - zielone lancetowate liscie. %; /echo Trawa jak trawa. Niezbyt smaczna. Jak to trawa.

/def -Fp200 -mregexp -t'([Cc]zerwonaw(y|e|ego|ych) duz(y|ego|e|ych) lisc(|i|ie|ia))([ .,])' _ziolo_Rabarbar = /substitute -p %{PL}%{P1} @{BxCyellow}(Rabarbar)@{n}%{P5}%{PR}
/def rabarbar = /echo  %; /echo Rabarbar, Rheum palmatum - czerwonawy duzy lisc. %; /echo Calkiem smaczny ale niezyt sycacy.

/def -Fp200 -mregexp -t'([Ss]mukl(a|e|ych) jasnozielon(a|e|ych) lodyg(a|i|))([ .,])' _ziolo_Centuria = /substitute -p %{PL}%{P1} @{BxCgreen}(Centuria)@{n}%{P5}%{PR}
/def centuria = /echo  %; /echo Centuria - smukla jasnozielona lodyga. %; /echo Oslabia dzialanie trucizn.


/def -Fp200 -mregexp -t'([Zz]ielon(y|ych) galezist(y|ego|ych) ped(|e|i))([ .,])' _ziolo_Rdest = /substitute -p %{PL}%{P1} @{BxCgreen}(Rdest)@{n}%{P5}%{PR}
/def rdest = /echo  %; /echo Rdest Ptasi, Polygonum avicurale - zielony galezisty ped. %; /echo Przylozyc, by rany zasklepic. Spozycie przyprawia o wzdryganie sie.

/def -Fp200 -mregexp -t'([Oo]kazal(y|e|ego|ych) pachnac(y|ego|e|ych) kwiat(|u|y|ow))([ .,])' _ziolo_Mak = /substitute -p %{PL}%{P1} @{BxCgreen}(Mak Polny)@{n}%{P5}%{PR}
/def mak = /echo  %; /echo Mak Polny, Papaver rhoeas - okazaly pachnacy kwiat. %; /echo Zjesc aby natychmiastowa znaczna poprawe zdrowia odczuc. UWAGA! Efekt uboczny: zmeczenie oraz zmiejszenie zrecznosci

/def -Fp200 -mregexp -t'([Zz]drewnial(a|y|ego|ych) rozgalezion(a|ego|e|ych) krzewin(ka|ki|ki|ek))([ .,])' _ziolo_Macznica = /substitute -p %{PL}%{P1} @{BxCgreen}(Macznica)@{n}%{P5}%{PR}
/def macznica = /echo  %; /echo Macznica,Arctostaphylos uva-ursi - zdrewniala rozgaleziona krzewinka. %; /echo Ususzona rozgryzc, aby sie wyleczyc.(sprawdzic zdrowa)

/def -Fp200 -mregexp -t'([Cc]iemn(e|y|ego|ych) poskrecan(e|ego|e|ych) klacz(a|e||y|ow))([ .,])' _ziolo_Pieciornik = /substitute -p %{PL}%{P1} @{BxCgreen}(Pieciornik)@{n}%{P5}%{PR}
/def pieciornik = /echo  %; /echo Pieciornik, Potentilla - ciemne poskrecane klacze. %; /echo Rozgryzc aby natychmiastowa poprawe zdrowia odczuc. 

/def -Fp200 -mregexp -t'([Cc]zterokanciast(y|e|ego|ych) rozgalezion(a|ego|y|ych) lodyg(a||i))([ .,])' _ziolo_Dziurawiec = /substitute -p %{PL}%{P1} @{BxCgreen}(Dziurawiec)@{n}%{P5}%{PR}
/def dziurawiec = /echo  %; /echo Dziurawiec, Hypericum perforatum - czterokanciasta rozgaleziona lodyga. %; /echo Rozgryziona lecz

/def -Fp200 -mregexp -t'([Ss]rebrzystoszar(y|e|ego|ych) owlosion(y|e|ego|ych) ( | ususzon(e |y |ych ))lisc(|u|y|ow))([ .,])' _ziolo_Naparstnica = /substitute -p %{PL}%{P1} @{BxCgreen}(Naparstnica)@{n}%{P6}%{PR}
/def naparstnica = /echo  %; /echo Naparstnica, Digitalis -  srebrzystoszary owlosiony lisc. %; /echo Zjesc, by zmeczenie usunac

/def -Fp200 -mregexp -t'([Ss]mukl(a|e|ych) zielon(a|e|ych) lodyg(a|i|))([ .,])' _ziolo_Nostrzyk = /substitute -p %{PL}%{P1} @{BxCgreen}(Nostrzyk)@{n}%{P5}%{PR}
/def nostrzyk = /echo  %; /echo Nostrzyk - smukla zielona lodyga. %; /echo Przezuty usuwa zmeczenie. Zjesc, aby pozbyc sie glodu. Rozgryziony rani i przyprawia o glod.

/def -Fp200 -mregexp -t'([Kk]anciast(a|e|ych) rozgalezion(a|e|ych) lodyg(a|i|))([ .,])' _ziolo_Bylica = /substitute -p %{PL}%{P1} @{BxCgreen}(Bylica)@{n}%{P5}%{PR}
/def bylica = /echo  %; /echo Bylica, Artemisia - kanciasta rozgaleziona lodyga. %; /echo Przylozyc na zmeczenie. Zjesc, by zoladek napelnic.

/def -Fp200 -mregexp -t'([Kk]osmatoowlosion(y|e|ego|ych) kwiatostan(|u|y|ow))([ .,])' _ziolo_Kasztanowiec = /substitute -p %{PL}%{P1} @{BxCgreen}(Kasztanowiec)@{n}%{P5}%{PR}
/def kasztanowiec= /echo  %; /echo Kasztanowiec, Aesculus hippocastanum - kosmatoowlosiony kwiatostan. %; /echo Zjedzony redukuje zmeczenie.

/def -Fp200 -mregexp -t'([Kk]remow(y|e|ego|ych) owlosion(y|ego|e|ych) kwiat(|u|y|ow))([ .,])' _ziolo_Przelot = /substitute -p %{PL}%{P1} @{BxCgreen}(Przelot)@{n}%{P5}%{PR}
/def przelot = /echo  %; /echo Przelot - kremowy owlosiony kwiat. %; /echo Ususzony sproszkowac aby usunac zmeczenie (niesproszkowany?) UWAGA! Efekt uboczny: zmeczenie mentalne

/def -Fp200 -mregexp -t'([Dd]uz(y|e|ych) bial(y|e|ych) kwiat(|y|ow))([ .,])' _ziolo_Bielun = /substitute -p %{PL}%{P1} @{BxCgreen}(Bielun)@{n}%{P5}%{PR}
/def bielun = /echo  %; /echo Bielun - duzy bialy kwiat. %; /echo Powachany zwieksza wytrzymalosc. Uwaga: spozycie jest trujace,odtrutka plucnica

/def -Fp200 -mregexp -t'([Ll]sniac(y|ego|e|ych) czerwon(y|ego|e|ych) owoc(|e|ow|ami))([ .,])' _ziolo_Deren = /substitute -p %{PL}%{P1} @{BxCgreen}(Deren)@{n}%{P5}%{PR}
/def deren = /echo  %; /echo Deren - lsniacy czerwony owoc. %; /echo Zjedzony zwieksza wytrzymalosc, ale jednoczesnie zwieksza pragnienie. Na choroby skory(?)

/def -Fp200 -mregexp -t'([Mm]acznistoowlosion(a|e|ych) szaraw(a|e|ych) roslin(|e|y))([ .,])' _ziolo_Komosa = /substitute -p %{PL}%{P1} @{BxCgreen}(Komosa)@{n}%{P5}%{PR}
/def komosa = /echo  %; /echo Komosa  - macznistoowlosiona szarawa roslina. %; /echo Przezuta zmniejsza zmeczenie i zwieksza wytrzymalosc. Zjedzona zwieksza sile.

/def -Fp200 -mregexp -t'([Zz]olt(y|e|ych) rurkowat(y|e|ych) kwiat(|y|ow))([ .,])' _ziolo_Wrotycz = /substitute -p %{PL}%{P1} @{BxCgreen}(Wrotycz)@{n}%{P5}%{PR}
/def wrotycz = /echo  %; /echo Wrotycz, Tanacetum vulgare - zolty rurkowaty kwiat. %; /echo Powachany zwieksza odpornosc na trucizny.

/def -Fp200 -mregexp -t'([Bb]ial(y|e|ego|ych) rozgalezion(y|ego|e|ych)( | ususzon(e |y |ych ))korzen(|ie|i|ia))([ .,])' _ziolo_Mandragora = /substitute -p %{PL}%{P1} @{BxCgreen}(Mandragora)@{n}%{P6}%{PR}
/def mandragora = /echo  %; /echo Mandragora,Magicus asklepiosis - bialy rozgaleziony korzen. %; /echo Przezucie regeneruje mane. Rozgryzienie chyba moze odtruwac

/def -Fp200 -mregexp -t'([Ss]zar(y|e|ego|ych) kolczast(y|ego|e|ych)( | ususzon(e |ego |y |ych ))korzen(|ie|i|ia))([ .,])' _ziolo_Aralia = /substitute -p %{PL}%{P1} @{BxCgreen}(Aralia)@{n}%{P6}%{PR}
/def aralia = /echo  %; /echo Aralia  - szary kolczasty korzen. %; /echo Usuwa zmeczenie i poprawia odpornosc na trucizny. Uwaga: Nieco truje

/def -Fp200 -mregexp -t'([Bb]razow(e|ych) okragl(e|ego|ych) nasion(ko|ek|ka||))([ .,])' _ziolo_Kola = /substitute -p %{PL}%{P1} @{BxCyellow}(Kola)@{n}%{P5}%{PR}
/def kola = /echo  %; /echo Kola - brazowe okragle nasinko. %; /echo Kola - rozgryziona zwieksza wytrzymalosc, usuwa zmeczenie i zwieksza stan najedzenia. Zjedzona zmniejsza zrecznosc.

/def -Fp200 -mregexp -t'([Rr]ozgowat(a|e|ych) zoltozielon(a|e|ych) galaz(ka|ki|ek))([ .,])' _ziolo_Przesl = /substitute -p %{PL}%{P1} @{BxCgreen}(Przesl)@{n}%{P5}%{PR}
/def przesl = /echo  %; /echo Przesl, Ephedra - rozgowata zoltozielona galazka. %; /echo Przezuta zwieksza wytrzymalosc.

/def -Fp200 -mregexp -t'([Jj]asnozielon(a|e|ych) nieowlosion(a|e|ych) lodyg(a|i|))([ .,])' _ziolo_Lulecznica = /substitute -p %{PL}%{P1} @{BxCgreen}(Lulecznica)@{n}%{P5}%{PR}
/def lulecznica = /echo  %; /echo Lulecznica, Scopolia carniolica - jasnozielona nieowlosiona lodyga. %; /echo Przylozenie(?) usuwa zmeczenie, uspakaja.

/def -Fp200 -mregexp -t'([Ww]onn(y|e|ego|ych) dzwonkowat(y|ego|e|ych) kwiat(|ek|ka|ki|kow))([ .,])' _ziolo_Konwalia = /substitute -p %{PL}%{P1} @{BxCgreen}(Konwalia)@{n}%{P5}%{PR}
/def konwalia = /echo  %; /echo Konwalia, Convallaria - wonny dzwonkowaty kwiatek. %; /echo Powachanie uspokaja i uwuwa zmeczenie. Uwaga:Zjedzenie zatruwa

/def -Fp200 -mregexp -t'([Ss]ztywn(a|e|ych) smukl(a|e|ych) lodyg(a|i|))([ .,])' _ziolo_Lak = /substitute -p %{PL}%{P1} @{BxCgreen}(Lak)@{n}%{P5}%{PR}
/def lak = /echo  %; /echo Lak, Cheiranthus cheiri - sztywna smukla lodyga. %; /echo Przezuty usuwa zmeczenie. Rozgryziony zwieksza wytrzymalosc.


/def -Fp200 -mregexp -t'([Dd]robn(y|e|ego|ych) bial(y|ego|e|ych) kwiat(|ek|ka|ki|kow))([ .,])' _ziolo_Rumianek = /substitute -p %{PL}%{P1} @{BxCgreen}(Rumianek)@{n}%{P5}%{PR}
/def rumianek = /echo  %; /echo Rumianek, Matricaria chamomilla - drobny bialy kwiatek. %; /echo Mozliwe dzialanie odtruwajace po powachaniu. Zjedzony napycha zoladek.

/def -Fp200 -mregexp -t'([Ww]ysok(i|ie|iego|ich) blekitny(y|ego|e|ych) kwiat(|u|y|ow))([ .,])' _ziolo_Chaber = /substitute -p %{PL}%{P1} @{BxCgreen}(Chaber)@{n}%{P5}%{PR}
/def chaber = /echo  %; /echo Chaber, Centaurea cyanus - wysoki blekitny kwiat. %; /echo Mozliwe dzialanie odtruwajace przy przezuciu lub powachaniu. Zjedzony sprawia, ze jest sie bardziiej glodnym.

/def -Fp200 -mregexp -t'([Jj]asnobrunatn(a|e|ych) popekana(a|e|ych) galaz(ka|ki|ek))([ .,])' _ziolo_Bez = /substitute -p %{PL}%{P1} @{BxCgreen}(Bez)@{n}%{P5}%{PR}
/def bez = /echo  %; /echo Bez Czarny - jasnobrunatna popekana galazka. %; /echo Przezuta moze odtruwac.

/def -Fp200 -mregexp -t'([Zz]oltaw(y|e|ego|ych) powyginan(y|ego|e|ych)( | ususzon(e |y |ych ))korzen(|ie|i|ia))([ .,])' _ziolo_Krzyzownica = /substitute -p %{PL}%{P1} @{BxCgreen}(Krzyzownica)@{n}%{P6}%{PR}
/def krzyzownica= /echo  %; /echo Krzyzownica - zoltawy powyginany korzen. %; /echo Przezuty moze odtruwac.

/def -Fp200 -mregexp -t'([Jj]asnobrazow(a|e|ych) ulistnion(a|e|ych) lodyg(a|i|))([ .,])' _ziolo_Nawloc = /substitute -p %{PL}%{P1} @{BxCgreen}(Nawloc)@{n}%{P5}%{PR}
/def nawloc = /echo  %; /echo Nawloc, Solidago virga-aurea - jasnobrazowa ulistniona lodyga. %; /echo Rozgryziona zwieksza glod i pragnienie, ale chyba moze odtruwac.




/def -Fp200 -mregexp -t'([Dd]ziwn(e|ych) zoltoszar(e|ego|ych) nasion(ko|ek|ka||))([ .,])' _ziolo_Kulczyba = /substitute -p %{PL}%{P1} @{BxCred}(Kulczyba)@{n}%{P5}%{PR}
/def kulczyba = /echo  %; /echo Kulczyba, Strychnos - dziwne zoltoszare nasinko. %; /echo Z wygladu trucizna. Niesprawdzone dzialania. W rl otrzymuje sie z tego strychnine

/def -Fp200 -mregexp -t'([Rr]ozdet(a|e|ych) aromatyczn(a|e|ych) lodyg(a|i|))([ .,])' _ziolo_Szczwol = /substitute -p %{PL}%{P1} @{BxCred}(Szczwol)@{n}%{P5}%{PR}
/def szczwol = /echo  %; /echo Szczwol, Conium maculatum - rozdeta aromatyczna lodyga. %; /echo Z wygladu trucizna. Niesprawdzone dzialania. 

/def -Fp200 -mregexp -t'([Oo]liwkowozielon(a|e|ych) gietk(a|e|ych) galaz(ka|ki|ek))([ .,])' _ziolo_Jemiola = /substitute -p %{PL}%{P1} @{BxCred}(Jemiola)@{n}%{P5}%{PR}
/def jemiola = /echo  %; /echo Jemiola, Viscum album  - oliwkowozielona gietka galazka. %; /echo Spozyta obniza wytrzymalosc i sile.

/def -Fp200 -mregexp -t'([Cc]iemn(y|e|ego|ych) splatan(y|ego|e|ych) korzen(|ie|i|ia))([ .,])' _ziolo_Ciemiernik = /substitute -p %{PL}%{P1} @{BxCred}(Ciemiernik)@{n}%{P5}%{PR}
/def ciemiernik = /echo  %; /echo Ciemiernik, Helleborus - ciemny splatany korzen. %; /echo Prawdopodobnie trucizna. 

/def -Fp200 -mregexp -t'([Cc]zarn(a|e|ych) blyszczac(a|e|ych) fasolk(a|i|ek))([ .,])' _ziolo_Bobotrutka = /substitute -p %{PL}%{P1} @{BxCred}(Bobotrutka)@{n}%{P5}%{PR}
/def Bobotrutka = /echo  %; /echo Bobotrutka,Physostigma venenosum - czarna blyszczaca fasolka. %; /echo Prawdopodobnie trucizna.

/def -Fp200 -mregexp -t'([Cc]iemnozielon(a|e|ych) rozwart(a|e|ych) rozyczk(a|i|ek))([ .,])' _ziolo_Rojnik = /substitute -p %{PL}%{P1} @{BxCred}(Rojnik)@{n}%{P5}%{PR}
/def Rojnik = /echo  %; /echo Rojnik,Sempervivum - ciemnozielona rozwarta rozyczka. %; /echo Oslabia mentalnie.

/def -Fp200 -mregexp -t'([Pp]ierzast(y|ych|e) ogonkow(y|e|ych) lisc(|i|ie))([ .,])' _ziolo_Potoslin = /substitute -p %{PL}%{P1} @{BxCred}(Potoslin)@{n}%{P5}%{PR}
/def potoslin = /echo  %; /echo Potoslin, Pilocarpus jaborandi - pierzasty ogonkowy lisc. %; /echo UWAGA! Bardzo silna trucizna. Oslabia, zmniejsza odwage, wtrzymalosc, powoduje krwawienie z nosa i potok sliny z ust. 

/def -Fp200 -mregexp -t'([Gg]rub(e|y|ego|ych) walcowat(e|ego|e|ych) klacz(e||y|ow))([ .,])' _ziolo_Pokrzyk = /substitute -p %{PL}%{P1} @{BxCred}(Pokrzyk)@{n}%{P5}%{PR}
/def pokrzyk = /echo  %; /echo Pokrzyk, Atropa belladonna - grube walcowate klacze. %; /echo Zjedzony spowalnia ruchy, zmniejsza spostrzegawczosc (Wilcza Jagoda).

/def -Fp200 -mregexp -t'([Ss]zaraw(e|y|ego|ych) pogiet(e|ego|e|ych) klacz(e||y|ow))([ .,])' _ziolo_Rauwolfia = /substitute -p %{PL}%{P1} @{BxCred}(Rauwolfia)@{n}%{P5}%{PR}
/def Rauwolfia = /echo  %; /echo Rauwolfia - szarawe pogiete klacze. %; /echo Przezucie moze leczyc, ale zjedzenie truje, oslabia odpornosc na trucizny, zmniejsza zrecznosc i wytrzymalosc.

/def -Fp200 -mregexp -t'([Ww]iotk(a|e|ych) drobn(a|e|ych) lodyz(ka|ki|ek))([ .,])' _ziolo_Kurzyslad = /substitute -p %{PL}%{P1} @{BxCred}(Kurzyslad)@{n}%{P5}%{PR}
/def kurzyslad = /echo  %; /echo Kurzyslad, Anagallis arvensis- wiotka drobna lodyzka. %; /echo Spozyta obniza spostrzegawczosc.

/def -Fp200 -mregexp -t'([Ww]zniesion(a|e|ych) ukwiecon(a|e|ych) lodyg(a|i|))([ .,])' _ziolo_Tojad = /substitute -p %{PL}%{P1} @{BxCred}(Tojad)@{n}%{P5}%{PR}
/def tojad = /echo  %; /echo Tojad,Aconitum - wzniesiona ukwiecona lodyga. %; /echo Przezuty leczy.

/def -Fp200 -mregexp -t'([Dd]uz(y|e|ych) filoetow(y|e|ch) kwiat(|y|ow))([ .,])' _ziolo_Ostrozeczka = /substitute -p %{PL}%{P1} @{BxCred}(Ostrozeczka )@{n}%{P5}%{PR}
/def ostrozeczka = /echo  %; /echo Ostrozeczka, Consolida regalis- duzy fioletowy kwiat. %; /echo Prawdopodobnie trucizna, nie sprawdzone.

/def -Fp200 -mregexp -t'([Rr]ozgalezion(a|e|ych) owlosion(a|e|ych) lodyg(a|i|))([ .,])' _ziolo_Stroiczka = /substitute -p %{PL}%{P1} @{BxCred}(Stroiczka)@{n}%{P5}%{PR}
/def stroiczka = /echo  %; /echo Stroiczka, Lobelia - rozgaleziona  owlosiona lodyga. %; /echo Sproszkowana oslabia, obniza zrecznosc, zmniejsza wytrzymalosc i powoduje piane na ustach. 

/def -Fp200 -mregexp -t'([Zz]ielon(y|e|ych) miesist(y|e|ch) kwiat(|y|ow))([ .,])' _ziolo_Ciemiezyca = /substitute -p %{PL}%{P1} @{BxCred}(Ciemiezyca)@{n}%{P5}%{PR}
/def ciemiezyca = /echo  %; /echo Ciemiezyca, Veratrum - zielony miesisty kwiat. %; /echo Zjedzona zmniejsza spostrzegawczosc i zrecznosc.

/def -Fp200 -mregexp -t'([Ww]ysok(i|ie|iego|ich) zolt(y|e|ch) kwiat(|y|ow))([ .,])' _ziolo_Starzec = /substitute -p %{PL}%{P1} @{BxCred}(Starzec)@{n}%{P5}%{PR}
/def starzec = /echo  %; /echo Starzec, Senecio - wysoki zolty kwiat. %; /echo Sproszkowany leczy. Zjedzony truje mentalnie i rani.

/def -Fp200 -mregexp -t'([Rr]ozgalezion(a|e|ych) wzniesion(a|e|ych) lodyg(a|i|))([ .,])' _ziolo_Jaskier = /substitute -p %{PL}%{P1} @{BxCred}(Jaskier)@{n}%{P5}%{PR}
/def jaskier  = /echo  %; /echo Jaskier,Ranunculus - rozgaleziona wzniesiona lodyga. %; /echo Przezuty oslepia.



/def -Fp200 -mregexp -t'([Nn]iepozorn(a|e|ych) sinozelon(a|e|ych) roslin(ka|ki|ek))([ .,])' _ziolo_Urzet = /substitute -p %{PL}%{P1} @{BxCyellow}(Urzet)@{n}%{P5}%{PR}
/def urzet = /echo  %; /echo Urzet - niepozorna sinozielona roslinka. %; /echo Mozna sie najesc.

/def -Fp200 -mregexp -t'([Ss]zarozielon(y|ych|e) szorstk(i|ie|ich) lisc(|i|ie))([ .,])' _ziolo_Boldoa = /substitute -p %{PL}%{P1} @{BxCyellow}(Boldoa)@{n}%{P5}%{PR}
/def boldoa = /echo  %; /echo Boldoa - szarozielony szorstki lisc. %; /echo Nic

/def -Fp200 -mregexp -t'([Rr]ozwiniet(e|y|ego|ych) klacz(e||y|ow))([ .,])' _ziolo_Marzanna = /substitute -p %{PL}%{P1} @{BxCyellow}(Marzanna)@{n}%{P5}%{PR}
/def marzanna = /echo  %; /echo Marzanna,Rubia - rozwiniete klacze. %; /echo Nic.

/def -Fp200 -mregexp -t'([Zz]olt(y|e|ych) jaskraw(y|e|ch) kwiat(|y|ow))([ .,])' _ziolo_Podbial = /substitute -p %{PL}%{P1} @{BxCyellow}(Podbial)@{n}%{P5}%{PR}
/def podbial = /echo  %; /echo Podbial, Tussilago farfara  (konskie kopyto) - zolty jaskrawy kwiat. %; /echo Nic.

/def -Fp200 -mregexp -t'([Gg]alezist(a|e|ych) sinozielon(a|e|ych) lodyg(a|i|))([ .,])' _ziolo_Ostrozen = /substitute -p %{PL}%{P1} @{BxCyellow}(Ostrozen)@{n}%{P5}%{PR}
/def ostrozen = /echo  %; /echo Ostrozen,Cirsium - galezista sinozielona lodyga. %; /echo Nic.

/def -Fp200 -mregexp -t'([Ss]zorstk(a|e|ych) ciemnozielon(a|e|ych) galaz(ka|ki|ek))([ .,])' _ziolo_Poziewnik = /substitute -p %{PL}%{P1} @{BxCyellow}(Poziewnik)@{n}%{P5}%{PR}
/def poziewnik = /echo  %; /echo Poziewnik, Galeopsis - szorstka ciemnozielona galazka. %; /echo Nic.

/def -Fp200 -mregexp -t'([Cc]zarn(y|ego|e|ych) niewielk(i|ie|iego|ich) owoc(|e|ow|ami))([ .,])' _ziolo_Sliwa = /substitute -p %{PL}%{P1} @{BxCyellow}(Sliwa)@{n}%{P5}%{PR}
/def sliwa = /echo  %; /echo Sliwa, Prunus - czarny niewielki owoc. %; /echo Ziolo obojetne dla zdrowia ale jadalne i calkiem smaczne.

/def -Fp200 -mregexp -t'([Cc]zarn(e|y|ego|ych) aromatyczn(e|y|ego|ych) ziaren(ko|ka|kami|ek))([ .,])' _ziolo_Bulawinka = /substitute -p %{PL}%{P1} @{BxCyellow}(Bulawinka)@{n}%{P5}%{PR}
/def bulawinka = /echo  %; /echo Bulawinka,Claviceps  - czarne aromatyczne ziarenko. %; /echo Nic. Pasozyt zboz. 

/def -Fp200 -mregexp -t'([Ww]zniesion(a|e|ych) owlosion(a|e|ych) lodyg(a|i|))([ .,])' _ziolo_Kociomietka = /substitute -p %{PL}%{P1} @{BxCyellow}(Kociomietka)@{n}%{P5}%{PR}
/def kociomietka = /echo  %; /echo Kociomietka - wzniesiona owlosiona lodyga. %; /echo Nic.

/def -Fp200 -mregexp -t'([Zz]ielon(a|e|ych) trzeszczac(a|e|ych) galaz(ka|ki|ek))([ .,])' _ziolo_Skrzyp = /substitute -p %{PL}%{P1} @{BxCyellow}(Skrzyp)@{n}%{P5}%{PR}
/def skrzyp = /echo  %; /echo Skrzyp, Equisetum - zielona trzeszczaca galazka. %; /echo Nic.

/def -Fp200 -mregexp -t'([Zz]locist(e|y|ego|ych) spor(e|y|ego|ych) ziol(o||a))([ .,])' _ziolo_Cebula = /substitute -p %{PL}%{P1} @{BxCyellow}(Cebula)@{n}%{P5}%{PR}
/def cebula = /echo  %; /echo Cebula,Allium cepa  - zlociste spore ziolo. %; /echo Nic. 


/def -Fp200 -mregexp -t'([Zz]dretwial(a|e|ych) zwiniet(a|e|ych) rur(ka|ki|ek))([ .,])' _ziolo_Kruszyna = /substitute -p %{PL}%{P1} @{BxCyellow}(Kruszyna)@{n}%{P5}%{PR}
/def kruszyna = /echo  %; /echo Kruszyna, Frangula alnus mill - zdrewniala zwinieta rurka. %; /echo Po zjedzeniu zglodniejesz.

/def -Fp200 -mregexp -t'([Zz]ielon(a|e|ych) kwitnac(a|e|ych) lodyg(a|i|))([ .,])' _ziolo_Hyzop = /substitute -p %{PL}%{P1} @{BxCyellow}(Hyzop)@{n}%{P5}%{PR}
/def hyzop = /echo  %; /echo Hyzop - zielona kwitnaca lodyga. %; /echo Po zjedzeniu zglodniejesz.

/def -Fp200 -mregexp -t'([Ss]ztywn(y|e|ego|ych) rozgalezion(y|ego|e|ych)( | ususzon(e |y |ych ))korzen(|ie|i|ia))([ .,])' _ziolo_Lukrecja = /substitute -p %{PL}%{P1} @{BxCyellow}(Lukrecja)@{n}%{P6}%{PR}
/def lukrecja = /echo  %; /echo Lukrecja,Glycyrrhiza  - sztywny rozgaleziony korzen. %; /echo Przezuty zwieksza pragnienie.

/def -Fp200 -mregexp -t'([Kk]anciast(a|e|ych) parzac(a|e|ych) lodyg(a|i|))([ .,])' _ziolo_Pokrzywa = /substitute -p %{PL}%{P1} @{BxCyellow}(Pokrzywa)@{n}%{P5}%{PR}
/def pokrzywa = /echo  %; /echo Pokrzywa, Urtica dioica - kanciasta parzaca lodyga. %; /echo Zjedzenie zwieksza glod i pragnienie.

/def -Fp200 -mregexp -t'([Ww]iotk(a|e|ych) kwitnac(a|e|ych) galaz(ka|ki|ek))([ .,])' _ziolo_Janowiec = /substitute -p %{PL}%{P1} @{BxCyellow}(Janowiec)@{n}%{P5}%{PR}
/def janowiec = /echo  %; /echo Janowiec, Juniperus - wiotka kwitnaca galazka. %; /echo Zjedzony zwieksza pragnienie.

/def -Fp200 -mregexp -t'([Cc]zarn(y|e|ego|ych) aromatyczn(y|ego|e|ych)( | ususzon(e |y |ych ))korzen(|ie|i|ia))([ .,])' _ziolo_Lubczyk = /substitute -p %{PL}%{P1} @{BxCyellow}(Lubczyk)@{n}%{P6}%{PR}
/def lubczyk = /echo  %; /echo Lubczyk,Levisticum officinale  - czarny aromatyczny korzen. %; /echo Zjedzony zwieksza glod.




