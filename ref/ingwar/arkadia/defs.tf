; Automagicly added line: tf_ver=1.0.3
;------------------------------------------------------------------------------
;|                           System i inne takie                              |
;------------------------------------------------------------------------------
/def ping = \
    /sys ping -i2 -c5 arkadia.rpg.pl

/def tfver = \
    /_echo%;\
    /echo -p -aCgreen Tiny Fugue Script for @{B}Arkadia @{n}version @{n}%{tf_version}%;\
    /echo -p -aCgreen Powered by @{n}Ingwar Swenson%;\
    /echo %;\
    /echo -p -aCgreen Ta wersja jest obcieta wersja przeznaczona do rozpowszechniania publicznego.%;\
    /echo -p -aCgreen Z tego powodu moze zawierac mase bledow i niedociagniec.%;\
    /_echo %;\
    /echo -p -aCgreen Wpisz "@{B}/pomoc@{n}" lub wcisnij "@{B}F1@{n}" azeby uzyskac @{BCwhite}Pomoc@{nCgreen}!

/def apropos = \
    /if ({1}=/"-*") \
      /let _opt=%{1} %;\
      /shift %;\
    /endif %;\
    /if ({*}=~NULL & {_opt}=~NULL) \
      /echo Apropos what?? %;\
    /else \
      /let __apropos=0 %;\
      /list %{_opt} *%{*}* %;\
      /let __apropos=$[{__apropos}+{?}] %;\
      /list %{_opt} -t'*%{*}*' %;\
      /let __apropos=$[{__apropos}+{?}] %;\
      /list %{_opt} =*%{*}* %;\
      /let __apropos=$[{__apropos}+{?}] %;\
      /if ( {*}!~NULL) \
        /listvar *%{*}* %;\
        /let __apropos=$[{__apropos}+{?}] %;\
      /endif %;\
      /if ({__apropos}==0) \
        /echo Nothing appriopriate. %;\
      /endif %;\
    /endif 
  
/def rec = \
    /if ({1}=/"-*") \
      /let _opt=$[substr({1},1)] %;\
      /shift %;\
    /endif %;\
    /recall -q -mregexp -t /%{_opt-10} %* %;\
    /if ({?}==0) \
      /echo Nie znalazlem pasujacych linii!! %;\
    /endif

/purge -i pid_of
/def -i pid_of = \
    /quote -S \
      /eval /let pid_czego=`"/@ps -r" %%;\
      /if (strstr({pid_czego},{*}) != -1) \
        /first %%{pid_czego} %%;\
      /endif %;\

/def rstart = \
    /if ($(/pid_of %{-2})=~NULL) \
      /repeat %{1} %{2} %{-2} %;\
    /endif

/def rstop = \
    /kill $(/pid_of %{*})

; Wyswietlanie wszystkich komend ktore moga byc uzyteczne..
; narazie nie ma sensu tego uzywac.. jak ktos wymysli sensowny sposob 
; wyswiatlania to trza bedzie dorobic

/def allcmd = \
    /quote -S /last `"/list -s -mregexp -h0 -t'^$$$$' ^[^_~]"

;"
; Probka zmiany standartowego loada..
; fajna tylko za wolno dziala..
; Moze kiedys go wlacze na stale
/purge -i _load_licz
/def -i _load_licz = \
    /test ++_load_licz

