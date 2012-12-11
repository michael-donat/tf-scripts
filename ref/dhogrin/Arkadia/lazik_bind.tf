/alias n /mapgo polnoc%;/set przeciwny=s
/alias s /mapgo poludnie%;/set przeciwny=n
/alias e /mapgo wschod%;/set przeciwny=w
/alias w /mapgo zachod%;/set przeciwny=e
/alias nw /mapgo polnocny-zachod%;/set przeciwny=se
/alias ne /mapgo polnocny-wschod%;/set przeciwny=sw
/alias se /mapgo poludniowy-wschod%;/set przeciwny=nw
/alias sw /mapgo poludniowy-zachod%;/set przeciwny=ne
/alias u /mapgo gora%;/set przeciwny=d
/alias d /mapgo dol%;/set przeciwny=u
/def lazikuj = \
 /set kier=polnoc n poludnie s wschod e zachod w poludniowy-wschod se poludniowy-zachod sw polnocny-wschod ne polnocny-zachod nw gora u dol d%;\
 /for licz 1 20 \
  /if ($$(/nth %%licz %%kier)=~{_pierwsze}) /test licz:=%%licz+1%%;\
   /set __pierwsze=$$(/nth %%licz %%kier)%%;\
  /endif%%;\
  /if ($$(/nth %%licz %%kier)=~{_drugie}) /test licz:=%%licz+1%%;\
   /set __drugie=$$(/nth %%licz+1 %%kier)%%;\
  /endif%;\
 /unset licz%;/unset kier
/def -Fp999 -mregexp -t'^(Szlak prowadzi tutaj w dwoch kierunkach:|Sa tutaj dwa widoczne wyjscia:|Trakt wiedzie na|W gestych ciemnosciach dostrzegasz trakt wiodacy na) ([^ ]*) i ([^ ]*)\.$' _chodze = /set _pierwsze=%{P2}%;/set _drugie=%{P3}%; \
/lazikuj%;\
/bind ^[OM=/go%%;/bind ^[OM=
/def go = \
/if (przeciwny=~__pierwsze) $[__drugie]%; \
/elseif (przeciwny=~__drugie) $[__pierwsze]%;/endif
/def koniec_lazenia = \
 /unalias n%;\
 /unalias s%;\
 /unalias e%;\
 /unalias w%;\
 /unalias nw%;\
 /unalias ne%;\
 /unalias se%;\
 /unalias sw%;\
 /unalias u%;\
 /unalias d%;\
 /undef _chodze%;\
 /undef lazikuj%;\
 /unset przeciwny%;\
 /unset _pierwsze%;\
 /unset _drugie%;\
 /unset __pierwsze%;\
 /unset __drugie
 