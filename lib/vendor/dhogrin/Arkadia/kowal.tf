/def kowal = \
 /set _zbr=1%;\
 /def -p999 -n1 -ag -t'Slucham?' = /purge ukowala_*%;\
 /def -p1 -ag -t'*' ukowala_gaguj_wszystko%;\
 /def -p2 -ag -mregexp -t'Oceniasz starannie (.*)\.' ukowala_co_oceniam = \
  /test (echo("------------------------------------"))%%;\
  /echo -p [%%{_zbr}]: Oceniasz @{uBCcyan}%%{P1}@{n}:%%;\
  /test (++{_zbr})%;\
 /def -p400 -aBCblue -t'Wyglada na to, ze *' ukowala_stopien_zniszczenia%;\
 /def -p2 -a -t'Umm, co chcesz ocenic?' ukowala_zly_parametr%;\
 /if ({1}=~NULL) \
  /echo ### Oceniam wszystkie zbroje i bronie:%;\
  ocen wszystkie zbroje%;\
  ocen wszystkie bronie%;\
  ocena%; \
 /else \
  ocen %{*}%;\
  ocena%; \
 /endif%;\
 /unset _zbr
 