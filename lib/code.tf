/def -aL -mregexp -t're:([A-Z]+):(.*)' code_1 = \
  /let helper=$[tolower({P1})]%;\
  /let helper=$[replace('dn','d',{helper})]%;\
  /let helper=$[replace('up','u',{helper})]%;\
  /def reb=%{P2}

/showme re:DN:otworz sarkofag%; wejdz do sarkofagu