/purge -i iload
/def -i iload = \
    /if (!getopts("qv", "")) /return 0%; /endif%; \
    /if ({opt_v}) \
      /purge _load_%{1} %;\
      /def -1 -ag -h'LOAD' _load_%{1} %;\
      /set _load_licz=0 %;\
      /quote -S /_load_licz `/list -i -s %;\
      /let _load_licz_defs=%{_load_licz} %;\
      /set _load_licz=0 %;\
      /quote -S /_load_licz `/list -mglob -h0 -b -s %;\
      /let _load_licz_bind=%{_load_licz} %;\
      /set _load_licz=0 %;\
      /quote -S /_load_licz `/list -mglob -h0 -b{} -t -an -s %;\
      /let _load_licz_trig=%{_load_licz} %;\
      /set _load_licz=0 %;\
      /quote -S /_load_licz `/list -I -s %;\
      /let _load_licz_invi=%{_load_licz} %;\
      /set _load_licz=0 %;\
      /quote -S /_load_licz `/list -s -mregexp -h0 -t'^$$$$' ^[^_~] %;\
      /let _load_licz_comm=%{_load_licz} %;\
      /set _load_licz=0 %;\
      /quote -S /_load_licz `/list -s -h %;\
      /let _load_licz_hook=%{_load_licz} %;\
      /@load %{1} %;\
      /if ({?}==0) \
        /purge _load_%{1} %;\
        /return %;\
      /else %;\
        /set _load_licz=0 %;\
        /quote -S /_load_licz `/list -i -s %;\
        /let _load_licz_defs=$[{_load_licz}-{_load_licz_defs}+1] %;\
        /set _load_licz=0 %;\
        /quote -S /_load_licz `/list -mglob -h0 -b -s %;\
        /let _load_licz_bind=$[{_load_licz}-{_load_licz_bind}] %;\
        /set _load_licz=0 %;\
        /quote -S /_load_licz `/list -mglob -h0 -b{} -t -s %;\
        /let _load_licz_trig=$[{_load_licz}-{_load_licz_trig}] %;\
        /set _load_licz=0 %;\
        /quote -S /_load_licz `/list -I -s %;\
        /let _load_licz_invi=$[{_load_licz}-{_load_licz_invi}] %;\
        /set _load_licz=0 %;\
        /quote -S /_load_licz `/list -s -mregexp -h0 -t'^$$$$' ^[^_~] %;\
        /let _load_licz_comm=$[{_load_licz}-{_load_licz_comm}] %;\
        /set _load_licz=0 %;\
        /quote -S /_load_licz `/list -s -h %;\
        /let _load_licz_hook=$[{_load_licz}-{_load_licz_hook}+1] %;\
        /let _load_=$[pad({_load_licz_defs}, 4, "@{n} defs @{B}", 1, {_load_licz_comm}, 4, "@{n} commands @{B}", 1, {_load_licz_bind}, 4, "@{n} binds @{B}", 1, {_load_licz_trig},4, "@{n} trigs @{B}", 1, {_load_licz_hook},4, "@{n} hooks @{B}", 1, {_load_licz_invi}, 4, "@{n} invis", 1)] %;\
        /echo -p Loading @{B}$[pad({1},15)]@{n} - @{B}%{_load_}@{n}! %;\
        /purge _load_%{1} %;\
      /endif %;\
    /elseif ({opt_q}) \
	/@load -q %{*} %;\
    /else \
	/@load %{*} %;\
    /endif

/def defs = \
    /set _load_licz=0 %;\
    /quote -S /_load_licz `/list -i -s %;\
    /let _load_licz_defs=$[{_load_licz}-{_load_licz_defs}+1] %;\
    /set _load_licz=0 %;\
    /quote -S /_load_licz `/list -mglob -h0 -b -s %;\
    /let _load_licz_bind=$[{_load_licz}-{_load_licz_bind}] %;\
    /set _load_licz=0 %;\
    /quote -S /_load_licz `/list -mglob -h0 -b{} -t -s %;\
    /let _load_licz_trig=$[{_load_licz}-{_load_licz_trig}] %;\
    /set _load_licz=0 %;\
    /quote -S /_load_licz `/list -I -s %;\
    /let _load_licz_invi=$[{_load_licz}-{_load_licz_invi}] %;\
    /set _load_licz=0 %;\
    /quote -S /_load_licz `/list -s -mregexp -h0 -t'^$$$$' ^[^_~] %;\
    /let _load_licz_comm=$[{_load_licz}-{_load_licz_comm}] %;\
    /set _load_licz=0 %;\
    /quote -S /_load_licz `/list -s -h %;\
    /let _load_licz_hook=$[{_load_licz}-{_load_licz_hook}+1] %;\
    /let _load_=$[pad({_load_licz_defs}, 4, "@{n} defs @{B}", 1, {_load_licz_comm}, 4, "@{n} commands @{B}", 1, {_load_licz_bind}, 4, "@{n} binds @{B}", 1, {_load_licz_trig},4, "@{n} trigs @{B}", 1, {_load_licz_hook},4, "@{n} hooks @{B}", 1, {_load_licz_invi}, 4, "@{n} invis", 1)] %;\
    /echo -p All @{B}%{_load_}@{n}! %;\

