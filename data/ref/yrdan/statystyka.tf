; ## Linie dodane automagicznie   : tf_ver=1.5.5
; ## 
; ## Wersja pliku                 : 1.5.5
; ## Ostatnia zmiana pliku        : 2009-01-06 21:07:40
; ## Plik pobrany                 : 2009-01-06 21:07:55
; ## Wersja Tfupdate              : 2.0.1
; ##
; ##
;------------------------------------------------------------------------------
;|                        Rozne cuda niewidy.. Statystyki wykresy             |
;------------------------------------------------------------------------------
/require -q textutil.tf
/require -q savehist.tf
/require -q tools.tf

/def _wykres_start = \
    /if ({*}=~NULL) \
      /if ($(/pid_of /_wykres_base)=~NULL) \
        /rstart -$[60*(10-(substr(ftime("%M",time()),1)))] 1 /_wykres_start now %;\
      /endif %;\
    /else \
      /rstart -600 1000 /_wykres_base %;\
    /endif

/_wykres_start

/rstart -300 1000 /_zapisz

/if ($(/listvar -s zabici_ostatnio_suma_zabitych)=~NULL) /set zabici_ostatnio_suma_zabitych=0 %;/endif
/if ($(/listvar -s zabici_ostatnio_suma_poleglych)=~NULL) /set zabici_ostatnio_suma_poleglych=0 %;/endif
/if ($(/listvar -s zabici_calkowicie_data)=~NULL) /eval /set zabici_calkowicie_data=$[ftime("%d.%m.%Y",time())] %;/endif
/if ($(/listvar -s zabici_calkowicie_suma_zabitych)=~NULL) /set zabici_calkowicie_suma_zabitych=0 %;/endif
/if ($(/listvar -s zabici_calkowicie_suma_poleglych)=~NULL) /set zabici_calkowicie_suma_poleglych=0 %;/endif
/if ($(/listvar -s ogolne_wykres_slupkowy)=~NULL) /eval /set ogolne_wykres_slupkowy=$[strcat(ftime("%H:%M",time()),"#",time(),"$")] %;/endif
/if ($(/listvar -s ogolne_wykres_postepow)=~NULL) /eval /set ogolne_wykres_postepow=$[strcat(ftime("%H:%M:%S", time()),"|0$0/0#")] %;/endif

;------------------------------------------------------------------------------
;|                        Logowanie zapisywanie ustawien i inne               |
;------------------------------------------------------------------------------

/undef ~login_hook_lp

/eval /def -mglob -T{lp|lp.*|diku|diku.*|aber|aber.*} -hLOGIN -iFp%{maxpri} ~login_hook_lp = \
    /send -- $${world_character} %%;\
    /send -- $${world_password} %%;\
    /_wpusc_gracza $${world_character} $${world_name} %%;\
    /def -p30 -1 -h'PROMPT *Podaj swoje imie*' ~login_hook_ingwar1= \
      /set nie_za_czesto=1 %%%;\
      /rstart -5 1 /set nie_za_czesto=0

/def -p20 -q -h'PROMPT *Podaj swoje imie*' ~login_hook_ingwar= \
    /if ({nie_za_czesto}==0) \
      /set nie_za_czesto=1 %;\
      /purge ~login_hook_ingwar_* %;\
      /def -mregexp -1 -F -h'SEND ([^ ]*)' ~login_hook_ingwar_2 = \
    /send %%{P0} %%;\
    /set nie_za_czesto=0 %%;\
    /def -1 -F -q -h'PROMPT *Witaj, * Podaj swe haslo:*' ~login_hook_ingwar_3=\
      /_wpusc_gracza $$[tolower({P0})] $$${world_name} %;\
      /rstart -5 1 /set nie_za_czesto=0 %;\
    /endif

/def _wpusc_gracza = \
    /_czysc_calkowita_statystyke %;\
    /_czysc_ostatnia_statystyke %;\
    /_czysc_ogolne_zmienne %;\
    /set obecnie_expujacy=%{1} %;\
    /set obecnie_swiat=%{2} %;\
    /_login_sprawdz %;\
    /_odczytaj %;\
    /reload -q %;\
    /_changelog_sprawdz %;\
    /echo $[strcat("Log in - ", ftime("%Y-%m-%d %H:%M:%S", time()), " : ", \
        {obecnie_expujacy})] %| /writefile -a %{TFDIR}/save/io.log %;\
    /if ({ogolne_autolog}) \
        /_autolog %;\
    /endif %;\
    /if ({ogolne_szerokosc_ekranu} != 3) \
        /_ustaw_szerokosc %;\
    /endif %;\
    /if (ogolne_xtitle_show) \
        /xtitle Connected [%{obecnie_expujacy}] %;\
    /endif %;\
    /if ({ogolne_savehist}) \
        /set savehist_dir=%{TFDIR}/save/%{obecnie_expujacy}/tf-hist %;\
        /load_histories %;\
    /endif

/def _login_sprawdz = \
    /quote -S -decho !\
      if [ ! -d %{TFDIR}/save/%{obecnie_expujacy} ]; then \
        mkdir %{TFDIR}/save/%{obecnie_expujacy}; \
        touch %{TFDIR}/save/%{obecnie_expujacy}/zabici_calkowicie.tf; \
        touch %{TFDIR}/save/%{obecnie_expujacy}/zabici_ostatnio.tf; \
        touch %{TFDIR}/save/%{obecnie_expujacy}/ogolne_ustawienia.tf; \
;        touch %{TFDIR}/save/%{obecnie_expujacy}/cechy_obecne.tf; \
    if [ -r %{TFDIR}/save/%{obecnie_expujacy}.stat ]; then \
      echo /_login_przepisz; \
        fi; \
      fi; \
      if [ ! -r %{TFDIR}/%{obecnie_expujacy}.tf ]; then \
          cp %{TFDIR}/ktos.tf %{TFDIR}/%{obecnie_expujacy}.tf; \
      fi


/def _login_przepisz = \
    /load -q %{TFDIR}/save/%{obecnie_expujacy}.stat %;\
    /quote -S /_login_przepisz_ zabici_calkowicie_zabite `/listvar -s zabitecalkowicie_* %;\
    /quote -S /_login_przepisz_ zabici_calkowicie_polegle `/listvar -s poleglecalkowicie_* %;\
    /_login_przepisz_ zabici_calkowicie_suma ogolemcalkowicie_zabitych %;\
    /_login_przepisz_ zabici_calkowicie_suma ogolemcalkowicie_poleglych %;\
    /_login_przepisz_ zabici_calkowicie odcalkowicie_data

