/set ramka=Cred
/set y=B

/eval /set pp=$[decode_attr("|",{ramka})]

/def ob = \
 ob %*%;\
 /def -n1 -ag -p5 -t'*' tm_skrzynia_ob_t1 %;\
 /def -n1 -F -ag -mregexp -p0 -t'(zawiera |przy nim )' tm_skrzynia_ob_t2 = \
   /skrzynia %%PR %%; /pokaz_wszystko

/def lok =\
 /def -p545 -n1 -F -t'*wyjsc*:*' tm_skrzynia_lok_t1 = \
 /def -n1 -ag -F -p{maxpri} -t'*\.' tm_skrzynia_lok_t2 =  \
     /skrzynia %%%*%%%;/pokaz_wszystko%;\
 zerknij
 
/def lok1 =\
 /def -p545 -n1 -ag -F -t'Za szeroka lawa siedz*' tm_skrzynia_lok_t5 = \
 /def -n1 -ag -F -p{maxpri} -t'*\.' tm_skrzynia_lok_t6 =  \
     /skrzynia %%%*%%%;/pokaz_wszystko%;\
 zerknij
 
/def lok2 =\
 /def -n1 -ag -t'*lawa siedz*' gagujjj%; \
 /lok

/def pokaz_wszystko = \
 /pokaz_zbroje%;\
 /pokaz_tarcze%;\
 /pokaz_bronie%;\
 /pokaz_pozostale

