/def lw5=\
	/set lw1=$[substr(lw,0,strchr(lw,'., '))] %;\
	/set lw=$[substr(lw,strchr(lw,'., ')+1,strlen(lw)-strchr(lw,'., ')-1) ]%;\
	/if (lw1=/"zachod")                /set _lw0=w,%; /test ++lwcount %;\
	/elseif (lw1=/"polnocny-zachod")   /set _lw1=nw,%; /test ++lwcount %;\
	/elseif (lw1=/"polnoc")            /set _lw2=n,%; /test ++lwcount %;\
	/elseif (lw1=/"polnocny-wschod")   /set _lw3=ne,%; /test ++lwcount %;\
	/elseif (lw1=/"wschod")            /set _lw4=e,%; /test ++lwcount %;\
	/elseif (lw1=/"poludniowy-wschod") /set _lw5=se,%; /test ++lwcount %;\
	/elseif (lw1=/"poludnie")          /set _lw6=s,%; /test ++lwcount %;\
	/elseif (lw1=/"poludniowy-zachod") /set _lw7=sw,%; /test ++lwcount %;\
	/elseif (lw1=/"gora")              /set _lw8=u,%; /test ++lwcount %;\
	/elseif (lw1=/"dol")               /set _lw9=d,%; /test ++lwcount %;\
	/elseif (lw1=/"wyjscie")           /set _lw10=wyjscie,%; /test ++lwcount%; /unnormalset wyjscie %;\
	/elseif (lw1=/"drzwiczki")             /set _lw11=drzwiczki,%; /test ++lwcount%; /unnormalset drzwiczki %;\
	/elseif (lw1=/"drzwi")             /set _lw12=drzwi,%; /test ++lwcount%; /unnormalset drzwi %;\
	/elseif (lw1=/"most")             /set _lw13=most,%; /test ++lwcount%; /unnormalset most %;\
	/elseif (lw1=/"schody")            /set _lw14=schody,%; /test ++lwcount%; /unnormalset schody %;\
	/elseif (lw1=/"furta")            /set _lw15=furta,%; /test ++lwcount%; /unnormalset furta %;\
	/elseif (lw1=/"ulica")            /set _lw16=ulica,%; /test ++lwcount%; /unnormalset ulica %;\
	/elseif (lw1=/"sklep")            /set _lw17=sklep,%; /test ++lwcount%; /unnormalset sklep %;\
	/elseif (lw1=/"prom")            /set _lw18=prom,%; /test ++lwcount%; /unnormalset prom %;\
	/elseif (lw1=/"kaplica")            /set _lw19=kaplica,%; /test ++lwcount%; /unnormalset kaplica %;\
	/elseif (lw1=/"karczma")            /set _lw20=karczma,%; /test ++lwcount%; /unnormalset karczma %;\
	/elseif (lw1=/"schodki")            /set _lw21=schodki,%; /test ++lwcount%; /unnormalset schodki %;\
	/elseif (lw1=/"mlyn")            /set _lw22=mlyn,%; /test ++lwcount%; /unnormalset mlyn %;\
	/elseif (lw1=/"piekarnia")            /set _lw23=piekarnia,%; /test ++lwcount%; /unnormalset piekarnia %;\
	/elseif (lw1=/"trakt")            /set _lw24=trakt,%; /test ++lwcount%; /unnormalset trakt %;\
	/elseif (lw1=/"jaskinia")            /set _lw25=jaskinia,%; /test ++lwcount%; /unnormalset jaskinia %;\
	/elseif (lw1=/"szopa")            /set _lw26=szopa,%; /test ++lwcount%; /unnormalset szopa %;\
	/elseif (lw1=/"barak")            /set _lw27=barak,%; /test ++lwcount%; /unnormalset barak %;\
	/elseif (lw1=/"wrota")            /set _lw28=wrota,%; /test ++lwcount%; /unnormalset wrota %;\
	/elseif (lw1=/"brama")            /set _lw29=brama,%; /test ++lwcount%; /unnormalset brama %;\
	/elseif (lw1=/"wejscie")            /set _lw30=wejscie,%; /test ++lwcount%; /unnormalset wejscie %;\
	/elseif (lw1=/"ganek")            /set _lw31=ganek,%; /test ++lwcount%; /unnormalset ganek %;\
	/elseif (lw1=/"chata")            /set _lw32=chata,%; /test ++lwcount%; /unnormalset chata %;\
	/endif

