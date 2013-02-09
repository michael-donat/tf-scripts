/def lw5=\
	/set lw1=$[substr(lw,0,strchr(lw,'., '))]%;\
	/set lw=$[substr(lw,strchr(lw,'., ')+1,strlen(lw)-strchr(lw,'., ')-1)]%;\
	/if (lw1=/"zachod")                /set _lw0=w,%; /test ++lwcount%;\
	/elseif (lw1=/"polnocny-zachod")   /set _lw1=nw,%; /test ++lwcount%;\
	/elseif (lw1=/"polnoc")            /set _lw2=n,%; /test ++lwcount%;\
	/elseif (lw1=/"polnocny-wschod")   /set _lw3=ne,%; /test ++lwcount%;\
	/elseif (lw1=/"wschod")            /set _lw4=e,%; /test ++lwcount%;\
	/elseif (lw1=/"poludniowy-wschod") /set _lw5=se,%; /test ++lwcount%;\
	/elseif (lw1=/"poludnie")          /set _lw6=s,%; /test ++lwcount%;\
	/elseif (lw1=/"poludniowy-zachod") /set _lw7=sw,%; /test ++lwcount%;\
	/elseif (lw1=/"gora")              /set _lw8=u,%; /test ++lwcount%;\
	/elseif (lw1=/"dol")               /set _lw9=d,%; /test ++lwcount%;\
	/elseif (lw1=/"wyjscie")           /set _lw10=wyjscie,%; /test ++lwcount%; /unnormalset wyjscie%;\
	/elseif (lw1=/"drzwi")             /set _lw11=drzwi,%; /test ++lwcount%; /unnormalset drzwi%;\
	/elseif (lw1=/"schody")            /set _lw12=schody,%; /test ++lwcount%; /unnormalset schody %;\
	/elseif (lw1=/"targ")              /set _lw13=targ,%; /test ++lwcount%; /unnormalset targ%;\
	/elseif (lw1=/"bank")             /set _lw14=wbank,%; /test ++lwcount%; /unnormalset bank%;\
	/elseif (lw1=/"baszta")             /set _lw14=baszta,%; /test ++lwcount%; /unnormalset baszta%;\
	/elseif (lw1=/"bazar")             /set _lw14=bazar,%; /test ++lwcount%; /unnormalset bazar%;\
	/elseif (lw1=/"drzwiczki")             /set _lw14=drzwiczki,%; /test ++lwcount%; /unnormalset drzwiczki%;\
	/elseif (lw1=/"faktoria")             /set _lw14=faktoria,%; /test ++lwcount%; /unnormalset faktoria%;\
	/elseif (lw1=/"gmach")             /set _lw14=gmach,%; /test ++lwcount%; /unnormalset gmach%;\
	/elseif (lw1=/"kantorek")             /set _lw14=kantorek,%; /test ++lwcount%; /unnormalset kantorek%;\
	/elseif (lw1=/"karczma")             /set _lw14=karczma,%; /test ++lwcount%; /unnormalset karczma%;\
	/elseif (lw1=/"komnata")             /set _lw14=komnata,%; /test ++lwcount%; /unnormalset komnata%;\
	/elseif (lw1=/"korytarz")             /set _lw14=korytarz,%; /test ++lwcount%; /unnormalset korytarz%;\
	/elseif (lw1=/"krzaki")             /set _lw14=krzaki,%; /test ++lwcount%; /unnormalset krzaki%;\
	/elseif (lw1=/"kuchnia")             /set _lw14=kuchnia,%; /test ++lwcount%; /unnormalset kuchnia%;\
	/elseif (lw1=/"kuznia")             /set _lw14=kuznia,%; /test ++lwcount%; /unnormalset kuznia%;\
	/elseif (lw1=/"miasto")             /set _lw14=miasto,%; /test ++lwcount%; /unnormalset miasto%;\
	/elseif (lw1=/"most")             /set _lw14=most,%; /test ++lwcount%; /unnormalset most%;\
	/elseif (lw1=/"palac")             /set _lw14=palac,%; /test ++lwcount%; /unnormalset palac%;\
	/elseif (lw1=/"piekarnia")             /set _lw14=piekarnia,%; /test ++lwcount%; /unnormalset piekarnia%;\
	/elseif (lw1=/"poczta")             /set _lw14=poczta,%; /test ++lwcount%; /unnormalset poczta%;\
	/elseif (lw1=/"podworko")             /set _lw14=podworko,%; /test ++lwcount%; /unnormalset podworko%;\
	/elseif (lw1=/"restauracja")             /set _lw14=restauracja,%; /test ++lwcount%; /unnormalset restauracja%;\
	/elseif (lw1=/"sala")             /set _lw14=sala,%; /test ++lwcount%; /unnormalset sala%;\
	/elseif (lw1=/"schodki")             /set _lw14=schodki,%; /test ++lwcount%; /unnormalset schodki%;\
	/elseif (lw1=/"sciezka")             /set _lw14=sciezka,%; /test ++lwcount%; /unnormalset sciezka%;\
	/elseif (lw1=/"sklep")             /set _lw14=sklep,,%; /test ++lwcount%; /unnormalset sklep%;\
	/elseif (lw1=/"stajnia")             /set _lw14=stajnia,%; /test ++lwcount%; /unnormalset stajnia%;\
	/elseif (lw1=/"stragan")             /set _lw14=stragan,%; /test ++lwcount%; /unnormalset stragan%;\
	/elseif (lw1=/"swiatynia")             /set _lw14=swiatynia,%; /test ++lwcount%; /unnormalset swiatynia%;\
	/elseif (lw1=/"szpital")             /set _lw14=szpital,%; /test ++lwcount%; /unnormalset szpital%;\
	/elseif (lw1=/"tawerna")             /set _lw14=tawerna,%; /test ++lwcount%; /unnormalset tawerna%;\
	/elseif (lw1=/"trakt")             /set _lw14=trakt,%; /test ++lwcount%; /unnormalset trakt%;\
	/elseif (lw1=/"ulica")             /set _lw14=ulica,%; /test ++lwcount%; /unnormalset ulica%;\
	/elseif (lw1=/"wieza")             /set _lw14=wieza,%; /test ++lwcount%; /unnormalset wieza%;\
	/elseif (lw1=/"wrota")             /set _lw14=wrota,%; /test ++lwcount%; /unnormalset wrota%;\
	/elseif (lw1=/"zaklad")             /set _lw14=zaklad,%; /test ++lwcount%; /unnormalset zaklad%;\
	/elseif (lw1=/"zaplecze")             /set _lw14=zaplecze,%; /test ++lwcount%; /unnormalset zaplecze%;\
	/endif

