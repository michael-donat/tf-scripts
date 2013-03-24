/def -p1 -F -mregexp -t'Twoje doswiadczenie i umiejetnosci podpowiadaja ci, ze jak na (lekka|srednia|ciezka) zbroje (chroni ona|chroni on|chroni ono|chronia one) (wyjatkowo |bardzo |dosc )?([a-z]+) przed obrazeniami ([a-z]+), ([a-z]+) i ([a-z]+).' _OcenaEq1=/echo  $(/ShowArmorStats $(/ETOI %P3%P4) $(/ETOI %P3%P4) $(/ETOI %P3%P4) $(/ArmorW %P1))
/def -p1 -F -mregexp -t'Twoje doswiadczenie i umiejetnosci podpowiadaja ci, ze jak na (lekka|srednia|ciezka) zbroje (chroni ona|chroni on|chroni ono|chronia one) (wyjatkowo |bardzo |dosc )?([a-z]+) przed obrazeniami ([a-z]+), (wyjatkowo |bardzo |dosc )?([a-z]+) przed ([a-z]+) (i|oraz) (wyjatkowo |bardzo |dosc )?([a-z]+) przed ([a-z]+).' _OcenaEq2= /Kolejnosc %P5 $(/ETOI %P3%P4) %P8 $(/ETOI %P6%P7) %P12 $(/ETOI %P10%P11)%; /echo  $(/ShowArmorStats %zTemp1 %zTemp2 %zTemp3 $(/ArmorW %P1))
/def -p1 -F -mregexp -t'Twoje doswiadczenie i umiejetnosci podpowiadaja ci, ze jak na (lekka|srednia|ciezka) zbroje (chroni ona|chroni on|chroni ono|chronia one) (wyjatkowo |bardzo |dosc )?([a-z]+) przed obrazeniami ([a-z]+) i ([a-z]+) (i|oraz) (wyjatkowo |bardzo |dosc )?([a-z]+) przed ([a-z]+).' _OcenaEq3= /Kolejnosc %P5 $(/ETOI %P3%P4) %P6 $(/ETOI %P3%P4) %P10 $(/ETOI %P8%P9)%; /echo  $(/ShowArmorStats %zTemp1 %zTemp2 %zTemp3 $(/ArmorW %P1))

/def -p1 -F -mregexp -t'Twoje doswiadczenie i umiejetnosci podpowiadaja ci, ze jak na ( |dwureczna |dwureczny )?(sztylet|mlot|topor|miecz|maczuge|bron drzewcowa) (jest|sa) (on|ona|ono|one) (wyjatkowo |bardzo |dosc )?([a-z]+) (wywazony|wywazona|wywazone) i ([a-z]+ )(skuteczn[a-z]|nieskuteczn[a-z]).' _OcenaWp1=/echo  $(/ShowWeaponStats $(/WTOI %P5%P6) $(/STOI %P8%P9))

/def -p1 -F -mregexp -t'Twoje doswiadczenie i umiejetnosci podpowiadaja (ci), ze chroni (ona|on|ono) (wyjatkowo |bardzo |dosc )?([a-z]+) przed obrazeniami ([a-z]+), ([a-z]+) i ([a-z]+). Ponadto jest ([a-z]+ )(skuteczn[a-z]|nieskuteczn[a-z]) w parowaniu ciosow.' _OcenaSh1=/echo  $(/ShowArmorStats $(/ETOI %P3%P4) $(/ETOI %P3%P4) $(/ETOI %P3%P4) $(/STOI %P8%P9))
/def -p1 -F -mregexp -t'Twoje doswiadczenie i umiejetnosci podpowiadaja (ci), ze chroni (ona|on|ono) (wyjatkowo |bardzo |dosc )?([a-z]+) przed obrazeniami ([a-z]+), (wyjatkowo |bardzo |dosc )?([a-z]+) przed ([a-z]+) (i|oraz) (wyjatkowo |bardzo |dosc )?([a-z]+) przed ([a-z]+). Ponadto jest ([a-z]+ )(skuteczn[a-z]|nieskuteczn[a-z]) w parowaniu ciosow.' _OcenaSh2= /Kolejnosc %P5 $(/ETOI %P3%P4) %P8 $(/ETOI %P6%P7) %P12 $(/ETOI %P10%P11)%; /echo  $(/ShowArmorStats %zTemp1 %zTemp2 %zTemp3 $(/STOI %P13%P14))
/def -p1 -F -mregexp -t'Twoje doswiadczenie i umiejetnosci podpowiadaja (ci), ze chroni (ona|on|ono) (wyjatkowo |bardzo |dosc )?([a-z]+) przed obrazeniami ([a-z]+) i ([a-z]+) (i|oraz) (wyjatkowo |bardzo |dosc )?([a-z]+) przed ([a-z]+). Ponadto jest ([a-z]+ )(skuteczn[a-z]|nieskuteczn[a-z]) w parowaniu ciosow.' _OcenaSh3= /Kolejnosc %P5 $(/ETOI %P3%P4) %P6 $(/ETOI %P3%P4) %P10 $(/ETOI %P8%P9)%; /echo  $(/ShowArmorStats %zTemp1 %zTemp2 %zTemp3 $(/STOI %P11%P12))

/def -p1 -F -mregexp -t'Twoje doswiadczenie i umiejetnosci podpowiadaja ci, ze jest (on|ona|ono) ([a-z]+ )(skuteczn[a-z]|nieskuteczn[a-z]) w parowaniu ciosow.' _OcenSh4=/echo  $(/ShowShieldStats $(/STOI %P2%P3))


