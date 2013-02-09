; Automagicly added line: tf_ver=1.0.6
;------------------------------------------------------------------------------
;|                        Rozne cuda niewidy.. Statystyki wykresy             |
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;|                        Logowanie zapisywanie ustawien i inne               |
;------------------------------------------------------------------------------


/def -Fh'DISCONNECT' _hook_disconnect = \
    /echo -p -aCgreen Wcisnij '@{B}Ctr+R@{n}' azeby polaczyc sie ponownie!! %;\
    /if ({1}=/'(unnamed*)') \
    /endif %;\
    /set obecnie_swiat=%{1}

/def reconnect = \
    /if ({*}!~NULL) \
      /if ($(/listsockets -s %{*})!~NULL) \
        /dc %{*} %;\
      /endif %;\
      /connect %{*} %;\
    /elseif (${world_name}!~NULL) \
      /let _cur_world=${world_name} %;\
      /dc %{_cur_world} %;\
      /connect %{_cur_world} %;\
    /elseif ({obecnie_swiat}!~NULL) \
      /if ($(/listsockets -s %{obecnie_swiat})!~NULL) \
        /dc %{obecnie_swiat} %;\
      /endif %;\
      /connect %{obecnie_swiat} %;\
    /elseif ($(/listsockets -s)!~NULL) \
      /let _cur_world=$(/listsockets -s) %;\
      /dc %{_cur_world} %;\
      /connect %{_cur_world} %;\
    /else \
      /connect %;\
    /endif

/def -Fh'PROMPT *Czy chcesz sie ustawic w kolejce*' _hook_kolejka = \
    t %;\
    /_echo Hmmm.... Znowu jest kolejka ... %;\
    /repeat -5 1 t%%;kto %;\
;    /rstart -120 1000 kto jest w kolejce%;\
    /def -p2 -h'SEND z*' _hook_kolejka_2 = \
      /echo -p -aCgreen Musisz wpisac "@{BCred}zakoncz@{nCgreen}" azeby opuscic kolejke!! %;\
    /def -p3 -h'SEND zakoncz' _hook_kolejka_3 = \
      /echo -p -aCgreen Opuszczam kolejke. %%;\
      /purge _hook_kolejka_* %%;\
;      /rstop kto jest w kolejce %%;\
      zakoncz 

/def -aB -F -t'* z hosta:*' _zalogowalo_mnie_1 = \
    /repeat -5 1 /start

/def -aB -F -t'*... lacze ...*' _zalogowalo_mnie_2 = \
    /purge _hook_kolejka_*

    
;------------------------------------------------------------------------------
;|                        Pasek stanu z roznymi cudami                       |
;------------------------------------------------------------------------------


/if ($(/listvar -s aktualna_kondycha)=~NULL) /set aktualna_kondycha= Ingwar Swenson  '%;/endif
/if ($(/listvar -s wykrzykniki)=~NULL) /set wykrzykniki *** %;/endif
/eval /if ($(/listvar -s wyjscia_z_lokacji)=~NULL) /set wyjscia_z_lokacji=  ver %{tf_version-3.1.0}   '%;/endif

/set warn_status=0

/set status_int_more \
     (!limit() & moresize() == 0) ? "" : status_int_more()

/purge -i status_int_more
/def -i status_int_more = \
    /if (columns() < 80) \
	/let all=$[moresize()]%; \
	/if (all >= 1000) /let all=$[all/1000]k%; /endif%; \
	/result pad(all, 4) %;\
    /endif %;\
    /let new=$[moresize("ln")]%; \
    /let old=$[moresize("l") - new]%; \
    /if (old >= 1000) /let old=$[old/1000]k%; /endif%; \
    /if (new >= 1000) /let new=$[new/1000]k%; /endif%; \
    /if (old) \
	/result pad(limit() ? "L" : " ", 1,  old, 3,  "+", 1,  new, 3)%; \
    /else \
	/result pad(limit() ? "LIM " : "More", 4,  new, 4)%; \
    /endif

/set status_int_world   \
     ${world_name} =~ "" ? "(no world)" : \
     strcat(!is_open() ? "!" : "",  ${world_name})