/def -PCgreen -Fp2 -t'Jest tutaj (.*) widoczne wyjscie: (.*)\\.$' olw0 = /set lw %P2 %; /lw4
/def -PCgreen -Fp2 -t'Jest tutaj (.*) widocznych wyjsc: (.*)\\.$' olw1 = /set lw %P2 %; /lw4
/def -PCgreen -Fp2 -t'Sa tutaj (.*) widoczne wyjscia: (.*)\\.$' olw2 = /set lw %P2 %; /lw4
/def -PCgreen -Fp2 -t'W panujacym tu polmroku zauwazasz (.*) widoczne wyjscia: (.*)\\.$' olw3 = /set lw %P2 %; /lw4
/def -PCgreen -Fp2 -t'W panujacym tu polmroku zauwazasz (.*) widocznych wyjsc: (.*)\\.$' olw4 = /set lw %P2 %; /lw4
/def -PCgreen -Fp2 -t'W panujacym tu polmroku zauwazasz (.*) wyjscie: (.*)\\.$' olw5 = /set lw %P2 %; /lw4
/def -PCgreen -Fp2 -t'Droga posrod grobowcow rozdziela sie na (.*)\\.$' olw6 = /set lw %P1 %; /lw4
/def -PCgreen -Fp2 -t'Tunel ktorym kroczysz konczy sie slepo, mozesz co najwyzej cofnac sie z powrotem (.*)\\.$' olw7 = /set lw %P1 %; /lw4
/def -PCgreen -Fp2 -t'Wedrujac po gorach zuwazasz, ze jedyne widoczne wyjscia stad prowadza na (.*)\\.$' olw8 = /set lw %P1 %; /lw4
/def -PCgreen -Fp2 -t'W gorach, po zachodzie slonca ciezko cokolwiek zauwazyc, lecz bardziej poslugujac sie swoja intuicja dostrzegasz ledwo widoczne wyjscie prowadzace na (.*)\\.$' olw9 = /set lw %P1 %; /lw4
/def -PCgreen -Fp2 -t'Gorski teren nie nalezy do zbyt przyjaznych, lecz udaje ci sie spostrzec wyjscia prowadzace na (.*)\\.$' olw10 = /set lw %P1 %; /lw4
/def -PCgreen -Fp2 -t'W trudnym gorskim terenie udaje ci sie spostrzec jedno jedyne wyjscie prowadzace na (.*)\\.$' olw11 = /set lw %P1 %; /lw4
/def -PCgreen -Fp2 -t'Wedrujac po gorach zauwazasz, ze jedyne widoczne wyjscia stad prowadza na (.*)\\.$' olw12 = /set lw %P1 %; /lw4

