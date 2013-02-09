; ## Linie dodane automagicznie   : tf_ver=2.4.2
; ## 
; ## Wersja pliku                 : 2.4.2
; ## Ostatnia zmiana pliku        : 2009-01-06 21:07:40
; ## Plik pobrany                 : 2009-01-06 21:07:50
; ## Wersja Tfupdate              : 2.0.1
; ##
; ##
;------------------------------------------------------------------------------
;|                           System i inne takie                              |
;------------------------------------------------------------------------------
; Przeladowanie wszystkich makr (lacznie z makramami grajacej obecnie osoby)
; Uzycie : /reload [-g] 
/def reload = \
    /mecho off %;\
    /purge %;\
    /purge -i ?alias_body_* %;\
    /purge -i ?alias_call_* %;\
    /load %{1} %{master_file}.tf%;\
    /load %{1} %{obecnie_expujacy}.tf %;\
    /if ({1} !~ "-q") \
        /tfver %;\
        /defs %;\
    /endif

/def check_tf_ver = \
    /if (regmatch("[1-4]+.+[0-9]+", $(/ver))) \
        /echo %;\
        /echo %;\
        /echo -p -aBCyellow Ta wersja skryptow jest przeznaczona do TF-a w wersji conajmniej 5.0 %;\
        /echo -p -aBCred    I moze zawierac pewnie bledy i nie uruchamiac czesci rzeczy. %;\
        /echo -p -aBCgreen  Prosze zainstalowac nowsza wersje. %;\
        /echo %;\
        /echo %;\
    /elseif (regmatch("5.0 alpha (.*)", $(/ver)) & {P1} < 14) \
        /echo %;\
        /echo -p -aBCyellow Ta wersja skryptow jest przeznaczona do TF-a w wersji conajmniej 5.0 beta 5, moze dzialac poprawnie ale to nie jest zalecane%;\
        /echo -p -aBCgreen  Prosze zainstalowac nowsza wersje. %;\
        /echo %;\
        /def decode_attr = /return inline_attr({*}) %;\
    /elseif (regmatch("5.0 beta (.*)", $(/ver)) & {P1} < 5) \
        /echo %;\
        /echo -p -aBCyellow Ta wersja skryptow jest przeznaczona do TF-a w wersji conajmniej 5.0 beta 5, moze dzialac poprawnie na tej wersji ale to nie jest zalecane%;\
        /echo %;\
    /endif

/check_tf_ver

/def _is_on = \
    /if ({*} =~ "on" | {*} =~ "1" | {*} =~ "wl") \
        /result 1 %;\
    /endif
   
/def _is_off = \
    /if ({*} =~ "off" | {*} =~ "0" | {*} =~ "wyl") \
        /result 1 %;\
    /endif

/def _have_druzyna = \
    /if ({ogolne_leader-LEADER} !~ "LEADER" | {ogolne_druzyna-DRUZYNA} !~ "DRUZYNA") \
        /result 1 %;\
    /endif

/def _have_leader = \
    /if ({ogolne_leader-LEADER} !~ "LEADER") \
        /result 1 %;\
    /endif
         
/def ping = \
    /sys ping -i2 -c5 arkadia.rpg.pl

/def rping = \
    /set ping_nr1=0 %;\
    /set ping_nr2=0 %;\
    /def -ag -t'Spoliczkuj kogo?' _ping_trig = \
        /test ++ping_nr2 %%;\
        /let _time=$$(/listvar -v ping_pong_%%{ping_nr2}) %%;\
        /let _time=$$[time() - _time] %%;\
        /let _time=$$[_time * 1000] %%;\
        /echo -aCgreen -p Ping nr %%{ping_nr2} - real ping time: %%{_time} ms %%;\
            /if (ping_nr2 >= 5) \
                /for i 0 5 /unset ping_pong_%%%{i} %%;\
                /unset ping_nr1 %%;\
                /unset ping_nr2 %%;\
                /purge _ping_trig %%;\
            /endif %;\
        /repeat -n -1 5 \
            /test ++ping_nr1 %%;\
            /set ping_pong_%%{ping_nr1}=$$[time()] %%;\
            /_send_safe spoliczkuj sie sam

/def _mtr_recieved = \
    /set mtr_time_last=$[(time() - mtr_time) * 1000] %;\
    /set mtr_time_sum=$[mtr_time_last + mtr_time_sum] %;\
    /set mtr_time_count=$[mtr_time_count + 1] %;\
    /if (mtr_time_last < mtr_time_min) \
        /set mtr_time_min=$[mtr_time_last] %;\
    /endif %;\
    /if (mtr_time_last > mtr_time_max) \
        /set mtr_time_max=$[mtr_time_last] %;\
    /endif %;\
    /unset mtr_time %;\
    /_mtr_set_line

/def _mtr_set_line = \
    /let orig_sigfigs=$[sigfigs] %;\
    /set sigfigs=3 %;\
    /let el=$[pad("Count: ", 0, mtr_time_count, 4, " last: ", 0, mtr_time_last, 7, " min: ", 0, mtr_time_min, 7, " max: ", 0, mtr_time_max, 7, " med: ", 0, mtr_time_sum / mtr_time_count, 7, " err: ", 0, mtr_time_err, 4, " skip: ", 0, mtr_time_skip, 4)] %;\
    /set sigfigs=$[orig_sigfigs] %;\
    /set empty_line=$[strcat({el}, strrep(" ", columns() - strlen(el)))]

/def _mtr_check = \
    /if (idle() < 60) \
        /if (!mtr_time) \
            /set mtr_time=$[time()] %;\
            /_send_safe opluj sie sam %;\
        /else \
            /set mtr_time_err=$[mtr_time_err + 1] %;\
            /_mtr_set_line %;\
        /endif %;\
    /else \
        /set mtr_time_skip=$[mtr_time_skip + 1] %;\
        /_mtr_set_line %;\
    /endif

/def mtr = \
    /set mtr_time_last=0 %;\
    /set mtr_time_min=1000 %;\
    /set mtr_time_max=0 %;\
    /set mtr_time_count=0 %;\
    /set mtr_time_sum=0 %;\
    /set mtr_time_err=0 %;\
    /set mtr_time_skip=0 %;\
    /rstop /_mtr_check %;\
    /rstart -1 i /_mtr_check %;\
    /unset mtr_time %;\
    /def -ag -t'Opluj kogo?' _mtr_trig = \
        /_mtr_recieved

/def tfver = \
    /_echo%;\
    /echo -p -aCgreen Tiny Fugue Script for @{B}Arkadia @{n}version @{n}%{tf_version}%;\
    /echo -p -aCgreen Powered by @{n}Ingwar Swenson%;\
    /_echo %;\
    /echo -p -aCgreen Wpisz "@{B}/pomoc@{n}" lub wcisnij "@{B}F1@{n}" azeby uzyskac @{BCwhite}Pomoc@{nCgreen}!

/def sys_fg = /quote -S -decho \\!!%{*-:} >/dev/null 2>/dev/null </dev/null & :