/def -PCgreen -Fp2 -t'Jest tutaj (.*) widoczne wyjscie: (.*)\\.$' olw0 = /set lw %P2 %; /lw4
/def -PCgreen -Fp2 -t'Jest tutaj (.*) widocznych wyjsc: (.*)\\.$' olw1 = /set lw %P2 %; /lw4
/def -PCgreen -Fp2 -t'Sa tutaj (.*) widoczne wyjscia: (.*)\\.$' olw2 = /set lw %P2 %; /lw4
/def -PCgreen -Fp2 -t'Trakt wiedzie na (.*)\\.$' olw3 = /set lw %P1 %; /lw4
/def -PCgreen -Fp2 -t'Trakt rozgalezia sie na (.*)\\.$' olwr4 = /set lw %P1 %; /lw4
/def -PCgreen -Fp2 -t'W gestych ciemnosciach dostrzegasz trakt wiodacy na (.*)\\.$' olw5 = /set lw %P1 %; /lw4
/def -PCgreen -Fp2 -t'W gestych ciemnosciach dostrzegasz, ze trakt rozgalezia sie na (.*)\\.$' olw6 = /set lw %P1 %; /lw4
/def -PCgreen -Fp2 -t'Sciezka prowadzi tutaj w (.*) kierunkach: (.*)\\.$' olw7 = /set lw %P2 %; /lw4
/def -PCgreen -Fp2 -t'Sciezka prowadzi tutaj w (.*) kierunku: (.*)\\.$' olw8 = /set lw %P2 %; /lw4
/def -PCgreen -Fp2 -t'W mroku nocy dostrzegasz (.*) widoczn.* wyjsc.*: (.*)\\.$' olw9 = /set lw %P2 %; /lw4
/def -PCgreen -Fp2 -t'Wyjscia prowadza tutaj w (.*) kierunkach: (.*)\\.$' olw10 = /set lw %P2 %; /lw4
/def -PCgreen -Fp2 -t'Dostrzegasz tu jedno wyjscie: (.*)\\.$' olw11 = /set lw %P1 %; /lw4
/def -PCgreen -Fp2 -t'Wydeptane w kukurydzy sciezki prowadza na (.*)\\.$' olw12 = /set lw %P1 %; /lw4
/def -PCgreen -Fp2 -t'Szlak prowadzi tutaj w (.*) kierunkach: (.*)\\.$' olw13 = /set lw %P2 %; /lw4
/def -PCgreen -Fp2 -t'Tunel.* ciagn.* sie na (.*)\\.$' olw14 = /set lw %P1 %; /lw4

/def -mregexp -p2 -t'Wszyscy na poklad!' ship0_0 = \
	/tbind wns
/def -mregexp -p2 -t'Doplynelismy.*(Mozna|w calej swej)' ship0_1 = \
	/tbind zsiadz ze statku
/def -mregexp -p2 -t'Do przystani przybija wielki trojmasztowy galeon.' ship2_0 = \
	/tbind wns
/def -mglob -p2 -t'*Marynarze sprawnie cumuja go i wysuwaja na brzeg trap.*' ship2_1 = \
	/tbind zsiadz ze statku
/def -mregexp -p2 -t'Niewielki prom rzeczny przybija do brzegu.' ship3_0 = \
	/tbind wsiadz na statek
/def -mregexp -p2 -t' przybija do brzegu\\.' ship3_1 = \
	/tbind wsiadz na statek
/def -mregexp -p2 -t'Prom przybija do przystani na polnocnym brzegu rzeki.' ship_6 = \
	/tbind zsiadz ze statku
/def -mregexp -p2 -t'.*dylizans powoli zatrzymuje sie' dyl0_0 = \
	/tbind wdyl
/def -mregexp -p2 -t'Powoli pojazd zaczyna tracic predkosc' dyl0_1 = \
	/tbind wyjscie
/def -mregexp -p2 -t'i wsiada do .* dylizansu' dyl0_2 = \
	/tbind wdyl

/def -mregexp -p2 -t'Stalowa klatka nadjezdza' winda0 = /beep 1
/def -mregexp -p2 -t'Otworzyly sie drzwi klatki' winda1 = /beep 1

/def -mregexp -p2 -t'Probujesz otworzyc .*(?<!drzwi), ale nie udaje ci sie to.' bind_go00 = \
	/tbind zapukaj w brame