/def _login_przepisz_ = \
    /let ktory_nazwa=$[substr({2},strrchr({2},"_")+1)] %;\
    /eval /set $[strcat({1},"_",{ktory_nazwa})]=$(/listvar -v %{2}) %;\
    /unset %{2}

/def -Fh'SIGHUP|SIGTERM' ~disconnect_hook_ingwar_1 = \
    /zapisz

;/def -Fh'SIGINT|SIGQUIT|SIGTSTP' ~disconnect_hook_ingwar_2 = \
;    /zapisz

/def -F -p10 -h'DISCONNECT' _hook_disconnect = \
    /if ({1}=/'mapa') \
        /return %;\
    /endif %;\
    /zapisz %;\
    /if (ogolne_xtitle_show) \
        /xtitle Disconnected [%{obecnie_expujacy}] %;\
    /endif %;\
    /msg Wcisnij '@{B}Ctr+R@{n}' azeby polaczyc sie ponownie!! %;\
    /if ({1}!/'(unnamed*)') \
        /set obecnie_swiat=%{1} %;\
    /endif

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

;/def -Fh'PROMPT *Czy chcesz sie ustawic w kolejce*' _hook_kolejka = \
;    t %;\
;    /_echo Hmmm.... Znowu jest kolejka ... %;\
;    /repeat -5 1 t%%;kto %;\
;    /def -p2 -h'SEND z*' _hook_kolejka_2 = \
;      /echo -p -aCgreen Musisz wpisac "@{BCred}zakoncz@{nCgreen}" azeby opuscic kolejke!! %;\
;    /def -p3 -h'SEND zakoncz' _hook_kolejka_3 = \
;      /echo -p -aCgreen Opuszczam kolejke. %%;\
;      /purge _hook_kolejka_* %%;\
;      zakoncz %;\
;   /def -aB -F -t'*... lacze ...*' _zalogowalo_mnie_2 = \
;       /purge _hook_kolejka_*


/def -aB -F -t'* z hosta:*' _zalogowalo_mnie_1 = \
    /_czysc_ostatnia_statystyke %;\
    /set ogolne_leader=LEADER %;\
    /set ogolne_druzyna=DRUZYNA %;\
    /_wsparcie_base %;\
    /set ogolne_wykres_slupkowy=$[strcat(ftime("%H:%M",time()),"#",time(),"$")] %;\
    /set ogolne_postep_last=0 %;\
    /set ogolne_wykres_postepow=$[strcat(ftime("%H:%M:%S", time()),"|0$0/0#")] %;\
    /_zapisz %;\
    /repeat -5 1 /start


/def -aBCblue -F -t'Oddalasz sie.' oddalasz_sie = \
    /if ({obecnie_expujacy} =~ NULL) \
        /return %;\
    /endif %;\
    /let log_plik=$[strcat({TFDIR}, "/log/", {obecnie_expujacy}, "_zgon_", ftime("%Y-%m-%d.%H:%M",time()), ".log")] %;\
    /echo Zgina   : $[toupper({obecnie_expujacy}, 1)] %| /writefile -a %{log_plik} %;\
    /echo Dnia    : $[ftime("%Y-%m-%d",time())] %|/writefile -a %{log_plik} %;\
    /echo Godzina : $[ftime("%H:%M:%S",time())] %|/writefile -a %{log_plik} %;\
    /echo %|/writefile -a %{log_plik} %;\
    /echo %|/writefile -a %{log_plik} %;\
    /let out=%; \
    /test out := tfopen({log_plik}, "a") %;\
    /test tfflush(out, 0) %;\
    /quote -S -decho #1000 %| /copyio i %{out} %;\
    /test tfclose(out) %;\
;    /relog %{log_plik} 1000 %;\
    /echo ####### Jak widze umarles!!!! :)  ####### 

/def odczytaj = \
    /echo Odczytuje stan konta!!! %;\
    /_odczytaj

/def _odczytaj = \
    /quote -S /_od_1 '%{TFDIR}/save/%{obecnie_expujacy}/zabici_calkowicie.tf %;\
    /quote -S /_od_1 '%{TFDIR}/save/%{obecnie_expujacy}/zabici_ostatnio.tf %;\
    /quote -S /_od_1 '%{TFDIR}/save/%{obecnie_expujacy}/ogolne_ustawienia.tf
;    /quote -S /_od_1 '%{TFDIR}/save/%{obecnie_expujacy}/cechy_obecne.tf

/purge -i _od_1
/def -i _od_1 = \
    /test regmatch("/set (.*?)=", {*}) %;\
    /eval /set %{P1}=$$[{PR}]

/def _zapisz = \
  /if ( ({obecnie_swiat}=~${world_name} & is_connected({obecnie_swiat})) | ({1}=~"all") ) \
        /listvar zabici_calkowicie_* %|/writefile %{TFDIR}/save/%{obecnie_expujacy}/zabici_calkowicie.tf %;\
        /listvar zabici_ostatnio_* %|/writefile %{TFDIR}/save/%{obecnie_expujacy}/zabici_ostatnio.tf %;\
        /listvar ogolne_* %|/writefile %{TFDIR}/save/%{obecnie_expujacy}/ogolne_ustawienia.tf %;\
        /if ({ogolne_savehist}) \
            /save_history -i %;\
        /endif %;\
  /endif

/def zapisz = \
    /echo Zapisuje stan konta!! %;\
    /_zapisz all


/def _czysc_calkowita_statystyke = \
    /quote -S /unset `/listvar -s zabici_calkowicie_*

/def _czysc_ostatnia_statystyke = \
    /quote -S /unset `/listvar -s zabici_ostatnio_zabite_* %;\
    /quote -S /unset `/listvar -s zabici_ostatnio_polegle_* %;\
    /quote -S /unset `/listvar -s zabici_ostatnio_ktozabil_* %;\
    /set zabici_ostatnio_suma_zabitych=0 %;\
    /set zabici_ostatnio_suma_poleglych=0 %;\
    /set zabici_ostatnio_suma_zabitych_1=0 %;\
    /set zabici_ostatnio_suma_poleglych_1=0