/def color = \
    /if ({*} =~ NULL | {*} =~ "help" | {*} =~ "pomoc") \
        /echo Pomoc do kolorkow tu bedzie :) %;\
    /elseif ({#} != 2) \
        /echo Zla ilosc argumentow. %;\
        /echo Uzycie: /color kolor_czego atrybuty %;\
    /else \
        /eval /set ogolne_color_%{1}=%{2} %;\
    /endif

/def color_set_scheme = \
    /if (regmatch("^(?![;#]).*?([^    ]+)", {*})) \
        /eval /set ogolne_color_%{P1} %;\
    /endif  

/def scheme = /colorscheme %{*}
/def skin = /colorscheme %{*}
/def colorscheme = \
    /if ({*} =~ NULL) \
        /echo -aCgreen -p Aktualnie wybrana jest skorka @{B}%{ogolne_colorscheme}@{n}. %;\
        /return %;\
    /elseif ({*} =~ "default" | {*} =~ "clear" | {*} =~ "standard") \
        /quote -S /unset `/listvar -s ogolne_color_* %;\
        /set ogolne_colorscheme=standard %;\
        /reload -q %;\
        /colorscheme %;\
    /else \
        /if ($(/quote -S -decho !if [ -f %{TFDIR}/%{*}.stf ]; then echo y; fi) =~ "y") \
            /quote -S /unset `/listvar -s ogolne_color_* %;\
            /quote -S -dexec /color_set_scheme '%{TFDIR}/%{*}.stf %;\
            /set ogolne_colorscheme=%{*} %;\
            /reload -q %;\
            /colorscheme %;\
        /else \
            /echo -aCgreen Nie ma takiego schematu kolorow. %;\
        /endif %;\
    /endif

/def compression = \
    /echo -p -aCgreen Current Compression "@{BCred}$[mccp_info(${world_name})]@{n}"

/def apropos = \
    /if ({1}=/"-*") \
      /let _opt=%{1} %;\
      /shift %;\
    /endif %;\
    /if ({*}=~NULL & {_opt}=~NULL) \
      /echo Apropos what?? %;\
    /else \
      /let __apropos=0 %;\
      /list %{_opt} *%{*}* %;\
      /let __apropos=$[{__apropos}+{?}] %;\
      /list %{_opt} -t'*%{*}*' %;\
      /let __apropos=$[{__apropos}+{?}] %;\
      /list %{_opt} =*%{*}* %;\
      /let __apropos=$[{__apropos}+{?}] %;\
      /if ( {*}!~NULL) \
        /listvar *%{*}* %;\
        /let __apropos=$[{__apropos}+{?}] %;\
      /endif %;\
      /if ({__apropos}==0) \
        /echo Nothing appriopriate. %;\
      /endif %;\
    /endif 
  
/def rec = \
    /if ({1}=/"-*") \
      /let _opt=$[substr({1},1)] %;\
      /shift %;\
    /endif %;\
    /recall -t[%%H:%%M:%%S.%%.] -q -mregexp /%{_opt-10} %* %;\
    /if ({?}==0) \
      /echo Nie znalazlem pasujacych linii!! %;\
    /endif

/purge -i pid_of
/def -i pid_of = \
    /quote -S \
      /eval /let pid_czego=`"/@ps -r" %%;\
      /if (strstr({pid_czego},{*}) != -1) \
        /first %%{pid_czego} %%;\
      /endif %;\

/def rstart = \
    /if ($(/pid_of %{-2})=~NULL) \
      /repeat %{1} %{2} %{-2} %;\
    /endif

/def rstop = \
    /kill $(/pid_of %{*})

/def itrigger = \
    /test $[fake_recv({*})]

/def _czesto = \
    /if (nie_za_czesto != 0) \
        /result 1 %;\
    /else \
        /set nie_za_czesto=1 %;\
        /rstart -%{1-5} 1 /set nie_za_czesto=0 %;\
        /result 0 %;\
    /endif

/def _nieczesto = \
    /if (nie_za_czesto == 0) \
        /eval %{*} %;\
        /set nie_za_czesto=1 %;\
        /rstart -5 1 /set nie_za_czesto=0 %;\
    /endif
    
/def opoznienie = \
    /set ogolne_opoznienie=%{*-%{ogolne_opoznienie}} %;\
    /msg Opoznienie przy szybkich akcjach ustawione na @{B}%{ogolne_opoznienie}@{n} sec.

/def _opoznij = \
    /if (!getopts("o#", "")) /return 0%; /endif%; \
    /let _opoznienie_std=$[rand(({opt_o-0} + {ogolne_opoznienie-3}) * 1000) / 1000.0] %;\
    /repeat -%{_opoznienie_std} 1 /_send_safe %{*}

/def auto_trig = \
    /if ({*} =~ NULL) \
        /if ({ogolne_auto_trig_off}) \
            /auto_trig on %;\
        /else \
            /auto_trig off %;\
        /endif %;\
    /elseif ($(/_is_on %{*})) \
        /unset ogolne_auto_trig_off %;\
        /msg Automagiczne robienie cudow wlaczone. %;\
    /elseif ($(/_is_off %{*})) \
        /set ogolne_auto_trig_off=1 %;\
        /msg Automagiczne robienie cudow wylaczone. %;\
    /else \
        /msg Automatyczne robienie cudow wlaczyc czy wylaczyc? %;\
    /endif

/def _trig_do = \
    /if (!getopts("o#", "")) /return 0%; /endif%; \
    /if (ogolne_auto_trig_off) \
        /fast_bind %{*} %;\
    /else \
        /_opoznij -o%{opt_o-0} %{*} %;\
    /endif
        
;Przypominacz ktorego pomysl zaczerpnollem ze skryptow Evina..
;Deczko :) przerobiony i poprawiony.. przypomina wczesniej 20, 10, 5 minut przed
;uruchomienie 
;/przypomnij 19:33 miecz do odebrania
;  o 19:33 i troche wczesniej przypomni o mieczu
;/przypomnij -2:10 spotkanie
; za 2 godziny 10 minut przypomni o spotkaniu..

/def przypomnij = \
    /if ({1}=/"-*") \
      /let _delay=$[substr({1},1)] %;\
    /else \
      /let _delay=$[{1} - $(/time %%H:%%M:%%S)] %;\
      /let _delay=$[({_delay} > 0) ? {_delay} : ({_delay} + 24:00)] %;\
    /endif %;\
    /if ({_delay} > 0:30 ) \
      /let _delay=$[{_delay} - 0:20] %;\
      /let _ile=20 %;\
    /elseif ({_delay} > 0:15 ) \
      /let _delay=$[{_delay} - 0:10] %;\
      /let _ile=10 %;\
    /elseif ({_delay} > 0:10 ) \
      /let _delay=$[{_delay} - 0:5] %;\
      /let _ile=5 %;\
    /else \
      /let _ile=0 %;\
    /endif %;\
    /repeat -%{_delay} 1 /_przypomnij %{_ile} %{-1}

/def _przypomnij = \
    /if ({1}==20 ) \
      /echo -p -abBCblack  Przypominasz sobie ze za @{BCwhite}20@{BCblack} minut masz @{BCgreen}%{-1}@{BCblack}!! %;\
      /repeat -0:10 1 /_przypomnij 10 %{-1} %;\
    /elseif ({1}==10) \
      /echo -p -abBCblack  Przypominasz sobie ze za @{BCwhite}10@{BCblack} minut masz @{BCgreen}%{-1}@{BCblack}!! %;\
      /repeat -0:5 1 /_przypomnij 5 %{-1} %;\
    /elseif ({1}==5) \
      /echo -p -abBCblack  Przypominasz sobie ze za @{BCwhite}5@{BCblack} minut masz @{BCgreen}%{-1}@{BCblack}!! %;\
      /repeat -0:5 1 /_przypomnij 0 %{-1} %;\
    /else \
      /echo -p -abBCblack  Przypominasz sobie ze za @{BCwhite}wlasnie@{BCblack} masz @{BCgreen}%{-1}@{BCblack}!! %;\
    /endif

; Wyswietlanie wszystkich komend ktore moga byc uzyteczne..
; narazie nie ma sensu tego uzywac.. jak ktos wymysli sensowny sposob 
; wyswiatlania to trza bedzie dorobic

/def allcmd = \
    /quote -S /last `"/list -s -mregexp -h0 -t'^$$$$' ^[^_~]"

;"
; Probka zmiany standartowego loada..
; fajna tylko za wolno dziala..
; Moze kiedys go wlacze na stale
/purge -i _load_licz
/def -i _load_licz = \
    /test ++_load_licz

/purge -i iload
/def -i iload = \
    /if (!getopts("qv", "")) /return 0%; /endif%; \
    /if ({opt_v}) \
      /purge _load_%{1} %;\
      /def -1 -ag -h'LOAD' _load_%{1} %;\
      /set _load_licz=0 %;\
      /quote -S /_load_licz `/list -i -s %;\
      /let _load_licz_defs=%{_load_licz} %;\
      /set _load_licz=0 %;\
      /quote -S /_load_licz `/list -mglob -h0 -b -s %;\
      /let _load_licz_bind=%{_load_licz} %;\
      /set _load_licz=0 %;\
      /quote -S /_load_licz `/list -mglob -h0 -b{} -t -an -s %;\
      /let _load_licz_trig=%{_load_licz} %;\
      /set _load_licz=0 %;\
      /quote -S /_load_licz `/list -I -s %;\
      /let _load_licz_invi=%{_load_licz} %;\
      /set _load_licz=0 %;\
      /quote -S /_load_licz `/list -s -mregexp -h0 -t'^$$$$' ^[^_~] %;\
      /let _load_licz_comm=%{_load_licz} %;\
      /set _load_licz=0 %;\
      /quote -S /_load_licz `/list -s -h %;\
      /let _load_licz_hook=%{_load_licz} %;\
      /@load %{1} %;\
      /if ({?}==0) \
        /purge _load_%{1} %;\
        /return %;\
      /else \
        /set _load_licz=0 %;\
        /quote -S /_load_licz `/list -i -s %;\
        /let _load_licz_defs=$[{_load_licz}-{_load_licz_defs}+1] %;\
        /set _load_licz=0 %;\
        /quote -S /_load_licz `/list -mglob -h0 -b -s %;\
        /let _load_licz_bind=$[{_load_licz}-{_load_licz_bind}] %;\
        /set _load_licz=0 %;\
        /quote -S /_load_licz `/list -mglob -h0 -b{} -t -s %;\
        /let _load_licz_trig=$[{_load_licz}-{_load_licz_trig}] %;\
        /set _load_licz=0 %;\
        /quote -S /_load_licz `/list -I -s %;\
        /let _load_licz_invi=$[{_load_licz}-{_load_licz_invi}] %;\
        /set _load_licz=0 %;\
        /quote -S /_load_licz `/list -s -mregexp -h0 -t'^$$$$' ^[^_~] %;\
        /let _load_licz_comm=$[{_load_licz}-{_load_licz_comm}] %;\
        /set _load_licz=0 %;\
        /quote -S /_load_licz `/list -s -h %;\
        /let _load_licz_hook=$[{_load_licz}-{_load_licz_hook}+1] %;\
        /let _load_=$[pad({_load_licz_defs}, 4, "@{n} defs @{B}", 1, {_load_licz_comm}, 4, "@{n} commands @{B}", 1, {_load_licz_bind}, 4, "@{n} binds @{B}", 1, {_load_licz_trig},4, "@{n} trigs @{B}", 1, {_load_licz_hook},4, "@{n} hooks @{B}", 1, {_load_licz_invi}, 4, "@{n} invis", 1)] %;\
        /echo -p Loading @{B}$[pad({1},15)]@{n} - @{B}%{_load_}@{n}! %;\
        /purge _load_%{1} %;\
      /endif %;\
    /elseif ({opt_q}) \
    /@load -q %{*} %;\
    /else \
    /@load %{*} %;\
    /endif

/def defs = \
    /let _load_licz_defs=$(/length $(/quote -S /first `/list -s -i)) %;\
    /let _load_licz_bind=$(/length $(/quote -S /first `/list -s -h0 -b)) %;\
    /let _load_licz_hili=$(/length $(/quote -S /first `/list -s -h0 -b{} -t = {})) %;\
    /let _load_licz_trig=$(/length $(/quote -S /first `/list -s -h0 -b{} -t = ?*)) %;\
    /let _load_licz_invi=$(/length $(/quote -S /first `/list -s -I)) %;\
    /let _load_licz_comm=$(/length $(/quote -S /first `/list -s -mregexp -h0 -t'^$$$$' ^[^_~])) %;\
    /let _load_licz_hook=$(/length $(/quote -S /first `/list -s -h)) %;\
    /let _load_=$[pad({_load_licz_defs}, 4, "@{n} defs @{B}", 1, {_load_licz_comm}, 4, "@{n} commands @{B}", 1, {_load_licz_bind}, 4, "@{n} binds @{B}", 1, {_load_licz_hili}, 4, "@{n} hilites @{B}", 1, {_load_licz_trig},4, "@{n} trigs @{B}", 1, {_load_licz_hook},4, "@{n} hooks @{B}", 1, {_load_licz_invi}, 4, "@{n} invis", 1)] %;\
    /msg All @{B}%{_load_}@{n}! %;\

/def _opcje_pokaz = \
    /msg $[pad({1}, -40, ": @{B}", 2, {2})]

/def opcje = \
    /if (strlen({ogolne_temblak}) > 0) \
    /let _tembl="Bron wkladasz do", {ogolne_temblak} %;\
    /let _btembl="Do %{ogolne_temblak} wkladasz", {ogolne_bron} %;\
    /else \
    /let _tembl="Nie uzywasz temblaka" %;\
    /let _btembl="Nie uzywasz temblaka" %;\
    /endif %;\
    /if ({ogolne_autoloot} !~ "0") \
    /let _auto="Automatycznie podnosisz", {ogolne_autoloot} %;\
    /else \
    /let _auto="Po zabiciu nic nie podnosisz"%;\
    /endif %;\
    /if ({ogolne_przemykanie}==0) \
        /let _prze=Wylaczone %;\
    /elseif ({ogolne_przemykanie}==1) \
        /let _prze=Wlaczone %;\
    /else \
        /let _prze=Druzynowe %;\
    /endif %;\
    /if ({ogolne_kierunki}==0) \
        /let _kier=Wylaczone %;\
    /elseif ({ogolne_kierunki}==1) \
        /let _kier=Nowe %;\
    /else \
        /let _kier=Stare %;\
    /endif %;\
    /if ({ogolne_pokazuj_gdzie_ide}==1) \
    /let _pkier=Wlaczone %;\
    /else \
    /let _pkier=Wylaczone %;\
    /endif %;\
    /test _opcje_pokaz("Twoje ustawienia wygladaja nastepujaco") %;\
    /test _opcje_pokaz("Swiecisz", {ogolne_swiatlo}) %;\
    /test _opcje_pokaz("Monety wkladasz do", {ogolne_pojemnik_monety}) %;\
    /test _opcje_pokaz("Na plecy zakladasz", {ogolne_plecak}) %;\
    /test _opcje_pokaz("Rzeczy wkladasz do", {ogolne_plecaka}) %;\
    /test _opcje_pokaz(%{_tembl}) %;\
    /test _opcje_pokaz(%{_btembl}) %;\
    /test _opcje_pokaz("Dobywasz", {ogolne_broni}) %;\
    /test _opcje_pokaz(%{_auto}) %;\
    /test _opcje_pokaz("Przemykanie", {_prze}) %;\
    /test _opcje_pokaz("Kierunki", {_kier}) %;\
    /test _opcje_pokaz("Pokazywanie kierunkow", {_pkier})

;    /echo -aCgreen -p $[strcat("+-", strrep("=", 75), "-+")] %;\
;    /echo -aCgreen -p $[pad("|", -2, "Twoje ustawienia wygladaja nastepujaco:", -76, "|", 1)] %;\
;    /echo -aCgreen -p $[pad("|", -2, "Swiecisz: ", -10, {ogolne_swiatlo}, -27, "|", -2, "Monety wkladasz do: ", -19, {ogolne_pojemnik_monety}, -17, "|", 1)] %;\
;    /echo -aCgreen -p $[pad("|", -2, "Na plecy zakladasz: ", -20, {ogolne_plecak}, -17, "|", -2, "Rzeczy wkladasz do: ", -19, {ogolne_plecaka}, -17, "|", 1)] %;\
;    /echo -aCgreen -p $[pad("|", -2, {_tembl}, -37, "|", -2, {_btembl}, -37, "|", 1)] %;\
;    /echo -aCgreen -p $[pad("|", -2, "Dobywasz: ", -10, {ogolne_broni}, -27, "|", -2, {_auto}, -37, "|", 1)] %;\
;    /echo -aCgreen -p $[pad("|", -2, "Przemykanie: ", -13, {_prze}, -24, "|", -2, "Kierunki: ", -10, {_kier}, -27, "|", 1)] %;\
;    /echo -aCgreen -p $[pad("|", -2, "Pokazywanie kierunkow: ", -23, {_pkier}, -14, "|", -2, "", -37, "|", 1)] %;\
;    /echo -aCgreen -p $[strcat("+-", strrep("=", 75), "-+")]

/def msg = \
    /if (!getopts("ew")) /return 0 %; /endif %;\
    /if (opt_e) \
        /let _color=%{ogolne_color_msg_err-Cred} %;\
    /elseif (opt_w) \
        /let _color=%{ogolne_color_msg_warn-Cyellow} %;\
    /else \
        /let _color=%{ogolne_color_msg_info-Cgreen} %;\
    /endif %;\
    /return echo(strcat("## ", {*}), {_color}, 1)

/def priolist = \
    /let _prio=%{1-400} %;\
    /for i 0 %{_prio} \
        /msg Priority $$[_prio - {i}] %%;\
        /list -p$$[_prio - {i}] -mglob -h0 -b{} -t

/def debug = \
    /if (!getopts("t:", "")) /return 0%; /endif %;\
    /if ($(/_is_on %{*})) \
        /set debug=%{opt_t-1} %;\
        /msg Debugowanie wlaczone. %;\
    /elseif ($(/_is_off %{*})) \
        /set debug=0 %;\
        /msg Debugowanie wylaczone. %;\
    /else \
        /msg Debugowanie wlaczyc czy wylaczyc? %;\
    /endif

/def _debug = \
    /if ({1} =~ '-t') \
        /let opt_t=%{2} %;\
        /shift 2 %;\
    /endif %;\
    /if (debug =~ {opt_t-1}) \
        /echo -e -aCgreen DEBUG %{opt_t}: %{*} %;\
    /endif

;------------------------------------------------------------------------------
;|                           Standartowe definicje                            |
;------------------------------------------------------------------------------

/def men = \
    ob mezczyzne %;\
    ob drugiego mezczyzne %;\
    ob trzeciego mezczyzne %;\
    ob czwartego mezczyzne

/def we = \
    wesprzyj %{*} %;\
    /if ({bron_dobyta}==0) \
      /_echo >>>>>>****** WALCZYSZ BEZ BRONI!!! ******<<<<<< %;\
    /endif

/def v = \
    /wem %;\
    kup bilet %;\
    wsiadz na statek %;\
    /wlm

/def vnilf = \
    /wem %;\
    wejdz na statek %;\
    /wlm 

/def zs = \
    zsiadz ze statku

/def s = \
    zapukaj w skale

/def kk = \
    krzyknij %{*}

/def pyt = \
    /if ({*}=/"* o *") \
      zapytaj %{*} %;\
    /elseif ({*}=/"* o") \
      /msg Chyba chcesz sie zapytac @{B}_o_@{n} cos? %;\
    /else \
      zapytaj %{*-mezczyzne} o prace %;\
      zapytaj %{*-mezczyzne} o zadanie %;\
      zapytaj %{*-mezczyzne} o zlecenie %;\
      zapytaj %{*-mezczyzne} o pomoc %;\
    /endif

/def por = /c %{*}
/def c = \
    /if ({*}=/"* i *") \
      /let _kim_=%{*} %;\
    /else \
      /let _kim_=z %{*-mezczyzna} %;\
    /endif %;\
    porownaj sile %{_kim_} %;\
    porownaj zrecznosc %{_kim_} %;\
    porownaj wytrzymalosc %{_kim_}

/def kj = \
    przedstaw sie %{*}

/def sk = \
    /if ({*}=~NULL) \
      sp na skrzynie %;\
    /else \
      wez %{*} ze skrzyni %;\
    /endif

/def dsk = \
    wloz %{*} do skrzyni

/def ko = /ks %{*}
/def ks = \
    /if ({*}=~NULL) \
      sp na kosz %;\
    /else \
      wez %{*} z kosza %;\
    /endif

/def dko = /dks %{*}
/def dks = \
    wloz %{*} do kosza

/def st = \
    /if ({*}=~NULL) \
      sp na stojak %;\
    /else \
      wez %{*} ze stojaka %;\
    /endif

/def dst = \
    wloz %{*} do stojaka

/def bra = \
    /purge _czytaj_haslo* %;\
    /def -1 -mregexp -t"'(.*)'. By w" _czytaj_haslo1 = \
      /def _czytaj_haslo2 = \
        /while ({1}!~NULL) \
      /let haslo_mah=$$$[tolower(strcat(haslo_mah, substr({1}, 0, 1)))] %%%;\
      /shift %%%;\
    /done %%%;\
    wypowiedz %%%{haslo_mah} %%%;\
    /purge _czytaj_haslo* %%;\
      /_czytaj_haslo2 %%{P1} %;\
    przeczytaj napis
    
/def mur = \
    wespnij sie na mur

/def beczki = \
    przeslizgnij sie miedzy beczkami

;/def st = \
;    sp na tablice

/def stt = \
    sp na tabliczke

/def pt = \
    przeczytaj tablice

/def ptt = \
    przeczytaj tabliczke

/def ta = \
    sp na tablice %;\
    sp na tabliczke %;\
    przeczytaj tablice %;\
    przeczytaj tabliczke %;\
    przeczytaj menu

/def pd = \
    porzuc druzyne

/def zap = \
    zapros %{*}

/def d = \
    /if ({*} !~ NULL) \
        porzuc druzyne %;\
        dolacz do %{*} %;\
    /else \
        /druzyna %;\
    /endif

/def porz = \
    porzuc %{*}

/def ja = \
    sp na siebie

/def statua = /ocs
/def ocs = \
    poklon sie statui

/def czacha = /pc
/def pc = \
    przekrec czaszke

/def z = \
    zapukaj we wrota %;\
    zadzwon %;\
    pociagnij sznur

/def szcz = \
    n %;\
    wejdz w szczeline

/def p = \
    przejrzyj %{*}

/def ocena = \
    ocen sile %;\
    ocen zrecznosc %;\
    ocen wytrzymalosc %;\
    ocen inteligencje %;\
    ocen madrosc %;\
    ocen odwage

/def med = /gil
/def gil = \
    usiadz %;\
    medytuj %;\
    /ocena %;\
    powstan

/def psm = \
    policz srebrne monety

/def pzm = \
    policz zlote monety

/def pmm = \
    policz miedziane monety

/def zam = \
    zamien srebro i miedz na zloto

/def ce = \
    cechy

/def puk = \
    /for i 1 5 kopnij pukacza

/def wod = \
    wejdz do wody %;\
    przejdz przez wodospad

/def szka = \
    zajrzyj do szkatulki

/def pnacze = /liana
/def liana = \
    zlap za pnacze %;\
    przeskocz nad pulapka

/def czolgn = \
    przeczolgaj sie na polnoc

/def czolgs = \
    przeczolgaj sie na poludnie 

/def _kasa_na_miedz = \
    /return {1} * 24000 + {2} * 240 + {3} * 12 + {4}

/def _kasa_na_grube = \
    /return decode_attr(strcat("@{BCcyan}", {1} / 24000, " Mithryli @{BCyellow}", mod({1}, 24000) / 240, " Zlota @{BCwhite}", mod({1}, 240) / 12, " Srebra @{nCyellow}", mod({1}, 12), " Miedzi"))

/def kasa = \
    /if ({1}!~0 & {1}==0) \
      /echo -p -aCgreen Uzycie: /kasa <Mithryle> <Zloto> <Srebro> <Miedz> - np. /kasa 0 3 2 1 %;\
    /else \
      /let kasa=$[_kasa_na_miedz({1}, {2}, {3}, {4})] %;\
      /echo -p -aCgreen Masz w tym momencie $[_kasa_na_grube({kasa})]. %;\
      /echo -p -aCgreen Czyli @{B}$[{kasa}]@{n} Miedziakow. %;\
    /endif

/def atakuja = \
    /if ({*} =~ "1" | {*} =~ "on" | {*} =~ NULL) \
        /set ogolne_robie_po_ataku=/beep 5 %;\
    /elseif ({*} =~ "0" | {*} =~ "off") \
        /unset ogolne_robie_po_ataku %;\
        /msg Jak ktos mnie zaatakuje to nic nie robie!! %;\
        /return %;\
    /else \
        /set ogolne_robie_po_ataku=%{*} %;\
    /endif %;\
    /msg Jak ktos mnie zaatakuje to wykonuje "@{B}%{ogolne_robie_po_ataku}@{n}".

/def ziolka = \
    /idz -s"szukaj ziol %%; \
    /repeat -7 1 szukaj ziol %%;\
    /repeat -14 1 \
        otworz woreczek %%%; \
        wloz ziola do woreczka %%%;\
        zamknij woreczek" \
    15 %{*}

/def kkto = \
    /if ($(/recall -q -mregexp #100 \(^| \)Nerkt\([,. ]|\\\$\))) \
        zapytaj nerkta o krasnoludy %;\
        zapytaj nerkta o bezdomnych %;\
        zapytaj nerkta o wygnanych %;\
    /elseif ($(/recall -q -mglob #100 *Umiesniony siwowlosy krasnolud*)) \
        przedstaw sie umiesnionemu siwowlosemu krasnoludowi %;\
        zapytaj umiesnionego siwowlosego krasnoluda o krasnoludy %;\
        zapytaj umiesnionego siwowlosego krasnoluda o bezdomnych %;\
        zapytaj umiesnionego siwowlosego krasnoluda o wygnanych %;\
    /elseif ($(/recall -q -mregexp #100 \(^| \)Garad\([,. ]|\\\$\))) \
        zapytaj garada o krasnoludy %;\
        zapytaj garada o bezdomnych %;\
        zapytaj garada o wygnanych %;\
    /elseif ($(/recall -q -mglob #100 *Stary brodaty krasnolud*)) \
        przedstaw sie staremu brodatemu krasnoludowi %;\
        zapytaj starego brodatego krasnoluda o krasnoludy %;\
        zapytaj starego brodatego krasnoluda o bezdomnych %;\
        zapytaj starego brodatego krasnoluda o wygnanych %;\
    /elseif ($(/recall -q -mregexp #100 \(^| \)Ora\([,. ]|\\\$\))) \
        zapytaj ore o krasnoludy %;\
    /elseif ($(/recall -q -mglob #100 *Dostojna piwnooka krasnoludka*)) \
        przedstaw sie dostojnej piwnookiej krasnoludce %;\
        zapytaj dostojna piwnooka krasnoludke o krasnoludy %;\
   /endif 

/def _autolog_compress = \
    /if (!{ogolne_compress_command} | {ogolne_compress_command} =~ "bzip2") \
        /let _compress=bzip2 --compress -9 %;\
    /elseif ({ogolne_compress_command} =~ "gz" | {ogolne_compress_command} =~ "gzip") \
        /let _compress=gzip -9 %;\
    /else \
        /let _compress={ogolne_compress_command} %;\
    /endif %;\
    /sys_fg find %{TFDIR}/log/*.log -ctime +1 -exec %{_compress} \\{\\} \\;
    
/def _autolog = \
    /let log_plik=$[strcat({TFDIR}, "/log/", {obecnie_expujacy}, \
        "_", ftime("%Y-%m-%d", time()), ".log")] %;\
    /echo %|/writefile -a %{log_plik} %;\
    /echo %|/writefile -a %{log_plik} %;\
    /echo Log     : $[toupper({obecnie_expujacy}, 1)] %| /writefile -a %{log_plik} %;\
    /echo Dnia    : $[ftime("%Y-%m-%d",time())] %|/writefile -a %{log_plik} %;\
    /echo Godzina : $[ftime("%H:%M:%S",time())] %|/writefile -a %{log_plik} %;\
    /echo %|/writefile -a %{log_plik} %;\
    /echo %|/writefile -a %{log_plik} %;\
    /log off %;\
    /if (regmatch("-w([^ ]*)", ogolne_autolog_log_opts)) \
        /log -w%{P1} %{log_plik} %;\
    /endif %;\
    /if (ogolne_autolog_log_opts =/ '*-l*') \
        /log -l %{log_plik} %;\
    /endif %;\
    /if (ogolne_autolog_log_opts =/ '*-i*') \
        /log -i %{log_plik} %;\
    /endif %;\
    /if (!strlen(ogolne_autolog_log_opts) | ogolne_autolog_log_opts =/ '*-g*') \
        /log -g %{log_plik} %;\
    /endif %;\
    /if (ogolne_autolog_log_opts =/ '*-a*') \
        /set ansi_log=1 %;\
    /endif %;\
    /rstop /_autolog %;\
    /at 00:00:01 /_autolog %;\
    /_autolog_compress

/if ({ogolne_autolog} & !$(/pid_of /_autolog)) \
    /_autolog %;\
/endif

/def autolog = \
    /if (!getopts("ilgaw:", "")) /return 0%; /endif %;\
    /if (opt_w =~ "" & !opt_l & !opt_i & !opt_g & !opt_a) \
        /set ogolne_autolog_log_opts=%{ogolne_autolog_log_opts--g} %;\
    /else \
        /set ogolne_autolog_log_opts=$[strcat(opt_w !~ "" ? strcat("-w", opt_w) : "", opt_l ? " -l" : "", opt_i ? " -i" : "", opt_g ? " -g" : "", opt_a ? " -a" : "")] %;\
    /endif %;\
    /if ({*} =~ NULL) \
        /if ({ogolne_autolog}) \
            /autolog off %;\
        /else \
            /autolog on %;\
        /endif %;\
    /elseif ($(/_is_on %{*})) \
        /set ogolne_autolog=1 %;\
        /msg Autologowanie wlaczone. %;\
        /_autolog %;\
    /elseif ($(/_is_off %{*})) \
        /unset ogolne_autolog %;\
        /msg Autologowanie wylaczone. %;\
        /log off %;\
    /else \
        /msg Autologowanie wlaczyc czy wylaczyc? %;\
    /endif
        
/def savehist = \
    /if ({*} =~ NULL) \
        /if ({ogolne_savehist}) \
            /savehist off %;\
        /else \
            /savehist on %;\
        /endif %;\
    /elseif ($(/_is_on %{*})) \
        /set ogolne_savehist=1 %;\
        /set savehist_dir=%{TFDIR}/save/%{obecnie_expujacy}/tf-hist %;\
        /msg Atomatyczne zapisywanie historii wlaczone.. %;\
    /elseif ($(/_is_off %{*})) \
        /unset ogolne_savehist %;\
        /unset savehist_dir %;\
        /msg Atomatyczne zapisywanie historii wylaczone.. %;\
    /else \
        /msg Atomatyczne zapisywanie historii wlaczyc czy wylaczyc? %;\
    /endif

/def cyferki = \
    /if ({*} =~ NULL) \
        /if ({ogolne_literki_na_cyferki} =~ "1") \
            /cyferki 2 %;\
        /elseif ({ogolne_literki_na_cyferki}) \
            /cyferki off %;\
        /else \
            /cyferki on %;\
        /endif %;\
    /elseif ($(/_is_on %{*})) \
        /set ogolne_literki_na_cyferki=1 %;\
        /msg Zamiana literek na cyferki wlaczona. %;\
    /elseif ($(/_is_off %{*})) \
        /unset ogolne_literki_na_cyferki%;\
        /msg Zamiana literek na cyferki wylaczona. %;\
    /elseif ({*} =~ "2" | {*} =~ "all") \
        /set ogolne_literki_na_cyferki=2 %;\
        /msg Zamiana literek na cyferki wlaczona ze skrocaniem. %;\
    /else \
        /msg Zamiane literek na cyferki wlaczyc czy wylaczyc? %;\
    /endif

/def _zabij = \
    zabij %{*}

;/def -F -mregexp -t'Sposrod .* osob przebywajacych' _wstrzymaj_bindowanie_wrogow = \
/def -q -h'SEND kto*' _wstrzymaj_bindowanie_wrogow = \
    /set _wrog_bind_on=1 %;\
    /set _wrog_podpis_on=1 %;\
    /rstart -4 1 /unset _wrog_bind_on %;\
    /rstart -4 1 /unset _wrog_podpis_on

;No to ten /akt juz na jutro i pamietaj aby rozdzielic roznych wrogow ;-)
;/def akt = 

/def kto = \
    /unset _wrogowie_obecni %;\
    /set _ilosc_wrogow_obecnych=0 %;\
    /set _sprawdz_aktywnosci_wrogow=1 %;\
    kto k %;\
    /rstart -0.2 1 /_podsumuj_wrogow %;\
    /rstart -1 1 /unset _sprawdz_aktywnosci_wrogow

/def _podsumuj_wrogow = \
    /if ({_ilosc_wrogow_obecnych}==0) \
        /msg Nie pamietam zadnego drania albo wszyscy spia. %;\
    /else \
        /msg W swiecie przebywa @{B}%{_ilosc_wrogow_obecnych}@{n} wrogow. Uzyj @{B}/gprzedstaw@{n} aby ich przedstawic.%;\
;Uzyj @{B}/akt@{n} aby sprawdzic ich aktywnosci. %;\
    /endif 

; Narazie to tak wyglada
/def _set_wrog = \
    /if (!{_wrog_bind_on}) \
        /set _wrog_bind_on=1 %;\
        /rstart -60 1 /unset _wrog_bind_on %;\
        /let _kogo=$(/_odmien_M_B %{*}) %;\
        /f1 ob %{_kogo} %;\
        /af1 /_zabij %{_kogo} %;\
        /set ogolne_bindy_af2 /unset _wrog_bind_on%%; /msg Aktywuje bindowanie nowego wroga. %{*} juz mnie nie interesuje. %%; /set ogolne_bindy_f1 /msg Brak akcji. %%; /set ogolne_bindy_f2 /msg Brak akcji. %%; /set ogolne_bindy_af1 /msg -e @{B}    PUSTO ! ! !@{n} %%; /set ogolne_bindy_af2 /msg Bindowanie aktywne.%;\
        /echo -p -aCgreen Od teraz @{B}"AF2"@{n} aktywuje czujnosc i podbinduje nowego wroga. %;\
    /endif

/def _check_hkw = \
    /if (ogolne_zaslona & ogolne_zaslona_time > 0 & _have_druzyna()) \
        /set _hkw_count=%{1-5} %;\
        /let _opoznienie_std=$[rand(ogolne_zaslona_time * 1000) / 4000.0] %;\
        /rstart -%{_opoznienie_std} 1 /_repeat_hkw %;\
    /endif

/def _repeat_hkw = \
    /if (_hkw_count > 0) \
        /test --_hkw_count %;\
        /set _hidden_cond=1 %;\
        /_send_safe kondycja wszystkich %;\
        /let _opoznienie_std=$[ogolne_zaslona_time / 2 + (rand(ogolne_zaslona_time * 1000) / 1000.0)] %;\
        /repeat -%{_opoznienie_std} 1 /_repeat_hkw %;\
    /endif

/def _send_safe = \
    /if ({obecnie_swiat}=~${world_name} & is_connected({obecnie_swiat})) \
        /if ({ogolne_send_safe}) \
            /set ogolne_send_safe_now=1 %;\
            /eval %{*} %;\
            /unset ogolne_send_safe_now %;\
        /else \
            /eval %{*} %;\
        /endif %;\
    /endif

/def _druzyna_powtorz = \
    /if (!_have_druzyna()) \
        /msg -w Nie jestes w druzynie wiec nie mozesz wykonywac operacji druzynowych! %;\
        /return %;\
    /endif %;\
    /let _tmp=%{ogolne_druzyna}| %;\
    /if (_have_leader()) \
        /let _tmp=%{_tmp}%{ogolne_leader}| %;\
    /endif %;\
    /while /let i=$[strstr({_tmp},"|")] %;/@test i>-1 %;/do \
        /let _name=$[substr({_tmp},0,i)] %;\
        /let _tmp=$[substr({_tmp},i+1)] %;\
        /let _name=$(/_odmien_M_%{1} %{_name}) %;\
        /let _todo=$[replace("_IMIE_", {_name}, {-1})] %;\
        %_todo %;\
    /done

/def ddaj = \
    /if ({*} =~ NULL) \
        /msg -w Co chcesz dac wszystkim w druzynie? %;\
    /else \
        /_druzyna_powtorz C daj %{*} _IMIE_ %;\
    /endif 

/def dszepnij = \
    /if ({*} =~ NULL) \
        /msg -w Co chcesz szepnac wszystkim w druzynie? %;\
    /else \
        /_druzyna_powtorz C szepnij _IMIE_ %{*} %;\
    /endif 

/def dprzedstaw = \
    /_druzyna_powtorz B przedstaw _IMIE_ %{*} %;\
    przedstaw sie %{*}

;-----------------------------------------------------------------------------
;|                      MANIPULOWANIE SWIATLEM                               |
;-----------------------------------------------------------------------------
/def _swiatloswitch = \
    /if ({swiatlo}==0) \
        /if ({ogolne_swiatlo}=~"lampa") \
            /zpl %;\
        /else \
            /zpp %;\
        /endif %;\
    /else \
        /if ({ogolne_swiatlo}=~"lampa") \
            /zgl %;\
        /else \
            /zgp %;\
        /endif %;\
    /endif

/def swiatlo = \
    /if ({*}=/"l*") \
        /set ogolne_swiatlo=lampa %;\
        /msg Dobra nie bedziesz swiecil oczami tylko "@{B}lampa@{n}". %;\
    /elseif ({*}=/"p*") \
        /set ogolne_swiatlo=pochodnia %;\
        /msg Dobra nie bedziesz swiecil oczami tylko "@{B}pochodnia@{n}". %;\
    /else \
        /msg Uzycie: /swiatlo <lampa|pochodnia> %;\
    /endif

/def nl = /nlo
/def nlo = \
    napelnij lampe olejem

/def zp = /zpp
/def zpp = \
    zapal pochodnie

/def zg = /zgp
/def zgp = \
    zgas zapalona pochodnie 

/def zl = /zpl
/def zpl = \
    zapal lampe
    
/def zgl = \
    zgas zapalona lampe

/def _lampa+ = \
    /if (ogolne_lampa_auto) \
        /rstart -80 100 napelnij lampe olejem %;\
    /endif %;\
    /set swiatlo=1

/def _lampa- = \
    /rstop napelnij lampe olejem %;\
    /set swiatlo=0

/def _pochodnia+ = \
    /set swiatlo=1

/def _pochodnia- = \
    /set swiatlo=0

/def -E(!{swiatlo}) -t'Zapalasz *lampe.'                  _lampa_trig_1 = \
    /_lampa+

/def -E({swiatlo}) -t'Gasisz *lampe.'                  _lampa_trig_2 = \
    /_lampa-

/def -E({swiatlo}) -t'*lampa wypala sie i gasnie.'             _lampa_trig_3 = \
    /_lampa- %;\
    /if (ogolne_lampa_auto) \
        /nlo %;\
        /zpl %;\
    /else \
	    /fast_bind /nlo %%; /zpl %;\
    /endif

/def -E(!{swiatlo}) -t'Probujesz zapalic *lampe, ale ci sie*' _lampa_trig_4 = \
    /_lampa- %;\
    /if ($(/_czesto)) \
        /return %; %;\
    /endif %;\
    /if (ogolne_lampa_auto) \
        /nlo %;\
        /zpl %;\
    /else \
        /fast_bind /nlo %%; /zpl %;\
    /endif 

/def -E({swiatlo}) -t'Woda szybko gasi zapalona *lampe.'     _lampa_trig_5 = \
    /_lampa-

/def -E({swiatlo}) -t'Lampa jest juz pelna.'                _lampa_trig_6 = \
    /_lampa-

/def -E({swiatlo}) -t'Napelnij lampe czym\\?'                 _lampa_trig_7 = \
    /_lampa-

/def -E({swiatlo}) -t'Napelnij co\\?'                     _lampa_trig_8 = \
    /_lampa-

/def -E({swiatlo}) -t'Zgas co\\?'                     _lampa_trig_9 = \
    /_lampa-

/def -E({swiatlo}) -t'Czym chcesz napelnic olejna lampe?' _lampa_trig_10 = \
    /_lampa- %;\
    
/def -E(!{swiatlo}) -t'Zapalasz *{luczywo.|pochodnie.}' _pochodnia_trig_1 = \
    /_pochodnia+

/def -E(!{swiatlo}) -t'*{pochodnia|luczywo|lampa} juz jest zapalona.' _pochodnia_trig_2 = \
    /_pochodnia+

/def -E({swiatlo}) -t'Gasisz *{luczywo.|pochodnie.}' _pochodnia_trig_3 = \
    /_pochodnia-

/def -E({swiatlo}) -t'*{luczywo|pochodnia} wypala sie i gasnie.' _pochodnia_trig_4 = \
    odloz wypalone pochodnie %;\
    /zpp %;\
    /_pochodnia-

/def -q -h'SEND napelnij *lampe*' _butelka_hook = \
    /if (ogolne_lampa_auto) \
        /purge _butelka_trig_1 %;\
        /def -FaB -t' oleju jest pusta.'         _butelka_trig_1 = \
            odloz butelke %%;\
            wez butelke z %{ogolne_plecaka-placaka} %%;\
            /nlo %%;\
            /zpl %;\
        /rstart -5 1 /purge _butelka_trig_1 %;\
    /else \
        /purge _butelka_trig_* %;\
        /def -Fa -t'*oleju jest pusta.' _butelka_trig_2 = \
            /fast_bind odloz butelke %%%; wez butelke z %{ogolne_plecaka-plecaka} %%%; /nlo %%%; /zpl %;\
        /def -Fa -t'Dopelniasz *olejna lampe, oprozniajac zupelnie*' _butelka_trig_3 = \
            /fast_bind odloz butelke %%%; wez butelke z %{ogolne_plecaka-plecaka} %%%; /nlo %%%; /zpl %;\
        /rstart -5 1 /purge _butelka_trig_* %;\
    /endif 

;------------------------------------------------------------------------------
;|                            UBIERANIE SIE                                   |
;------------------------------------------------------------------------------

/def -mregexp -t'^Dobywasz (prawa reka|lewa reka|oburacz) (.*)\\.$$' _trig_dobywasz = \
    /if ({P2}!~{ogolne_broni} & {ogolne_zapamietuj_bronie}==1) \
      /nb %{P2} %;\
    /endif %;\
    /set bron_dobyta=1

/def -mregexp -t'^Dobywasz (.*) (prawa reka|lewa reka|oburacz)\\.$$' _trig_dobywasz_2 = \
    /if ({P1}!~{ogolne_broni} & {ogolne_zapamietuj_bronie}==1) \
      /nb %{P1} %;\
    /endif %;\
    /set bron_dobyta=1

/def -mregexp -t'^Opuszczasz (.*)\\.$$' _trig_opuszczasz = \
    /if ({P1}!~{ogolne_bron} & {P1}!~"realny swiat" & {ogolne_zapamietuj_bronie}==1) \
      /nbt %{P1} %;\
    /endif %;\
    /set bron_dobyta=0

/def -mregexp -t'^Zakladasz na plecy (otwarty|zamkniety) (.*)\\.$$' _trig_zakladasz_plecak = \
    /if ({P2}!~{ogolne_plecak} & {ogolne_zapamietuj_bronie}==1) \
      /test plecak("%{P2}") %;\
    /endif

; trza by wyymyslic im jakies nazwy ale narazie moga byc..
/def autoalarm+ = \
    /set ogolne_zapamietuj_bronie=1 %;\
    /msg Od teraz bedziesz zapamietywal bronie i przedmioty.

/def autoalarm- = \
    /set ogolne_zapamietuj_bronie=0 %;\
    /msg Od teraz NIE bedziesz zapamietywal broni i przedmiotow.
;------------------------------------------------------------

/def nb = \
    /set ogolne_broni=%{*-%{ogolne_broni}} %;\
    /msg Od teraz bedziesz dobywal: "@{B}%{ogolne_broni}@{n}".

/def nbt = \
    /set ogolne_bron=%{*-%{ogolne_bron}} %;\
    /msg Od teraz do "@{B}%{ogolne_temblak-Temblaka}@{n}" bedziesz uzywal: "@{B}%{ogolne_bron}@{n}".

/def nt = \
    /set ogolne_temblak=%{*} %;\
    /msg Od teraz bronie bedziesz wkladal do "@{B}%{ogolne_temblak}@{n}".

/def plecak = \
    /set ogolne_plecak=%{1-plecak} %;\
    /let _plecaka=$(/_odmien_M_D %{ogolne_plecak}) %;\
    /set ogolne_plecaka=%{2-%_plecaka} %;\
    /msg Od teraz na plecy bedziesz zakladal "@{B}%{ogolne_plecak} (%{ogolne_plecaka})@{n}".

/def monety = \
    /set ogolne_pojemnik_monety=%{*-plecaka} %;\
    /msg Od teraz na monety bedziesz wkladal do "@{B}%{ogolne_pojemnik_monety}@{n}"

/def db = \
    /if ({ogolne_bron}!~NULL & {ogolne_temblak}!~NULL) \
      powyjmij %{ogolne_bron} z %{ogolne_temblak} %;\
    /endif %;\
    dobadz %{ogolne_broni-broni}

/def op = \
    opusc bronie %;\
    /if ({ogolne_bron}!~NULL & {ogolne_temblak}!~NULL) \
      powsun %{ogolne_bron} do %{ogolne_temblak} %;\
    /endif

/def np = \
    napelnij %{ogolne_plecak-plecak}

/def pl = \
    oproznij %{ogolne_plecak-plecak}

/def yy = \
    zdejmij wszystkie zbroje %;\
    /op %;\
    /np %;\
    /ub

/def y = \
    zdejmij wszystkie zbroje %;\
    /np %;\
    /ub

/def u = \
    wez bronie z %{ogolne_plecaka-plecaka} %;\
    /db %;\
    /purge _auto_ubieranie

/def uu = \
    /pl %;\
    /db %;\
    zaloz wszystkie zbroje %;\
    /purge _auto_ubieranie

/def zal = \
    zaloz wszystko

/def zde = \
    zdejmij wszystko

/def ub = \
    /purge _auto_ubieranie %;\
    /def -aB -p35 -1 -F -mregexp -t"(muska cie|rani cie) " _auto_ubieranie=/uu %;\
    /msg Dobywam broni i ubieram sie jak ktos mnie zrani!!

/def zmien = \
    zdejmij %{*} %;\
    zaloz %{*}

/def wdp = \
    wloz %{*-wszystko} do %{ogolne_plecaka-plecaka} 

/def wzp = \
    wez %{*-wszystko} z %{ogolne_plecaka-plecaka} 

/def ww = \
    wez wszystko %{*}

/def -Fp10 -aB -mregexp -t"^Nagle (.*) rozpruwa sie, a przedmioty znajdujace sie w nim rozsypuja sie po calym otoczeniu\\.$$" _cos_mi_sie_rozwalilo = \
    /_trig_do /ww %;\
    /msg    UWAGA! @{BCmagenta}%{P1}@{n} sie rozwalil i wszystko lezy na ziemi!

/def kol = \
    koumiesc kolczyk w lewym uchu %;\
    koumiesc drugi kolczyk w prawym uchu %;\
    koumiesc trzeci kolczyk w nosie

/def sa = \
    /if ({bron_dobyta}==1) \
      sprzedaj wszystko %;\
    /else \
      /echo >>>>>>****** NAJPIERW DOBADZ BRONI ******<<<<<< %;\
    /endif

/def saa = \
    sprzedaj wszystko

/def qw = \
    /let co_brac=%{*-wszystko} %;\
    wez %{co_brac} z ciala %;\
    wez %{co_brac} z drugiego ciala %;\
    wez %{co_brac} z trzeciego ciala %;\
    wez %{co_brac} z czwartego ciala %;\
    wez %{co_brac} z piatego ciala

/def q = \
    /qw %{*} %;\
    wez %{*-monety} %;\
    /np

/def w = \
    /qw %;\
    wez monety %;\
    /wb %;\
    /wz %;\
    /np

/def wb = \
     wez wszystkie bronie

/def wz = \
    wez wszystkie zbroje

/def wek = \
    wez kamienie z %{ogolne_pojemnik_monety-plecaka}

/def wlk = \
    wloz kamienie do %{ogolne_pojemnik_monety-plecaka}

/def wem = \
    wez monety z %{ogolne_pojemnik_monety-plecaka}

/def wlm = \
    wloz monety do %{ogolne_pojemnik_monety-plecaka}

;------------------------------------------------------------------------------
;|                UKLADANKA U REPTOW                      |
;------------------------------------------------------------------------------
/def ukladanka = \
    /unset _ukladanka_in %;\
    /def -p5 -n4 -mregexp -t'--- --- --- ---' _ukladanka_trig_1 = \
        /def -1 -mregexp -t'\\\\\\\\| (.) \\\\\\\\| (.) \\\\\\\\| (.) \\\\\\\\| (.) \\\\\\\\|' _ukladanka_trig_catch = \
            /set _ukladanka_in=$$$[strcat(_ukladanka_in, {P1}, {P2}, {P3}, {P4})] %;\
    /def -p1 -1 -mregexp -t'--- --- --- ---' _ukladanka_trig_2 = \
        /repeat -0.1 1 /_ukladanka_do %;\
    ob ukladanke 
;    /_ukladanka_test

/def _ukladanka_do = \
    /purge _ukladanka_trig_* %;\
    /set _ukladanka_in=$[replace(" ", "0", _ukladanka_in)] %;\
    /msg Uklad: %{_ukladanka_in} %;\
    /quote -S /set _ukladanka_ruchy=!nPuzzle %{_ukladanka_in} %;\
    /msg Ruchy: %{_ukladanka_ruchy} $[strlen({_ukladanka_ruchy})] %;\
    /f1 /ukladanka_rusz

/def ukladanka_rusz = \
    /let _ruch=$[substr(_ukladanka_ruchy, 0, 1)] %;\
    /set _ukladanka_ruchy=$[substr(_ukladanka_ruchy, 1)] %;\
    /msg Ruchy: %{_ukladanka_ruchy} $[strlen({_ukladanka_ruchy})] %;\
    przesun %{_ruch}

/def _ukladanka_test = \
    /test $[fake_recv("                            --- --- --- ---")] %;\
    /test $[fake_recv("                           | E | C | G | K |")] %;\
    /test $[fake_recv("                            --- --- --- ---")] %;\
    /test $[fake_recv("                           | J | O | H | L |")] %;\
    /test $[fake_recv("                            --- --- --- ---")] %;\
    /test $[fake_recv("                           | N | B | A | D |")] %;\
    /test $[fake_recv("                            --- --- --- ---")] %;\
    /test $[fake_recv("                           | I | M | F |   |")] %;\
    /test $[fake_recv("                            --- --- --- ---")]

;------------------------------------------------------------------------------
;|                NAPRAWIANIE RZECZY                      |
;------------------------------------------------------------------------------

/def naostrz = \
    /purge _napraw_nastepny %;\
    /msg Nastepne do ostrzenia >>%{*}<< %;\
    /def -1 -t'*konczy prace.*' _napraw_nastepny = \
        naostrz %{*}

/def napraw = \
    /purge _napraw_nastepny %;\
    /msg Nastepne do naprawy >>%{*}<< %;\
    /def -1 -t'*konczy prace.' _napraw_nastepny = \
        napraw %{*}

/def zamow = \
    /purge _napraw_nastepny %;\
    /msg Nastepne do roboty >>%{*}<< %;\
    /def -1 -t'*konczy prace.' _napraw_nastepny = \
        zamow %{*}
    
/def naprawa = \
    /wem %;\
    /pl %;\
    /set naprawiam_=0 %;\
    /purge _kowalik_* %;\
    /def -aB -F -p600 -mregexp -t'(Nie umiem tego|nie wymaga ost|nie wymaga.* nap|konczy prace\.|nie nadaje sie)' _kowalik_1 = \
        /_napraw_se_nastepny %;\
    /def -aB -F -p600 -mregexp -t'(Nie masz niczego takiego|Przeciez ten warsztat zajmuje sie tylko|Przeciez tutaj wykuwa i naprawia sie tylko zbroje)' _kowalik_2 = \
        /_napraw_se_koniec %;\
    /def -aB -F -p20 -t'*jest pochloniet? praca*' _kowalik_3 = \
        /_napraw_se_cofnij %;\
    /def -aB -F -p20 -mregexp -t'(Gildia nie bylaby zadowolona, gdyby czlonkowie rozdawali jej wlasnosc|Czapka jest oznaka twojej przynaleznosci do osadnikow, wiec nie mozesz nia nikogo obdarowac.)' _kowalik_4 = \
        /_napraw_se_nastepny %;\
    /_napraw_se_nastepny

/def _napraw_se_koniec = \
    /if (naprawiam_<6) \
        /set naprawiam_=5 %;\
        /_napraw_se_nastepny %;\
    /else \
        /purge _kowalik_* %;\
        /wlm %;\
        /unset naprawiam_ %;\
    /endif

/def _napraw_se_cofnij = \
    /test --naprawiam_ 

/def _napraw_se_nastepny = \
    /test ++naprawiam_ %;\
    /if (naprawiam_<2) naostrz bron %;/set naprawiam_=1%;\
    /elseif (naprawiam_==2) naostrz druga bron %;\
    /elseif (naprawiam_==3) naostrz trzecia bron %;\
    /elseif (naprawiam_==4) naostrz czwarta bron %;\
    /elseif (naprawiam_==5) naostrz piata bron %;\
    /elseif (naprawiam_==6) napraw zbroje %;\
    /elseif (naprawiam_==7) napraw druga zbroje %;\
    /elseif (naprawiam_==8) napraw trzecia zbroje %;\
    /elseif (naprawiam_==9) napraw czwarta zbroje %;\
    /elseif (naprawiam_==10) napraw piata zbroje %;\
    /elseif (naprawiam_==11) napraw szosta zbroje %;\
    /elseif (naprawiam_==12) napraw siodma zbroje %;\
    /elseif (naprawiam_==13) napraw osma zbroje %;\
    /elseif (naprawiam_==14) napraw dziewiata zbroje %;\
    /elseif (naprawiam_==15) napraw dziesiata zbroje %;\
    /elseif (naprawiam_==16) napraw jedynasta zbroje %;\
    /elseif (naprawiam_==17) napraw dwunasta zbroje %;\
    /elseif (naprawiam_==18) napraw trzynasta zbroje %;\
    /elseif (naprawiam_==19) napraw cztarnasta zbroje %;\
    /elseif (naprawiam_==20) napraw pietnasta zbroje %;\
    /else /_napraw_se_koniec %;\
    /endif

/def _string_rem_name = \
    /result substr({*}, 0, strchr(strcat({*}, " ("), "(") - 1)

/def _string_to_varname = \
    /result replace("_32_", "_", textencode(tolower(_string_rem_name({*}))))

;------------------------------------------------------------------------------
;|                              OPCJE                                         |
;------------------------------------------------------------------------------

/def kro = \
    opcje krotkie +

/def dlu = \
    opcje krotkie -

/def okw = \
    opcje krotkie wylacz

/def okww = \
    opcje krotkie wlacz

/def nwal = \
    opcje opisywanie wylacz

/def twal = \
    opcje opisywanie wlacz

/def szer = \
    opcje szerokosc %{*}

/def wys = \
    opcje wysokosc %{*}


/def nig = \
    opcje uciekaj nigdy %;\
    /msg Hmmmm.... czy wiesz ze.... ty nie uciekasz NIGDY!!!

/def led = \
    opcje uciekaj ledwo zywy %;\
    /msg Oj... duze ryzyko ..... - bedziesz uciekal przy : LEDWO ZYWY!

/def cie = \
    opcje uciekaj ciezko ranny %;\
    /msg Twoja ucieczka - przy Ciezko ranny....

/def zla = \
    opcje uciekaj w zlej kondycji %;\
    /msg Twoja ucieczka - przy Zlej Kondycji....  cieniawo ....

/def ran = \
    opcje uciekaj ranny %;\
    /msg Nie badz blaznem !!!!!!!

/def lek = \
    opcje uciekaj lekko ranny %;\
    /msg Nie badz blaznem !!!!!!!

/def dob = \
    opcje uciekaj w dobrym stanie %;\
    /msg Nie rob ze siy ylfa !!!!!!!

/def swi = \
    opcje uciekaj w swietnej kondycji %;\
    /msg Zachowujys siy jak zniewiyscialy ylf !!!!

;------------------------------------------------------------------------------
;|                     Testowanie roznych codow niewidow :)                   |
;------------------------------------------------------------------------------
; Sciagniete od Evina... Oczywiscie przerobione.. i to bardzo znaczaco...

/def szukaj = /testuj
/def testuj = \
    spoliczkuj kogo? %;\
    /def -p306 -1 -i -agLG -t'Spoliczkuj kogo?' _testuj_poczatek = \
      /let _testuj_komendy=\
      wykop|kop|trenuj|kup|przejrzyj|zamow|wejdz|przejdz|wespnij|zlap|\
      chwyc|zejdz|zsun|dotknij|urwij|wyskocz|zlam|zniszcz|rozwal|uderz|\
      pomodl|modl|rozsun|wsun|dosun|posun|odsun|nasun|wysun|zasun|\
      przesun|usun|rozciagnij|wciagnij|dociagnij|pociagnij|odciagnij|\
      naciagnij|wyciagnij|zaciagnij|uciagnij|wcisnij|docisnij|pocisnij|\
      odcisnij|wycisnij|zacisnij|przecisnij|ucisnij|rozlacz|wlacz|\
      polacz|odlacz|wylacz|zalacz|przelacz|rozerwij|porwij|oderwij|narwij|\
      wyrwyj|przerwij|podwaz|wywaz|przewaz|roznies|wnies|donies|\
      ponies|odnies|nanies|wynies|zanies|przenies|unies|wplyn|doplyn|\
      poplyn|wyplyn|zanurkuj|nurkuj|przeplyn|umiesc|nadaj|wypowiedz|\
      zapukaj|zadzwon|rozpal|podpal|rzuc|podrzuc|podsadz|rozbij|przebij|\
      zmien|zamien|przemien|podloz|podeprzyj|przeczolgaj|czolgaj|\
      wdrap|wyjdz|zastukaj|przepraw|przelej|wyrwij|wyjrzyj|wczolgaj|\
      wygladnij|podciagnij|wygnij|nalej|odlej|wyrzuc|podnies|zloz|\
      zasyp|nasyp|przesyp|podlej|opowiedz|sprawdz|popraw|zwroc|\
      nacisnij|siadz|usiadz|popchnij|pchnij|wplyn|\
      wslizgnij|wskocz|zeskocz|wkrec|wykrec|odkrec|zakrec|przekrec|\
      odbierz|wydlub|poswiec|ukorz|oddaj|kleknij|ukleknij|poddaj|\
      odetnij|odwiaz|odetkaj|wykap|zdeponuj|przeskocz|postaw|zdepcz|zadepcz|\
      rozdepcz|przetrzyj|wyczysc|oczysc|powachaj|wachaj|sproboj|pobierz|\
      wygrzeb|odgrzeb|zerwij|zaczep|odczep|przyczep|przyloz|przystaw|\
      odchyl|przezuj|sproszkuj|spal|wypal|przywiaz|zawiaz|rozgryz|pozbieraj|\
      zbieraj|doloz|zabierz|zalej|zagrzeb|rozbroj|przekop|popusc|obroc|\
      wydoj|sciagnij|zatknij|rozegraj|graj|przymij|zarzuc|\
      zdenominuj|wypozycz|pozycz|napraw|wybierz|wydrap|naloz|odpocznij|\
      potargaj|utul|zanuc|pobij|mietos|spij|dmuchnij|odczytaj|\
      wyryj|naostrz|zlomuj|wrzuc|odrzuc|ogrzej|wstan|powstan|kucnij|ukucnij|\
      wytnij|rozpostrzyj|zepnij|rozepnij|przylacz|odlacz|przeslizgnij|\
      zadeklaruj|poprzyj|\
        %%;\
; Czesc glowna czynnosci dopisywac powyzej..
      /while /let i=$$[strstr({_testuj_komendy},"|")] %%; /@test i > 0 %%; /do \
      /send $$[strcat(substr({_testuj_komendy},0,i), " Grrrrr..")] %%;\
      /let _i_=$$[{_i_}+1] %%;\
      /set _testuj_komendy2=$$[strcat({_testuj_komendy2},pad({_i_},-3),substr({_testuj_komendy},0,i+1))] %%;\
      /let _testuj_komendy=$$[substr({_testuj_komendy},i+1)] %%;\
    /done %%;\
    /set _testuj_ilosc=0 %%;\
    /echo -p -aCgreen Poczatek testu... %%;\
    spoliczkuj kogo? %%;\
    /def -agLG -p1301 -i -mregexp -t'^(> )*Slucham\\\\\\\\?$$$$' _testuj_gag1 = \
      /set _testuj_ilosc=$$$[{_testuj_ilosc}+1] %%%;\
      /set _testuj_cos=1 %%;\
    /def -agLG -p1301 -i -mregexp -t'^(> )*Ze co\\\\\\\\?$$$$' _testuj_gag2 = \
      /set _testuj_ilosc=$$$[{_testuj_ilosc}+1] %%%;\
      /set _testuj_cos=1 %%;\
    /def -agLG -p1301 -i -mregexp -t'^(> )*Pociagnij .nosem. .jak.\\\\\\\\?$$$$' _testuj_gag3 = \
      /set _testuj_ilosc=$$$[{_testuj_ilosc}+1] %%%;\
      /set _testuj_cos=1 %%;\
    /def -p1205 -i -mregexp -h'PROMPT ^> ' _testuj_gag4 = \
      /set _testuj_cos=1 %%;\
    /def -p1300 -i -mregexp -t'^> ' _testuj_gag5 = \
      /set _testuj_cos=1 %%%;\
      /_testuj_gag_hit %%;\
    /def -p1200 -i -t'*' _testuj_gag_hit = \
      /if ({_testuj_cos}==1) \
        /set _testuj_ilosc=$$$[{_testuj_ilosc}+1] %%%;\
        /set _testuj_ilosc2=$$$[{_testuj_ilosc2}+1] %%%;\
        /set _testuj_cos=0 %%%;\
    /let num=$$$[strstr({_testuj_komendy2},{_testuj_ilosc})+3] %%%;\
    /let num2=$$$[strstr(substr({_testuj_komendy2},{num}),"|")] %%%;\
    /let _testuj_kom=$$$[substr({_testuj_komendy2},{num},{num2})] %%%;\
    /echo -p -aCyellow Komenda: @{BCblue}%%%{_testuj_kom} @{BCwhite}(@{BCred}%%%{_testuj_ilosc}@{BCwhite})%%%;\
      /endif %%;\
    /def -p1305 -agLG -i -t'*Spoliczkuj kogo?' _testuj_koniec = \
      /echo -p -aCgreen Koniec testu... @{BCred}%%%{_testuj_ilosc}@{nCgreen} prob z tego @{BCred}%%%{_testuj_ilosc2-0}@{nCgreen} powiodlo sie!! %%%;\
      /purge -i _testuj_* %%%;\
      /unset _testuj_ilosc %%%;\
      /unset _testuj_ilosc2 %%%;\
      /unset _testuj_cos %%%;\
      /unset _testuj_komendy2

;------------------------------------------------------------------------------
;|                     Szybkobiegi (sciezki)                                  |
;------------------------------------------------------------------------------
/def mah = e %; s %; se %; e %; e %; e %; e %; e %; e %; %; n %; n %; e %; e %; gora %; gora %; n %; zapukaj w skale
/def zmah = w %; w %; w %; w %; w %;  s %; d %; d %; w %; w %; %; s %; s %; w %; w %; w %; w %; w %; w %; nw %; n %; w

;/def novi = w %; w %; w %; nw %; nw %; nw %; nw %; nw %; n %; w %; w %; w %; nw %; n %; nw %; nw %; nw %; n %; n %; nw %; w %; w %; nw %; n %; n %; n %; nw %; n %; w %; w %; w %; w %; w %; w %; w %; zapukaj we wrota %; w %; w %; w %; w %; w %; w 
;/def znovi = e %; e %; e %; e %; e %; e %; s %; se %; s %; s%; s%; e %; e %; zapukaj we wrota %; e %; e %; e %; e %; e %; e %; e %; e %; w %; s %; se %;  s %; s %; s %; se %; e %; e %; se %; s %; s %; se %; se %; se %; s %; se %; e %; e %; e %; s %; se %; se %; se %; se %; se %; e %; e %; e

;/def gob=/nagob
/def nagob = e %; e %; se %; se %; se %; e %; e %; e %; ne %; ne %; ne %; e %; d %; d %; d %; e %; e %; e %; n %; n %; w %; n %; n %; e %; e %; e %; e %; e %; n %; d 
/def zgob = u %; s %; w %; w %; w %; w %; w %; s %; s %; e %; s %; s %; w %; w %; w %; u %; u %; u %; w %; sw %; sw %; sw %; w %; w %; w %; nw %; ne 

;/def vra=/navra
/def navra = w %; w %; w %; w %; w %; w %; w %; d %; e %; u %; e %; d %; e %; u %; ne %; s %; s %; d %; d %; d %; d %; d %; jaskinie 
/def zvra = wyjscie %; u %; u %; u %; u %; u %; n %; n %; sw %; d %; w %; u %; w %; d %; w %; u %; zapukaj w skale

/def skav = d%;nw%;ne%;ne%;ne%;ne%;e%;e%;ne%;ne%;ne%;e%;e%;e%;e%;d%;n%;e
/def zskav = w%;s%;u%;w%;w%;w%;w%;sw%;sw%;sw%;w%;w%;sw%;sw%;sw%;sw%;se%;u


;/def topa = n %; n %; ne %; e %; ne %; ne %; ne %; e %; e %; e %; se %; se %; se %; se %; e %; se %; se %; /echo **************SKRYPT 1*******************
;/def topb = e %; e %; e %; e %; e %; e %; e %; e %; se %; se %; se %; e %; e %; e %; e %; se %; s %; se %; s %; s %; s %; e %; e %; e  %; /echo *****************SKRYPT 2*******************
;/def topc = s %; s %; s %; se %; e %; se %; e %; e %; se %; ne %; e %; e %; s %; s %; se %; se %; s %; se %; se %; e %;/echo ***************SKRYPT 4 -> WODOSPAD***************
;/def top = n %; n %; ne %; e %; e %; e %; s %; se %; e %; ne %; ne %; ne %; ne %; nw %; ne %; nw %; nw %; nw %; gora %; ne %; ne %; se %; se %; /echo *****************SKRYPT 4 -> OSTATNI**********************

;/def powa = nw %; nw %; sw %; sw %; dol %; se %; se %; sw %; se %; sw %; sw %; sw %; sw %; w %; nw %; n %; w %; w %; w %; w %; sw %; s %; s %; s %; przejdz przez wodospad %; /echo *********POWROT 1************
;/def powb = w %; nw %; nw %; n %; nw %; nw %; n %; n %; w %; w %; sw %; nw %; w %; w %; nw %; w %; nw %; n %; n %; n %; n %; n %; n %; w %; w %; w %; nw %; n %; nw %; w %; w %; w %; w %; w %; nw %; nw %; nw %; w %; w %; w %; w %; w %; w %; w %; w %; nw %; /echo **************POWROT 2****************
;/def powc = nw %; nw %; w %; nw %; nw %; nw %; nw %; w %; w %; w %; sw %; sw %; sw %; w %; sw %; s %; s %; s  %; /echo ******BRAMA NULN*****


;/def nuln = n %; n %; n %; n %; n %; n %; ne %; e %; ne %; e %; zapukaj we wrota %; e %; e %; e %; e %; e %; n %; n%; ne %; e %; se %; e %; e %; e %; e %; e %; e %; e %; e  
;/def n = e %; ne %; nw %; w %; w %; w %; w %; ne %; w %; sw %; /wc 
;/def kra = e %; s %; s %; se %; se %; s %; se %; se %; e
;/def zkra = w %; nw %; nw %; n %; nw %; nw %; n %; n %; w 
;/def kraina = n %; n %; ne %; e %; ne %; ne %; ne %; e %; e %; e %; se %; se %; se %; se %; e %; se %; se %; e %; e %; e %; e %; e %; e %; e %; e %; se %; se %; se %; e %; e %; e %; e %; se %; s %; se %; s %; s %; s %; e %; e %; e 