/def -mglob -Fp2 -t'Brama jest zamknieta*' followgo0 = \
	/tbind uderz w brame%%; popros straznikow o otwarcie bramy
/def -mglob -Fp2 -t'*Wysokie kamienne wrota sa zamkniete*' followgo1 = \
	/tbind zapukaj we wrota
/def -mglob -Fp2 -t'*Drewniane okute wrota sa zamkniete.*' followgo2 = \
	/tbind zapukaj we wrota
/def -mglob -Fp2 -t'*Masywna zelazna brama jest zamknieta.*' followgo3 = \
	/tbind pociagnij za sznurek
/def -mglob -Fp2 -t'*Wysoka kamienna brama jest zamknieta.*' followgo4 = \
	/tbind pociagnij za sznurek
/def -mglob -Fp2 -t'* wdrapuje sie na lagodne zbocze*' followgo5 = \
	/tbind wespnij sie na zbocze
/def -mglob -Fp2 -t'*odsuwa plyte grobowca i wchodzi do krypty*' followgo6 = \
	/tbind odsun plyte
/def -mglob -Fp2 -t'*Jak zamierzasz sie tam udac? Przez zamknieta brame?*' followgo7 = \
	/tbind zapukaj w brame
/def -mglob -Fp2 -t'*nurkuje w ton jeziora*' followgo8 = \
	/tbind zanurkuj do podwodnych jaskin
/def -mglob -Fp2 -t'*znika w szczelinie*' followgo9 = \
	/tbind przecisnij sie przez szczeline
/def -mglob -Fp2 -t'*zamyka oczy i znika we * scianie*' followgo10 = \
	/tbind wejdz w miraz
/def -mglob -Fp2 -t'*znika miedzy krzakami*' followgo11 = \
	/tbind przejdz miedzy krzakami %%; przecisnij sie miedzy krzakami
/def -mglob -Fp2 -t'*Drzwi sa zamkniete*' followgo12 = \
	/tbind otworz drzwi
/def -mglob -Fp2 -t'*ostroznie, trzymajac sie sciany omija wielka dziure.*' followgo13 = \
	/tbind obejdz dziure
/def -mglob -Fp2 -t'*nabiera chaust powietrza i nurkuje w sadzawce.*' followgo14 = \
	/tbind przeplyn sadzawke
/def -mglob -Fp2 -t'*znika w otworze.*' followgo15 = \
	/tbind osun sie przez otwor
/def -mglob -Fp2 -t'*zrecznie wspina sie po wglebieniach w scianie.*' followgo16 = \
	/tbind wespnij sie do otworu