/def _czysc_ogolne_zmienne = \
    /quote -S /unset `/listvar -s zabici_ogolne_*

/def _ustaw_szerokosc = \
    opcje szerokosc 0%;\
    /set ogolne_szerokosc_ekranu=3


/def -p10 -h'SEND zakoncz' _zakoncz_gre = \
    /send wez wszystko z %{ogolne_plecaka} %;\
    /send wez wszystko z %{ogolne_pojemnik_monety} %;\
    /send zakoncz

/def -mregexp -t'^Szerokosc ekranu:'    _sprawdzam_szerokosc = \
    /set ogolne_szerokosc_ekranu=$[0 + {PR}]%;\
    /if ({ogolne_szerokosc_ekranu} != 0) \
        /echo Te skrypty WYMAGAJA szerokosci 0. Czyli calkowitego nieciecia textu. %;\
        /echo Ustawiam wymagana szrokosc :) %;\
        /_ustaw_szerokosc %;\
    /else \
       /set ogolne_szerokosc_ekranu=3 %;\
    /endif
    
;------------------------------------------------------------------------------
;|                        Pasek stanu z roznymi cudami                       |
;------------------------------------------------------------------------------

/if ($(/listvar -s aktualna_kondycha)=~NULL) /set aktualna_kondycha= Ingwar Swenson  '%;/endif
/if ($(/listvar -s wykrzykniki)=~NULL) /set wykrzykniki *** %;/endif
/eval /if ($(/listvar -s wyjscia_z_lokacji)=~NULL) /set wyjscia_z_lokacji=  version %{tf_version-3.1.0}   '%;/endif

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
;    /if ({ogolne_top}==1 & columns()>102) \
;      /set zuzycie_cpu=%{zuzycie_cpu-0.0} %;\
;      /set zuzycie_mem=%{zuzycie_mem-0.0} %;\
;      /set status_fields \
;        @more:8:Br :1 @world:0 "CPU:":-5:Cblue zuzycie_cpu:-5:BCblue "%":1:BCblue "MEM:":-5:Cblue zuzycie_mem:-5:BCblue "%":1:BCblue :1 \
;        @more:8:Br :1 "CPU:":-5:Cblue zuzycie_cpu:-5:BCblue "%":1:BCblue "MEM:":-5:Cblue zuzycie_mem:-5:BCblue "%":1:BCblue :1 \
;        aktualna_kondycha:17 :1 \
;        wyjscia_z_lokacji:19 :1 \
;        "(":1 zabici_ostatnio_suma_zabitych:-3 "/":1 zabici_ostatnio_suma_poleglych:-3 ")":1 :1 \
;        :0 @log:5 :1 @mail:6 :1 insert:6 :1 @clock:5 %;\
;      /sys  %{TFDIR}/top.sh $[getpid()] %;\
;      /rstart -30 99999 /_top_tf %;\
    /if (columns() >= 80) \
;      /set pad_width=$[columns() - 79] %;\
        /let first_line=\
            @more:8:Br :1 aktualna_kondycha:17 \
            :1 wyjscia_z_lokacji:19 :1 "(":1 \
            zabici_ostatnio_suma_zabitych:-3 \
            "/":1 zabici_ostatnio_suma_poleglych:-3 ")":1 \
            '':0 @log:5 @mail:6 insert:6 :1 @clock:5 %;\
;       /sys %{TFDIR}/top.sh $[getpid()] stop %;\
;       /rstop /_top_tf %;\
    /elseif (columns() > 54) \
        /let first_line=\
            aktualna_kondycha:17 :1 \
            wyjscia_z_lokacji:19 :1 \
            "(":1 zabici_ostatnio_suma_zabitych:-3 "/":1 \
            zabici_ostatnio_suma_poleglych:-3 ")":1 \
            :0 @clock:5 %;\
;       /sys %{TFDIR}/top.sh $[getpid()] stop %;\
;       /rstop /_top_tf %;\
    /else \
        /let first_line=\
            :1 @clock:5 %;\
;     /sys %{TFDIR}/top.sh $[getpid()] stop %;\
;      /rstop /_top_tf %;\
    /endif %;\
    /if (regmatch("5.0 beta (.*)", $(/ver)) & {P1} >= 7) \
        /if (!ogolne_status_old & columns() >= 90) \
            /let _sh=10 %;\
            /let _i=0 %;\
            /let _l0 %;\
            /let _l1 %;\
            /let _l2 %;\
            /while ({_i} < {_sh}) \
                /test ++{_i} %;\
                /let _l0=%{_l0} kier_0_%{_i}:1:Cbgblue %;\
                /let _l1=%{_l1} kier_1_%{_i}:1:Cbgblue %;\
                /let _l2=%{_l2} kier_2_%{_i}:1:Cbgblue %;\
            /done %;\
            /_wyjscia_czysc %;\
            /set second_line=$[substr(strcat({second_line}, strrep(" ", columns() - {_sh})), 0, columns() - {_sh})] %;\
            /set empty_line=$[strrep(" ", columns())] %;\
            /set status_height=3 %;\
            /set status_fields=%{_l0} %{first_line} %;\
            /status_add -r0 -c - %{_l0} %{first_line} %;\
            /status_add -r1 -c - %{_l1} empty_line:0:Cbgblue %;\
            /status_add -r2 -c - %{_l2} second_line:0:Cbgblue %;\
        /else \
            /set second_line=$[substr(strcat({second_line}, strrep(" ", columns())), 0, columns())] %;\
            /set status_height=2 %;\
            /set status_fields=%{first_line} %;\
            /status_add -r0 -c - %{first_line} %;\
            /status_add -r1 -c - second_line:0:Cbgblue %;\
        /endif %;\
    /else \
        /echo -aBCred Niestety twoja wersja tf-a nie obsluguje multistatusow %;\
        /echo -aBCred Sciagnij conajmniej versje tf-a 5.0b7 %;\
        /set status_fields=%{first_line} %;\
    /endif %;\
    /if ({ORIGTERM} =~ "zmud") \
        /visual off %;\
    /else \
        /visual on %;\
    /endif

/_status_ustaw

/def -h'RESIZE' _status_hook = /_status_ustaw

/def top = \
    /if ({1}=/'{wyswietl|pokaz}') \
      /echo -p -aCblue Zuzycie CPU: @{B}%{zuzycie_cpu}@{n} MEM: @{B}%{zuzycie_mem} %;\
    /elseif ({1}=/'{on|1|wlacz}') \
      /set ogolne_top=1 %;\
      /echo Wlaczam sprawdzanie zuzycia pamieci i procesora %;\
      /_status_ustaw %;\
      /if (columns()<103) \
        /echo Zbyt mala szerokosc ekranu wymagane to conajmniej 103 kolumny a jest $[columns()]. %;\
      /endif %;\
    /elseif ({1}=/'{off|0|wylacz}') \
      /set ogolne_top=0 %;\
      /echo Wylaczam sprawdzanie zuzycia pamieci i procesora %;\
      /_status_ustaw %;\
    /else \
      /echo Uzycie: /status [on|off|pokaz] %;\
    /endif

/def _top_tf = \
    /quote -S \
;      /if (strstr(_top_,getpid()) >-1) \
;        /_top_tf2 %%{_top_} %%;\
;      /endif %%;\
    /set _top_=!%{TFDIR}/top.sh $[getpid()] %;\
    /_top_tf2 %{_top_} %;\
    /unset _top_

/def _top_tf2= \
    /set zuzycie_cpu=%{9} %;\
    /set zuzycie_mem=%{10}

/def -F -abBCmagenta -mregexp -t'^Czeka na ciebie NOWA poczta' _poczta_1 = \
    /_poczta_add Kogos lub Czegos (NOWA)

/def -F -abBCmagenta -mregexp -t'^Czeka na ciebie nieprzeczytana poczta' _poczta_2 = \
    /_poczta_add Kogos lub Czegos (Nieprzeczytana)

/def -F -t'Czeka na ciebie poczta*' _poczta_3 = \
    /_poczta_clear

/def -F -abBCmagenta -mregexp -t'^Masz nowa poczte od (.*).' _poczta_4 = \
    /_poczta_add %{P1}

/def -F -abBCmagenta -mregexp -t'^Masz nowy list.*od ([^ ]*), zatytulowany \'(.*)(\'|[^.]$)' _poczta_5 = \
    /_poczta_add %{P1} zatytuowany '%{P2}'

/def -F -t'Twoja skrzynka pocztowa*' _poczta_6 = \
    /_poczta_clear

/def _poczta_add = \
    /set ogolne_poczta=$[strcat({ogolne_poczta},ftime("%H:%M", time()), {*}, "|")] %;\
    /test status_fields := status_fields

/def _poczta_clear = \
    /unset ogolne_poczta %;\
    /test status_fields := status_fields %;\

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
      /echo Poczta wyczyszczona. %;\
      /_poczta_clear %;\
    /else \
      /echo Uzycie: /poczta [czysc|clear|off|wyswietl] %;\
    /endif

/def _kondycha_show = \
    /if (ogolne_kondycja_old) \
        /return _kondycha_show_old({1}, {2}, {3}, {4}, {5}) %;\
    /else \
        /return _kondycha_show_new({1}, {2}, {3}, {4}, {5}) %;\
    /endif

/def _kondycha_show_new = \
    /let _who=$[replace("[", "", replace("]", "", tolower({4})))] %;\
    /let _wwho=$[_string_to_varname(_who)] %;\
    /let _state=%;\
    /let _col=%;\
    /let _n=%;\
    /if ({_who} =~ '') \
        /if (_kondycja_ != {2}) \
            /set aktualna_kondycha=$[pad(decode_attr({3}), 17)] %;\
            /unset _hidden_cond %;\
        /endif %;\
        /let _col=@{BCyellow} %;\
        /quote -S /unset `/listvar -s _kondycja_* %;\
        /if (ogolne_zaslona & !_zaslona_niegotowa) \
            /_opoznij -o'0.2' /_zas_auto %;\
        /endif %;\
        /if ({ORIGTERM} =~ "zmuda") \
            /_echo ##### Kond clear %;\
        /else \
            /if (_hidden_cond == 1) \
                /set _hidden_cond=2 %;\
            /elseif (_hidden_cond == 2) \
                /unset _hidden_cond %;\
                /_echo %;\
            /else \
                /_echo %;\
            /endif %;\
        /endif %;\
    /else \
        /let i=$[strchr({_who}, "@{\\(")] %;\
        /if ({i} > -1) \
            /test _who := substr({_who}, 0, i - 1) %;\
        /else \
            /test _n := _opis_sprawdz_i_wyswietl({_who}) %;\
            /test _n := (strlen(_n) > 3 ? strcat(" ", _n) : "") %;\
        /endif %;\
        /if (strstr({ogolne_druzyna}, {_who}) != -1) \
            /let _state=$(/eval /eval /echo %%druzyna_state_%{_wwho})D %;\
            /let _col=@{Cgreen} %;\
        /elseif (strstr({ogolne_leader}, {_who}) != -1) \
            /let _state=L %;\
            /let _col=@{BCgreen} %;\
        /endif %;\
    /endif %;\
    /let _wrog=$(/listvar -v _zaslona_wrog_%{_wwho}) %;\
    /let _wrog=$[strlen(_wrog) ? strcat(" @{Bn}-@{BCyellow}>@{BCgreen}>@{BCmagenta}>@{BCblue}> @{Bn}", strip_attr(toupper(_wrog, 1))) : ""] %;\