/def skrzynia = \
 /quote -S /unset `/listvar -s skrzynia_*%;\
 /set skrzynia_z=$[replace(".","",replace(" i ",", ",{*}))]%;\
 /set skrzynia_x=$[strstr({skrzynia_z}, ", ")]%;\
 /while ({skrzynia_x}!=-1) \
   /set skrzynia_e=$[substr({skrzynia_z},0,{skrzynia_x})]%;\
   /set skrzynia_z=$[substr({skrzynia_z},{skrzynia_x}+2)]%;\
   /if ($(/zbroje_przydziel %skrzynia_e)==0) \
     /if ($(/bronie_przydziel %skrzynia_e)==0)\
       /if ($(/tarcze_przydziel %skrzynia_e)==0)\
         /set skrzynia_i=$[strcat({skrzynia_i},{pp},{skrzynia_e})]%;\
       /endif%;\
     /endif%;\
   /endif%;\
   /set skrzynia_x=$[strstr({skrzynia_z}, ", ")]%;\
 /done%;\
 /if ($(/zbroje_przydziel %skrzynia_z)==0) \
   /if ($(/bronie_przydziel %skrzynia_z)==0)\
     /if ($(/tarcze_przydziel %skrzynia_z)==0)\
       /set skrzynia_i=$[strcat({skrzynia_i},{pp},{skrzynia_z})]%;\
     /endif%;\
   /endif%;\
 /endif%;


/def pokaz_zbroje = \
 /skrzynia_pokaz Helmy %skrzynia_helmy%;\
 /skrzynia_pokaz Plaszcze %skrzynia_plaszcze%;\
 /skrzynia_pokaz Ramiona %skrzynia_ramiona%;\
 /skrzynia_pokaz Korpus %skrzynia_korpus%;\
 /skrzynia_pokaz Nogi %skrzynia_nogi%;\
 /if ({#}) \
   /skrzynia_pokaz Inne %skrzynia_i1%;\
   /echo -p @{%{ramka}}+$[strcat(strrep("-",38),"+",strrep("-",38),"+")]%;\
 /endif%;

/def pokaz_bronie = \
 /skrzynia_pokaz Drzewce %skrzynia_drzewce%;\
 /skrzynia_pokaz Maczugi %skrzynia_maczugi%;\
 /skrzynia_pokaz Miecze %skrzynia_miecze%;\
 /skrzynia_pokaz Mloty %skrzynia_mloty%;\
 /skrzynia_pokaz Sztylety %skrzynia_sztylety%;\
 /skrzynia_pokaz Topory %skrzynia_topory%;\
 /skrzynia_pokaz Skory %skrzynia_skory%;\
 /skrzynia_pokaz Ubrania %skrzynia_ubrania%;\
 /skrzynia_pokaz Bizuteria %skrzynia_bizuteria%;\
 /skrzynia_pokaz Kamienie %skrzynia_kamienie%;\
 /skrzynia_pokaz Monety %skrzynia_monety%;\
 /if ({#}) \
   /skrzynia_pokaz Inne %skrzynia_i2%;\
   /echo -p @{%{ramka}}+$[strcat(strrep("-",38),"+",strrep("-",38),"+")]%;\
 /endif%;

/def pokaz_tarcze = \
 /skrzynia_pokaz Tarcze %skrzynia_tarcze%;\
 /if ({#}) \
   /skrzynia_pokaz Inne %skrzynia_i3%;\
   /echo -p @{%{ramka}}+$[strcat(strrep("-",38),"+",strrep("-",38),"+")]%;\
 /endif%;

/def pokaz_pozostale = \
 /skrzynia_pokaz Inne %skrzynia_i%;\
 /echo -p @{%{ramka}}+$[strcat(strrep("-",38),"+",strrep("-",38),"+")]
                               
/def zbroje_przydziel = \
 /if ({*}=/"*{plaszcz*|szat*|peleryn*}*") \
   /set skrzynia_plaszcze=$[strcat({skrzynia_plaszcze},{pp},{*})]%;\
 /elseif ({*}=/"*{helm*|szlom*|morion*|basinet*|czaszk*|misiurk*|barbut*|kaptur*|kapalin*|szyszak*}*")\
   /set skrzynia_helmy=$[strcat({skrzynia_helmy},{pp},{*})]%;\
 /elseif ({*}=/"*{naramiennik*|nareczak*|nalokietnik*|rekawic*}*")\
   /set skrzynia_ramiona=$[strcat({skrzynia_ramiona},{pp},{*})]%;\
 /elseif ({*}=/"*{naudziak*|nakolanni*|nagolennik*|bigwant*|buty*|but|butow*|mokasyn*|spod*|nogawic*}*")\
   /set skrzynia_nogi=$[strcat({skrzynia_nogi},{pp},{*})]%;\
 /elseif ({*}=/"*{koszulk*|kolczug*|tunik*|kaftan*|kurt*|pancerz*|karacen*|napiersnik*|kirys*|bajdan*}*")\
   /set skrzynia_korpus=$[strcat({skrzynia_korpus},{pp},{*})]%;\
 /else /set skrzynia_i1=$[strcat({skrzynia_i1},{pp},{*})]%;\
   /result 0%;\
 /endif%;\
 /result 1
   
/def bronie_przydziel = \
 /if ({*}=/"*{topor*|berdysz*|czekan*|dun*|siekier*}*")\
   /set skrzynia_topory=$[strcat({skrzynia_topory},{pp},{*})]%;\
 /elseif ({*}=/"*{jatagan*|schiavon*|miecz*|scimitar*|talwar*|szabl*|sihill*|floret*|estok*|szamszir*|palasz*|tasak*|bulat*|koncerz*|nimsz*|kord*|flamberg*|espadon*|karabel*|katzbalger*|multon*|claymor*|rapier*}*")\
   /set skrzynia_miecze=$[strcat({skrzynia_miecze},{pp},{*})]%;\
 /elseif ({*}=/"*{maczug*|bulaw*|lancuch*|nasiek*|lamie*|lamia*|buzdyg*|lag*|pal*|wekier*|korbacz*|piernacz*|morgenstern*}*")\
   /set skrzynia_maczugi=$[strcat({skrzynia_maczugi},{pp},{*})]%;\
 /elseif ({*}=/"*{parazoni*|sztylet*|lewak*|katar*|navaj*|stilett*|pazur*|puginal*|dag*|noz*}*")\
   /set skrzynia_sztylety=$[strcat({skrzynia_sztylety},{pp},{*})]%;\
 /elseif ({*}=/"*{mlot*|nadziak*|obusz*|kilof*}*")\
   /set skrzynia_mloty=$[strcat({skrzynia_mloty},{pp},{*})]%;\
 /elseif ({*}=/"*{rohatyn*|runek|halabard*|kij*|runke*|dard*|runki*|trojzab*|las*|dzid*|spis*|glewi*|naginat*|gizarm*|wloczni*|kosa|kosy|kose|cep*|drannach*|pike*|piki*|partyzan*|korsek*|ronkon*}*")\
   /set skrzynia_drzewce=$[strcat({skrzynia_drzewce},{pp},{*})]%;\
 /elseif ({*}=/"*{spodni*|koszul*|turban*|kurtk*|toga|togi|toge|kapelusz*|kamizel*|bluz*|oficerk*|kaftan*|tunik*}*")\
   /set skrzynia_ubrania=$[strcat({skrzynia_ubrania},{pp},{*})]%;\
 /elseif ({*}=/"*{kolczyk*|sygnet*|pierscien*|wisior*|bransolet*|lancusz*|broszk*|spink*|spinek*|ryngraf*|diadem*|naszyjnik*}*")\
   /set skrzynia_bizuteria=$[strcat({skrzynia_bizuteria},{pp},{*})]%;\
 /elseif ({*}=/"*{skor|skora|skory|skore}*")\
   /set skrzynia_skory=$[strcat({skrzynia_skory},{pp},{*})]%;\
 /elseif ({*}=/"*{diament*|nefryt*|fluoryt*|obsydian*|granat*|szafir*|perl*|serpentyn*|hematyt*|piryt*|onyks*|zoisyt*|almandyn*|labrador*|spinel*|rodolit*|turmalin*|cytryn*|celestyn*|oliwin*|rodochrozyt*|akwamaryn*|bursztyn*|cyrkon*|azuryt*|iolit*|ametyst*|jaspis*|kwarc*|rubin*|tytanit*|chryzoberyl*|chryzopraz*|monacyt*|diopsyd*|apatyt*|ortoklaz*|gagat*|malachit*|szmaragd*|kyanit*|topaz*|krysztal*|agat*|turkus*|opal*|lazuryt*|karneol*|heliodor*|perel*|aleksandryt*|awenturyn*}*")\
   /set skrzynia_kamienie=$[strcat({skrzynia_kamienie},{pp},{*})]%;\
 /elseif ({*}=/"*{monet*}*")\
   /set skrzynia_monety=$[strcat({skrzynia_monety},{pp},{*})]%;\
 /else \
   /set skrzynia_i2=$[strcat({skrzynia_i2},{pp},{*})]%;\
   /result 0%;\
 /endif%;\
 /result 1

/def tarcze_przydziel = \
 /if ({*}=/"*{tarcz*|pawez*|puklerz*}*")\
   /set skrzynia_tarcze=$[strcat({skrzynia_tarcze},{pp},{*})]%;\
 /else \
   /set skrzynia_i3=$[strcat({skrzynia_i3},{pp},{*})]%;\
   /result 0 %;\
 /endif%;\
 /result 1

/def skrzynia_pokaz = \
 /if ({#}<2) /return %; /endif%;\
 /echo -p @{%{ramka}}+--- @{Cred}%{1}@{n} @{%{ramka}}$[strrep("-",33-strlen({1}))]+$[strrep("-",38)]+%;\
 /shift%;\
 /set skrzynia_z=$[substr({*},1)]%;\
 /set skrzynia_x=$[strstr({skrzynia_z}, {pp})]%;\
 /while ({skrzynia_x}!=-1) \
   /set s_l=%{pp} $(/l2n $[substr({skrzynia_z},0,{skrzynia_x})])%;\
   /if (strlen({s_l})>38) /set s_l=$[substr({s_l},0,38)]%; /endif%;\
   /set s_l=$[strcat({s_l},pad({pp},40-strlen({s_l})))]%;\
   /set skrzynia_z=$[substr({skrzynia_z},{skrzynia_x}+1)]%;\
   /set skrzynia_x=$[strstr({skrzynia_z}, {pp})]%;\
   /if ({skrzynia_x}!=-1) \
     /set s_l=%{s_l} $(/l2n $[substr({skrzynia_z},0,{skrzynia_x})])%;\
     /set skrzynia_z=$[substr({skrzynia_z},{skrzynia_x}+1)]%;\
     /set skrzynia_x=$[strstr({skrzynia_z}, {pp})]%;\
   /else \
     /set s_l=%{s_l} $(/l2n %{skrzynia_z})%;\
     /set skrzynia_z=%;\
   /endif%;\
   /if (strlen({s_l})>78) /set s_l=$[substr({s_l},0,78)]%;/endif%;\
   /echo -p %{s_l}$[pad({pp},79-strlen({s_l}))]%;\
 /done%;\
 /if (strlen({skrzynia_z})>0) \
   /set s_l=%{pp} $(/l2n %{skrzynia_z})%;\
   /if (strlen({s_l})>38) /set s_l=$[substr({s_l},0,38)]%; /endif%;\
   /echo -p %{s_l}$[pad({pp},40-strlen({s_l}),{pp},39)]%;\
 /endif%;

/def l2n = \
/set _i=1%;\
/set _lb=dwa dwie trzy cztery piec szesc siedem osiem dziewiec dziesiec%;\
/while ({_i}<11)\
  /if ({1}=/$(/nth %{_i} %{_lb}))\
    /if ({_i}==1) /test ++_i%;/endif%;\
    /result strcat({_i}," ",{-1}) %;\
  /endif%;\
  /test ++_i%;\
/done%;\
/if ({1}=/"wiele") /result strcat("X ",{-1})%;/endif%;\
/result strcat("  ",{*})

/def skrzynia_czysc = \
 /quote -S /unset `/listvar -s skrzynia_*%;\
 /purge tm_skrzynia_*


