; ## Linie dodane automagicznie   : tf_ver=1.0.4
; ## 
; ## Wersja pliku                 : 1.0.4
; ## Ostatnia zmiana pliku        : 2008-11-07 21:28:10
; ## Plik pobrany                 : 2008-11-07 21:28:35
; ## Wersja Tfupdate              : 2.0.1
; ##
; ##

; Budowa pliku z ziolami
; "nazwa","opis zwykly","opis regexp","ulega wysuszeniu","typ","dlugi opis","dzialanie","kumenda na uzycie","data wpisu","user","widoczne"
/set ogolne_odmiana_d_woreczek=woreczka
/set ogolne_odmiana_n_woreczek=woreczkiem
/set ogolne_odmiana_b_woreczek=woreczka

/def _ziola_make_trig = \
    /test ++_ziola_last_id %;\
    /if ({5} =/ "{lecznicze|odtrutki|regenerujace|uniwersalne}") \
        /let _color=BCgreen %;\
    /elseif ({5} =/ "trujace") \
        /let _color=BCred %;\
    /elseif ({5} =/ "obojetne") \
        /let _color=BCyellow %;\
    /else \
        /let _color=BCblue %;\
    /endif %;\
    /let _txt=$[strcat("@{", _color, "}", toupper({1}, 1))] %;\
    /def -Fp220 -mregexp -t'(%{3})([ .,])' _ziola_trig_%{_ziola_last_id} = \
        /return _ziola_seen("%{_txt}")
    
/def _ziola_seen = \
    /return substitute(strcat({PL}, {P1}, " @{BCwhite}(@{BCred}@{nBCwhite}", {1}, "@{nBCwhite})@{n}", {P2}, {PR}))