;    /echo [%_who] [%_wwho] [%_wrog] %;\
    /let _who=$(/_odmien_M_B %{_who}) %;\
    /let _who=$[replace(" ", "_", tolower({_who}))] %;\
    /let _c=%{1} %;\
;    /_debug %_who %;\
    /if ($(/listvar -v _szal_%{_who})) \
        /if ({2} != 7) \
            /set _kondycja_%{_who}=%{2} %;\
            /let _show=* %;\
            /unset _szal_%{_who} %;\
        /else \
            /set _kondycja_%{_who}=0 %;\
            /let _c=BCred %;\
            /let _show=X %;\
            /if ({_who} !~ '') \
                /unset _szal_%{_who} %;\
            /endif %;\
        /endif %;\
    /else \
        /set _kondycja_%{_who}=%{2} %;\
        /let _show=# %;\
    /endif %;\
    /_debug %{_who} %;\
    /let _wrogowie_count=$(/length $(/listvar -s _zaslona_wrog_* %{_who-cie*})) %;\
    /if (_wrogowie_count) \
        /let _wrog= @{BCyellow}<@{BCgreen}<@{BCmagenta}<@{BCblue}<@{Bn}- %;\
    /endif %;\
    /let _col_szer=2 %;\
    /if (ogolne_xtitle_show & {_who} =~ '') \
        /xtitle %{aktualna_kondycha} [%{obecnie_expujacy}] %;\
;        /xtitle $[strrep({_show}, {2} * {_col_szer})] %;\
    /endif %;\
    /if (!_hidden_cond | {ORIGTERM} =~ "zmuda") \
        /return substitute(pad(ogolne_literki_na_cyferki ? strcat("[", {2}, "/7][", _wrogowie_count, "]") : "", 0, "[@{", 0, {_c}, 0, "}", 0, strrep({_show}, {2} * {_col_szer}), 7 * {_col_szer}, "@{nCwhite}]", 0, "[", 0, {_state}, 2, "] ", 0, {_col}, 0, encode_attr({4-Ty}), 0, {_n}, 0, ".", 0, {_wrog}), "", 1) %;\
    /else \
        /return substitute("", "gL", 0) %;\
    /endif