/def -mglob -Fp2 -t'*ostroznie przesuwa galezie i przechodzi miedzy krzakami.*' followgo17 = \
	/tbind przejdz miedzy krzakami
/def -mglob -Fp2 -t'W gaszczu.' followgo18 = \
	/tbind przejdz miedzy krzakami
/def -mglob -Fp2 -t'Solidna debowa brama jest zamknieta.' followgo19 = \
	/tbind uderz we wrota%%; uderz w brame
/def -mglob -Fp2 -t'Nie jestes w stanie przejsc przez zamknieta brame.' followgo20 = \
	/tbind zapukaj we wrota
/def -mglob -Fp2 -t'*przeciska sie przez otwor znikajac ci z oczu.*' followgo21 = \
	/tbind przecisnij sie przez otwor
/def -mglob -Fp2 -t'*wczolguje sie w otwor ukryty w zboczu miedzy galeziami.*' followgo22 = \
	/tbind wczolgaj sie do otworu
/def -mregexp -Fp2 -t'sierzant' followgo23 = \
	/tbind bramanazboje%%; zapytaj sierzanta o lapowke
/alias bramanazboje /bramanazboje
/def bramanazboje = \
	/zp monety %;\
	/send przekup sierzanta %;\
	/dp monety
/def -mglob -Fp2 -t'*sierzant mowi: Nawet nie probuj mnie przekupic... bo pozalujesz!*' followgo24 = \
	/tbind bramanazboje
/def -mglob -Fp2 -t'*Przy bramie miejskiej.*' followgo25 = \
	/tbind zapukaj trzykrotnie w brame
/def -mglob -Fp2 -t'*podchodzi do bramy i puka w nia*' followgo26 = \
	/tbind zapukaj trzykrotnie w brame
/def -mglob -Fp2 -t'*Duze mocne wrota sa zamkniete*' followgo27 = \
	/tbind uderz w gong
/def -mglob -Fp2 -t'* przeciska sie miedzy krzakami*' followgo28 = \
	/tbind przecisnij sie miedzy krzakami
/def -mglob -Fp2 -t'*mocno pochyla sie w dol*' followgo29 = \
	/tbind pochyl sie
/def -mglob -Fp2 -t'*mocno pochylasz sie w dol*' followgo30 = \
	/tbind wejdz w otwor
/def -mregexp -Fp2 -t'Wrota Baldura! Czujecie zapach morza' followgo31 = \
	/tbind zsiadz ze statku
/def -mglob -Fp2 -t'*znika za filarem*' followgo32 = \
	/tbind przecisnij sie obok filara
/def -mglob -Fp2 -t'*przeciska sie przez wneke w scianie.*' followgo33 = \
	/tbind przecisnij sie przez wneke
/def -mglob -Fp2 -t'*bierze kilka krokow rozbiegu, po czym bez wiekszych *' followgo34 = \
	/tbind przeskocz rozpadline
/def -mglob -Fp2 -t'*wchodzi po schodach na pierwsze pietro*' followgo35 = \
	/tbind wkrocz po schodach na gore
/def -mglob -Fp2 -t'*nagle odbija sie od ziemi i wyskakuje przez okno*' followgo36 = \
	/tbind wyskocz przez okiennice
/def -mglob -Fp2 -t'*Do pomostu przybija *' followgo37 = \
	/tbind wns
/def -mglob -Fp2 -t'*Doplynelismy*' followgo38 = \
	/tbind zsiadz ze statku
/def -mglob -Fp2 -t'*Drzwiczki czarnego brudnego dylizansu otwieraja sie!*' followgo39 = \
	/tbind wdyl
/def -mglob -Fp2 -t'*Z zewnatrz dochodzi twych uszu wolanie woznicy: Dojechalismy! Przystanek*' followgo40 = \
	/tbind wyjscie
/def -mregexp -Fp2 -t'bierze rozbieg i skacze na (.*)\.' followgo41 = \
	/tbind zeskocz na %{P1}
