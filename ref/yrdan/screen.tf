; ## Linie dodane automagicznie   : tf_ver=1.0.6
; ## 
; ## Wersja pliku                 : 1.0.6
; ## Ostatnia zmiana pliku        : 2004-05-22 12:46:49
; ## Plik pobrany                 : 2004-05-22 14:52:29
; ## 
; ##


/def _screen_start = \
    /if ({ogolne_screen} > 2) \
      /rstart -30 1 /_screen_base %;\
    /endif

/_screen_start

/def _screen_base = \
    /let czas_screena=$(/rand 60 300)%;\
    /let czas_idla=$[sidle()] %;\
    /if ({czas_idla} > 180 & ({ogolne_screen}==3 | {ogolne_screen}==4)) \
      /let numer_screena=$(/rand %{ogolne_screen_od-1} %{ogolne_screen_do-30}) %;\
      /if ({ogolne_screen}==2 | {ogolne_screen}==4) \
    	/send -n ! %;\
      /endif %;\
      /_screen_%{numer_screena} %;\
    /endif %;\
    /repeat -%{czas_screena} 1 /_screen_base

/def screen = \
    /if ({1}=~"on") \
      /set ogolne_screen=3 %;\
      /echo Wlaczam Screena!! %;\
      /rstart -30 1 /_screen_base %;\
    /elseif ({1}=~"off") \
      /set ogolne_screen=1 %;\
      /echo Wylaczam Screena!! %;\
      /rstop /_screen_base %;\
    /else \
      /if ({1}!~NULL) \
        /set ogolne_screen_od=%{1} %;\
      /endif %;\
      /if ({2}!~NULL) \
        /set ogolne_screen_do=%{2} %;\
      /endif %;\
      /echo Powtarzam komendy od %{ogolne_screen_od-1} do %{ogolne_screen_do-30}!!! %; \
    /endif

/def _screen_off = \
    /eval /test ++ogolne_screen %;\
    /echo Widze ze zaczoles pisac!!!

/def _screen_on = \
    /eval /test --ogolne_screen %;\
    /echo Dobra koniec tego dobrego.. trza sie wziasc za walke.

/def -q -mregexp -h'PROMPT (Podaj tytul notki|Adresat:|Subject:)' _poczatek_pisania_list = \
    /if (ogolne_screen==1 | ogolne_screen==3) \
      /_screen_off %;\
      /def -1 -h'PROMPT *>*' koniec_pisania = /_screen_on %;\
    /endif

/def -mregexp -t'(Napisz swoja wiadomosc|Wpisz .*, zeby uzyskac pomoc, lub|Enter your message|Extended editor!)' _poczatek_pisania_golab = \
    /if (ogolne_screen==1 | ogolne_screen==3) \
      /_screen_off %;\
      /def -1 -h'PROMPT >*' koniec_pisania = /_screen_on %;\
    /endif


/def _screen_0= namysl sie
/def _screen_1= sp
/def _screen_2= um
/def _screen_3= usmiech posepnie
/def _screen_4= sp na siebie
/def _screen_5= rozejrzyj sie pewnie
/def _screen_6= kto
/def _screen_7= cechy
/def _screen_8= hmm
/def _screen_9= podrap sie po nosie
/def _screen_10= kondycja wszystkich
/def _screen_11= podrap sie po zadku
/def _screen_12= podrap sie po plecach
/def _screen_13= czknij
/def _screen_14= kichnij
/def _screen_15= pierdnij
/def _screen_16= przelknij
/def _screen_17= podrepcz
/def _screen_18= przestap
/def _screen_19= potrzyj
/def _screen_20= podlub
/def _screen_21= napij sie z kubka
/def _screen_22= napij sie z kubka
/def _screen_23= kgzamysl sie
/def _screen_24= kgoczysc brode
/def _screen_25= smarknij
/def _screen_26= smarknij
/def _screen_27= podrap sie po glowie
/def _screen_28= popatrz
/def _screen_29= sapnij .
/def _screen_30= usmiech ciezko
/def _screen_31= lam
/def _screen_32= lam 
/def _screen_33= lam
/def _screen_34= lam
/def _screen_35= popatrz krwawo
/def _screen_36=
/def _screen_37=
/def _screen_38=
/def _screen_39=
/def _screen_40=smile
/def _screen_41=
/def _screen_42=
/def _screen_43=
/def _screen_44=
/def _screen_45=
/def _screen_46=
/def _screen_47=
/def _screen_48=
/def _screen_49=
/def _screen_50=
/def _screen_51=
/def _screen_52=
/def _screen_53=
/def _screen_54=
/def _screen_55=
/def _screen_56=
/def _screen_57=
/def _screen_58=
/def _screen_59=
/def _screen_60=