/def -mregexp -p2 -t'Nie jestes zbyt pewny swojej umiejetnosci latania...' bind_go01 = \
	/tbind pociagnij linke %%; uderz w dzwon
/def -mregexp -p2 -t'Niewielka furtka otwiera sie.' bind_go02 = \
	/tbind furtka
/def -mregexp -p2 -t'otwiera niewielka furtke\.' bind_go03 = \
	/tbind furtka
/def -mregexp -p2 -t'rozgarnia krzewy probujac sie przez nie przedrzec. Po chwili znika wewnatrz sciany roslinnosci.' bind_go04 = \
	/tbind przecisnij sie przez krzaki
/def -mregexp -p2 -t'chwyta za line skryta posrod pnacz bluszczu i razno zaczyna wspinac sie po niej na szczyt urwiska.' bind_go05 = \
	/tbind wespnij sie po linie
/def -mregexp -p2 -t'podchodzi do cedru na skraju urwiska, chwyta za przywiazana do jego pnia line i zaczyna schodzic na dol.' bind_go06 = \
	/tbind zejdz po linie 
/def -mregexp -p2 -t'WOLNE' bind_go07 = \
	/tbind kto
/def -mregexp -p2 -t'WOLNE' bind_go08 = \
	/tbind kto
/def -mregexp -p2 -t'WOLNE' bind_go09 = \
	/tbind kto
/def -mregexp -p2 -t'WOLNE' bind_go10 = \
	/tbind kto
/def -mregexp -p2 -t'WOLNE' bind_go11 = \
	/tbind kto
/def -mregexp -p2 -t'WOLNE' bind_go12 = \
	/tbind kto
/def -mregexp -p2 -t'korzystajac ze skrzypiacych schodow wchodzi na pietro wiezy.' bind_go13 = \
	/tbind wejdz po schodkach
/def -mregexp -p2 -t'znika w ciemnym otworze, schodzac po schodach na parter.' bind_go14 = \
	/tbind zejdz po schodkach
/def -mregexp -p2 -t'wchodzi ostroznie na luk skalny' bind_go15 = \
	/tbind wejdz na luk
/def -mregexp -p2 -t'zeskakuje na plaskie podloze jaskini.' bind_go16 = \
	/tbind zeskocz na placyk
/def -mregexp -p2 -t'przeskakuje przez krawedz studni i znika z twych oczu.' bind_go17 = \
	/tbind wejdz do studni
/def -mregexp -p2 -t'pochyla sie i czolgajac probuje przecisnac sie przez otwor w murze... po chwili znika ci z oczu.' bind_go18 = \
	/tbind przecisnij sie przez otwor
/def -mregexp -p2 -t'znika w szczelinie.' bind_go19 = \
	/tbind przecisnij sie przez szczeline
/def -mregexp -p2 -t'przeciska sie przez szczeline' bind_go2 = \
	/tbind przecisnij sie przez szczeline
/def -mregexp -p2 -t'majstruje cos przy sciane.' bind_go21 = \
	/tbind przekrec czaszke
/def -mregexp -p2 -t'poklonil sie statui.' bind_go22 = \
	/tbind poklon sie statui
/def -mregexp -p2 -t'podaza przeskakujac przez mur.' bind_go23 = \
	/tbind wespnij sie na mur
/def -mregexp -p2 -t'wsiada do stojacego .* dylizansu.' bind_go24 = \
	/tbind wsiadz do dylizansu
/def -mregexp -p2 -t'podaza w kierunku wodospadu.' bind_go25 = \
	/tbind pij%%; wejdz do wody %%; przejdz przez wodospad
/def -mregexp -p2 -t'kieruje sie w strone krzakow i po chwili daje w nie nura, niknac ci z oczu.*' bind_go26 = \
	/tbind wejdz w krzaki
/def -mregexp -p2 -t'podaza do kurhanu.' bind_go27 = \
	/tbind wejdz do kurhanu
/def -mregexp -p2 -t'wspina sie na gore.' bind_go28 = \
	/tbind wespnij sie na gore
/def -mregexp -p2 -t'rusza w strone kurhanu, przedzierajac sie przez lapiace'  bind_go29 = \
	/tbind wejdz w krzaki
/def -mregexp -p2 -t'kleka przy wale(,|) i odgarniajac reka suche trawy(,|) odnajduje otwor prowadzacy w dol' bind_go30 = \
	/tbind wejdz w otwor
