; ## Linie dodane automagicznie   : tf_ver=1.0.6
; ## 
; ## Wersja pliku                 : 1.0.6
; ## Ostatnia zmiana pliku        : 2004-05-22 12:46:49
; ## Plik pobrany                 : 2004-05-22 14:52:29
; ## 
; ##



/def gl=/gluderz %{*}
/def gluderz = \
    /if ({*}=~"off") \
      /set ogolne_gluderz=0 %;\
      /echo No i co to ma znaczyc.. Teraz to juz nie bedzie zabawy.. %;\
    /elseif ({*}=~"on") \
      /set ogolne_gluderz=1 %;\
      /echo Dobra napierdzielam tarcza co popadnie... %;\
    /elseif ({*}=~NULL) \
      /if ({ogolne_gluderz}==1) \
        /set ogolne_gluderz=0 %;\
        /echo No i co to ma znaczyc.. Teraz to juz nie bedzie zabawy.. %;\
      /else \
        /set ogolne_gluderz=1 %;\
        /echo Dobra napierdzielam tarcza co popadnie... %;\
      /endif %;\
    /else \
      /echo Uzycie: /gluderz [on|off] %;\
    /endif

/def glop = \
    /set ogolne_gluderz_opoznienie=%{1-2} %;\
    /echo -p -aCgreen Opuznienie przy oderzaniu tarcza ustawione na mniej niz "@{B}%{1-2}@{n}" sekundy!!
					  
/def _gluderz = \
  /rstart -$[rand({ogolne_gluderz_opoznienie-2})] 1 gluderz

;/def -aB -t'**' _gladsi_uderz1 =\
;    /set gluderz=1

;/def -aBCmagenta -t'**' _gladsi_uderz2 =\
;    /set gluderz=1

/def -aB -t'*Jestes goto* do wyprowadzenia kolejnego ciosu*' _gladsi_uderz3 =\
    /set gluderz=0 %;\
    /_gluderz

/def -t'*atakuje cie!*' _gladsi_uderz4 =\
    /_gluderz

/def -t'*koncentruje sie na walce z toba*' _gladsi_uderz5 =\
    /repeat -1 1 /_gluderz %;\
    /repeat -1 2 /_gluderz

/def -h'SEND {zabij|wesprzyj} *' _gladsi_uderz6 =\
    /send %{*} %;\
    /_gluderz