/set status_int_read    nread() ? "(Read)" : ""

/set status_int_active  nactive() ? pad("(Active:", 0, nactive(), 2, ")") : ""

/set status_int_log     nlog() ? "(Log)" : ""

/set status_int_mail \
    !nmail() ? ogolne_poczta=~NULL ? "" : "(List)" : ogolne_poczta=~NULL ? "(Mail)" : "(ToTo)"

/set status_var_insert  insert ? "" : "(Over)"

/set status_int_clock   ftime("%H:%M", time())

/set status_var_wyjscia_z_lokacji \
    decode_attr(strcat("@{Cgreen}(@{BCwhite}" , substr( \
	strlen({wyjscia_z_lokacji})>17 ? {wyjscia_z_lokacji} : \
	pad("",(17-strlen({wyjscia_z_lokacji}))/2,{wyjscia_z_lokacji},0,"",10), \
        0, 17), "@{nCgreen})"))


/def _status_ustaw = \
;    /visual off %;\
    /if ({ogolne_top}==1 & columns()>102) \
      /set zuzycie_cpu=%{zuzycie_cpu-0.0} %;\
      /set zuzycie_mem=%{zuzycie_mem-0.0} %;\
      /set status_fields \
;        @more:8:Br :1 @world:0 "CPU:":-5:Cblue zuzycie_cpu:-5:BCblue "%":1:BCblue "MEM:":-5:Cblue zuzycie_mem:-5:BCblue "%":1:BCblue :1 \
        @more:8:Br :1 "CPU:":-5:Cblue zuzycie_cpu:-5:BCblue "%":1:BCblue "MEM:":-5:Cblue zuzycie_mem:-5:BCblue "%":1:BCblue :1 \
        aktualna_kondycha:17 :1 \
        wyjscia_z_lokacji:19 :1 \
        "(":1 zabici_ostatnio_suma_zabitych:-3 "/":1 zabici_ostatnio_suma_poleglych:-3 ")":1 :1 \
        :0 @log:5 :1 @mail:6 :1 insert:6 :1 @clock:5 %;\
;      /sys  %{TFDIR}/top.sh $[getpid()] %;\
;      /rstart -30 99999 /_top_tf %;\
    /elseif (columns()>=80) \
      /set status_fields=\
        @more:8:Br :1 aktualna_kondycha:17 \
        :1 wyjscia_z_lokacji:19 :1 \
        "(":1 zabici_ostatnio_suma_zabitych:-3 "/":1 zabici_ostatnio_suma_poleglych:-3 ")":1 :1 \
        :0 @log:5 @mail:6 insert:6 :1 @clock:5 %;\
;      /sys %{TFDIR}/top.sh $[getpid()] stop %;\
;      /rstop /_top_tf %;\
    /elseif (columns()>54) \
      /set status_fields \
        aktualna_kondycha:17 :1 \
        wyjscia_z_lokacji:19 :1 \
        "(":1 zabici_ostatnio_suma_zabitych:-3 "/":1 zabici_ostatnio_suma_poleglych:-3 ")":1 \
	:0 @clock:5 %;\
;      /sys %{TFDIR}/top.sh $[getpid()] stop %;\
;      /rstop /_top_tf %;\
    /else \
      /set status_fields \
	:1 @clock:5 %;\
;      /sys %{TFDIR}/top.sh $[getpid()] stop %;\
;      /rstop /_top_tf %;\
    /endif %;\
    /visual on

/_status_ustaw

/def -h'RESIZE' _status_hook = /_status_ustaw

/def -F -abBCmagenta -mregexp -t'Czeka na ciebie NOWA poczta' _poczta_1 = \
    /set ogolne_poczta=$[strcat(ftime("%H:%M",time()),"Kogos lub Czegos (NOWA)|")] %;\
    /test status_fields := status_fields

/def -F -abBCmagenta -mregexp -t'Czeka na ciebie nieprzeczytana poczta' _poczta_2 = \
    /set ogolne_poczta=$[strcat(ftime("%H:%M",time()),"Kogos lub Czegos (Nieprzeczytana)|")] %;\
    /test status_fields := status_fields