/def -mregexp -p2 -t'staje niepewnie na kamiennej plycie, i nagle zapada sie w dol! Po chwili' bind_go31 = \
	/tbind wejdz na plyte
/def -mregexp -p2 -t'podaza przeciskajac sie pomiedzy beczkami do otworu' bind_go32 = \
	/tbind przeslizgnij sie miedzy beczkami
/def -mregexp -p2 -t'wchodzi na drzewo.' bind_go33 = \
	/tbind wejdz na drzewo
/def -mregexp -p2 -t'podaza przez lustro wodospadu na zewnatrz.' bind_go34 = \
	/tbind przejdz przez wodospad
/def -mregexp -p2 -t'podaza do pieczary szefa' bind_go35 = \
	/tbind wejdz do pieczary
/def -mregexp -p2 -t'przywiera plasko do posadzki i ryjac nosem w pokrywajacym ja piachu, posuwa sie na poludnie' bind_go36 = \
	/tbind przeczolgaj sie na poludnie
/def -mregexp -p2 -t'przywiera plasko do posadzki i ryjac nosem w pokrywajacym ja piachu, posuwa sie na polnoc' bind_go37 = \
	/tbind przeczolgaj sie na polnoc
/def -mregexp -p2 -t'podchodzi do szczeliny w skale i znika w jej wnetrzu.' bind_go38 = \
	/tbind zsun sie na dol
/def -mregexp -p2 -t'napina sie i probuje podwazyc jeden z glazow, ktory po chwili ustepuje ujawniajac spora' bind_go39 = \
	/tbind podwaz czarny glaz
/def -mregexp -p2 -t'pewnie lapie za zwisajace liny i zaczyna wspinac sie do gory. Po chwili' bind_go40 = \
	/tbind wespnij sie po linach
/def -mregexp -p2 -t'podchodzi do szybu i pewnie lapie za zwisajace liny, by po chwili zsunac sie' bind_go41 = \
	/tbind zsun sie po linie
/def -mregexp -p2 -t'zaczyna szybko wdrapywac sie po scianie. Po chwili znika za zalomem' bind_go42 = \
	/tbind wdrap sie na sciezke
/def -mregexp -p2 -t'wchodzi do szczeliny miedzy glazami i znika w jej mroku' bind_go43 = \
	/tbind przecisnij sie przez szczeline
/def -mregexp -p2 -t'stuka w skale' bind_go44 = \
	/tbind zapukaj w skale
/def -mregexp -p2 -t'znika w kepie krzakow.' bind_go45 = \
	/tbind wejdz w krzaki
/def -mregexp -p2 -t'wspina sie po scianie jaru' bind_go46 = \
	/tbind wespnij sie po scianie
/def -mregexp -p2 -t'lapie za korzen i szybko wspina sie po skale. Po chwili wciaga sie na' bind_go47 = \
	/tbind wdrap sie po korzeniu
/def -mregexp -p2 -t'wchodzi po schodach na gore i niknie ci z oczu.' bind_go48 = \
	/tbind wejdz po schodach
/def -mregexp -p2 -t'zatyka nos i skacze do stawu machajac nogami.' bind_go49 = \
	/tbind skocz do stawu
/def -mregexp -p2 -t'podaza przez otwor.' bind_go50 = \
	/tbind zejdz na dol
/def -mregexp -p2 -t' ostroznie wchodzi na most i powoli podaza w kierunku jego srodka.' bind_go51 = \
	/tbind wejdz na most
/def -mregexp -p2 -t'nurkuje i przeplywa na polnoc.' bind_go52 = \
	/tbind przeplyn na polnoc
/def -mregexp -p2 -t'nurkuje i przeplywa na poludnie.' bind_go53 = \
	/tbind przeplyn na poludnie
/def -mregexp -p2 -t'wskakuje na poklad promu.' bind_go54 = \
	/tbind wejdz na prom
/def -mregexp -p2 -t'schodzi na brzeg.' bind_go55 = \
	/tbind zejdz
/def -mregexp -p2 -t'wskakuje na poklad tratwy.' bind_go56 = \
	/tbind wejdz na tratwe
/def -mregexp -p2 -t'wspina sie na dach baraku.' bind_go57 = \
	/tbind wespnij sie na barak
/def -mregexp -p2 -t'przeskakuje palisade.' bind_go58 = \
	/tbind przeskocz palisade
