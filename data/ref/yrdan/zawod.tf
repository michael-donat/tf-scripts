; ## Linie dodane automagicznie   : tf_ver=1.0.1
; ## 
; ## Wersja pliku                 : 1.0.1
; ## Ostatnia zmiana pliku        : 2009-01-06 21:07:41
; ## Plik pobrany                 : 2009-01-06 21:08:14
; ## Wersja Tfupdate              : 2.0.1
; ##
; ##
/def zawod = \
    /if (!{#}) \
        /if ({ogolne_zawod}!~NULL) \
             /msg Mam zawod @{B}%{ogolne_zawod}@{n} %;\
        /else \
             /msg Nie mam zadnego zawodu %;\
        /endif %;\
        /msg * Uzycie: @{B}/zawod MC@{n} %;\
        /msg Obecnie dostepne zawody na arkadii to: %;\
        /msg * Zabojca Trolli        - @{B}ZT@{n} %;\
        /msg * Rycerz Zakonu Sigmara - @{B}ZS@{n} %;\
        /msg * Tancerz Wojny         - @{B}TW@{n} %;\
        /msg * Gladiator             - @{B}VR@{n} %;\
        /msg * Miecznik              - @{B}KG@{n} %;\
        /msg * Nozownik              - @{B}RA@{n} %;\
        /msg * Fanatyk               - @{B}MC@{n} %;\
        /msg * Korsarz               - @{B}BS@{n} %;\
        /msg * Partyzant             - @{B}SC@{n} %;\
        /msg * Legionistwa           - @{B}OHM@{n} %;\
        /msg * Straznik              - @{B}WKS@{n} %;\
;        /msg * Stary Palkarz         - @{B}DDROPS@{n} %;\
        /return %;\
    /endif %;\
    /if ({#}>1) \
        /msg Jak ty masz wiecej niz jeden zawod to ja jestem robocop ;-). %;\
        /return %;\
    /endif %;\
    /let _zawod=%{1} %;\
    /if ({_zawod}=~"ZT" | \
         {_zawod}=~"ZS" | \
         {_zawod}=~"TW" | \
         {_zawod}=~"VR" | \
         {_zawod}=~"KG" | \
         {_zawod}=~"RA" | \
         {_zawod}=~"MC" | \
         {_zawod}=~"BS" | \
         {_zawod}=~"SC" | \
         {_zawod}=~"OHM"| \
         {_zawod}=~"WKS"| \
         {_zawod}=~"DDROPS") \
        /msg Od teraz przy zalogowaniu beda ladowane spece dla twojej osoby. %;\
        /set ogolne_zawod=%{_zawod} %;\
        /_wgraj_spece_zawodu %;\
    /else \
        /msg Zle zdefiniowales swoj zawod. %;\
        /zawod %;\
    /endif

/def _wgraj_spece_zawodu = \
;Tu trzeba wyczyscic wszystkie defy ktore sa ladowane ponizej i bedzie git;-)
    /purge _moj_spec* %;\
    /if ({ogolne_zawod}=~"ZT") \
;Tu mozna dac wszystko dotyczace ZT z 1 osoby
    /elseif ({ogolne_zawod}=~"ZS") \
;Wszystko co dotyczy zawodu ZS
    /elseif ({ogolne_zawod}=~"TW") \
;Wszystko co dotyczy zawodu TW 
    /elseif ({ogolne_zawod}=~"VR") \
;Wszystko co dotyczy zawodu VR %;\
    /elseif ({ogolne_zawod}=~"KG") \
	/def -Fp5 -P2xnCgreen -mregexp -t'^(?:Poprawiasz chwyt na swym|Wyrzucasz do przodu swoj|Nie zwazajac na nic rozpoczynasz .* mlyniec|Niespodziewanie skrecasz tulow, wyprowadzajac przy tym .* uderzenie|Ruszasz do przodu, w pol kroku wyprowadzajac .* uderzenie) ([^,]*?)(?: i z szerokiego zamachu wyprowadzasz nim potezne uderzenie|, wkladajac cala sile w uderzenie|, momentalnie przechodzac do uderzenia|), ktore tylko (jakims cudem nie dosiega) ([^.]*)\.' _moj_spec_0 = /return _psnr("@{BCgray}", "TWOJ", "(0/8)", "TY", {P3}, {P1}, {P2}) %;\
	/def -Fp5 -P2xnCgreen -mregexp -t'^(?:Poprawiasz chwyt na swym|Wyrzucasz do przodu swoj|Nie zwazajac na nic rozpoczynasz .* mlyniec|Niespodziewanie skrecasz tulow, wyprowadzajac przy tym .* uderzenie|Ruszasz do przodu, w pol kroku wyprowadzajac .* uderzenie) ([^,]*?)(?: i z szerokiego zamachu wyprowadzasz nim potezne uderzenie|, wkladajac cala sile w uderzenie|, momentalnie przechodzac do uderzenia|), ktore (ledwo zacina) ([^.]*) w ' _moj_spec_1 = /return _psnr("@{BCgray}", "TWOJ", "(1/8)", "TY", {P3}, {P1}, {P2}) %;\
	/def -Fp5 -P2xnCgreen -mregexp -t'^(?:Poprawiasz chwyt na swym|Wyrzucasz do przodu swoj|Nie zwazajac na nic rozpoczynasz .* mlyniec|Niespodziewanie skrecasz tulow, wyprowadzajac przy tym .* uderzenie|Ruszasz do przodu, w pol kroku wyprowadzajac .* uderzenie) ([^,]*?)(?: i z szerokiego zamachu wyprowadzasz nim potezne uderzenie|, wkladajac cala sile w uderzenie|, momentalnie przechodzac do uderzenia|), ktore (zacina) ([^.]*) w ' _moj_spec_2 = /return _psnr("@{BCgray}", "TWOJ", "(2/8)", "TY", {P3}, {P1}, {P2}) %;\
	/def -Fp5 -P2xnCgreen -mregexp -t'^(?:Poprawiasz chwyt na swym|Wyrzucasz do przodu swoj|Nie zwazajac na nic rozpoczynasz .* mlyniec|Niespodziewanie skrecasz tulow, wyprowadzajac przy tym .* uderzenie|Ruszasz do przodu, w pol kroku wyprowadzajac .* uderzenie) ([^,]*?)(?: i z szerokiego zamachu wyprowadzasz nim potezne uderzenie|, wkladajac cala sile w uderzenie|, momentalnie przechodzac do uderzenia|), ktore (bolesnie zacina) ([^.]*) w ' _moj_spec_3 = /return _psnr("@{BCgray}", "TWOJ", "(3/8)", "TY", {P3}, {P1}, {P2}) %;\
	/def -Fp5 -P2xnCgreen -mregexp -t'^(?:Poprawiasz chwyt na swym|Wyrzucasz do przodu swoj|Nie zwazajac na nic rozpoczynasz .* mlyniec|Niespodziewanie skrecasz tulow, wyprowadzajac przy tym .* uderzenie|Ruszasz do przodu, w pol kroku wyprowadzajac .* uderzenie) ([^,]*?)(?: i z szerokiego zamachu wyprowadzasz nim potezne uderzenie|, wkladajac cala sile w uderzenie|, momentalnie przechodzac do uderzenia|), ktore (plytko tnie) ([^.]*) w ' _moj_spec_4 = /return _psnr("@{BCgray}", "TWOJ", "(4/8)", "TY", {P3}, {P1}, {P2}) %;\
	/def -Fp5 -P2xBCgreen -mregexp -t'^(?:Poprawiasz chwyt na swym|Wyrzucasz do przodu swoj|Nie zwazajac na nic rozpoczynasz .* mlyniec|Niespodziewanie skrecasz tulow, wyprowadzajac przy tym .* uderzenie|Ruszasz do przodu, w pol kroku wyprowadzajac .* uderzenie) ([^,]*?)(?: i z szerokiego zamachu wyprowadzasz nim potezne uderzenie|, wkladajac cala sile w uderzenie|, momentalnie przechodzac do uderzenia|), ktore (tnie) ([^.]*) w ' _moj_spec_5 = /return _psnr("@{BCgray}", "TWOJ", "(5/8)", "TY", {P3}, {P1}, {P2}) %;\
	/def -Fp5 -P2xBCgreen -mregexp -t'^(?:Poprawiasz chwyt na swym|Wyrzucasz do przodu swoj|Nie zwazajac na nic rozpoczynasz .* mlyniec|Niespodziewanie skrecasz tulow, wyprowadzajac przy tym .* uderzenie|Ruszasz do przodu, w pol kroku wyprowadzajac .* uderzenie) ([^,]*?)(?: i z szerokiego zamachu wyprowadzasz nim potezne uderzenie|, wkladajac cala sile w uderzenie|, momentalnie przechodzac do uderzenia|), ktore (gleboko tnie) ([^.]*) w ' _moj_spec_6 = /return _psnr("@{BCgray}", "TWOJ", "(6/8)", "TY", {P3}, {P1}, {P2}) %;\
	/def -Fp5 -P2xBCgreen -mregexp -t'^(?:Poprawiasz chwyt na swym|Wyrzucasz do przodu swoj|Nie zwazajac na nic rozpoczynasz .* mlyniec|Niespodziewanie skrecasz tulow, wyprowadzajac przy tym .* uderzenie|Ruszasz do przodu, w pol kroku wyprowadzajac .* uderzenie) ([^,]*?)(?: i z szerokiego zamachu wyprowadzasz nim potezne uderzenie|, wkladajac cala sile w uderzenie|, momentalnie przechodzac do uderzenia|), ktore (niemalze rozcina) ([^.]*) (?:glowe|korpus|cialo)\.' _moj_spec_7 = /return _psnr("@{BCgray}", "TWOJ", "(7/8)", "TY", {P3}, {P1}, {P2}) %;\
	/def -Fp5 -P2xBCgreen;4BCgreen -mregexp -t'^(?:Poprawiasz chwyt na swym|Wyrzucasz do przodu swoj|Nie zwazajac na nic rozpoczynasz .* mlyniec|Niespodziewanie skrecasz tulow, wyprowadzajac przy tym .* uderzenie|Ruszasz do przodu, w pol kroku wyprowadzajac .* uderzenie) ([^,]*?)(?: i z szerokiego zamachu wyprowadzasz nim potezne uderzenie|, wkladajac cala sile w uderzenie|, momentalnie przechodzac do uderzenia|), ktore (z potworna moca tnie) (.*) (doslownie w pol)\.' _moj_spec_8 = /return _psnr("@{BCgray}", "TWOJ", "(8/8)", "TY", {P3}, {P1}, {P2}) %;\
	/def -Fp5 -P3xBCgreen -mregexp -t'^Wyczekujesz na dogodny moment i tniesz nagle plasko przez (.*). Ostrze (.*) z nieprzyjemnym chrobotem przechodzi przez miesnie i kosci, a gdy zatrzymujesz ped swej broni, slyszysz tylko jak (dwa ciala bez ducha osuwaja sie na podloze)\.' _moj_spec_9 = /return _psnr("@{BCgray}", "TWOJ DOUBLE KILL", "(8/8)", "TY", {P1}, {P2}, {P3}) %;\
    /elseif ({ogolne_zawod}=~"RA") \
;Wszystko co dotyczy zawodu RA %;\
		/def -Fp48 -mregexp -t"Sprezasz sie do skoku probujac ugodzic (.*) sw.* lecz tracisz koncentracje .* (mija cel) .*." _moj_spec_1 = /substitute -p @{CCyan}%%{PL}> > > > NZCIOS @{Cred}----> @{CMagenta} %%{P1} @{Cred}----> @{BCyellow}%%{P2}. %;\
	 	/def -Fp48 -mregexp -t"Wykorzystujac dogodna sytuacje rzucasz sie na (.*) pragnac pchnac .* (nieskoordynowany ruch) .* nikogo zaskoczyc." _moj_spec_2 = /substitute -p @{CCyan}%%{PL}> > > > NZCIOS @{Cred}----> @{CMagenta} %%{P1} @{Cred}----> @{BCyellow}%%{P2}.%;\
		/def -Fp48 -mregexp -t"Zamierzasz sie na (.*) sw.* (unika twojego ciosu)." _moj_spec_3 =/substitute -p @{CCyan}%%{PL}> > > > NZCIOS @{Cred}----> @{CMagenta} %%{P1} @{Cred}----> @{BCyellow}%%{P2}.%;\
		/def -Fp48 -mregexp -t"Wykonujesz szybki wypad by trafic (.*) sw.* (nieznaczne drasniecie)." _moj_spec_4 = /substitute -p @{CCyan}%%{PL}> > > > NZCIOS @{Cred}----> @{CMagenta} %%{P1} @{Cred}----> @{BCyellow}%%{P2}. %;\
		/def -Fp48 -mregexp -t"Obracajac w reku .* wykonujesz nagly zwod i trafiasz (.*) pozost.* (nieznaczne obrazenia)." _moj_spec_5 = /substitute -p @{CCyan}%%{PL}> > > > NZCIOS @{Cred}----> @{CMagenta} %%{P1} @{Cred}----> @{BCyellow}%%{P2}. %;\
		/def -Fp48 -mregexp -t"Odskakujesz do tylu, .* trzymasz w rece, zatacza szeroki luk by ostatecznie trafic (.*) zadajac .* (nieznaczne obrazenia)." _moj_spec_6 = /substitute -p @{CCyan}%%{PL}> > > > NZCIOS @{Cred}----> @{CMagenta} %%{P1} @{Cred}----> @{BCyellow}%%{P2}. %;\
		/def -Fp48 -mregexp -t"Wykorzystujac chwilowa dekoncentracje (.*) wbijasz .* (lekkie drasniecie)." _moj_spec_7 = /substitute -p @{CCyan}%%{PL}> > > > NZCIOS @{Cred}----> @{CMagenta} %%{P1} @{Cred}----> @{BCyellow}%%{P2}. %;\
		/def -Fp48 -mregexp -t"Wykorzystujac dogodna chwile doskakujesz do (.*) a.* .* po sobie tylko (lekkie drasniecie)." _moj_spec_8 = /substitute -p @{CCyan}%%{PL}> > > > NZCIOS @{Cred}----> @{CMagenta} %%{P1} @{Cred}----> @{BCyellow}%%{P2}. %;\
		/def -Fp48 -mregexp -t"Korzystajac z nieuwagi (.*) klujesz .* tylko (lekkie drasniecie)." _moj_spec_9 = /substitute -p @{CCyan}%%{PL}> > > > NZCIOS @{Cred}----> @{CMagenta} %%{P1} @{Cred}----> @{BCyellow}%%{P2}. %;\
		/def -Fp48 -mregexp -t"Wykonujesz pare oszczednych unikow starajac sie zmeczyc (.*) i gdy.* zlapac oddech, (wbijasz).*." _moj_spec_10 = /substitute -p @{CCyan}%%{PL}> > > > NZCIOS @{Cred}----> @{CMagenta} %%{P1} @{Cred}----> @{BCyellow}%%{P2}. %;\
		/def -Fp48 -mregexp -t"Poziomym cieciem .* godzisz w (.*) trafiajac.* i wywolujac (bolesny grymas) na.*." _moj_spec_11 = /substitute -p @{CCyan}%%{PL}> > > > NZCIOS @{Cred}----> @{CMagenta} %%{P1} @{Cred}----> @{BCyellow}%%{P2}. %;\
		/def -Fp48 -mregexp -t"Uwaznie sledzisz ruchy (.*) i trafiajac.* zostawiasz (bolesna rane)." _moj_spec_12 = /substitute -p @{CCyan}%%{PL}> > > > NZCIOS @{Cred}----> @{CMagenta} %%{P1} @{Cred}----> @{BCyellow}%%{P2}. %;\
		/def -Fp48 -mregexp -t"Uwaznie sledzisz ruchy (.*) a gdy.* odslania sie, .* (znaczne obrazenia)." _moj_spec_13 = /substitute -p @{CCyan}%%{PL}> > > > NZCIOS @{Cred}----> @{CMagenta} %%{P1} @{Cred}----> @{BCyellow}%%{P2}. %;\
		/def -Fp48 -mregexp -t"Wypatrujac luke w obronie (.*) blyskawicznie skracasz dystans i trafiasz .* (krwawa bruzde).*." _moj_spec_14 = /substitute -p @{CCyan}%%{PL}> > > > NZCIOS @{Cred}----> @{CMagenta} %%{P1} @{Cred}----> @{BCyellow}%%{P2}. %;\
		/def -Fp48 -mregexp -t"Blyskawicznie wyrzucasz przed siebie.* trafiajac (.*) w .* wyszarpujesz .* (krwawiaca rane)." _moj_spec_15 = /substitute -p @{CCyan}%%{PL}> > > > NZCIOS @{Cred}----> @{CMagenta} %%{P1} @{Cred}----> @{BCyellow}%%{P2}. %;\
		/def -Fp48 -mregexp -t"Zaciskasz mocniej palce na .* (paskudnie ranisz) (.*) trafiaj.*." _moj_spec_16 = /substitute -p @{CCyan}%%{PL}> > > > NZCIOS @{Cred}----> @{CMagenta} %%{P2} @{Cred}----> @{BCyellow}%%{P1}. %;\
 		/def -Fp48 -mregexp -t"Zaciskasz mocniej palce na .* naglego doskoku dopadasz do (.*) trafia.* po sobie (powazne obrazenia)." _moj_spec_17 = /substitute -p @{CCyan}%%{PL}> > > > NZCIOS @{Cred}----> @{CMagenta} %%{P1} @{Cred}----> @{BCyellow}%%{P2}. %;\
		/def -Fp48 -mregexp -t"Celujac w (.*) zagleb.* (az po rekojesc), a gdy wyciagasz .* od krwi." _moj_spec_18 = /substitute -p @{CCyan}%%{PL}> > > > NZCIOS @{Cred}----> @{CMagenta} %%{P1} @{Cred}----> @{BCyellow}%%{P2}. %;\
		/def -Fp48 -mregexp -t"Wykonujesz plynny polobrot dla zmylenia (.*) zyskuj.* (celnie trafiajac).*." _moj_spec_19 = /substitute -p @{CCyan}%%{PL}> > > > NZCIOS @{Cred}----> @{CMagenta} %%{P1} @{Cred}----> @{BCyellow}%%{P2}. %;\
		/def -Fp48 -mregexp -t"Wyprowadzasz szybkie pchniecie .* az po rekojesc w (.*) Wyszar.* (potwornej rany) momentalnie tryska krew." _moj_spec_20 = /substitute -p @{CCyan}%%{PL}> > > > NZCIOS @{Cred}----> @{CMagenta} %%{P1} @{Cred}----> @{BCyellow}%%{P2}. %;\
		/def -Fp48 -mregexp -t"Zwinnym, kocim ruchem przypadasz do ziemi, by nagle doskoczyc do (.*) i wyrzu.* (potwornej rany) natychmiast.*." _moj_spec_21 = /substitute -p @{CCyan}%%{PL}> > > > NZCIOS @{Cred}----> @{CMagenta} %%{P1} @{Cred}----> @{BCyellow}%%{P2}. %;\
		/def -Fp48 -mregexp -t"Mruzysz oczy, nie spuszczajac ani na chwile wzroku z (.*) a gdy.* (rozlegle obrazenia).*." _moj_spec_22 = /substitute -p @{CCyan}%%{PL}> > > > NZCIOS @{Cred}----> @{CMagenta} %%{P1} @{Cred}----> @{BCyellow}%%{P2}. %;\
        	/def -Fp48 -mregexp -t"Zwinnie uchylasz sie przed ciosem (.*) i wykorzystujac.* Bron celnie trafia.* (bardzo powazne obrazenia).*." _moj_spec_23 = /substitute -p @{CCyan}%%{PL}> > > > NZCIOS @{Cred}----> @{CMagenta} %%{P1} @{Cred}----> @{BCyellow}%%{P2}. %;\
		/def -Fp48 -mregexp -t"Wyczekujesz .* a gdy (.*) rzuca.* dojdzie do siebie, wyprowadzasz szybkie pchniecie .* (bardzo ciezko ranisz).*." _moj_spec_24 = /substitute -p @{CCyan}%%{PL}> > > > NZCIOS @{Cred}----> @{CMagenta} %%{P1} @{Cred}----> @{BCyellow}%%{P2}. %;\
		/def -Fp48 -mregexp -t"Zwinnym, .* doskoczyc do (.*) i wyrzucajac.* Nim .* Ofiara (z trudem dochodzi do siebie).*." _moj_spec_25 = /substitute -p @{CCyan}%%{PL}> > > > NZCIOS @{Cred}----> @{CMagenta} %%{P1} @{Cred}----> @{BCyellow}%%{P2}. %;\
		/def -Fp48 -mregexp -t"Zrecznym ruchem parujesz cios (.*) rownocze.* Starannie wymierzonym pchnieciem wbijasz .* (koniec walki).*." _moj_spec_26 = /substitute -p @{CCyan}%%{PL}> > > > NZCIOS @{Cred}----> @{CMagenta} %%{P1} @{Cred}----> @{BCyellow}%%{P2}. %;\
		/def -Fp48 -mregexp -t"Unikajac uderzenia (.*) blyskawicz.* cios. Mimowolnie usmiechasz sie z satysfak.* do (zakonczenia istnienia).*." _moj_spec_27 = /substitute -p @{CCyan}%%{PL}> > > > NZCIOS @{Cred}----> @{CMagenta} %%{P1} @{Cred}----> @{BCyellow}%%{P2}. %;\
		/def -Fp48 -mregexp -t"Unikajac uderzenia (.*) blyskawiczn.* z satysfakcja czujac, jak z twej ofiary (uchodzi zycie).*." _moj_spec_28 = /substitute -p @{CCyan}%%{PL}> > > > NZCIOS @{Cred}----> @{CMagenta} %%{P1} @{Cred}----> @{BCyellow}%%{P2}. %;\
		/def -Fp48 -mregexp -t"Wykorzystujac .*i oslabienie (.*) silnym .* podcinasz .*Przec.* traci rownowage i osuwa sie na.* (osuwajacego sie na ziemie ciala).*." _moj_spec_29 = /substitute -p @{CCyan}%%{PL}> > > > NZCIOS @{Cred}----> @{CMagenta} %%{P1} @{Cred}----> @{BCyellow}%%{P2}. %;\
		/def -Fp48 -mregexp -t"Wykorzystujac .*i oslabienie (.*) silnym .* podcinasz .*Przec.* traci rownowage i osuwa sie na.* (ostatnie sily).*." _moj_spec_30 = /substitute -p @{CCyan}%%{PL}> > > > NZCIOS @{Cred}----> @{CMagenta} %%{P1} @{Cred}----> @{BCyellow}%%{P2}.  %;\
    /elseif ({ogolne_zawod}=~"MC") \
		/def -Fp5 -P3xnCmagenta -t'^Bierzesz potezny zamach i wyprowadzasz (.*) cios, ktory ma zmasakrowac (.*)\. Jednak twoja bron (.*), nie czyniac (?:przeciwnikowi|przeciwniczce) najmniejszej krzywdy\.$$' _moj_spec_0 =  /return _psnr("@{BCgray}", "TWOJ", "(0/7)", "TY", {P2}, {P1}, {P3}) %;\
		/def -Fp5 -P2xnCmagenta -t'ostrzegajac luke w obronie (?:przeciwnika|przeciwniczki) rzucasz sie do ataku\. .* trafiasz (.*) w .* (ledwo muskajac) (?:go|ja|je) ' _moj_spec_1 = /return _psnr("@{BCgray}", "TWOJ", "(1/7)", "TY", {P1}, {PR}, {P2}) %;\
		/def -Fp5 -P2xnCmagenta -t'ostrzegajac luke w obronie (?:przeciwnika|przeciwniczki) rzucasz sie do ataku\. .* trafiasz (.*) w .* (lekko raniac) (?:go|ja|je) ' _moj_spec_2 = /return _psnr("@{BCgray}", "TWOJ", "(2/7)", "TY", {P1}, {PR}, {P2}) %;\
		/def -Fp5 -P2xnCmagenta -t'ostrzegajac luke w obronie (?:przeciwnika|przeciwniczki) rzucasz sie do ataku\. .* trafiasz (.*) w .* ((?<!lekko |powaznie |bardzo ciezko )raniac) (?:go|ja|je) ' _moj_spec_3 = /return _psnr("@{BCgray}", "TWOJ", "(3/7)", "TY", {P1}, {PR}, {P2}) %;\
		/def -Fp5 -P2xBCmagenta -t'ostrzegajac luke w obronie (?:przeciwnika|przeciwniczki) rzucasz sie do ataku\. .* trafiasz (.*) w .* (powaznie raniac) (?:go|ja|je) ' _moj_spec_4 = /return _psnr("@{BCgray}", "TWOJ", "(4/7)", "TY", {P1}, {PR}, {P2}) %;\
		/def -Fp5 -P2xBCmagenta -t'ostrzegajac luke w obronie (?:przeciwnika|przeciwniczki) rzucasz sie do ataku\. .* trafiasz (.*) w .* (bardzo ciezko raniac) (?:go|ja|je) ' _moj_spec_5 = /return _psnr("@{BCgray}", "TWOJ", "(5/7)", "TY", {P1}, {PR}, {P2}) %;\
		/def -Fp5 -P2xBCmagenta -t'ostrzegajac luke w obronie (?:przeciwnika|przeciwniczki) rzucasz sie do ataku\. .* trafiasz (.*) w .* (masakrujac) (?:go|ja|je) ' _moj_spec_6 = /return _psnr("@{BCgray}", "TWOJ", "(6/7)", "TY", {P1}, {PR}, {P2}) %;\
		/def -Fp5 -P3xBCmagenta -t'^Stajesz pewnie na szeroko rozstawionych nogach i wyprowadzasz potezne uderzenie (.*)\. Bezlitosny, okrutny cios trafia (.*)zaglebiajac bron w (?:jego|jej) ciele\. Widzisz, jak (?:przeciwnik|przeciwniczka) (stara sie jeszcze dosiegnac cie zanim osunie sie na ziemie), jednak przekracza to (?:jego|jej) mozliwosci\.$$' _moj_spec_7 = /return _psnr("@{BCgray}", "TWOJ", "(7/7)", "TY", {P2}, {P1}, {P3}) %;\
    /elseif ({ogolne_zawod}=~"BS") \
        /def -Fp5 -P4xnCgreen -t'^Niezgrabny ruch niemal cudem pozwala ci uniknac ciosu ([^,]*), a twoj(|a) ([^,]*), wyrz.* (przecina tylko powietrze)' _moj_spec_0 = /return _psnr("@{BCgray}", "TWOJ", "(0/5)", "TY", {P1}, {P3}, {P4}) %;\
        /def -Fp5 -P4xnCgreen -t'^Powolnym ruchem unikasz ciosu ([^,]*), jednoczesnie uderzajac .* sw(ym|a|oja) ([^,]*), lecz .* (nieznaczne obrazenia)' _moj_spec_1 = /return _psnr("@{BCgray}", "TWOJ", "(1/5)", "TY", {P1}, {P3}, {P4}) %;\
        /def -Fp5 -P4xnCgreen -t'^Oszczednym ruchem unikasz ciosu ([^,]*), rabiac .* rownoczesnie sw(ym|a|oja) ([^,]*), a twoje uderzenie (otwiera szeroka rane)' _moj_spec_2 = /return _psnr("@{BCgray}", "TWOJ", "(2/5)", "TY", {P1}, {P3}, {P4}) %;\
        /def -Fp5 -P4xBCgreen -t'^Zgrabnym ruchem unikasz ciosu (.*) i korzystajac .* sw(ym|a|oja) ([^,]*), (gleboko rozrywajac)' _moj_spec_3 = /return _psnr("@{BCgray}", "TWOJ", "(3/5)", "TY", {P1}, {P3}, {P4}) %;\
        /def -Fp5 -P4xBCgreen -t'^Plynnym ruchem unikasz ciosu (.*) i uderzajac .* sw(ym|a|oja) ([^,]*), ktor.* (ogromne obrazenia)' _moj_spec_4 = /return _psnr("@{BCgray}", "TWOJ", "(4/5)", "TY", {P1}, {P3}, {P4}) %;\
        /def -Fp5 -P4xBCgreen -t'^Blyskawicznym polobrotem unikasz ciosu ([^,]*), a twoj(|a) ([^,]*), dzierzon.* (krwawy warkocz smierci)' _moj_spec_5 = /return _psnr("@{BCgray}", "TWOJ", "(5/5)", "TY", {P1}, {P3}, {P4}) %;\
    /elseif ({ogolne_zawod}=~"SC") \
        /def -Fp5 -P3xnCgreen -t'^Probujesz dosiegnac (.*) ([a-z]+ [a-z]+ [a-z]+(?:, | rycerskim, | wojennym, | bojowym, ))jednak twoja bron nieznacznie (chybia celu)' _moj_spec_0 = /return _psnr ("@{BCgray}", "TWOJ", "(0/7)", "TY", {P1}, {P2}, {P3}) %;\
        /def -Fp5 -P3xnCgreen -t'^(?:Z doskoku|Bez zastanowienia|Niezbyt celnie|Oszczednym ruchem|Bez wysilku|Niezbyt dokladnie|Z szybkiego doskoku|Robiac oszczedny zamach|W pospiechu|Zbierajac sie w sobie|W zamieszaniu|Korzystajac z zamieszania|Z lekkiego wymachu) uderzasz (.*) ([a-z]+ [a-z]+ [a-z]+(?:, | rycerskim, | wojennym, | bojowym, ))(nieznacznie raniac)' _moj_spec_1 = /return _psnr ("@{BCgray}", "TWOJ", "(1/7)", "TY", {P1}, {P2}, {P3}) %;\
        /def -Fp5 -P3xnCgreen -t'^(?:Z doskoku|Bez zastanowienia|Niezbyt celnie|Oszczednym ruchem|Bez wysilku|Niezbyt dokladnie|Z szybkiego doskoku|Robiac oszczedny zamach|W pospiechu|Zbierajac sie w sobie|W zamieszaniu|Korzystajac z zamieszania|Z lekkiego wymachu) uderzasz (.*) ([a-z]+ [a-z]+ [a-z]+(?:, | rycerskim, | wojennym, | bojowym, ))(lekko raniac)' _moj_spec_2 = /return _psnr ("@{BCgray}", "TWOJ", "(2/7)", "TY", {P1}, {P2}, {P3}) %;\
        /def -Fp5 -P3xnCgreen -t'^(?:Z doskoku|Bez zastanowienia|Niezbyt celnie|Oszczednym ruchem|Bez wysilku|Niezbyt dokladnie|Z szybkiego doskoku|Robiac oszczedny zamach|W pospiechu|Zbierajac sie w sobie|W zamieszaniu|Korzystajac z zamieszania|Z lekkiego wymachu) uderzasz (.*) ([a-z]+ [a-z]+ [a-z]+(?:, | rycerskim, | wojennym, | bojowym, ))(bolesnie raniac)' _moj_spec_3 = /return _psnr ("@{BCgray}", "TWOJ", "(3/7)", "TY", {P1}, {P2}, {P3}) %;\
        /def -Fp5 -P3xBCgreen -t'^(?:Zaciskajac z wysilku zeby|Dziko hallakujac|Wrzeszczac na cale gardlo|Bez chwili namyslu|(?:Blyskawicznie|Szybko) skladajac sie do ciosu|(?:Pewnym|Plynnym) ruchem|Z szybkiego doskoku|Zbierajac sie w sobie|W szalenczym porywie|Z grymasem wysilku|Robiac szeroki zamach|Blyskawicznie) uderzasz (.*) ([a-z]+ [a-z]+ [a-z]+(?:, | rycerskim, | wojennym, | bojowym, ))(powaznie raniac)' _moj_spec_4 = /return _psnr ("@{BCgray}", "TWOJ", "(4/7)", "TY", {P1}, {P2}, {P3}) %;\
        /def -Fp5 -P3xBCgreen -t'^(?:Zaciskajac z wysilku zeby|Dziko hallakujac|Wrzeszczac na cale gardlo|Bez chwili namyslu|(?:Blyskawicznie|Szybko) skladajac sie do ciosu|(?:Pewnym|Plynnym) ruchem|Z szybkiego doskoku|Zbierajac sie w sobie|W szalenczym porywie|Z grymasem wysilku|Robiac szeroki zamach|Blyskawicznie) uderzasz (.*) ([a-z]+ [a-z]+ [a-z]+(?:, | rycerskim, | wojennym, | bojowym, ))(bardzo ciezko raniac)' _moj_spec_5 = /return _psnr ("@{BCgray}", "TWOJ", "(5/7)", "TY", {P1}, {P2}, {P3}) %;\
        /def -Fp5 -P3xBCgreen -t'^(?:Zaciskajac z wysilku zeby|Dziko hallakujac|Wrzeszczac na cale gardlo|Bez chwili namyslu|(?:Blyskawicznie|Szybko) skladajac sie do ciosu|(?:Pewnym|Plynnym) ruchem|Z szybkiego doskoku|Zbierajac sie w sobie|W szalenczym porywie|Z grymasem wysilku|Robiac szeroki zamach|Blyskawicznie) uderzasz (.*) ([a-z]+ [a-z]+ [a-z]+(?:, | rycerskim, | wojennym, | bojowym, ))(potwornie raniac)' _moj_spec_6 = /return _psnr ("@{BCgray}", "TWOJ", "(6/7)", "TY", {P1}, {P2}, {P3}) %;\
        /def -Fp5 -P2xBCgreen -t'^Blyskawicznie doskakujesz do ledwo stojacego na nogach ([^,]*), (bezlitosnie masakrujac (?:go|ja)) (.*)\\.$$' _moj_spec_7 = /return _psnr ("@{BCgray}", "TWOJ", "(7/7)", "TY", {P1}, {P3}, {P2}) %;\
    /elseif ({ogolne_zawod}=~"OHM") \
        /def -Fp5 -P3nCgreen -t'^(?:Napierasz zdecydowanie bokiem na|Nie tracac dystansu do|Przesuwasz sie nieznacznie w bok, obchodzac powoli) ([^,]*), (?:by|cofasz).*(?:pchniecie|uderzenie|ciecie) ([^.]*). .* (przecinajac tylko powietrze|nie czyniac najmniejszej krzywdy)\.$$' _moj_spec_0 = /return _psnr("@{BCgray}", "TWOJ", "(0/7)", "TY", {P1}, {P2} , {P3}) %;\
        /def -Fp5 -P3nCgreen -t'^(?:Napierasz zdecydowanie bokiem na|Nie tracac dystansu do|Przesuwasz sie nieznacznie w bok, obchodzac powoli) ([^,]*), (?:by|cofasz).*(?:pchniecie|uderzenie|ciecie) ([^.]*). .* powodujac tylko (ledwo zauwazalne obrazenia)\.$$' _moj_spec_1 = /return _psnr("@{BCgray}", "TWOJ", "(1/7)", "TY", {P1}, {P2} , {P3}) %;\
        /def -Fp5 -P3nCgreen -t'^(?:Napierasz zdecydowanie bokiem na|Nie tracac dystansu do|Przesuwasz sie nieznacznie w bok, obchodzac powoli) ([^,]*), (?:by|cofasz).*(?:pchniecie|uderzenie|ciecie) ([^.]*). .* powodujac tylko (nieznaczne obrazenia)\.$$' _moj_spec_2 = /return _psnr("@{BCgray}", "TWOJ", "(2/7)", "TY", {P1}, {P2} , {P3}) %;\
        /def -Fp5 -P3nCgreen -t'^(?:Napierasz zdecydowanie bokiem na|Nie tracac dystansu do|Przesuwasz sie nieznacznie w bok, obchodzac powoli) ([^,]*), (?:by|cofasz).*(?:pchniecie|uderzenie|ciecie) ([^.]*). .* powodujac (niemale obrazenia)\.$$' _moj_spec_3 = /return _psnr("@{BCgray}", "TWOJ", "(3/7)", "TY", {P1}, {P2} , {P3}) %;\
        /def -Fp5 -P3BCgreen -t'^(?:Napierasz zdecydowanie bokiem na|Nie tracac dystansu do|Przesuwasz sie nieznacznie w bok, obchodzac powoli) ([^,]*), (?:by|cofasz).*(?:pchniecie|uderzenie|ciecie) ([^.]*). .* powodujac (rozlegle obrazenia)\.$$' _moj_spec_4 = /return _psnr("@{BCgray}", "TWOJ", "(4/7)", "TY", {P1}, {P2} , {P3}) %;\
        /def -Fp5 -P3BCgreen -t'^(?:Napierasz zdecydowanie bokiem na|Nie tracac dystansu do|Przesuwasz sie nieznacznie w bok, obchodzac powoli) ([^,]*), (?:by|cofasz).*(?:pchniecie|uderzenie|ciecie) ([^.]*). .* powodujac (liczne i glebokie obrazenia)\.$$' _moj_spec_5 = /return _psnr("@{BCgray}", "TWOJ", "(5/7)", "TY", {P1}, {P2} , {P3}) %;\
        /def -Fp5 -P3BCgreen -t'^(?:Napierasz zdecydowanie bokiem na|Nie tracac dystansu do|Przesuwasz sie nieznacznie w bok, obchodzac powoli) ([^,]*), (?:by|cofasz).*(?:pchniecie|uderzenie|ciecie) ([^.]*). .* powodujac (prawie ze smiertelne obrazenia)\.$$' _moj_spec_6 = /return _psnr("@{BCgray}", "TWOJ", "(6/7)", "TY", {P1}, {P2} , {P3}) %;\
        /def -Fp5 -P3BCgreen -t'^(?:Napierasz zdecydowanie bokiem na|Nie tracac dystansu do|Przesuwasz sie nieznacznie w bok, obchodzac powoli) ([^,]*), (?:by|cofasz).*(?:pchniecie|uderzenie|ciecie) ([^.]*). .* (konczac walke)\.$$' _moj_spec_7 = /return _psnr("@{BCgray}", "TWOJ", "(7/7)", "TY", {P1}, {P2} , {P3}) %;\
    /elseif ({ogolne_zawod}=~"WKS") \
;Wszystko co dotyczy zawodu WKS %;\
    /elseif ({ogolne_zawod}=~"DDROPS") \
        /def -Fp5 -ag -mregexp -t'^Napinasz wszystkie miesnie i lekko mruzysz oczy. Wiesz, ze potrwa to ulamek sekundy, ale jednoczesnie zdajesz sobie sprawe, ze musisz uzyc calej swojej sily. Zaciskasz palce na broni, bierzesz szeroki rozmach  i... i... nietrafiles!' _moj_spec_0 = /echo -p @{BCcyan}PUDLO PauOoOO@{BCyellow}!@{n} %;\
        /def -Fp5 -ag -mregexp -t'^Mocno napinasz wszystkie miesnie i lekko mruzysz oczy. Wiesz, ze potrwa to tylko ulamek sekundy, ale jednoczesnie zdajesz sobie sprawe z tego, ze musisz uzyc calej swojej sily. Zaciskasz palce na broni i biorac niewielki rozmach lekko ogluszasz (.*) trafiajac' _moj_spec_1 = /echo -p @{BCcyan}BOMBA@{BCyellow}! @{BCcyan}OGLUSZENIE @{BCyellow}! @{BCcyan}LEKKO @{BCyellow}-> @{BCred}%%{P1}@{n} %;\
        /def -Fp5 -ag -mregexp -t'^Mocno napinasz wszystkie miesnie i lekko mruzysz oczy. Wiesz, ze potrwa to tylko ulamek sekundy, ale jednoczesnie zdajesz sobie sprawe z tego, ze musisz uzyc calej swojej sily. Zaciskasz palce na broni i biorac polkolisty rozmach ogluszasz (.*) trafiajac' _moj_spec_2 = /echo -p @{BCcyan}BOMBA@{BCyellow}! @{BCcyan}OGLUSZENIE @{BCyellow}!! @{BCcyan}NORMALNIE @{BCyellow}-> @{BCred}%%{P1}@{n} %;\
        /def -Fp5 -ag -mregexp -t'^Mocno napinasz wszystkie miesnie i lekko mruzysz oczy. Wiesz, ze potrwa to tylko ulamek sekundy, ale jednoczesnie zdajesz sobie sprawe z tego, ze musisz uzyc calej swojej sily. Zaciskasz palce na broni i biorac szeroki rozmach mocno ogluszasz (.*) trafiajac' _moj_spec_3 = /echo -p @{BCcyan}BOMBA@{BCyellow}! @{BCcyan}OGLUSZENIE @{BCyellow}!!! @{BCcyan}MOCNO @{BCyellow}-> @{BCred}%%{P1}@{n} %;\
        /def -Fp5 -ag -mregexp -t'^Bardzo mocno napinasz wszystkie miesnie i mruzysz oczy. Wiesz, ze potrwa to tylko ulamek sekundy, ale jednoczesnie zdajesz sobie sprawe, ze musisz uzyc calej swojej sily. Zaciskasz palce na broni i biorac potezny zamach calkowicie ogluszasz (.*) trafiajac' _moj_spec_4 = /echo -p @{BCyellow}!!! @{BCcyan}ABSOLUTNA BOMBA@{BCyellow}!!! @{BCcyan}CALKOWICIE @{BCyellow}-> @{BCred}%%{P1}@{n} %;\
     /endif

/_wgraj_spece_zawodu
