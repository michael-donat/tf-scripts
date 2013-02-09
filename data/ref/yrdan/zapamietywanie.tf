; ## Linie dodane automagicznie   : tf_ver=1.6.5
; ## 
; ## Wersja pliku                 : 1.6.5
; ## Ostatnia zmiana pliku        : 2009-01-06 21:07:40
; ## Plik pobrany                 : 2009-01-06 21:08:03
; ## Wersja Tfupdate              : 2.0.1
; ##
; ##
;-------------------------------------------------------------------------------
;|                          ZAPAMIETYWANIE OSOB                                |
;-------------------------------------------------------------------------------
/def imiona = \
    /if ({*} =~ NULL) \
        /if ({ogolne_wyswietlaj_imiona}) \
            /imiona off %;\
        /else \
            /imiona on %;\
        /endif %;\
    /elseif ($(/_is_on %{*})) \
        /set ogolne_wyswietlaj_imiona=1 %;\
        /_imiona_zrob %;\
        /msg Wyswietlam imiona. %;\
    /elseif ($(/_is_off %{*})) \
        /set ogolne_wyswietlaj_imiona=0 %;\
        /_imiona_zrob %;\
        /msg Nie wyswietlam imion. %;\
    /elseif ({*} =~ "help" | {*} =~ "pomoc") \
        /?imiona %;\
    /else \
        /msg Syntax: /imiona [on|off|help] %;\
    /endif

/def _imiona_zrob = \
    /set _imiona_wszystkie=!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! %;\
    /if ({ogolne_wyswietlaj_imiona} == 1) \
        /set _imiona_wszystkie=%{_imiona_wszystkie}$(/sys cat %{TFDIR}/imiona.db) %;\
    /elseif ({obecnie_expujacy}) \
        /msg -w Zapamietywanie nie jest wlaczone. Wpisz "@{B}/imiona on@{n}" zeby je uaktywnic! %;\
    /endif

/def -Fp250 -mregexp -t' i (.*) (przybywaja z|podazaja na) ' _imiona_trig1 = \
    /let _sum=0 %;\
    /let tmp=$[replace(']', '', replace('[', '', strcat({PL},",")))] %;\
    /while \
        /let i=$[strstr({tmp},",")] %;\
        /@test i>-1 %; /do \
        /_opis_sprawdz_i_wyswietl $[substr({tmp}, 0, i)] %;\
        /let tmp=$[substr({tmp},i+1)] %;\
        /let _sum=$[_sum + 1] %;\
    /done %;\
    /_opis_sprawdz_i_wyswietl %{P1} %;\
    /_przybywa_licz $[_sum + 1]

/def -Fp250 -mregexp -t'^\\[?(.+)]? (podaza|przybywa)(\\.| ze? | na )' _imiona_trig2 = \
    /_opis_sprawdz_i_wyswietl %{P1} %;\
    /_przybywa_licz 1

;/def -Fp250 -mregexp -t'^\\[?([^( ]* [^(]*)]? jest [wlrcl]' _imiona_trig3 = \
;    /_opis_sprawdz_i_wyswietl %{P1}

/def -Fp199 -t'*@\\{*\\}*' _imiona_substitute_all = /return substitute({*},  "x", 1)
 
/purge -i _opis_sprawdz_i_wyswietl
/def -i _opis_sprawdz_i_wyswietl = \
    /let test=$[strcat('","', toupper({*}, 1), '","')] %;\
    /let i=$[strstr({_imiona_wszystkie}, {test})] %;\
    /if (i != -1 & strlen({test}) > 10) \
        /let j=$[strrchr(substr({_imiona_wszystkie}, 0, i), '!')] %;\
        /let imie1=$[substr({_imiona_wszystkie}, j+2, i-j-2)] %;\
        /if ($(/list -s _imie2_%{imie1}) !~ NULL) \
            /return ''%;\
        /endif %;\
        /let tmp=%{_imiona_wszystkie} %;\
        /let imie_opis=$[substr({tmp}, i+3, strchr(substr({tmp}, i+3), '","'))] %;\
        /let imie_opis=$[strcat('[',toupper(substr({imie_opis},0,1)),tolower(substr({imie_opis},0,1)),']',substr({imie_opis},1))]%;\
;        /echo %{imie_opis} %;\
        /while (i != -1) \
            /let tmp=$[substr({tmp}, i-18)] %;\
;           /let j=0 %;\
            /let j=$[strrchr(substr({tmp}, 0, 20), '!')] %;\
            /let k=$[strstr({tmp}, '","', strstr({tmp}, '","', 20)+1)] %;\
            /let l=$[strstr({tmp}, '","', k+1)] %;\
            /let imie=$[substr({tmp}, j+2, 16-j)] %;\
            /let imie_op=$[substr({tmp}, k+3, l-k-3)] %;\