/def -mregexp -p2 -t'otwiera klape i wydostaje sie przez otwor w suficie na gore.' bind_go59 = \
	/tbind otworz klape
/def -mregexp -p2 -t'chwyta za jeden z konarow i zaczyna przesuwac pien' bind_go60 = \
	/tbind przesun pien
/def -mregexp -p2 -t'zeskakuje do pobliskiej jamy, niknac calkowicie w jej wnetrzu.' bind_go61 = \
	/tbind wskocz do jamy
/def -mregexp -p2 -t'calkiem sprawnie radzac sobie ze wspinaczka po korzeniach, podaza w kierunku powierzchni ziemi.' bind_go62 = \
	/tbind wdrap sie na gore
/def -mregexp -p2 -t'naciska cos na scianie i po chwili znika' bind_go63 = \
	/tbind nacisnij kamien
/def -mregexp -p2 -t'ostroznie schodzi po zboczu pod most' bind_go64 = \
	/tbind zejdz pod most
/def -mregexp -p2 -t'wspina sie po najblizszym zboczu docierajac w koncu na trakt' bind_go65 = \
	/tbind wespnij sie na most
/def -mregexp -p2 -t'zablokowane jest przez kamienna plyte' bind_go66 = \
	/tbind odsun kamienna plyte
/def -mregexp -p2 -t'Kamienna plyta z przerazliwym zgrzytem zamyka wejscie do grobowca!' bind_go67 = \
	/tbind odsun kamienna plyte
/def -mregexp -p2 -t'Fantazyjne wrota sa zamkniete' bind_go68 = \
	/tbind otworz wrota
/def -mregexp -p2 -t'zsuwa sie po skarpie' bind_go69 = \
	/tbind zejdz na dol
/def -mregexp -p2 -t'znika w porastajacych krawedz traktu krzakach.' bind_go70 = \
	/tbind wejdz w krzaki
/def -mregexp -p2 -t'zaczyna schodzic na dol' bind_go71 = \
	/tbind zejdz na dol
/def -mregexp -p2 -t'zaczyna wspinac sie.*na gore' bind_go72 = \
	/tbind wespnij sie na gore
/def -mregexp -p2 -t'przeciska sie obok drzewa' bind_go73 = \
	/tbind przecisnij sie obok drzewa
/def -mregexp -p2 -t'znika w glebinach komina, pomagajac sobie przy tym wolna reka' bind_go74 = \
	/tbind wejdz do komina
/def -mregexp -p2 -t'mocno odbija sie stopami od podloza i zaczyna wspinaczke wglab tunelu' bind_go75 = \
	/tbind wejdz do komina
/def -mregexp -p2 -t'zaczyna wspinac sie po drabinie' bind_go76 = \
	/tbind wespnij sie na gore
/def -mregexp -p2 -t'chwyta koncowe szczeble drabiny i zaczyna' bind_go77 = \
	/tbind zejdz na dol po drabinie
/def -mregexp -p2 -t'przeciska sie przez otwor' bind_go78 = \
	/tbind przecisnij sie przez otwor
/def -mregexp -p2 -t'bierze rozbieg i przeskakuje wyrwe' bind_go79 = \
	/tbind przeskocz wyrwe
/def -mregexp -p2 -t'schyla sie niezgrabnie i wchodzi' bind_go80 = \
	/tbind wejdz do otworu
/def -mregexp -p2 -t'przechodzi szybko przez strumien' bind_go81 = \
	/tbind przejdz przez strumien
/def -mregexp -p2 -t'rusza w kierunku przegradzajacych droge glazow' bind_go82 = \
	/tbind przejdz za glaz
/def -mregexp -p2 -t'schodzi z mostu nad strumien.' bind_go83 = \
	/tbind zejdz nad strumien
/def -mregexp -p2 -t'bez trudu wchodzi na podest... traci rownowage' bind_go84 = \
	/tbind wejdz na podest
/def -mregexp -p2 -t'wsuwa sie do grobowca' bind_go85 = \
	/tbind wejdz do grobowca
/def -mregexp -p2 -t'pochyla sie i probuje wpelznac' bind_go86 = \
	/tbind przecisnij sie przez otwor
/def -mregexp -p2 -t'znika nagle w jednej ze scian' bind_go87 = \
	/tbind wejdz w sciane
