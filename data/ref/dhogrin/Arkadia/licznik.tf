/loaded licznik.tf
; ==============================================================================
; = Licznik moich ofiar + zbieranie z cial
; ==============================================================================
;
; *******************************************************************
; * v1.0
; * (c) YaaL 2003
; *******************************************************************
;
; Licznik zabitych stworow autorstwa YaaL, poprawiony nieco przeze mnie.
; Komendy: /zabici, /dzisiaj.
; /zabici pokazuje zabitych calkowicie podczas Twojej wladczej gry w Arkadie
; natomiast komenda /dzisiaj wyswietli zabitych przez Ciebie w dzisiejszym dniu
; Przerobione na v1.1, Bagrum.

/def -i doeach = \
  /let _cmd=%1%; \
  /while (shift(), {#}) \
      /eval %_cmd %%1%; \
  /done
;/set banner=@{BCyellow}###@{n}
;/def echo=/test $[echo(strcat({banner}, ' ', {*}), '', 1)]

; gdzie zapisujemy dane licznika
/set licznik_ofiar=~/tf/Arkadia/licznik_ofiar.data

/def -Fp10 -mregexp -t'^(> )*Zabil(a|e)s( [^ ]+)* ([^ ]+)\.$'  killed = \
  /test ++_licznik_%{P4}%;\
  /test ++_sesja_%{P4}%;\
  /test ++_suma_licznik %; \
  /eval /substitute -p %{PL}@{xBCred}%{P0}@{nBCgreen} (%%{_sesja_%P4}/%%{_licznik_%P4}/%%{_suma_licznik})%;\
  /zapisz_licznik -q%;\
; /hiena %{P4}

/def zabici = \
  /set _suma_sesja=0%;\
  /set _suma_licznik=0%;\
  /echo +================================+%;\
  /echo |   Licznik ofiar  (sesja/razem) |%;\
  /echo +================================+%;\
  /doeach /wyswietl_ofiare $(/listvar -s _licznik_*)%;\
  /echo +--------------------------------+%;\
  /echo |           razem:  $[pad(_suma_sesja,5)]/$[pad(_suma_licznik, 5)]  |%;\
  /echo +--------------------------------+

/def wyswietl_ofiare = \
  /let nazwa=$[substr({1},9)]%;\
  /let sesja=$(/listvar -v $[strcat("_sesja_",substr({1},9))])%;\
  /if (sesja<1) \
    /let sesja=0%;\
  /endif%;\
  /let razem=$(/listvar -v %1)%;\
  /test _suma_sesja:=%{_suma_sesja}+%{sesja}%;\
  /test _suma_licznik:=%{_suma_licznik}+%{razem}%;\
  /echo | $[pad(nazwa,15)]:  $[pad(sesja, 5)]/$[pad(razem,5)]  |

  
  
/def dzisiaj = \
  /set _suma_sesja=0%;\
  /echo +================================+%;\
  /echo |   Ofiary dzisiaj (sesja/razem) |%;\
  /echo +================================+%;\
  /doeach /wyswietl_dzisiejsze $(/listvar -s _sesja_*)%;\
  /echo +--------------------------------+%;\
  /echo |           razem:  $[pad(_suma_sesja,5)]/$[pad(_suma_licznik, 5)]  |%;\
  /echo +--------------------------------+
  
/def wyswietl_dzisiejsze = \
  /let nazwa=$[substr({1},7)]%; \
  /let licznik=$(/listvar -v $[strcat("_licznik_",substr({1},7))])%;\
  /let razem=$(/listvar -v %1)%;\
  /test _suma_sesja:=%{_suma_sesja}+%{razem}%;\
  /echo | $[pad(nazwa,15)]:  $[pad(razem, 5)]/$[pad(licznik,5)]  |


/def zapisz_licznik = \
  /if (!getopts("q", "")) /return 0%;/endif%; \
  /if ((uchwyt:=tfopen(licznik_ofiar, "w")) <0) \
    /return 0%; \
    /echo Blad zapisu licznika ofiar do pliku %{licznik_ofiar}!%; \
  /endif%;\
  /test tfflush(uchwyt, 0)%; \
  /doeach /nagraj_ofiare $(/listvar -s _licznik_*)%;\
  /test tfclose(uchwyt)%;\
  /if (!opt_q) /echo Dane licznika ofiar zostaly pomyslnie zapisane do pliku %{licznik_ofiar}.%;/endif

/def nagraj_ofiare = \
 /test tfwrite(uchwyt, strcat(substr({1},9), ':',$(/listvar -v %1)))


/def wczytaj_licznik = \
  /if ((uchwyt:=tfopen(licznik_ofiar, "r")) <0) \
    /return 0%; \
    /echo Nie moge otworzyc pliku %{licznik_ofiar}!%; \
  /endif%;\
  /while (tfread(uchwyt, tmpik) >= 0) \
    /let ofiara=$[substr(tmpik,0,strchr(tmpik, ':'))]%;\
    /let wartosc=$[substr(tmpik, strchr(tmpik, ':')+1)]%;\
    /set _licznik_%{ofiara}=%{wartosc}%;\
  /done%;\
  /test tfclose(uchwyt)%;\
;  /echo Dane licznika ofiar zostaly pomyslnie wczytane z pliku %{licznik_ofiar}.

/def ustaw_licznik = \
 /set _suma_licznik=$(/suma $(/listvar -v _licznik_*))

/def suma = \
 /let x=0%; \
   /while ({#}) \
     /test ({x}:={x}+{1}) %;\
   /shift %;\
 /done %; \
 /result {x} 

/wczytaj_licznik
/ustaw_licznik

; *******************************************************************
; * hiena
; *******************************************************************
; standardowo zgarniamy zaleznie od tego, kto padl
; tryb 'hiena cmentarna' to zbieranie wszystkiego
/set hiena=0
/def aweon  = /echo Hiena cmentarna uaktywniona. %;\
              /set hiena=1
/def aweoff = /set hiena=0%;\
              /echo Hiena cmentarna wylaczona.

/def hiena =\
  /if (hiena==1)\
    wez wszystko z ciala%;\
  /elseif ({#}==1 & ascii(substr({*},0,1)) <97)\
    wez kamienie z ciala %; wez monety z ciala%;\
  /elseif ({1}=~'trolla' | {1}=~'grzyboczleka' | {1}=~'potepienca') \
    wez kamien z ciala%;\
  /else \
    wez monety z ciala%;\
  /endif