/def -mregexp -Fp2 -t'Potezna zdobiona brama jest zamknieta.' followgo42 = \
	/tbind pociagnij za sznur
/def -mregexp -Fp2 -t'Imponujaca zdobiona brama jest zamknieta.' followgo43 = \
	/tbind uderz w brame
/def -mregexp -Fp2 -t'Masywna wysoka brama jest zamknieta.' followgo44 = \
	/tbind uderz w brame
/def -mregexp -Fp2 -t'Dwuskrzydlowa ciemna brama jest zamknieta.' followgo45 = \
	/tbind uderz w brame
/def -mregexp -Fp2 -t'Zelazne stare wrota jest zamkniete.' followgo46 = \
	/tbind uderz w brame
/def -mregexp -Fp2 -t'ostroznie schodzi po osuwisku.' followgo47 = \
	/tbind zejdz po osuwisku
/def -mregexp -Fp2 -t'ostroznie wchodzi po osuwisku.' followgo48 = \
	/tbind wejdz po osuwisku
/def -mregexp -Fp2 -t'Ciezka brama jest zamknieta.' followgo49 = \
	/tbind uderz w brame
/def -mregexp -Fp2 -t'Slyszysz litanie niewybrednych wyzwisk pod adresem marynarzy' followgo50 = \
	/tbind wns
/def -mregexp -Fp2 -t'zerka w przepasc, glosno przelyka sline, i stawia krok w przod' followgo51 = \
	/tbind wskocz w chmury
/def -mregexp -Fp2 -t'zrecznie wskakuje w blekitna ton. Juz' followgo52 = \
	/tbind zanurkuj w wode
/def -mregexp -Fp2 -t'powoli wchodzi w buchajace plomienie' followgo53 = \
	/tbind wejdz w plomienie
/def -mregexp -Fp2 -t'kladzie sie na ziemi.* sprawnie' followgo54 = \
	/tbind wczolgaj sie do nory
/def -mregexp -Fp2 -t'bierze rozbieg i probuje przeskoczyc ' followgo55 = \
	/tbind przeskocz przepasc
/def -mregexp -Fp2 -t'bierze krotki rozbieg i sprawnie' followgo56 = \
	/tbind przeskocz przepasc
/def -mregexp -Fp2 -t'pod twoimi nogami otwiera sie klapa, a ty momentalnie zaczynasz spadac' followgo57 = \
	/tbind wespnij sie na gore
/def -mregexp -Fp2 -t'otwiera szerzej drzwi w rogu komnaty' followgo58 = \
	/tbind przejdz przez drzwi
/def -mregexp -Fp2 -t'zapiera sie o sciane i z cichym steknieciem odsuwa glaz.' followgo59 = \
	/tbind odsun glaz
/def -mregexp -Fp2 -t'ostroznie wchodzi na waska sciezke. Po chwili znika za krawedzia klifu' followgo60 = \
	/tbind zejdz na dol
/def -mregexp -Fp2 -t'podaza przez drzwi do budynku.' followgo61 = \
	/tbind wejdz do budynku
/def -mregexp -Fp2 -t'przechodzi sciezka pod dom.' followgo62 = \
	/tbind przejdz sciezka do domu
/def -mregexp -Fp2 -t'otwiera nieco lekkie odrzwia do schowka i wchodzac do ciasnego pomieszczenia ostroznie zamyka za soba ich skrzydlo.' followgo63 = \
	/tbind zejdz do piwnicy
/def -mregexp -Fp2 -t'rusza na gore po stromych ciemnych schodkach' followgo64 = \
	/tbind wejdz na gore

/def -p2 -t'Przed zachodnia brama Crimmor.' stop0 = \
	/set lwgo=0 %;\
	/set auto off
/def -p2 -t'mala drewniana tabliczka' stop1 = \
	/set lwgo=0 %;\
	/set auto off
/def -p2 -t'* aby cie dalej niesc*' stop2 = \
	/beep 1 %;\
	/set lwgo=0 %;\
	/set auto off