/def _kondycha_show_old = \
    /let _who=$[replace("[", "", replace("]", "", tolower({4})))] %;\
    /let _state=%;\
    /let _col=%;\
    /let _n=%;\
    /if ({_who} =~ '') \
        /if (_kondycja_ != {2}) \
            /set aktualna_kondycha=$[pad(decode_attr({3}), 17)] %;\
        /endif %;\
        /let _col=@{BCyellow} %;\
        /quote -S /unset `/listvar -s _kondycja_* %;\
        /if (ogolne_zaslona & !_zaslona_niegotowa) \
            /_opoznij -o'0.2' /_zas_auto %;\
        /endif %;\
        /if (_hidden_cond == 1) \
            /set _hidden_cond=2 %;\
        /elseif (_hidden_cond == 2) \
            /unset _hidden_cond %;\
            /_echo %;\
        /else \
            /_echo %;\
        /endif %;\
    /else \
        /let i=$[strchr({_who}, "@{\\(")] %;\
        /if ({i} > -1) \
            /test _who := substr({_who}, 0, i - 1) %;\
        /else \
            /test _n := _opis_sprawdz_i_wyswietl({_who}) %;\
            /test _n := (strlen(_n) > 3 ? strcat(" ", _n) : "") %;\
        /endif %;\
        /if (strstr({ogolne_druzyna}, {_who}) != -1) \
            /let _wwho=$[replace(" ", "_", _who)] %;\
            /let _state=$(/eval /echo %%druzyna_state_%{_wwho})D %;\
            /let _col=@{Cgreen} %;\
        /elseif (strstr({ogolne_leader}, {_who}) != -1) \
            /let _state=L %;\
            /let _col=@{BCgreen} %;\
        /endif %;\
    /endif %;\
    /let _who=$(/_odmien_M_B %{_who}) %;\
    /let _who=$[replace(" ", "_", tolower({_who}))] %;\
    /let _c=%{1} %;\
    /if ($(/listvar -v _szal_%{_who})) \
        /if ({2} != 7) \
            /set _kondycja_%{_who}=%{2} %;\
            /let _show=* %;\
            /unset _szal_%{_who} %;\
        /else \
            /set _kondycja_%{_who}=0 %;\
            /let _c=BCred %;\
            /let _show=X %;\
            /if ({_who} !~ '') \
                /unset _szal_%{_who} %;\
            /endif %;\
        /endif %;\
    /else \
        /set _kondycja_%{_who}=%{2} %;\
        /let _show=# %;\
    /endif %;\
    /let _col_szer=2 %;\
    /if (!_hidden_cond) \
        /return substitute(pad("[", 0, {_state}, 3, "][@{", 0, {_c}, 0, "}", 0, strrep({_show}, {2} * {_col_szer}), 7 * {_col_szer}, "@{nCwhite}] ", 0, {_col}, 0, encode_attr({4}), 0, {_n}, 0, {_col}, 0, {5}), "", 1) %;\
    /else \
        /return substitute("", "gL", 0) %;\
    /endif

/def -mregexp -t'(?:| )jest(?:es|) w swietnej kondycji\\.$$' _kondycha_swietna= \
    /test _kondycha_show("BCgreen", 7, "@{BCgreen}Swietna kondycja@{BCblue}.", {PL}, {P0})
        
/def -mregexp -t'(?<!ze, )(?:| )jest(?:es|) w dobrym stanie\\.$$' _kondycha_dobra= \
    /test _kondycha_show("BCgreen", 6, "@{BCgreen}Dobry stan@{BCblue}.", {PL}, {P0})

/def -mregexp -t'(?:| )jest(?:es|) lekko rann.\\.$$' _kondycha_lekko_ranna= \
    /test _kondycha_show("BCyellow", 5, "@{BCyellow}Lekko ranny@{BCblue}..", {PL}, {P0})

/def -mregexp -t'(?:| )jest(?:es|) rann.\\.$$' _kondycha_ranna= \
    /test _kondycha_show("BCyellow", 4, "@{BCyellow}Ranny@{BCblue}...", {PL}, {P0})

/def -mregexp -t'(?:| )jest(?:es|) w zlej kondycji\\.$$' _kondycha_zla_kondycja= \
    /test _kondycha_show("BCmagenta", 3, "@{BCmagenta}W zlej kondycji@{BCblue}!", {PL}, {P0})

/def -mregexp -t'(?:| )jest(?:es|) ciezko rann.\\.$$' _kondycha_ciezko_ranny= \
    /test _kondycha_show("BCmagenta", 2, "@{BCmagenta}Ciezko ranny@{BCblue}!!", {PL}, {P0})

/def -mregexp -t'(?:| )jest(?:es|) ledwo zyw.\\.$$' _kondycha_ledwo_zywy= \
    /test _kondycha_show("BCred", 1, "@{BCred}LEDWO ZYWY@{BCblue}!!!", {PL}, {P0})

/def -mregexp -ag -t'^Wydaje sie, ze (.*) ignoruje wszystkie rany\\.$$' _kondycha_szal = \
    /let _who=$(/_odmien_M_B %{P1}) %;\
    /set _szal_$[_string_to_varname({_who})]=1

/def -Fp5 -P2BCgreen -t'Nieartykuowany ryk wyrywa sie z gardla (.*), gdy niczym.*(gdy rozpoczyna sie Bitewny Szal)!!$$' _szal_on_ktos = \
    /set _szal_$[_string_to_varname({P1})]=1

;/def -Fp5 -P2BCgreen -t'Na ustach (.*) pojawia sie piana, a w oku zas (dostrzegasz blysk pierwotnej furii)\\.$$' _zt_szal_on_ktos = \
;    /set _szal_$[replace(" ", "_", tolower({P1}))]=1

;/def -Fp5 -P2BCgreen -t'^(.*) (uspokaja sie i opuszcza na chwile glowe), a gdy ja podnosi to nie dostrzegasz juz w jego spojrzeniu oznak straszliwej furii lecz jedynie zawzietosc i upor\\.$$' _zt_szal_off_ktos = \
;    /unset _szal_$(/_odmien_M_D %{P1})

;------------------------------------------------------------------------------
;|                        Wykresy i inne statystykiyki                        |
;------------------------------------------------------------------------------
/def -p10 -F -mregexp -t'^Zabil[eao]s (.+)\\.$$' _zabiles_cosik_licz = \
    /_dodaj_do_zabitych %{P1} %;\
    /lootzciala %{P1}

/def -p10 -F -mregexp -t'^(.+?) (?:\\(.*\\) |)zabil(?:a|o|) (.+)\\.$' _ktos_zabil_cosik_licz = \
    /_dodaj_do_kto_zabil %{P1} %;\
    /_dodaj_do_poleglych %{P2}

/def _dodaj_do_zabitych = \
    /let zabity=$[replace('-', '_', substr({L1}, 0, 13))] %;\
    /if ($(/listvar -s zabici_ostatnio_polegle_%{zabity})=~NULL) \
      /set zabici_ostatnio_zabite_%{zabity}=0 %;\
      /set zabici_ostatnio_polegle_%{zabity}=0 %;\
      /if ($(/listvar -s zabici_calkowicie_polegle_%{zabity})=~NULL) \
        /set zabici_calkowicie_zabite_%{zabity}=0 %;\
        /set zabici_calkowicie_polegle_%{zabity}=0 %;\
      /endif %;\
    /endif %;\
    /test ++zabici_ostatnio_zabite_%{zabity} %;\
    /test ++zabici_ostatnio_polegle_%{zabity} %;\
    /test ++zabici_calkowicie_zabite_%{zabity} %;\
    /test ++zabici_calkowicie_polegle_%{zabity} %;\
    /test ++zabici_ostatnio_suma_zabitych %;\
    /test ++zabici_ostatnio_suma_poleglych  %;\
    /test ++zabici_calkowicie_suma_zabitych %;\
    /test ++zabici_calkowicie_suma_poleglych

/def _dodaj_do_poleglych = \
    /let zabity=$[replace('-', '_', substr({L1}, 0, 13))] %;\
    /if ($(/listvar -s zabici_ostatnio_polegle_%{zabity})=~NULL) \
      /set zabici_ostatnio_zabite_%{zabity}=0 %;\
      /set zabici_ostatnio_polegle_%{zabity}=0 %;\
      /if ($(/listvar -s zabici_calkowicie_polegle_%{zabity})=~NULL) \
        /set zabici_calkowicie_zabite_%{zabity}=0 %;\
        /set zabici_calkowicie_polegle_%{zabity}=0 %;\
      /endif %;\
    /endif %;\
    /test ++zabici_ostatnio_polegle_%{zabity} %;\
    /test ++zabici_calkowicie_polegle_%{zabity} %;\
    /test ++zabici_ostatnio_suma_poleglych %;\
    /test ++zabici_calkowicie_suma_poleglych

/def _dodaj_do_kto_zabil = \
    /let zabity=$[replace('-', '_', substr({L1}, 0, 13))] %;\
    /if ($(/listvar -s zabici_ostatnio_ktozabil_%{zabity})=~NULL) \
      /set zabici_ostatnio_ktozabil_%{zabity}=0 %;\
    /endif %;\
    /test ++zabici_ostatnio_ktozabil_%{zabity}

/def zabici = \
    /if (!getopts("s", "")) /return 0%; /endif %;\
    /let po_ile=%{1} %;\
    /if ({po_ile} < 1) \
      /let po_ile=2%;\
    /endif  %;\
    /let linia1=$[strrep("=========================+",po_ile-1)] %;\
    /let linia= %;\
    /let cc=0 %;\
    /_echo +%{linia1}=========================+%;\
    /if ({opt_s}) \
        /let zabici_lista=$(/listvar -s -S -mglob zabici_ostatnio_polegle_*) %;\
    /else \
        /let zabici_lista=$(/listvar -s -mglob zabici_ostatnio_polegle_*) %;\
    /endif %;\
    /let zabici_lista=$[strcat(zabici_lista," end")] %;\
    /while /let i=$[strstr(zabici_lista," ")]%; /@test i > 0%; /do \
      /let ktory_var=$[substr(zabici_lista,0,i)] %;\
      /let ktory_ile=$(/eval /listvar -v %{ktory_var}) %;\
      /let ktory_nazwa=$[substr(ktory_var,strrchr(ktory_var,"_")+1)] %;\
      /let ktory_ile2=$(/eval /listvar -v zabici_ostatnio_zabite_%{ktory_nazwa}) %;\
      /if (cc<{po_ile}) \
        /let linia=$[strcat(linia,"|",pad(ktory_nazwa,13),": (",pad(ktory_ile2,3),"/",pad(ktory_ile,4),")")] %;\
        /test ++cc %;\
        /let zabici_lista=$[substr(zabici_lista,i+1)] %;\
      /else \
    /_echo %{linia}| %;\
    /let cc=0 %;\
    /let linia= %;\
      /endif %;\
    /done %;\
    /if (cc>0) \
      /_echo $[strcat(linia,strrep("|             : (        )",po_ile-cc),"|")] %;\
    /endif %;\
    /let linia=$[strcat("(@{BCyellow}  ",pad(zabici_ostatnio_suma_zabitych,6),"@{n})|")] %;\
    /if (wrapsize > {po_ile}*27+6) \
      /let linia=$[strcat(linia," @{BCyellow}<@{BCgreen}<@{BCmagenta}<@{BCblue}<@{Bn}-")] %;\
    /endif %;\
    /echo -p +%{linia1}===== W sumie: %{linia}  %;\
    /_echo +%{linia1}=========================+%;\
    /let linia= %;\
    /let cc=0 %;\
    /let zabici_lista=$(/listvar -s -mglob zabici_ostatnio_ktozabil_*) %;\
    /if ({opt_s}) \
        /let zabici_lista=$(/quote -S -decho !echo %{zabici_lista}|tsort|sort) %;\
    /endif %;\
    /let zabici_lista=$[strcat(zabici_lista," end")] %;\
    /while /let i=$[strstr(zabici_lista," ")]%; /@test i > 0%; /do \
      /let ktory_var=$[substr(zabici_lista,0,i)] %;\
      /let ktory_ile=$(/eval /listvar -v %{ktory_var}) %;\
      /let ktory_nazwa=$[substr(ktory_var,strrchr(ktory_var,"_")+1)] %;\
      /if (cc<{po_ile}) \
        /let linia=$[strcat(linia,"|",pad(ktory_nazwa,13),": (     ",pad(ktory_ile,3),")")] %;\
        /test ++cc %;\
        /let zabici_lista=$[substr(zabici_lista,i+1)] %;\
      /else \
    /_echo %{linia}| %;\
    /let cc=0 %;\
    /let linia= %;\
      /endif %;\
    /done %;\
    /if (cc>0) \
      /_echo $[strcat(linia,strrep("|             : (        )",po_ile-cc),"|")] %;\
    /endif %;\
    /let linia=$[strcat("(@{BCyellow}  ",pad(zabici_ostatnio_suma_poleglych,6),"@{n})|")] %;\
    /if (wrapsize > {po_ile}*27+6) \
      /let linia=$[strcat(linia," @{BCyellow}<@{BCgreen}<@{BCmagenta}<@{BCblue}<@{Bn}-")] %;\
    /endif %;\
    /echo -p +%{linia1}===== W sumie: %{linia}  %;\
    /_echo +%{linia1}=========================+



/def zabici2 = \
    /if (!getopts("s", "")) /return 0%; /endif %;\
    /let po_ile=%{1} %;\
    /if ({po_ile} < 1) \
      /let po_ile=2%;\
    /endif  %;\
    /let linia1=$[strrep("============================+",po_ile-1)] %;\
    /let linia= %;\
    /let cc=0 %;\
    /_echo +%{linia1}============================+%;\
    /if ({opt_s}) \
        /let zabici_lista=$(/listvar -S -s -mglob zabici_calkowicie_polegle_*) %;\
    /else \
        /let zabici_lista=$(/listvar -s -mglob zabici_calkowicie_polegle_*) %;\
    /endif %;\
    /let zabici_lista=$[strcat(zabici_lista," end")] %;\
    /while /let i=$[strstr(zabici_lista," ")]%; /@test i > 0%; /do \
      /let ktory_var=$[substr(zabici_lista,0,i)] %;\
      /let ktory_ile=$(/eval /listvar -v %{ktory_var}) %;\
      /let ktory_nazwa=$[substr(ktory_var,strrchr(ktory_var,"_")+1)] %;\
      /let ktory_ile2=$(/eval /listvar -v zabici_calkowicie_zabite_%{ktory_nazwa}) %;\
      /if (cc<{po_ile}) \
        /let linia=$[strcat(linia,"|",pad(ktory_nazwa,13),": (",pad(ktory_ile2,5),"/",pad(ktory_ile,5),")")] %;\
        /test ++cc %;\
        /let zabici_lista=$[substr(zabici_lista,i+1)] %;\
      /else \
    /_echo %{linia}| %;\
    /let cc=0 %;\
    /let linia= %;\
      /endif %;\
    /done %;\
    /if (cc>0) \
      /_echo $[strcat(linia,strrep("|             : (           )",po_ile-cc),"|")] %;\
    /endif %;\
    /let linia=$[strcat("(@{BCyellow}",pad(zabici_calkowicie_suma_zabitych,5),"@{BCblue}/","@{BCyellow}",pad(zabici_calkowicie_suma_poleglych,5),"@{n})|")]%;\
    /if (wrapsize > {po_ile}*27+6) \
      /let linia=$[strcat(linia," @{BCyellow}<@{BCgreen}<@{BCmagenta}<@{BCblue}<@{Bn}-")] %;\
    /endif %;\
    /echo -p +%{linia1}====== W sumie:%{linia}  %;\
    /_echo +======== %{zabici_calkowicie_data} ========+%{linia1}

/def _nowy_postep = \
    /if ({1}=={ogolne_postep_last}) \
        /return %;\
    /endif %;\
    /msg -e @{B}              Zrobiles postep ! ! ! %;\
    /set ogolne_postep_last=%{1} %;\
    /set ogolne_wykres_postepow=$[strcat({ogolne_wykres_postepow}, ftime("%H:%M:%S", time()),"|",{ogolne_postep_last}, "$", {zabici_ostatnio_suma_zabitych},"/", {zabici_ostatnio_suma_poleglych},"#")]

/def postepy = \
    /let _postepy=%{ogolne_wykres_postepow} %;\
    /let _time=$[substr({_postepy},0,5)]%;\
    /echo -p +========== Expisz dzis od @{BCgreen}%{_time} @{BCyellow}!!@{nCwhite} ==========+ %;\
    /echo -p |   Postepy    |   Czas   | Zabilem | Poleglo | %;\
    /echo -p +--------------+----------+---------+---------+ %;\
    /while /let i=$[strstr({_postepy},"#")] %; /@test i > 0 %; /do \
         /let _kolejny=$[substr({_postepy}, 0, i)] %;\
         /let j=$[strstr({_kolejny},"/")] %;\
         /let k=$[strstr({_kolejny},"$")] %;\
         /let _time=$[substr({_kolejny}, 0, 8)] %;\
         /let l=$[substr({_kolejny}, 9, k-9)] %;\
         /let _moi=$[substr({_kolejny}, k+1, j-k-1)] %;\
         /let _razem=$[substr({_kolejny}, j+1, i-j)] %;\
         /if ({l}!=0) \
             /echo -p | $[pad(_poziom_postepy({l}),12," |",1,{_time},9," |",1,{_moi},8," |",1,{_razem},8," |",1)] %;\
         /endif %;\
         /let _postepy=$[substr({_postepy},i+1)]%;\
    /done %;\
    /echo -p +=============================================+ 

/def _poziom_postepy = \
    /if ({1}==1) /return "minimalne" %;\
    /elseif ({1}==2) /return "nieznaczne" %;\
    /elseif ({1}==3) /return "bardzo male" %;\
    /elseif ({1}==4) /return "male" %;\
    /elseif ({1}==5) /return "nieduze" %;\
    /elseif ({1}==6) /return "zadowalajace" %;\
    /elseif ({1}==7) /return "spore" %;\
    /elseif ({1}==8) /return "dosc duze" %;\
    /elseif ({1}==9) /return "znaczne" %;\
    /elseif ({1}==10) /return "duze" %;\
    /elseif ({1}==11) /return "bardzo duze" %;\
    /elseif ({1}==12) /return "ogromne" %;\
    /elseif ({1}==13) /return "imponujace" %;\
    /elseif ({1}==14) /return "wspaniale" %;\
    /elseif ({1}==15) /return "gigantyczne" %;\
    /elseif ({1}==16) /return "niebotyczne" %;\
    /endif 

/def _wykres_base = \
    /let ile_zabitych=$[{zabici_ostatnio_suma_zabitych}-{zabici_ostatnio_suma_zabitych_1-0}]%;\
    /let ile_poleglych=$[{zabici_ostatnio_suma_poleglych}-{zabici_ostatnio_suma_poleglych_1-0}]%;\
    /if ({ile_poleglych}==0) \
      /if (substr({ogolne_wykres_slupkowy},strlen({ogolne_wykres_slupkowy})-1)!~"!") \
        /set ogolne_wykres_slupkowy=$[strcat({ogolne_wykres_slupkowy},"!")]%;\
      /endif %;\
    /else \
      /if (substr({ogolne_wykres_slupkowy},strlen({ogolne_wykres_slupkowy})-1)=~"!") \
        /set ogolne_wykres_slupkowy=$[strcat(substr({ogolne_wykres_slupkowy},0,strlen({ogolne_wykres_slupkowy})-1),ftime("%H:%M",time()-600),"|",0,"/",0,"#")]%;\
      /endif %;\
      /set ogolne_wykres_slupkowy=$[strcat({ogolne_wykres_slupkowy},ftime("%H:%M",time()),"|",{ile_zabitych},"/",{ile_poleglych},"#")]%;\
      /set zabici_ostatnio_suma_zabitych_1=%{zabici_ostatnio_suma_zabitych}%;\
      /set zabici_ostatnio_suma_poleglych_1=%{zabici_ostatnio_suma_poleglych}%;\
    /endif

/def wykres = \
    /let i=%;\
    /let _wykres=%{ogolne_wykres_slupkowy}%;\
    /let _time=$[substr({_wykres},0,5)]%;\
    /echo -p +-=============== Zabiles dzis od @{BCgreen}%{_time} @{BCyellow}!!@{nCwhite} ==============-+%;\
    /let _time=$[(time()-substr({_wykres},6,strstr({_wykres},"$")-6))/3600.0]%;\
    /let _wykres=$[substr({_wykres},strstr({_wykres},"$")+1)]%;\
    /while /let i=$[strstr({_wykres},"#")] %; /@test i > 0 %; /do \
      /let _wyk=$[substr({_wykres},0,i)]%;\
      /let _ja=$[substr({_wyk},6,strstr({_wyk},"/")-6)]%;\
      /let _oni=$[substr({_wyk},strstr({_wyk},"/")+1)]%;\
      /let linia=$[pad("|",1,substr({_wyk},0,5),6,"  (",2,{_ja},3,"/",1,{_oni},3,")  ",3,"@{BCyellow}",0,strrep("#",{_ja}),0,"@{nCyellow}",0,strrep("#",{_oni}-{_ja}),0)]%;\
      /echo -p %{linia} %;\
      /let _wykres=$[substr({_wykres},i+1)]%;\
    /done %;\
    /let ile_zabitych=$[{zabici_ostatnio_suma_zabitych}-{zabici_ostatnio_suma_zabitych_1}]%;\
    /let ile_poleglych=$[{zabici_ostatnio_suma_poleglych}-{zabici_ostatnio_suma_poleglych_1}]%;\
    /let linia=$[pad("|",1,ftime("%H:%M",time()),6,"  (",2,{ile_zabitych},3,"/",1,{ile_poleglych},3,")  ",3,"@{BCyellow}",0,strrep("#",{ile_zabitych}),0,"@{nCyellow}",0,strrep("#",{ile_poleglych}-{ile_zabitych}),0)]%;\
    /echo -p %{linia} %;\
    /echo +---------------------------------------------------------+ %;\
    /echo -p +-== Srednia szybkosc zabijania: (@{BCgreen}$[pad(substr({zabici_ostatnio_suma_zabitych}/{_time},0,5),5)]@{BCred}/@{nCgreen}$[pad(substr({zabici_ostatnio_suma_poleglych}/{_time},0,5),5)]@{BCblue}/@{BCwhite}Godzine@{nCwhite}) ==-+


;------------------------------------------------------------------------------
;|                        Statystyka wyslanych/odebranych literek             |
;------------------------------------------------------------------------------

;/purge -i _statystyka_li*

;/def -i -Fp500 -t'*' _statystyka_liczb_trig_1 = \
;    /set statystyka_liter_in=$[{statystyka_liter_in} + strlen({*})] %;\
;    /set ogolne_statystyka_liter_in=$[{ogolne_statystyka_liter_in} + strlen({*})] %;\
;    /let tmp=%{*} %;\
;    /let ile=1 %;\
;    /while /let i=$[strstr(tmp," ")]%; /@test i > 0%; /do \
;      /let tmp=$[substr(tmp,i+1)] %;\
;      /test ++ile %;\
;    /done %;\
;    /set statystyka_slow_in=$[{statystyka_slow_in} + {ile}] %;\
;    /set ogolne_statystyka_slow_in=$[{ogolne_statystyka_slow_in} + {ile}]
;    /echo Slow: %{statystyka_slow_in} liter: %{statystyka_liter_in}
    
;/def -i -qFp500 -h'SEND *' _statystyka_liter_hook_1 = \
;    /set statystyka_liter_out=$[{statystyka_liter_out} + strlen({*})] %;\
;    /set ogolne_statystyka_liter_out=$[{ogolne_statystyka_liter_out} + strlen({*})] %;\
;    /let tmp=%{*} %;\
;    /let ile=1 %;\
;    /while /let i=$[strstr(tmp," ")]%; /@test i > 0%; /do \
;      /let tmp=$[substr(tmp,i+1)] %;\
;      /test ++ile %;\
;    /done %;\
;    /set statystyka_slow_out=$[{statystyka_slow_out} + {ile}] %;\
;    /set ogolne_statystyka_slow_out=$[{ogolne_statystyka_slow_out} + {ile}] %;\
;;    /send %{*}
;    /echo Slow out: %{statystyka_slow_out} liter out: %{statystyka_liter_out}


/def statystyka = \
    /echo -p +$[strrep('-',columns()-2)] %;\
    /echo -p | Teraz wyslanych slow/liter   ($[pad({statystyka_slow_out},10,"/",1,{statystyka_liter_out},10)]) %;\
    /echo -p | Ogolem wyslanych slow/liter  ($[pad({ogolne_statystyka_slow_out},10,"/",1,{ogolne_statystyka_liter_out},10)]) %;\
    /echo -p | Teraz odebranych slow/liter  ($[pad({statystyka_slow_in},10,"/",1,{statystyka_liter_in},10)]) %;\
    /echo -p | Ogolem odebranych slow/liter ($[pad({ogolne_statystyka_slow_in},10,"/",1,{ogolne_statystyka_liter_in},10)]) %;\
    /echo -p +$[strrep('-',columns()-2)]
    