;------------------------------------------------------------------------------
;|                           Standartowe definicje                            |
;------------------------------------------------------------------------------

/def men = \
    ob mezczyzne %;\
    ob drugiego mezczyzne %;\
    ob trzeciego mezczyzne %;\
    ob czwartego mezczyzne

/def we = \
    wesprzyj %{*} %;\
    /if ({bron_dobyta}==0) \
      /_echo >>>>>>****** WALCZYSZ BEZ BRONI!!! ******<<<<<< %;\
    /endif

/def v = \
    /wem %;\
    kup bilet %;\
    wsiadz na statek %;\
    /wlm

/def zs = \
    zsiadz ze statku

/def s = \
    zapukaj w skale

/def kk = \
    krzyknij %{*}

/def pyt = \
    /if ({*}=/"* o *") \
      zapytaj %{*} %;\
    /elseif ({*}=/"* o") \
      /echo -p -aCgreen Chyba chcesz sie zapytac @{B}_o_@{n} cos? %;\
    /else \
      zapytaj %{*-mezczyzne} o prace %;\
      zapytaj %{*-mezczyzne} o zadanie %;\
      zapytaj %{*-mezczyzne} o zlecenie %;\
      zapytaj %{*-mezczyzne} o pomoc %;\
    /endif

/def por = /c %{*}
/def c = \
    /if ({*}=/"* i *") \
      /let _kim_=%{*} %;\
    /else \
      /let _kim_=z %{*-mezczyzna} %;\
    /endif %;\
    porownaj sile %{_kim_} %;\
    porownaj zrecznosc %{_kim_} %;\
    porownaj wytrzymalosc %{_kim_}

/def kj = \
    przedstaw sie %{*}

/def sk = \
    /if ({*}=~NULL) \
      sp na skrzynie %;\
    /else \
      wez %{*} ze skrzyni %;\
    /endif

/def ks = \
    /if ({*}=~NULL) \
      sp na kosz %;\
    /else \
      wez %{*} z kosza %;\
    /endif

/def dsk = \
    wloz %{*} do skrzyni

/def dks = \
    wloz %{*} do kosza
    
/def mur = \
    wespnij sie na mur

/def beczki = \
    przeslizgnij sie miedzy beczkami

/def st = \
    sp na tablice

/def stt = \
    sp na tabliczke

/def pt = \
    przeczytaj tablice

/def ptt = \
    przeczytaj tabliczke

/def ta = \
    sp na tablice %;\
    sp na tabliczke %;\
    przeczytaj tablice %;\
    przeczytaj tabliczke %;\
    przeczytaj menu

/def pd = \
    porzuc druzyne

/def zap = \
    zapros %{*}

/def d = \
    dolacz do %{*}

/def porz = \
    porzuc %{*}

/def ja = \
    sp na siebie

/def statua = /ocs
/def ocs = \
    poklon sie statui

/def czacha = /pc
/def pc = \
    przekrec czaszke

/def z = \
    zapukaj we wrota %;\
    zadzwon %;\
    pociagnij sznur

/def szcz = \
    n %;\
    wejdz w szczeline

/def p = \
    przejrzyj %{*}

/def ocena = \
    ocen sile %;\
    ocen zrecznosc %;\
    ocen wytrzymalosc %;\
    ocen inteligencje %;\
    ocen madrosc %;\
    ocen odwage

/def gil = \
    usiadz %;\
    medytuj %;\
    /ocena %;\
    powstan

/def psm = \
    policz srebrne monety

/def pzm = \
    policz zlote monety

/def pmm = \
    policz miedziane monety

/def zam = \
    zamien srebro i miedz na zloto

/def ce = \
    cechy

/def puk = \
    /for i 1 5 kopnij pukacza

/def wod = \
    wejdz do wody %;\
    przejdz przez wodospad

/def szka = \
    zajrzyj do szkatulki

/def pnacze = /liana
/def liana = \
    zlap za pnacze %;\
    przeskocz nad pulapka

