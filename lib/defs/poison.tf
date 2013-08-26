;------------------------------------------------------------------------
;			   ... TRUCIZNY ... 				|
;------------------------------------------------------------------------

/set _trucizna_liczba=0

/def -F -aCred -mregexp -t'Zostales (zatruty|otruty)!' _trucizna_poczatek = \
  /set _trucizna_liczba=$[{_trucizna_liczba}+1]%; \
  /substitute %{P0} x %{_trucizna_liczba}


/def -F -aCgreen -mregexp -t'Czujesz sie znacznie lepiej\.|Trucizna zostala zn[ae]utralizowana przez twoj organizm\.' _trucizna_koniec = \
  /set _trucizna_liczba=$[{_trucizna_liczba}-1]%; \
  /substitute %{P0} x %{_trucizna_liczba}



/def -agL -mregexp -t'Twarz (.*) przecina spazm bolu(\.|, wiec trucizna musi juz plonac  w [^ ]+ zylach\.)' _krwisty_zatrul = \
  /echo%; \
  /echo -p @{BCwhite}       @{Cbgred}....:::  @{n} @{BCyellow}Dlugi krwisty sztylet @{BCwhite}zatrul @{BCblue}%{P1}@{BCwhite}. @{Cbgred}  :::....%;\
  /echo