/set _opcje_walka_patrzenie=0
/set _opcje_walka_wskazywanie=0
/set _opcje_walka_wskazywanie_celu=1
/set _opcje_walka_rozkazywanie=1

/def opcje = \
  /let __opcja=%{1}%; \
  /let __switch=$[({2}=~'on' | {2}=~"+") ? "1" : "0"]%; \
  /if ({__opcja}=~'rozkazy')\
    /set _opcje_walka_rozkazywanie=%{__switch}%; \
  /endif