/def czolgn = \
    przeczolgaj sie na polnoc

/def czolgs = \
    przeczolgaj sie na poludnie 


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
    /_echo +-=====================================+=====================================-+%;\

;-----------------------------------------------------------------------------
;|                      MANIPULOWANIE SWIATLEM                               |
;-----------------------------------------------------------------------------
/def swiatloswitch = \
    /if ({swiatlo}==0) \
        /if ({ogolne_swiatlo}=~"lampa") \
    	    /zpl %;\
        /else \
    	    /zpp %;\
        /endif %;\
    /else \
        /if ({ogolne_swiatlo}=~"lampa") \
    	    /zgl %;\
        /else \
    	    /zgp %;\
        /endif %;\
    /endif

/def swiatlo = \
    /if ({*}=/"l*") \
        /set ogolne_swiatlo=lampa %;\
        /echo -p Dobra nie bedziesz swiecil oczami tylko "@{B}lampa@{n}". %;\
    /elseif ({*}=/"p*") \
        /set ogolne_swiatlo=pochodnia %;\
        /echo -p Dobra nie bedziesz swiecil oczami tylko "@{B}pochodnia@{n}". %;\
    /else \
        /echo Uzycie: /swiatlo <lampa|pochodnia> %;\
    /endif


/def _lampa+ = \
    /rstart -80 100 napelnij lampe olejem %;\
    /set swiatlo=1

/def _lampa- = \
    /rstop napelnij lampe olejem %;\
    /set swiatlo=0

/def _pochodnia+ = \
    /set swiatlo=1

/def _pochodnia- = \
    /set swiatlo=0

/def nl = /nlo
/def nlo = \
    napelnij lampe olejem

/def zp = /zpp
/def zpp = \
    zapal pochodnie

/def zg = /zgp
/def zgp = \
    zgas zapalona pochodnie 

/def zl = /zpl
/def zpl = \
    zapal lampe

    
/def zgl = \
    zgas zapalona lampe


/def -t'*Zapalasz *lampe.*'  				_lampa_trig_1 = \
    /_lampa+

/def -t'*Gasisz *lampe.*'  				_lampa_trig_2 = \
    /_lampa-

/def -t'*lampa wypala sie i gasnie.*'  			_lampa_trig_3 = \
    /nlo %;\
    /zpl %;\
    /_lampa-

/def -t'*Probujesz zapalic *lampe, ale ci sie*' 	_lampa_trig_4 = \
    /_lampa- %;\
    /if ($(/_czesto)) %;\
        /return %; %;\
    /endif %;\
    /nlo %;\
    /zpl

/def -t'*Woda szybko gasi zapalona *lampe.*' 		_lampa_trig_5 = \
    /_lampa-

/def -t'*Lampa jest juz pelna*'				_lampa_trig_6 = \
    /_lampa-

/def -t'*Napelnij lampe czym*'			 	_lampa_trig_7 = \
    /_lampa-

/def -t'*Napelnij co?*'				 	_lampa_trig_8 = \
    /_lampa-

/def -t'*Zgas co?*'				 	_lampa_trig_9 = \
    /_lampa-

/def -t'*Zapalasz *{*luczywo*|*pochodnie*}*'  		_pochodnia_trig_1 = \
    /_pochodnia+

/def -t'*{*pochodnia*|*luczywo*|*lampa*}* juz jest zapalon*' _pochodnia_trig_2 = \
    /_pochodnia+

/def -t'*Gasisz *{*luczywo*|*pochodnie*}*'  		_pochodnia_trig_3 = \
    /_pochodnia-

/def -t'*{*luczywo*|*pochodnia*} wypala sie i gasnie.*'	_pochodnia_trig_4 = \
    odloz wypalone pochodnie %;\
    /zpp %;\
    /_pochodnia-

/def -h'SEND napelnij *lampe*' _butelka_hook = \
    /purge _butelka_trig %;\
    /def -FaB -t'*Butelka oleju jest pusta*' 		_butelka_trig = \
      odloz butelke %%;\
      wez butelke z %{ogolne_plecaka-placaka} %%;\
      /nlo %%;\
      /zpl %;\
    /send %{*} %;\
    /rstart -5 1 /purge _butelka_trig