/def -F -mregexp -t'Czeka na ciebie poczta' _poczta_3 = \
    /unset ogolne_poczta %;\
    /test status_fields := status_fields

/def -F -abBCmagenta -mregexp -t'Masz nowa poczte od (.*).' _poczta_4 = \
    /set ogolne_poczta=$[strcat({ogolne_poczta},ftime("%H:%M",time()),{P1},"|")] %;\
    /test status_fields := status_fields

/def -F -abBCmagenta -mregexp -t'Masz nowy list.*od ([^ ]*), zatytulowany \'(.*)(\'|[^.]$)' _poczta_5 = \
    /set ogolne_poczta=$[strcat({ogolne_poczta},ftime("%H:%M",time()),{P1}," zatytuowany '",{P2},"'|")] %;\
    /test status_fields := status_fields

/def poczta = \
    /if ({ogolne_poczta}=~NULL & {*}=/'{off|czysc|clear|wyswietl|}') \
      /echo -p Nie czeka na ciebie zadna poczta!! %;\
    /elseif ({*}=~NULL | {*}=~'wysiwetl') \
      /let _poczta=%{ogolne_poczta} %;\
      /echo -p Czekaja na ciebie na poczcie listy nastepujace listy: %;\
      /while /let i=$[strstr({_poczta},"|")] %; /@test i>-1 %; /do \
        /echo -p - - godzina @{B}$[substr({_poczta},0,5)] @{n}od @{B}$[substr({_poczta},5,i-5)]@{n}. %;\
	/let _poczta=$[substr({_poczta},i+1)] %;\
      /done %;\
      /echo -p Zeby wyczyscic poczte wpisz "@{BCgreen}/poczta czysc@{nCwhite}" %;\
    /elseif ({*}=/'{off|czysc|clear}') \
      /unset ogolne_poczta %;\
      /echo Poczta wyczyszczona. %;\
      /test status_fields := status_fields %;\
    /else \
      /echo Uzycie: /poczta [czysc|clear|off|wyswietl] %;\
    /endif

/def -aBCyellow -t'*Jestes w swietnej kondycji*' _kondycha_swietna= \
    /_echo %;\
    /set aktualna_kondycha=$[pad(decode_attr("@{BCgreen}Swietna kondycja@{BCblue}."), 17)]
        
/def -aBCyellow -t'*Jestes w dobrym stanie*' _kondycha_dobra= \
    /_echo %;\
    /set aktualna_kondycha=$[pad(decode_attr("@{BCgreen}Dobry stan@{BCblue}."), 17)]

/def -aBCyellow -t'*Jestes lekko rann*' _kondycha_lekko_ranna= \
    /_echo %;\
    /set aktualna_kondycha=$[pad(decode_attr("@{BCyellow}Lekko ranny@{BCblue}.."), 17)]

/def -aBCyellow -t'*Jestes rann*' _kondycha_ranna= \
    /_echo %;\
    /set aktualna_kondycha=$[pad(decode_attr("@{BCyellow}Ranny@{BCblue}..."), 17)]

/def -aBCyellow -t'*Jestes w zlej kondycji*' _kondycha_zla_kondycja= \
    /_echo %;\
    /set aktualna_kondycha=$[pad(decode_attr("@{BCmagenta}W zlej kondycji@{BCblue}!"), 17)]

/def -aBCyellow -t'*Jestes ciezko rann*' _kondycha_ciezko_ranny= \
    /_echo %;\
    /set aktualna_kondycha=$[pad(decode_attr("@{BCmagenta}Ciezko ranny@{BCblue}!!"), 17)]

/def -aBCyellow -t'*Jestes ledwo zyw*' _kondycha_ledwo_zywy= \
    /_echo %;\
    /set aktualna_kondycha=$[pad(decode_attr("@{BCred}LEDWO ZYWY@{BCblue}!!!"), 17)]

;------------------------------------------------------------------------------
;|                        Wykresy i inne statystykiyki                        |
;------------------------------------------------------------------------------



;------------------------------------------------------------------------------
;|                        Statystyka wyslanych/odebranych literek             |
;------------------------------------------------------------------------------