/def Prze = \
  /set IleEgzemplarzy=1%; \
  /set KtoryRaz=1%; \
  /set WykryteEgzemplarze=%; \
  /purge _wykryj_egzemplarz*%; \
  /def -p101 -mregexp -t'^([-|\\*]) ((.*)[^. ]) \.  \.' _wykryj_egzemplarz = \
    /set IleEgzemplarzy=1%%; \
    /if ({P1}=~'*') \
      /set Kolorek=Cred%%;\
    /else \
      /set Kolorek=n%%;\
    /endif%%; \
    /substitute -p @{%%{Kolorek}}[%{IleEgzemplarzy}] %%{P0}%%{PR}%%; \
    /if ({WykryteEgzemplarze}=~NULL) \
      /set WykryteEgzemplarze=$$[{P2}]%%; \
    /else \
      /set WykryteEgzemplarze=%%{WykryteEgzemplarze}|$$[{P2}] %%;\
    /endif%%; \
    /eval \
      /set KtoryRaz=$$[{KtoryRaz}+1]%%%; \
      /def -p102 -mregexp -t'^([-|\\*]) (%%{WykryteEgzemplarze}) \.  \.' _wykryj_egzemplarz_znany_%%{KtoryRaz} = \
      /set IleEgzemplarzy=$$$$[{IleEgzemplarzy}+1]%%%%; \
	/if ({P1}=~'*') \
	  /set Kolorek=Cred%%%%; \
	/else \
	  /set Kolorek=n%%%%; \
	/endif%%%%; \
	/substitute -p @{%%%%{Kolorek}}[%%%%{IleEgzemplarzy}] %%%%{P0}%%%%{PR}%;\
  przejrzyj %{*}

/def PrzeZS = /Prze wszystkie zbroje w skrzyni
/def PrzeBS = /Prze wszystkie bronie w skrzyni
/def PrzeZK = /Prze wszystkie zbroje w koszu
/def PrzeBK = /Prze wszystkie bronie w koszu

/def PrzeOff = \
  /purge _wykryj_egzemplarz*