/def Kolejnosc =\
  /if ({1}=~"cietymi")\
    /set zTemp1=%{2}%;\
  /elseif ({3}=~"cietymi")\
    /set zTemp1=%{4}%;\
  /elseif ({5}=~"cietymi")\
    /set zTemp1=%{6}%;\
  /endif%;\
  /if ({1}=~"obuchowymi")\
    /set zTemp2=%{2}%;\
  /elseif ({3}=~"obuchowymi")\
    /set zTemp2=%{4}%;\
  /elseif ({5}=~"obuchowymi")\
    /set zTemp2=%{6}%;\
  /endif%;\
  /if ({1}=~"klutymi")\
    /set zTemp3=%{2}%;\
  /elseif ({3}=~"klutymi")\
    /set zTemp3=%{4}%;\
  /elseif ({5}=~"klutymi")\
    /set zTemp3=%{6}%;\
  /endif

/def ArmorW=\
  /if ({1}=~"lekka") /result "L"%;\
  /elseif ({1}=~"srednia") /result "S"%;\
  /elseif ({1}=~"ciezka") /result "C"%;\
  /else /result 0%;\
  /endif

/def STOI =\
  /if ({1}=~"kompletnie" & {2}=/"nieskuteczn*")\
    /result 1%;\
  /elseif ({1}=~"strasznie" & {2}=/"nieskuteczn*")\
    /result 2%;\
  /elseif ({1}=~"bardzo" & {2}=/"nieskuteczn*")\
    /result 3%;\
  /elseif ({1}=~"raczej" & {2}=/"nieskuteczn*")\
    /result 4%;\
  /elseif ({1}=~"malo" & {2}=/"skuteczn*")\
    /result 5%;\
  /elseif ({1}=~"niezbyt" & {2}=/"skuteczn*")\
    /result 6%;\
  /elseif ({1}=~"raczej" & {2}=/"skuteczn*")\
    /result 7%;\
  /elseif ({1}=~"dosyc" & {2}=/"skuteczn*")\
    /result 8%;\
  /elseif ({1}=~"calkiem" & {2}=/"skuteczn*")\
    /result 9%;\
  /elseif ({1}=~"bardzo" & {2}=/"skuteczn*")\
    /result 10%;\
  /elseif ({1}=~"niezwykle" & {2}=/"skuteczn*")\
    /result 11%;\
  /elseif ({1}=~"wyjatkowo" & {2}=/"skuteczn*")\
    /result 12%;\
  /elseif ({1}=~"zabojczo" & {2}=/"skuteczn*")\
    /result 13%;\
  /elseif ({1}=~"fantastycznie" & {2}=/"skuteczn*")\
    /result 14%;\
  /else\
    /result 0%;\
  /endif

/def WTOI =\
  /if ({1}=~"wyjatkowo" & {2}=~"zle")\
    /result 1%;\
  /elseif ({1}=~"bardzo" & {2}=~"zle")\
    /result 2%;\
  /elseif ({1}=~"zle")\
    /result 3%;\
  /elseif ({1}=~"bardzo" & {2}=~"kiepsko")\
    /result 4%;\
  /elseif ({1}=~"kiepsko")\
    /result 5%;\
  /elseif ({1}=~"przyzwoicie")\
    /result 6%;\
  /elseif ({1}=~"srednio")\
    /result 7%;\
  /elseif ({1}=~"niezle")\
    /result 8%;\
  /elseif ({1}=~"dosc" & {2}=~"dobrze")\
    /result 9%;\
  /elseif ({1}=~"dobrze")\
    /result 10%;\
  /elseif ({1}=~"bardzo" & {2}=~"dobrze")\
    /result 11%;\
  /elseif ({1}=~"doskonale")\
    /result 12%;\
  /elseif ({1}=~"perfekcyjnie")\
    /result 13%;\
  /elseif ({1}=~"genialnie")\
    /result 14%;\
  /else\
    /result 0%;\
  /endif


/def ETOI =\
  /if ({1}=~"wyjatkowo" & {2}=~"zle")\
    /result 1%;\
  /elseif ({1}=~"bardzo" & {2}=~"zle")\
    /result 2%;\
  /elseif ({1}=~"zle")\
    /result 3%;\
  /elseif ({1}=~"bardzo" & {2}=~"kiepsko")\
    /result 4%;\
  /elseif ({1}=~"kiepsko")\
    /result 5%;\
  /elseif ({1}=~"przyzwoicie")\
    /result 6%;\
  /elseif ({1}=~"niezle")\
    /result 7%;\
  /elseif ({1}=~"dosc" & {2}=~"dobrze")\
    /result 8%;\
  /elseif ({1}=~"dobrze")\
    /result 9%;\
  /elseif ({1}=~"bardzo" & {2}=~"dobrze")\
    /result 10%;\
  /elseif ({1}=~"doskonale")\
    /result 11%;\
  /elseif ({1}=~"perfekcyjnie")\
    /result 12%;\
  /else \
    /result 0%;\
  /endif

/def ShowArmorStats =\
  /echo -p > > > [@{BxCblue}%{4}@{n}][@{BxCblue}%{1}, %{2}, %{3}@{n}] < < <

/def ShowWeaponStats =\
  /echo -p > > > [@{BxCblue}%{1}, %{2}@{n}] < < <

/def ShowShieldStats =\
  /echo -p > > > [@{BxCblue}%{1}@{n}] < < <