/def -mregexp -p2 -t'rzucajac niepewne spojrzenie na czarna wode' bind_go88 = \
	/echo -p #@{BC%kolor_info}#@{n}# Komendy: @{BC%kolor_info}zeskocz na glaz, wskocz do wody, zanurkuj pod wode@{n} %;\
	/tbind zeskocz na glaz
/def -mregexp -p2 -t'zagryzajac wargi wskakuje do ciemnej wody' bind_go89 = \
	/tbind wskocz do wody
/def -mregexp -p2 -t'z posepna mina spoglada na metna wode. Po chwili wachania nurkuje' bind_go90 = \
	/tbind zanurkuj pod wode
/def -mregexp -p2 -t'zaczyna wspinac sie ku gorze' bind_go91 = \
	/tbind wespnij sie na gore%%; wespnij sie do gory
/def -mregexp -p2 -t'Znika za nim i ku twemu' bind_go92 = \
	/tbind obroc rzezbe
/def -mregexp -p2 -t'znika w porastajacych krawedz traktu' bind_go93 = \
	/tbind wejdz w krzaki
/def -mregexp -p2 -t'wchodzi na .*(tratwe|prom)' bind_go94 = \
	/tbind wsiadz na statek
/def -mregexp -p2 -t'ostroznie schodzi na dol lapiac sie kolejnych szczebli drabiny.' bind_go95 = \
	/tbind zejdz po drabinie
/def -mregexp -p2 -t'ostroznie wchodzi do gory lapiac' bind_go96 = \
	/tbind wejdz po drabinie
/def -mregexp -p2 -t'przechodzi przez iluzje sciany.' bind_go97 = \
	/tbind przejdz przez wneke
/def -mregexp -p2 -t'przechodzi przez wneke' bind_go98 = \
	/tbind przejdz przez wneke
/def -mregexp -p2 -t'wchodzi do baszty' bind_go99 = \
	/tbind wejdz do baszty
/def -mregexp -p2 -t'wchodzi do czerwonego wozu' bind_go100 = \
	/tbind wejdz do czerwonego wozu
/def -mregexp -p2 -t'schodzi po drabince na dol' bind_go101 = \
	/tbind zejdz po drabince
/def -mregexp -p2 -t'wdrapuje sie na duzy glaz' bind_go102 = \
	/tbind wdrap sie na glaz
/def -mregexp -p2 -t'zrecznie wspina sie na znajdujaca sie powyzej polke skalna.' bind_go103 = \
	/tbind wdrap sie na glaz%%; wespnij sie na polke
/def -mregexp -p2 -t'wchodzi do wody i przeplywa na przeciwlegly brzegi' bind_go104 = \
	/tbind przeplyn rzeke
/def -mregexp -p2 -t'Kierujesz sie .* kotliny, lecz bezradnie'  bind_go104 = \
	/tbind wejdz w krzaki
/def -mregexp -p2 -t'podaza do mauzoleum' bind_go105 = \
	/tbind wejdz do grobowca
/def -mregexp -p2 -t'podaza do grobowca' bind_go106 = \
	/tbind wejdz do grobowca
/def -mregexp -p2 -t'podaza przez iluzoryczna sciane' bind_go107 = \
	/tbind wejdz w sciane
/def -mregexp -p2 -t'podaza w szczeline' bind_go108 = \
	/tbind wejdz w szczeline
/def -mregexp -p2 -t'wdrapuje sie na skalna polke' bind_go109 = \
	/tbind wdrap sie na polke
/def -mregexp -p2 -t'zeskakuje na dol' bind_go_110 = \
	/tbind zeskocz na dol
/def -mregexp -p2 -t'podaza do krypty' bind_go_111 = \
	/tbind wejdz do krypty
/def -mregexp -p2 -t'wslizguje sie do lodowej dziury' bind_go_112 = \
	/tbind wzlizgnij sie do otworu
/def -mregexp -p2 -t'schodzi do rozpadliny' bind_go_113 = \
	/tbind zejdz do rozpadliny
/def -mregexp -p2 -t'przeslizguje sie przez szczeline' bind_go_114 = \
	/tbind przecisnij sie przez szczeline
/def -mregexp -p2 -t'pokonujac zarastajace droge zarosla wchodzi do wnetrza spalonej chaty' bind_go_115 = \
	/tbind wejdz do chaty

/def -mregexp -Fp2 -t'^(Zamkniete|Otwarte) wrota prowadzace na poludniowy-wschod.$' stop0 = \
	/beep 1 %;\
	/set lwgo=0 %;\
	/set auto off