;------------------------------------------------------------------------------
;|                            UBIERANIE SIE                                   |
;------------------------------------------------------------------------------

/def -mregexp -t'Dobywasz (prawa reka|lewa reka|oburacz) (.*)\\.' _trig_dobywasz = \
    /if ({P2}!~{ogolne_broni} & {ogolne_zapamietuj_bronie}==1) \
      /nb %{P2} %;\
    /endif %;\
    /set bron_dobyta=1

/def -mregexp -t'Dobywasz (.*) (prawa reka|lewa reka|oburacz)\\.' _trig_dobywasz_2 = \
    /if ({P1}!~{ogolne_broni} & {ogolne_zapamietuj_bronie}==1) \
      /nb %{P1} %;\
    /endif %;\
    /set bron_dobyta=1

/def -mregexp -t'Opuszczasz (.*)\\.' _trig_opuszczasz = \
    /if ({P1}!~{ogolne_bron} & {P1}!~"realny swiat" & {ogolne_zapamietuj_bronie}==1) \
      /nbt %{P1} %;\
    /endif %;\
    /set bron_dobyta=0

/def -mregexp -t'Zakladasz na plecy (otwarty|zamkniety) (.*)\\.' _trig_zakladasz_plecak = \
    /if ({P2}!~{ogolne_plecak} & {ogolne_zapamietuj_bronie}==1) \
      /test plecak("%{P2}") %;\
    /endif

; trza by wyymyslic im jakies nazwy ale narazie moga byc..
/def autoalarm+ = \
    /set ogolne_zapamietuj_bronie=1 %;\
    /echo -p ####### Od teraz bedziesz zapamietywal bronie i przedmioty (do zmiany!) #######

/def autoalarm- = \
    /set ogolne_zapamietuj_bronie=0 %;\
    /echo -p ####### Od teraz NIE bedziesz zapamietywal broni i przedmiotow (do zmiany!) #######
;------------------------------------------------------------

/def nb = \
    /set ogolne_broni=%{*-%{ogolne_broni}} %;\
    /echo -p ####### Od teraz bedziesz dobywal: "@{BCgreen}%{ogolne_broni}@{nCwhite}" #######

/def nbt = \
    /set ogolne_bron=%{*-%{ogolne_bron}} %;\
    /echo -p ###### Od teraz do "@{B}%{ogolne_temblak-Temblaka}@{n}" bedziesz uzywal: "@{BCgreen}%{ogolne_bron}@{nCwhite}" #######

/def nt = \
    /set ogolne_temblak=%{*} %;\
    /echo -p ##### Od teraz bronie bedziesz wkladal do "@{B}%{ogolne_temblak}@{n}" ######

/def plecak = \
    /set ogolne_plecak=%{1-plecak} %;\
    /set ogolne_plecaka=%{2-plecaka} %;\
    /echo -p ##### Od teraz na plecy bedziesz zakladal "@{BCyellow}%{ogolne_plecak} (%{ogolne_plecaka})@{nCwhite}" ######

/def monety = \
    /set ogolne_pojemnik_monety=%{*-plecaka} %;\
    /echo -p ##### Od teraz na monety bedziesz wkladal do "@{BCyellow}%{ogolne_pojemnik_monety}@{nCwhite}" ######

/def db = \
    /if ({ogolne_bron}!~NULL & {ogolne_temblak}!~NULL) \
      powyjmij %{ogolne_bron} z %{ogolne_temblak} %;\
    /endif %;\
    dobadz %{ogolne_broni}

/def op = \
    opusc bronie %;\
    /if ({ogolne_bron}!~NULL & {ogolne_temblak}!~NULL) \
      powsun %{ogolne_bron} do %{ogolne_temblak} %;\
    /endif

/def np = \
    napelnij %{ogolne_plecak-plecak}

/def pl = \
    oproznij %{ogolne_plecak-plecak}

/def yy = \
    zdejmij wszystkie zbroje %;\
    /op %;\
    /np %;\
    /ub

/def y = \
    zdejmij wszystkie zbroje %;\
    /np %;\
    /ub