/def _ziola_make_trigs = \
    /purge _ziola_trig_* %;\
    /if ({ogolne_ziola_show}) \
        /set _ziola_last_id=0 %;\
        /quote -S /test _ziola_make_trig('"%{TFDIR}/ziola.db") %;\
        /unset _ziola_last_id %;\
    /endif

/_ziola_make_trigs

/def ziola = \
    /if ({*} =~ NULL) \
        /if ({ogolne_ziola_show}) \
            /ziola on %;\
        /else \
            /ziola off %;\
        /endif %;\
    /elseif ($(/_is_on %{*})) \
        /unset ogolne_ziola_show %;\
        /msg Nie podswietlam ziolek. %;\
        /_ziola_make_trigs %;\
    /elseif ($(/_is_off %{*})) \
        /set ogolne_ziola_show=1 %;\
        /msg Podswietlam opisy ziolek. %;\
        /_ziola_make_trigs %;\
    /else \
        /msg Podswietlac czy nie podswietlac opisow ziolek? %;\
    /endif
    

/def ziolo = \
    /if (!getopts("sf", "")) /return 0%; /endif%; \
    /if ({1} =~ "licz") \
        /set _ile_ziol=0%;\
;        $(/quote -S -decho !wc -l %{TFDIR}/ziola.db) %;\
        /quote -S /test _ziolo_licz('"%{TFDIR}/ziola.db") %;\
        /msg Znalazlem @{B}%{_ile_ziol}@{n} zapamietanych ziol!! %;\
        /unset _ile_ziol %;\
    /elseif ({*} !~ NULL) \
        /set _ile_ziol=0 %;\
        /if ({opt_s} == 1) \
            /quote -S /@test _ziolo_short("%{*}", '"%{TFDIR}/ziola.db") %;\
        /elseif ({opt_f} == 1) \
            /quote -S /@test _ziolo_full("%{*}", '"%{TFDIR}/ziola.db") %;\
             /else \
            /quote -S /@test _ziolo("%{*}", '"%{TFDIR}/ziola.db") %;\
        /endif %;\
        /msg Znalazlem @{B}%{_ile_ziol}@{n} pasujacych ziol!! %;\
        /unset _ile_ziol %;\
    /elseif ({*} =~ "help" | {*} =~ "pomoc") \
        /?ziolo %;\
    /else \
        /msg Uzycie: /ziolo -sf <imie|opis|licz|pomoc> %;\
   /endif

/def _ziolo = \
    /if ({-1} =/ strcat("*",{1},"*")) \
        /test ++_ile_ziol %;\
        /echo -p -aCgreen $[pad({3}, -40, {8}, 0, " @{BCwhite}(", 0, toupper({2}, 1), 0, "@{BCwhite})", 0 )] %;\
    /endif

/def _ziolo_short = \
    /if ({-1} =/ strcat("*",{1},"*")) \
        /test ++_ile_ziol %;\
        /echo -p -aCgreen $[pad({3}, -40, {2}, 0, " @{BCwhite}(", 0, {2}, 0, {5}, 0, "@{BCwhite})", 0)] %;\
    /endif

/def _ziolo_full = \
    /if ({-1} =/ strcat("*",{1},"*")) \
        /test ++_ile_ziol %;\
        /echo -p -aCgreen $[pad({3}, -40, {2}, 0, {4}, 0, " @{BCwhite}(", 0, {2}, 0, {5}, 0, "@{BCwhite})", 0 , " @{nCwhite}[", 0, {6}, 0, "]", 0 )]%;\
    /endif
    
/def _ziolo_licz = \
    /test ++_ile_ziol

/def _z8 = /result {-8}

/def _ziola_make_db_one = \
    /let _nazwa=$[tolower(substr({L}, 7))] %;\
    /let _i=$[strchr({*}, "'") + 4] %;\
    /let _opis=$[tolower(substr({*}, _i))] %;\
    /let _opis=$[substr(_opis, 0, strrchr({_opis}, "'") - 8)] %;\
    /let _opis=$[replace("]", "", _opis)] %;\
    /let _susz=0 %;\
    /if (_opis =/ "*ususzon*") \
        /let _susz=1 %;\
        /let _opis=$[replace("( | ususzon(e |y |ych ))", " ", _opis)] %;\
    /endif %;\
    /test a := regmatch("(\\\\(([^|]*).*?\\\\))", _opis) %;\
    /if (a) \
        /let _op=$[replace({P1}, {P2}, _opis)] %;\
    /endif %;\
    /test a := regmatch("(\\\\(([^|]*).*?\\\\))", _op) %;\
    /if (a) \
        /let _op=$[replace({P1}, {P2}, _op)] %;\
    /endif %;\
    /test a := regmatch("(\\\\(([^|]*).*?\\\\))", _op) %;\
    /if (a) \
        /let _op=$[replace({P1}, {P2}, _op)] %;\
    /endif %;\
    /let _opis=$[replace("(", "(?:", _opis)] %;\
    /let _long=$(/list %_nazwa) %;\
    /let _long=$(/_z8 %_long) %;\
    /let _dz=$[substr(_long, strstr(_long, "/echo") + 6)] %;\
    /let _long=$[substr(_long, 0, strstr(_long, "/echo") - 4)] %;\
    /if ($(/list lecznicze) =/ strcat("*/echo ", _nazwa, "?%;*")) \
        /let _typ=lecznicze %;\
        /msg typ: lecznicze %;\
    /endif %;\
    /if ($(/list odtrutki) =/ strcat("*/echo ", _nazwa, "?%;*")) \
        /let _typ=odtrutki %;\
        /msg typ: odtrutki %;\
    /endif %;\
    /if ($(/list regenerujace) =/ strcat("*/echo ", _nazwa, "?%;*")) \
        /let _typ=regenerujace %;\
        /msg typ: regenerujace %;\
    /endif %;\
    /if ($(/list uniwersalne) =/ strcat("*/echo ", _nazwa, "?%;*")) \
        /let _typ=uniwersalne %;\
        /msg typ: uniwersalne %;\
    /endif %;\
    /if ($(/list nieznane) =/ strcat("*/echo ", _nazwa, "?%;*")) \
        /let _typ=nieznane %;\
        /msg typ: nieznane %;\
    /endif %;\
    /if ($(/list niesprawdzone) =/ strcat("*/echo ", _nazwa, "?%;*")) \
        /let _typ=niesprawdzone %;\
        /msg typ: niesprawdzone %;\
    /endif %;\
    /if ($(/list nietypowe) =/ strcat("*/echo ", _nazwa, "?%;*")) \
        /let _typ=nietypowe %;\
        /msg typ: nietypowe %;\
    /endif %;\
    /if ($(/list obojetne) =/ strcat("*/echo ", _nazwa, "?%;*")) \
        /let _typ=obojetne %;\
        /msg typ: obojetne %;\
    /endif %;\
    /if ($(/list trujace) =/ strcat("*/echo ", _nazwa, "?%;*")) \
        /let _typ=trujace %;\
        /msg typ: trujace %;\
    /endif %;\
    /if ($(/list wymarle) =/ strcat("*/echo ", _nazwa, " %;*")) \
        /let _typ=wymarle %;\
        /msg typ: wymarle %;\
    /endif %;\
    /if (!strlen(_typ)) \
        /let _typ=nieznane %;\
        /msg typ: nieznane %;\
    /endif %;\
    /echo "%_nazwa","%_op","%_opis","%_susz","%_typ","%_long","%_dz","","","","" %| /writefile -a ziola.db %;\
    /echo ziolo %_susz: %_nazwa opis: %_opis op: %_op typ: %_typ long: %_long dzialanie: %_dz

/def _ziola_make_db = \
    /quote -S /_ziola_make_db_one `/list -s _ziolo_*

/def pz = \
    /def -mregexp -t'^(.*?)\\\\s+[0-9]+ mt,\\\\s+[0-9]+ z,\\\\s+[0-9]+ s,\\\\s+[0-9]+ m' _przegladnij_ziola = \
;        /return substitute(
        /eval $$[strcat("/ziolo ", tolower({P1}))] %;\
    przejrzyj

/def woreczek = \
    /if ({*} =~ NULL) \
        /_ziola_powtorz /msg Zdefiniowany woreczek %%_i: %;\
    /else \
        /let _liczba=1 %;\
        /if (regmatch("[1-9]", {1})) \
            /let _liczba=%{1} %;\
            /shift %;\
        /endif %;\
        /if (strlen({*})) \
            /eval /set ogolne_woreczek_m_%{_liczba}=%{*} %;\
            /eval /set ogolne_woreczek_d_%{_liczba}=$(/_odmien_M_D %{*}) %;\
            /eval /msg Nowy woreczek %_liczba to %%ogolne_woreczek_m_%{_liczba} (%%ogolne_woreczek_d_%{_liczba}). %;\
        /else \
            /eval /unset ogolne_woreczek_m_%{_liczba} %;\
            /eval /unset ogolne_woreczek_d_%{_liczba} %;\
            /eval /msg Usunieto woreczek %_liczba. %;\
        /endif %;\
    /endif

/def _ziola_powtorz = \
    /if (!getopts("d", "")) /return 0%; /endif%; \
    /let _i=1 %;\
    /while ($(/listvar -v ogolne_woreczek_m_%_i) !~ NULL) \
        /eval /eval $$[strcat("%{*} ", {opt_d} ? ogolne_woreczek_d_%{_i} : ogolne_woreczek_m_%{_i})] %;\
        /test ++_i %;\
    /done

/def pakz = /pakowanie_ziol
/def pakowanie_ziol = \
    /_ziola_powtorz otworz %;\
    /_ziola_powtorz -d wez ziola z  %;\
    /_ziola_powtorz -d wloz ziola do  %;\
    /_ziola_powtorz ob %;\
    /_ziola_powtorz zamknij
  
/def szw_lecz = otworz pierwszy woreczek %;\
 wloz jasnopomaranczowe kwiaty do pierwszego woreczka %;\
 wloz male czerwone kwiaty pierwszego woreczka %;\
 wloz dziurawce do pierwszego woreczka %;\
 wloz pieciorniki do pierwszego woreczka

/def szw_zmecz = otworz drugi woreczek  %;\
 wloz okraglawe aromatyczne liscie do drugiego woreczka %;\
 wloz deliony do drugiego woreczka %;\
 wloz laki do drugiego woreczka %;\
 wloz nostrzyki do drugiego woreczka


/def zmecz = \
/echo zmeczm - mieta %;\
/echo zmeczn - nostrzyk %;\
/echo zmeczl - lak


;mieta - strasznie slaba teraz
/def zmeczm = otworz drugi woreczek %;\
 wez 5 aromatycznych lisci z drugiego woreczka %;\
 powachaj aromatyczne liscie %;\
 zamknij woreczki %;\
 stan

;nostrzyk
/def zmeczn = otworz drugi woreczek %;\
 wez 5 smuklych zielonych lodyg z drugiego woreczka %;\
 przezuj smukle zielone lodygi %;\
 zamknij woreczki %;\
 stan


; lak
/def zmeczl = otworz drugi woreczek %;\
 wez 5 sztywnych smuklych lodyg z drugiego woreczka  %;\
 przezuj sztywne smukle lodygi  %;\
 zamknij woreczki %;\
 stan


; leczenie totalne

/def leczt = otworz pierwszy woreczek %;\
 wez wszystkie ziola z pierwszego woreczka %;\
 przyloz jasnopomaranczowe kwiaty %;\
 rozgryz pieciorniki %;\
 rozgryz dziurawce %;\
 przezuj male czerwone kwiaty  %;\
 zamknij woreczki


/def lecz = \
/echo leczn - nagietki %;\
/echo leczp - pieciorniki %;\
/echo leczs - serce kapitana %;\
/echo leczd - dziurawce


;nagietek
/def leczn = otworz pierwszy woreczek %;\
 wez 5 jasnopomaranczowych kwiatow z pierwszego woreczka %;\
 przyloz jasnopomaranczowe kwiaty %;\
 zamknij woreczki %;\
 k

;pieciornik
/def leczp = otworz pierwszy woreczek %;\
 wez piec pieciornikow z niego %;\
 rozgryz pieciorniki %;\
 zamknij woreczki %;\
 k

;serce kapitana
/def leczs = otworz pierwszy woreczek %;\
 wez piec malych czerwonych kwiatow z pierwszego woreczka %;\
 przezuj male czerwone kwiaty %;\
 zamknij woreczki %;\
 k

;dziurawiec
/def leczd = otworz pierwszy woreczek %;\
 wez 5 dziurawcow z pierwszego woreczka %;\
 rozgryz dziurawce %;\
 zamknij woreczki %;\
 k


/def szz = szukaj ziol

/def szw =\
 otworz woreczek %;\
 wloz ziola do niego %;\
 zamknij woreczki

/def szww =\
 otworz drugi woreczek %;\
 wloz ziola do niego %;\
 zamknij woreczki

/def wob =\
 otworz woreczek %;\
 ob woreczek %;\
 zamknij woreczki

/def wobb =\
 otworz drugi woreczek %;\
 ob go  %;\
 zamknij woreczki


/def dew =\
 otworz drugi woreczek %;\
 wez delione z niego %;\
 zjedz delione %;\
 zamknij woreczki

/def wwe =\
 otworz woreczek %;\
 wez %* z woreczka %;\
 zamknij woreczki

/def wwwe =\
 otworz drugi woreczek %;\
 wez %* z niego %;\
 zamknij woreczki