;                /echo $[substr(tmp, 0, 80)] :%{imie_op}:|| $[strlen({tmp})] | $[strcat("j:", j, " k:", k, " l:", l)]%;\
            /let opis=%{opis}@{%{ogolne_color_wyswietlane_imiona-BCwhite}}\(%{imie}%{imie_op}@{%{ogolne_color_wyswietlane_imiona-BCwhite}}\)@{n} %;\
            /let opis=$(/escape '" %{opis}) %;\
;            /echo %{opis} %;\
            /let tmp=$[substr({tmp}, 30)] %;\
            /let i=$[strstr({tmp},{test})] %;\
        /done %;\
        /def -Fp230 -mregexp -t'(%{imie_opis})([ .,])' _imie2_%{imie1} = /return substitute(strcat({PL}, {P1}, " ", "%{opis}", {P2}, {PR})) %;\
        /return {opis} %;\
    /endif %;\
    /return ''

/def zapamietani = /ktoto %{*}
/def ktoto = \
    /if (!getopts("sf", "")) /return 0%; /endif%; \
    /if ({1} =~ "licz") \
        /set _ilu_ludzi=0%;\
;        $(/quote -S -decho !wc -l %{TFDIR}/imiona.db) %;\
        /quote -S /test _ktoto_licz('"%{TFDIR}/imiona.db") %;\
        /echo -p -aCgreen Znalazlem @{B}%{_ilu_ludzi}@{n} zapamietanych istot!! %;\
        /unset _ilu_ludzi %;\
    /elseif ({*} !~ NULL) \
        /set _ilu_ludzi=0 %;\
        /if ({opt_s} == 1) \
            /quote -S /@test _ktoto_short("%{*}", '"%{TFDIR}/imiona.db") %;\
        /elseif ({opt_f} == 1) \
            /quote -S /@test _ktoto_full("%{*}", '"%{TFDIR}/imiona.db") %;\
             /else \
            /quote -S /@test _ktoto("%{*}", '"%{TFDIR}/imiona.db") %;\
        /endif %;\
        /echo -p -aCgreen Znalazlem @{B}%{_ilu_ludzi}@{n} pasujacych istot!! %;\
        /unset _ilu_ludzi %;\
    /elseif ({*} =~ "help" | {*} =~ "pomoc") \
        /?ktoto %;\
    /else \
        /echo Uzycie: /ktoto -sf <imie|opis|licz|pomoc> %;\
   /endif

/def _ktoto = \
    /if ({-1} =/ strcat("*",{1},"*")) \
        /test ++_ilu_ludzi %;\
        /echo -p -aCgreen $[pad({3}, -40, {2}, 0, {4}, 0, " @{BCwhite}(", 0, {2}, 0, {5}, 0, "@{BCwhite})", 0 )] %;\
    /endif

/def _ktoto_short = \
    /if ({-1} =/ strcat("*",{1},"*")) \
        /test ++_ilu_ludzi %;\
        /echo -p -aCgreen $[pad({3}, -40, {2}, 0, " @{BCwhite}(", 0, {2}, 0, {5}, 0, "@{BCwhite})", 0)] %;\
    /endif

/def _ktoto_full = \
    /if ({-1} =/ strcat("*",{1},"*")) \
        /test ++_ilu_ludzi %;\
        /echo -p -aCgreen $[pad({3}, -40, {2}, 0, {4}, 0, " @{BCwhite}(", 0, {2}, 0, {5}, 0, "@{BCwhite})", 0 , " @{nCwhite}[", 0, {6}, 0, "]", 0 )]%;\
    /endif
    
/def _ktoto_licz = \
    /test ++_ilu_ludzi

/def -p20 -mregexp -t'^(?:Na arenie: |)([^:\\(\\)]*) ([^ \\(\\)]*) (?:\\(.*\\) |)(?:czarodziej |)przedstawia sie jako:$$' _przedstawia_sie = \
    /if (world_info('host') !~ 'arkadia.rpg.pl') \
        /return %;\
    /endif %;\
    /def -n1 -p240 -t'*' _imie_trig_null = /purge _imie_trig_* %;\
    /def -n1 -p255 -mregexp -t'^(?:(?:Praktykant(?:ka|)|Szlachetnt(?:ka|)|Czcigodn[aye]|Senior(?:ita|e|)|Lord|Lady|Mistrz(?:yni|)|Don) |)([^ ,]*)(.*\\\\.)$$' _imie_trig_ok = \
        /test _zapamietaj_imie("%%{P1}","%{P1} %{P2}","%%{P2}") %%;\
        /purge _imie_trig_* 

;00:53:18.884126 # Ghazar, Torgen, Brygu i bezwzgledny szczerbaty ogr.
;00:53:21.306473 # Bezwzgledny szczerbaty ogr przedstawia sie jako:
;00:53:21.311638 # % _imie_trig_ok: expression syntax error: expected ',' or ')' after function argument, found 'Czarna'.
;00:53:21.306486 # Ingwi z Imperium, Kanaka Korsarskiego Drakkara "Czarna Czaszka", ogr.


/def _zapamietaj_imie = \
    /let _im=%{1} %;\
    /if (strstr(tolower(strcat({ogolne_druzyna}," ",{ogolne_leader})), tolower({2})) >-1) \
        /druzyna %;\
    /endif %;\
    /if /test (strstr({_imiona_wszystkie},strcat('!"',{1},'","',{2},'","',{3},'","'))==-1) %;/then \
        /if /test (strstr({_imiona_wszystkie},strcat('!"',{1},'","'))==-1) %;/then \
            /echo Zapamietany: %{1}. %;\
        /else \
            /echo Zmienil sie opis osoby: %{1}. %;\
        /endif %;\
    /endif %;\
;    /if ({2} =/ "* {mutant|mutantka}") \
;        /let _im=$[strcat(_im, "_m")] %;\
;    /elseif ({2} =/ "* {demon|demonica}") \
;        /let _im=$[strcat(_im, "_d")] %;\
;    /endif %;\
    /test _czysc_imie_full("%{_im}","%{2}","%{3}","","$[ftime("%Y-%m-%d %H:%M:%S",time())]") %;\
    /_zapamietaj_imie_2 $(/list _temp_imie_%{_im}) %| /writefile -a %{TFDIR}/imiona.db

/def _zapamietaj_imie_2 = \
    /purge _temp_imie_* %;\
    /echo %{-5}

/def czysc_imiona = \
    /if (!getopts("fs", "")) /return 0%; /endif%; \
    /sys cp %{TFDIR}/imiona.db  %{TFDIR}/.imiona.temp %;\
    /if ({opt_f} == 1) \
        /def -ag -h'REDEF' _temp_gag_imie %;\
        /quote -S /test _czysc_imie_full('"%{TFDIR}/imiona.db") %;\
        /false %| /writefile %{TFDIR}/imiona.db %;\
        /set __handle=%;\
        /test (__handle := tfopen("%{TFDIR}/imiona.db", "a")) %;\
        /quote -S /_zrob_odnowa `/list _temp_imie_* %;\
        /test tfclose({__handle}) %;\
        /unset __handle %;\
        /purge _temp_imie_* %;\
        /purge _temp_gag_imie %;\
    /else \
        /if ({*} !~ NULL) \
            /sys cat %{*} >> %{TFDIR}/imiona.db %;\
        /endif %;\
        /sys sort -r -t \\" -k 10,10 -o %{TFDIR}/imiona.db %{TFDIR}/imiona.db %;\
        /sys sort -u -t \\" -k 2,2 -o %{TFDIR}/imiona.db %{TFDIR}/imiona.db %;\
    /endif %;\
    /_imiona_zrob %;\
    /if ({opt_s} == 0) \
        /quote -S /_print_diff !"diff %{TFDIR}/.imiona.temp %{TFDIR}/imiona.db" %;\
        /_print_diff %;\
        /ktoto licz %;\
    /endif %;\
    /sys rm %{TFDIR}/.imiona.temp

/purge -i _czysc_imie_full
/def -i _czysc_imie_full = \
    /let short= %;\
;   Przyjaciele Brokilionu
    /if ({3} =/ "*Przyjaci* Brokilonu*") \
        /let short=%{short} @{xBCblack}PB@{n} %;\
;   Straz krain
    /elseif ({3} =/ "*Komendant* Strazy Krain*") \
        /let short=%{short} @{xBCblack}SK!@{n} %;\
    /elseif ({3} =/ "*Sekretarz* Strazy Krain*") \
        /let short=%{short} @{xBCblack}SK+@{n} %;\
    /elseif ({3} =/ "*Sierzant* Strazy Krain*") \
        /let short=%{short} @{xBCblack}SK+@{n} %;\
    /elseif ({3} =/ "*Strazn* Krain*") \
        /let short=%{short} @{xBCblack}SK@{n} %;\
    /endif %;\
;   Krasnoludy Gor Kranca Swiata
    /if ({3} =/ "*Than* Rodu * z Twierdzy*") \
        /let short=%{short} @{xBCblue}KGKS+@{n} %;\
    /elseif ({3} =/ "*Doradc* Krola*") \
        /let short=%{short} @{xBCblue}KGKS!@{n} %;\
    /elseif ({3} =/ "*Rodu * z Twierdzy*") \
        /let short=%{short} @{xBCblue}KGKS@{n} %;\
    /elseif ({3} =/ "*Dregni * z Twierdzy*") \
        /let short=%{short} @{xBCblue}KGKS@{n} %;\
;    /elseif ({3} =/ "*Wygnan* z Gor Kranca Swiata*") \
;        /let short=%{short} @{xBCwhite}KGKS[Wygnaniec]@{n} %;\
;    /elseif ({3} =/ "*Wyklety* z Gor Kranca Swiata*") \
;        /let short=%{short} @{xBCwhite}KGKS[Wyklety]@{n} %;\
;    /elseif ({3} =/ "*Przywod* Garaz-Runkaraki*") \
;        /let short=%{short} @{xBCwhite}KGKS[ZT]!@{n} %;\
;    /elseif ({3} =/ "*z grupy Garaz-Runkaraki*") \
;        /let short=%{short} @{xBCwhite}KGKS[ZT]@{n} %;\
;   Krasnoludy Mahakamu
    /elseif ({3} =/ "*Glowa Klanu*") \
        /let short=%{short} @{xBCwhite}KM!@{n} %;\
    /elseif ({3} =/ "*ze Starszyzny Klanu*") \
        /let short=%{short} @{xBCwhite}KM+@{n} %;\
    /elseif ({3} =/ "*Nestor klanu*") \
        /let short=%{short} @{xBCwhite}KM+@{n} %;\
    /elseif ({3} =/ "*{Mlodka|Mlodzik} z Klanu*") \
        /let short=%{short} @{xBCwhite}KM-@{n} %;\
    /elseif ({3} =/ "*z Klanu*") \
        /let short=%{short} @{xBCwhite}KM@{n} %;\
;    /elseif ({3} =/ "*z Mahakamu*") \
;        /let short=%{short} @{xBCwhite}KM--@{n} %;\
;   Ogrza Kompania
    /elseif ({3} =/ "*Herszt Ogrzej Kompani*") \
        /let short=%{short} @{xBCred}OK!@{n} %;\
    /elseif ({3} =/ "*z Ogrzej Kompani*") \
        /let short=%{short} @{xBCred}OK@{n} %;\
;   Stowarzyszenie halflingow
    /elseif ({3} =/ "*Wielce Niesyt*") \
        /let short=%{short} @{xBCwhite}HA!@{n} %;\
    /elseif ({2} =/ "*halfl*" & {3} =/ "*{Znawc*|Pogromc*|Smakosz*|Mistrz*|Wielbiciel*|Milosni*}*") \
        /let short=%{short} @{xBCwhite}HA@{n} %;\
;   Stowarzyszenie gnomich wynalazcow
    /elseif ({3} =/ "*Mist* Stowarzyszenia Gnomich Wynalazcow*") \
        /let short=%{short} @{xBCwhite}SGW!@{n} %;\
    /elseif ({3} =/ "*Gnomi* Kierowni* Wydzialu*") \
        /let short=%{short} @{xBCwhite}SGW+@{n} %;\
    /elseif ({3} =/ "*Gnomi* Konstruktor*") \
        /let short=%{short} @{xBCwhite}SGW@{n} %;\
    /elseif ({3} =/ "*Gnomi* Techni*") \
        /let short=%{short} @{xBCwhite}SGW@{n} %;\
    /elseif ({3} =/ "*Gnomi* Budowni*") \
        /let short=%{short} @{xBCwhite}SGW@{n} %;\
;   Elfy z Gor Sinych
    /elseif ({3} =/ "*{Ksiaze|Ksiezna} z Twierdzy Deithwen*") \
        /let short=%{short} @{xBCwhite}ES!@{n} %;\
    /elseif ({3} =/ "*Zwiaza* Wiezami Ksiazecej Krwi*") \
        /let short=%{short} @{xBCwhite}ES+@{n} %;\
    /elseif ({3} =/ "*Pierwsz* Mowc* Rodu*") \
        /let short=%{short} @{xBCwhite}ES!@{n} %;\
    /elseif ({3} =/ "*z Gor Sinych*") \
        /let short=%{short} @{xBCwhite}ES@{n} %;\
;   Lesne Elfy
    /elseif ({3} =/ "*Starsz* Rady Lesnych Elfow*") \
        /let short=%{short} @{xBCwhite}LE!@{n} %;\
    /elseif ({3} =/ "*Lesna Legenda*") \
        /let short=%{short} @{xBCwhite}LE+@{n} %;\
    /elseif ({2} =/ "* elf*" & {3} =/ "* Puszczy*") \
        /let short=%{short} @{xBCwhite}LE@{n} %;\
    /elseif ({2} =/ "* elf*" & {3} =/ "* Gwiazd*") \
        /let short=%{short} @{xBCwhite}LE@{n} %;\
    /elseif ({2} =/ "* elf*" & {3} =/ "* Drzew*") \
        /let short=%{short} @{xBCwhite}LE@{n} %;\
    /elseif ({3} =/ "*Lesn? Renegat*") \
        /let short=%{short} @{xBCwhite}LE[RE]@{n} %;\
;   Stowarzyszenie Polelfow
    /elseif ({3} =/ "*Zastepc* Przewodni* Stowarzyszenia Polelfow*") \
        /let short=%{short} @{xBCwhite}PE+@{n} %;\
    /elseif ({3} =/ "*Przewodni* Stowarzyszenia Polelfow*") \
        /let short=%{short} @{xBCwhite}PE!@{n} %;\
    /elseif ({2} =/ "*polelf*" & {3} =/ "* z *") \
        /let short=%{short} @{xBCwhite}PE@{n} %;\
;   Osadnicy spod Puszczy Shekal
    /elseif ({3} =/ "*Starsz* Rady Osadnikow*") \
        /let short=%{short} @{xBCwhite}OS!@{n} %;\
    /elseif (regmatch("(Wytrawny Lowca|Wielki Lowczy|Czlowiek Lasu|Czlowiek Puszczy|Znawc.* Puszczy)", {3})) \
        /let short=%{short} @{xBCwhite}OS+@{n} %;\
    /elseif (regmatch("(Kolonista|Kolonistka|Mlody Osiedleniec|Mieszkan.* Osady)", {3})) \
        /let short=%{short} @{xBCwhite}OS@{n} %;\
    /elseif (regmatch("(Osadnik|Osadniczka|Eksplorator.* Lasu|Mysliwy)", {3})) \
    /let short=%{short} @{xBCwhite}OS@{n} %;\
    /elseif (({2} =/ "*czlowiek*" | {2} =/ "*kobieta*") & regmatch("(Podroznik|Podrozniczka|Zahartowan.* Wedrowi|Obiezyswiat|Odkrywca Nowych Szlakow)", {3})) \
        /let short=%{short} @{xBCwhite}OS-@{n} %;\
    /endif %;\
;   Stowarzyszenie Kupcow Novigradu
    /if ({3} =/ "*Mistrz* Cechu Kupcow Novigradz*") \
        /let short=%{short} @{xnCmagenta}KN!@{n} %;\
    /elseif ({3} =/ "*Radn? Cechu Kupcow Novigrad*") \
        /let short=%{short} @{xnCmagenta}KN+@{n} %;\
    /elseif ({3} =/ "*Kupiec Novigrad*") \
        /let short=%{short} @{xnCmagenta}KN@{n} %;\
    /elseif ({3} =/ "*Subiekt Kupiecki*") \
        /let short=%{short} @{xnCmagenta}KN-@{n} %;\
;   Straz kupiecka
;    /elseif ({3} =/ "*Komendant Strazy Kupieckiej*") \
;        /let short=%{short} @{xBCmagenta}SKN!@{n} %;\
;    /elseif (regmatch("(Chorazy|Sierzant|Adiutant Komendanta) Strazy Kupieckiej", {3})) \
;        /let short=%{short} @{xBCmagenta}SKN+@{n} %;\
;    /elseif (regmatch("(Kapitan|Kapral) .* Strazy Kupieckiej", {3})) \
;        /let short=%{short} @{xBCmagenta}SKN+@{n} %;\
;    /elseif ({3} =/ "*Rekrut* Strazy Kupieckiej*") \
;        /let short=%{short} @{xBCmagenta}SKN-@{n} %;\
;    /elseif ({3} =/ "*Strazy Kupieckiej*") \
;        /let short=%{short} @{xBCmagenta}SKN@{n} %;\
;   Wolna kompania 'Skorpion'
;    /elseif ({3} =/ "*Komendant Wolnej Kompanii 'Skorpion'*") \
;        /let short=%{short} @{xBCmagenta}WKS!@{n} %;\
;    /elseif (regmatch("(Chorazy|Sierzant|Adiutant Komendanta) Wolnej Kompanii 'Skorpion'", {3})) \
;        /let short=%{short} @{xBCmagenta}WKS+@{n} %;\
;    /elseif (regmatch("(Kapitan|Kapral) .* Wolnej Kompanii 'Skorpion'", {3})) \
;        /let short=%{short} @{xBCmagenta}WKS+@{n} %;\
;    /elseif ({3} =/ "*Rekrut* Wolnej Kompanii 'Skorpion'*") \
;        /let short=%{short} @{xBCmagenta}WKS-@{n} %;\
;    /elseif ({3} =/ "*Wolnej Kompanii 'Skorpion'*") \
;        /let short=%{short} @{xBCmagenta}WKS@{n} %;\
;   Brygada Armii Lyrijskiej
    /elseif ({3} =/ "*Komendant* Armii Lyrijskiej*") \
        /let short=%{short} @{xBCmagenta}AL!@{n} %;\
    /elseif ({3} =/ "*{Adiutan*|Kapitan*|Kapral*|Kwatermistrz*} Armii Lyrijskiej*") \
        /let short=%{short} @{xBCmagenta}AL+@{n} %;\
    /elseif ({3} =/ "*{Najemni*|Felcz*|Zwiadowc*} Armii Lyrijskiej*") \
        /let short=%{short} @{xBCmagenta}AL@{n} %;\
    /elseif ({3} =/ "*Rekrut* Armii Lyrijskiej*") \
        /let short=%{short} @{xBCmagenta}AL-@{n} %;\
;   Zabojcy Trolli
    /elseif (regmatch("Zabojca Demonow", {3})) \
        /let short=%{short} @{xBCblue}ZT!@{n} %;\
    /elseif (regmatch("Zabojca Smokow", {3})) \
        /let short=%{short} @{xBCblue}ZT+@{n} %;\
    /elseif (regmatch("Zabojca (Trolli|Gigantow)", {3})) \
        /let short=%{short} @{xBCblue}ZT@{n} %;\
;   Zakon Sigmara Mlotodzierzcy
    /elseif ({3} =/ "*Wielki Mistrz Zakonu Sigmara*") \
        /let short=%{short} @{xBCblue}ZS!@{n} %;\
    /elseif ({3} =/ "*Wielki * Zakonu Sigmara*") \
        /let short=%{short} @{xBCblue}ZS+@{n} %;\
    /elseif ({3} =/ "*Brat Sluzebny*Sigmara*") \
        /let short=%{short} @{xBCblue}ZS-@{n} %;\
    /elseif ({3} =/ "*Rekrut z Gwardii*Sigmara*") \
        /let short=%{short} @{xBCblue}ZS-@{n} %;\
    /elseif ({3} =/ "*Sigmara*") \
        /let short=%{short} @{xBCblue}ZS@{n} %;\
;   Najemnicy
    /elseif ({3} =/ "*Kapitan *Kompan* Gryfa*") \
        /let short=%{short} @{xnCblue}NA!@{n} %;\
    /elseif ({3} =/ "*{Adiutant|Sierzant|Porucznik}* *Kompan* Gryfa*") \
        /let short=%{short} @{xnCblue}NA+@{n} %;\
    /elseif ({3} =/ "*Rekrut* Kompan* Gryfa*") \
        /let short=%{short} @{xnCblue}NA-@{n} %;\
    /elseif ({3} =/ "*Oddzial* Kompan* Gryfa*") \
        /let short=%{short} @{xnCblue}NA@{n} %;\
;   Gladiatorzy
    /elseif ({3} =/ "*Czempion* Szkoly von Raugen*") \
        /let short=%{short} @{xnCblue}GL!@{n} %;\
    /elseif ({3} =/ "* von Raugen*") \
        /let short=%{short} @{xnCblue}GL@{n} %;\
    /elseif ({3} =/ "*Gladiator*") \
        /let short=%{short} @{xnCblue}GL@{n} %;\
    /elseif ({3} =/ "*Szkoly Walki w Nuln*") \
        /let short=%{short} @{xnCblue}GL-@{n} %;\
;   Rodzina Alderazzi
    /elseif ({3} =/ "*Alderazzi Familia*") \
        /let short=%{short} @{xnCblue}RA@{n} %;\
;   Tancerze Wojny
    /elseif ({3} =/ "*Mistrz* Tanca*") \
        /let short=%{short} @{xnBCgreen}TW!@{n} %;\
    /elseif ({3} =/ "*Tancer* Wojny*") \
        /let short=%{short} @{xnBCgreen}TW@{n} %;\
;   Komando Scoiatael
    /elseif ({3} =/ "*Konsul* Komanda Scoia?tael*") \
        /let short=%{short} @{xnCblue}SC!@{n} %;\
    /elseif ({3} =/ "*Doradc* Komanda Scoia?tael*") \
        /let short=%{short} @{xnCblue}SC+@{n} %;\
    /elseif (regmatch("(Lesnej Bandy|Lesnego Komanda|Bojowni(k|czka) o Wolnosc)", {3})) \
        /let short=%{short} @{xnCblue}SC@{n} %;\
    /elseif (regmatch("(Wojowni(k|czka) Scoia.tael|Zabojc(a|zyni) Ludzi|Pogromc(a|zyni) Rasy Ludzkiej)", {3})) \
        /let short=%{short} @{xnCblue}SC@{n} %;\
    /elseif (regmatch("(Wyzwoliciel|Msciciel(|ka) Brugge|Obronc(a|zyni) (Shaerrawedd|Elfow|Krasnoludow|Gnomow|Halflingow|Ogrow))", {3})) \
        /let short=%{short} @{xnCblue}SC@{n} %;\
    /elseif ({3} =/ "*Scoia?tael*") \
        /let short=%{short} @{xnCblue}SC@{n} %;\
;   Berserkerzy
    /elseif ({3} =/ "*Komendant Berserkerow*") \
        /let short=%{short} @{xnCred}BS!@{n} %;\
    /elseif ({3} =/ "*Skellige* Komendant*") \
        /let short=%{short} @{xnCred}BS+@{n} %;\
    /elseif ({3} =/ "*Rekrut* w Morskiej Armii Skellige*") \
        /let short=%{short} @{xnCred}BS-@{n} %;\
    /elseif (regmatch("(Syn Burzy|Czarny Plomien Nilfgaardzkich Wybrzezy|Piesc Jarla ze Skellige|Piesc Hemdalla|Diabel morski|Kierownik Stoczni Skellige)", {3})) \
        /let short=%{short} @{xnCred}BS@{n} %;\
    /elseif ({3} =/ "*Berserker* Skellige*") \
        /let short=%{short} @{xnCred}BS@{n} %;\
    /elseif ({3} =/ "*Skellige*") \
        /let short=%{short} @{xnCred}BS@{n} %;\
;   Mutanty
    /elseif ({3} =/ "*{*nurgl*|*slaanesh*|*khorn*|*rhasnet*|*tzeentch*|*malal*}*") \
        /let short=%{short} @{xnCred}MC@{n} %;\
    /elseif ({2} =/ "*mutant*") \
        /let short=%{short} @{xnCred}MC@{n} %;\
;   Ochotniczy Hufiec Mahakamski
    /elseif ({3} =/ "*Pulkownik* Hufca Mahakam*") \
        /let short=%{short} @{xBCmagenta}OHM!@{n} %;\
    /elseif ({3} =/ "*{Kapitan|Chorazy}* Hufca Mahakam*") \
        /let short=%{short} @{xBCmagenta}OHM+@{n} %;\
    /elseif ({3} =/ "*{Ochotnik|Ochotniczka}* Hufca Mahakamskiego*") \
        /let short=%{short} @{xBCmagenta}OHM-@{n} %;\
    /elseif ({3} =/ "*Hufca Mahakam*") \
        /let short=%{short} @{xBCmagenta}OHM@{n} %;\
;   Koniec :)
    /endif %;\
;    /let __date=$[ftime("%H:%M:%S", substr({5}, 11, 8) - 00:59:59)]%;\
;    /let __date=$[strcat(substr({5}, 0, 11), {__date})]%;\
;    /echo %{5} -> %{__date}%;\
;    /def _temp_imie_%{1}="%{1}","%{2}","%{3}","%{short}","%{__date}"
    /def _temp_imie_%{1}="%{1}","%{2}","%{3}","%{short}","%{5}"

/def _zrob_odnowa = \
    /test tfwrite({__handle}, {-5})

/def wczytaj_stare_imiona = \
    /load imiona.tf %;\
    /quote -S /_wczytaj_stare_imiona `/list -s _imie_* %;\
    /purge _imie_* %;\
    /czysc_imiona -f
    
/def _wczytaj_stare_imiona = \
    /let pocz_opisu=$[strstr({*},"'([")] %;\
    /let koni_opisu=$[strstr({*},")(")] %;\
    /let pocz_imienia=$[strstr({*},"_imie_")+6] %;\
    /let imie=$[substr({*},{pocz_imienia})] %;\
    /let opis=$[strcat(substr({*},{pocz_opisu}+3,1),substr({*},{pocz_opisu}+6,{koni_opisu}-{pocz_opisu}-6))] %;\
    /def _temp_imie_%{imie}="%{imie}","%{opis}","","",""

/def ?ktoto = /?imiona
/def ?imiona = \
/echo -p -aCgreen +-======================== @{BCwhite}Arkadia ver %{tf_version} @{BCmagenta}Pomoc @{nCgreen}==========================-+ %; \
/echo -p -aCgreen | @{BCyellow}Obsluga imion!@{nCgreen}                                                              | %; \
/echo -p -aCgreen | @{BCwhite}Dostepne komendy :@{nCgreen}                                                          | %; \
/echo -p -aCgreen | /imiona <on|off|help>       - Podstawowa komenda, wlacza - wylancza imiona  | %; \
/echo -p -aCgreen | /ktoto [-s] <licz|str>      - Szukanie osob w spisie lub wyswietlenie       | %; \
/echo -p -aCgreen |                               zapamietanych osob                            | %; \
/echo -p -aCgreen | @{BCwhite}Opis skrotow w imionach :@{nCgreen}                                                   | %; \
/echo -p -aCgreen | Ogolne:                                                                     | %; \
/echo -p -aCgreen |     !                       - Szefowstwo Gildii                             | %; \
/echo -p -aCgreen |     +                       - Zastepcy - Starszyzna                         | %; \
/echo -p -aCgreen |     -                       - Kandydaci - Rekruci - Subiekci                | %; \
/echo -p -aCgreen |     [xxx]                   - Inne ciekawe opisy                            | %; \
/echo -p -aCgreen | Kluby:                                                                      | %; \
/echo -p -aCgreen |     @{BCblack}SK@{nCgreen}                      - Straz Krain                                   | %; \
/echo -p -aCgreen |     @{BCblack}PB@{nCgreen}                      - Przyjaciele Brokilionu                        | %; \
/echo -p -aCgreen | Gildie Imperium:                                                            | %; \
/echo -p -aCgreen |     @{BCblue}KGKS@{nCgreen}                    - Krasnoludy z Gor Kranca Swiata                | %; \
/echo -p -aCgreen |     @{BCblue}ZT@{nCgreen}                      - Zabojcy Trolli                                | %; \
/echo -p -aCgreen |     @{BCblue}ZS@{nCgreen}                      - Zakon Rycerzy Sigmara Mlotodzierzcy           | %; \
/echo -p -aCgreen |     @{nCblue}GL@{nCgreen}                      - Gladiatorzy ze Szkoly von Raugen              | %; \
/echo -p -aCgreen |     @{BCgreen}TW@{nCgreen}                      - Tancerze Wojny                                | %; \
/echo -p -aCgreen |     @{BCwhite}LE@{nCgreen}                      - Lesne Elfy                                    | %; \
/echo -p -aCgreen |     @{BCwhite}HA@{nCgreen}                      - Zgromadzenie Halflingow                       | %; \
/echo -p -aCgreen |     @{nCblue}RA@{nCgreen}                      - Rodzina Alderazzi - Mafia                     | %; \
/echo -p -aCgreen |     @{nCblue}NA@{nCgreen}                      - Najemna Kompania Gryfa                        | %; \
/echo -p -aCgreen |     @{nCred}OK@{nCgreen}                      - Ogrza Kompania                                | %; \
/echo -p -aCgreen |     @{nCred}MC@{nCgreen}                      - Mutanci Chaosu                                | %; \
/echo -p -aCgreen | Gildie Ishtar:                                                              | %; \
/echo -p -aCgreen |     @{BCwhite}KM@{nCgreen}                      - Krasnoludy Mahakamu                           | %; \
/echo -p -aCgreen |     @{BCwhite}OS@{nCgreen}                      - Osadnicy z Puszczy Shekal                     | %; \
/echo -p -aCgreen |     @{BCwhite}ES@{nCgreen}                      - Elfy z Gor Sinych                             | %; \
/echo -p -aCgreen |     @{BCwhite}SGW@{nCgreen}                     - Stowarzyszenie Gnomich Wynalazcow             | %; \
/echo -p -aCgreen |     @{BCwhite}PE@{nCgreen}                      - Stowarzyszenie Polelfow                       | %; \
/echo -p -aCgreen |     @{nCmagenta}KN@{nCgreen}                      - Cech Kupcow Novigradu                         | %; \
/echo -p -aCgreen |     @{nBCmagenta}AL@{nCgreen}                      - Armia Lyrijska                                | %; \
/echo -p -aCgreen |     @{nBCmagenta}OHM@{nCgreen}                     - Ochotniczy Hufiec Mahakamu                    | %; \
/echo -p -aCgreen |     @{nCred}BS@{nCgreen}                      - Berserkerzy z Wysp Skellige                   | %; \
/echo -p -aCgreen |     @{nCred}SC@{nCgreen}                      - Komando Scoia'tael                            | %; \
/echo -p -aCgreen |                                                                             | %; \
/echo -p -aCgreen +-===========================================================================-+

/czysc_imiona -s

;  _print_diff
;  /if (regmatch(^[0-9]*c[0-9*]$$, _diff)) %;\
/def _print_diff = \
    /let _diff=%{*} %;\
    /if (_diff =/ "---*" | _diff =/ "[0-9][0-9]*[0-9]") \
        /return %;\
    /endif %;\
    /let _cut_diff=$[strcat("> ", substr(_last_diff, 2, 10), "*")] %;\
    /if (_last_diff !~ NULL &_diff =/ _cut_diff) \
        /test echo(_last_diff, "BCbgyellow") %;\
        /test echo(_diff, "BCbgcyan") %;\
        /set _last_diff="sdkjhfskhsdfjkskdf,mns"%;\
        /return %;\
    /elseif (_last_diff =/ "> *") \
        /test echo(_last_diff, "BCbgblue") %;\
    /elseif (_last_diff =/ "< *") \
        /test echo(_last_diff, "BCbgred") %;\
    /endif %;\
    /set _last_diff=%{*} %;\
    