/def u = \
    wez bronie z %{ogolne_plecaka-plecaka} %;\
    /db %;\
    /purge _auto_ubieranie

/def uu = \
    /pl %;\
    /db %;\
    zaloz wszystkie zbroje %;\
    /purge _auto_ubieranie

/def zal = \
    zaloz wszystko

/def zde = \
    zdejmij wszystko

/def ub = \
    /purge _auto_ubieranie %;\
    /def -aB -p35 -1 -F -t"*{muska cie|rani cie} *" _auto_ubieranie=/uu %;\
    /echo **** Ubieram sie jak ktos mnie zrani!! ****

/def zmien = \
    zdejmij %{*} %;\
    zaloz %{*}

/def ww = \
    wez wszystko %{*}

/def kol = \
    koumiesc kolczyk w lewym uchu %;\
    koumiesc drugi kolczyk w prawym uchu %;\
    koumiesc trzeci kolczyk w nosie

/def sa = \
    /if ({bron_dobyta}==1) \
      sprzedaj wszystko %;\
    /else \
      /echo >>>>>>****** NAJPIERW DOBADZ BRONI ******<<<<<< %;\
    /endif

/def saa = \
    sprzedaj wszystko

/def qw = \
    /let co_brac=%{*-wszystko} %;\
    wez %{co_brac} z ciala %;\
    wez %{co_brac} z drugiego ciala %;\
    wez %{co_brac} z trzeciego ciala %;\
    wez %{co_brac} z czwartego ciala %;\
    wez %{co_brac} z piatego ciala

/def q = \
    /qw %{*} %;\
    wez %{*-monety} %;\
    /np

/def w = \
    /qw %;\
    wez monety %;\
    /wb %;\
    /wz %;\
    /np

/def wb = \
     wez wszystkie bronie

/def wz = \
    wez wszystkie zbroje

/def wem = \
    wez monety z %{ogolne_pojemnik_monety-plecaka}

/def wlm = \
    wloz monety do %{ogolne_pojemnik_monety-plecaka}

;------------------------------------------------------------------------------
;|			    NAPRAWIANIE RZECZY				      |
;------------------------------------------------------------------------------


;------------------------------------------------------------------------------
;|                              OPCJE                                         |
;------------------------------------------------------------------------------

/def kro = \
    opcje krotkie +

/def dlu = \
    opcje krotkie -

/def okw = \
    opcje krotkie wylacz

/def okww = \
    opcje krotkie wlacz

/def nwal = \
    opcje opisywanie wylacz

/def twal = \
    opcje opisywanie wlacz

/def szer = \
    opcje szerokosc %{*}

/def wys = \
    opcje wysokosc %{*}


/def nig = \
    opcje uciekaj nigdy %;\
    /echo ****** Hmmmm.... czy wiesz ze.... ty nie uciekasz NIGDY!!! ******  

/def led = \
    opcje uciekaj ledwo zywy %;\
    /echo **** Oj... duze ryzyko ..... - bedziesz uciekal przy : LEDWO ZYWY! ******

/def cie = \
    opcje uciekaj ciezko ranny %;\
    /echo ******* Twoja ucieczka - przy Ciezko ranny.... ******

/def zla = \
    opcje uciekaj w zlej kondycji %;\
    /echo ******* Twoja ucieczka - przy Zlej Kondycji....  cieniawo .... ******

/def ran = \
    opcje uciekaj ranny %;\
    /echo ****************** Nie badz blaznem !!!!!!! **********************

/def lek = \
    opcje uciekaj lekko ranny %;\
    /echo ****************** Nie badz blaznem !!!!!!! **********************

/def dob = \
    opcje uciekaj w dobrym stanie %;\
    /echo ****************** Nie rob ze siy ylfa !!!!!!! **********************

/def swi = \
    opcje uciekaj w swietnej kondycji %;\
    /echo ************* Zachowujys siy jak zniewiyscialy ylf !!!! *************

;------------------------------------------------------------------------------
;|                     Testowanie roznych codow niewidow :)                   |
;------------------------------------------------------------------------------

;------------------------------------------------------------------------------
;|                     Szybkobiegi (sciezki)                                  |
;------------------------------------------------------------------------------
