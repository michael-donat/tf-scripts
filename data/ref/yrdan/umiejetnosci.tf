; ## Linie dodane automagicznie   : tf_ver=1.2.9
; ## 
; ## Wersja pliku                 : 1.2.9
; ## Ostatnia zmiana pliku        : 2008-11-24 18:49:58
; ## Plik pobrany                 : 2008-11-24 18:50:22
; ## Wersja Tfupdate              : 2.0.1
; ##
; ##
;-----------------------------------------------------------------------------
;                          UMIEJETNOSCI                                      |
;-----------------------------------------------------------------------------
; cost = (new_level ^ 3 - old_lewel ^ 3) * skill_cost_factor / 100
; level = cost * 100 / skill_cost_factor ^ 1/3

/def um_cost = \
    /if (!getopts("f#c#", "")) /return 0%; /endif %;\
    /if (!{#}) \
        /msg Usage: /um_cost -f<from> -c<cost factor> <to> %;\
        /msg To get to know cost factor use: /cost_factor <skill> %;\
        /msg Example: We want to get to know cost of 'miecze' from 30% to 90% %;\
        /msg .        /cost_factor miecze %;\
        /msg .        @{B}Miecze@{n} has a factor equal to: @{B}100@{n}. %;\
        /msg .        /um_cost -f30 -c100 90 %;\
        /msg .        Koszt wytrenowania ... %;\
        /return %;\
    /endif %;\
    /let _to=$[{1}] %;\
    /let _from=$[{opt_f} ? {opt_f} : {_to} - 1] %;\
    /let _cost_factor=$[{opt_c-100}] %;\
    /let cost=$[trunc((pow(_to, 3) - pow(_from, 3)) * _cost_factor / 100)] %;\
    /msg Koszt wytrenowania umiejetnosci o faktorze $[_cost_factor] z $[_from] na $[_to] to $[_kasa_na_grube({cost})], czyli @{B}$[{cost}]@{n} Miedziakow.

/def um = \
    /if (!getopts("s", "")) /return 0%; /endif %;\
    /if ({*}=~NULL) \
      umiejetnosci bojowe %;\
      umiejetnosci ogolne %;\
      umiejetnosci zlodziejskie %;\
      umiejetnosci magiczne %;\
      umiejetnosci specjalne %;\
      /set _umiejetnosci_i=6 %;\
      /let _um_ktore=Bojowe Ogolne Zlodziejskie Magiczne Specjalne %;\
    /else \
      /if ({*}=~"wszystkie") \
        umiejetnosci %;\
        /let _um_ktore=Wszystkie %;\
      /else \
        umiejetnosci %{*} %;\
        /let _um_ktore=%{*} %;\
      /endif %;\
      /set _umiejetnosci_i=2 %;\
    /endif %;\
    /set umiejetnosci=%;\
    /def -p6 -ag -mregexp -t':( )*([^ ]*)( )*(.*):( )*([^ ]*)' _um_trig_1= \
      /set umiejetnosci=%%{umiejetnosci}%%{PL}|%%{P2}#%%{P4}|%%{P6}#%;\
    /def -p5 -ag -mregexp -t':( )*([^ ]*)( )*$$' _um_trig_2= \
      /set umiejetnosci=%%{umiejetnosci}%%{PL}|%%{P2}#@%%;\
      /test --_umiejetnosci_i %%;\
      /if ({_umiejetnosci_i}==1) \
        /purge _um_trig_* %%;\
        /_um_wyswietl -s%{opt_s} %{_um_ktore} %%;\
      /endif %;\
    /def -p5 -ag -mregexp -t'^($$|Nieznana kategoria. Masz do wyboru:)' _um_trig_3= \
      /set umiejetnosci=%%{umiejetnosci}@%%;\
      /test --_umiejetnosci_i %%;\
      /if ({_umiejetnosci_i}==1) \
        /purge _um_trig_* %%;\
        /_um_wyswietl -s%{opt_s} %{_um_ktore} %%;\
      /endif



/purge -i _um_wyswietl  
/def -i _um_wyswietl = \
    /if (!getopts("s:", "")) /return 0%; /endif%;\
    /set umiejetnosci=$[replace("-", "_", umiejetnosci)]%;\
    /let i=%;\
    /let linia=%;\
    /let cc=1%; \
;  /echo %{umiejetnosci} %;\
    /let _szer=$[wrapsize / 2 - 4] %;\
    /test echo(strcat("+-", strrep("=", _szer * 2 + 3) , "-+")) %;\
    /while /let i=$[strstr(umiejetnosci,"@")]%; /@test i > 0%; /do \
      /test echo(strcat("|", strrep("-", _szer * 2 + 5) , "|")) %;\
      /test echo(strcat("|", strrep(" ", _szer - 5), pad({1}, 15), strrep(" ", _szer - 5), "|")) %;\
      /test echo(strcat("|@{BCblack}", strrep("-", _szer * 2 + 5) , "@{nCwhite}|"), "", 1) %;\
      /shift %;\
      /let um_type=$[substr(umiejetnosci,0,i)]%; \
      /set umiejetnosci=$[substr(umiejetnosci,i+1)]%;\
      /let k=1 %;\
      /while (k <= 100) \
        /let um_type2=$[strcat("$$", k, "$$", um_type2)] %;\
        /test ++{k} %;\
      /done %;\
      /while /let i=$[strstr(um_type,"#")]%; /@test i > 0%; /do \
        /let um_name=$[substr(um_type, 0, i)]%;\
        /let um_type=$[substr(um_type, i + 1)]%;\
        /let j=$[strstr(um_name,"|")]%;\
        /let um_ile=$[substr(um_name, j + 1)]%;\
        /let um_name_real=$[substr(um_name, 0, j)]%;\
        /if ({um_ile}=~"ledwo") \
          /let ile_num=0 %;\
        /elseif ({um_ile}=~"troche") \
          /let ile_num=1 %;\
        /elseif ({um_ile}=~"pobieznie") \
          /let ile_num=2 %;\
        /elseif ({um_ile}=~"zadowalajaco") \
          /let ile_num=3 %;\
        /elseif ({um_ile}=~"niezle") \
          /let ile_num=4 %;\
        /elseif ({um_ile}=~"dobrze") \
          /let ile_num=5 %;\
        /elseif ({um_ile}=~"znakomicie") \
          /let ile_num=6 %;\
        /elseif ({um_ile}=~"doskonale") \
          /let ile_num=7 %;\
        /elseif ({um_ile}=~"perfekcyjnie") \
          /let ile_num=8 %;\
        /elseif ({um_ile}=~"mistrzowsko") \
          /let ile_num=9 %;\
        /endif %;\
        /let um_set_name=$[replace(" ", "_", um_name_real)]%;\
        /eval /set um_last_value=%%ogolne_umiejetnosci_%um_set_name %;\
        /if (({um_last_value} > {ile_num} * 10 + 10) | ({um_last_value} < {ile_num} * 10 + 1)) \
            /if ({opt_s} !~ NULL) \
                /test echo(strcat("Blad w wartosci umiejetnosci @{B}", {um_name_real}, "@{n} zmieniem z @{B}", {um_last_value}, "@{n} na @{B}", {ile_num} * 10 + 1, "@{n}."), "Cgreen", 1) %;\
                /eval /set ogolne_umiejetnosci_%um_set_name=$[{ile_num} * 10 + 1] %;\
            /else \
                /test echo(strcat("Blad w wartosci umiejetnosci @{B}", {um_name_real}, "@{n} jest @{B}", {um_last_value}, "@{n} powinno @{B}", {ile_num} * 10 + 1, "@{n}."), "Cgreen", 1) %;\
                /test echo("Nie ustawiam wartosci. Azeby ja ustawic uruchom @{B}/um -s@{n}.", "Cgreen", 1) %;\
            /endif %;\
        /endif %;\
        /set um_last_value=%{um_last_value-%ile_num * 10 + 1} %;\
        /let __sstring=$[strcat("$$", um_last_value, "$$")] %;\
        /let __slen=$[strlen({__sstring})] %;\
        /let j=$[strstr({um_type2}, {__sstring})] %;\
        /let um_type2=$[strcat(substr({um_type2}, 0, j + {__slen}),{um_name}, "#", substr({um_type2}, j + {__slen}))]%;\
      /done %;\
      /let k=100 %;\
      /while (k > 0) \
        /let __sstring=$[strcat("$$", k, "$$")] %;\
        /let __slen=$[strlen({__sstring})] %;\
        /let j=$[strstr({um_type2}, {__sstring})] %;\
        /let um_type2=$[strcat(substr({um_type2},0,{j}),substr({um_type2},{j}+__slen))] %;\
        /test --{k} %;\
      /done %;\
      /while /let i=$[strstr(um_type2,"#")]%; /@test i > 0%; /do \
        /let um_name=$[substr(um_type2,0,i)]%;\
        /let um_type2=$[substr(um_type2,i+1)]%;\
        /let j=$[strstr(um_name,"|")]%;\
        /let um_ile=$[substr(um_name,j+1)]%;\
        /let um_name=$[substr(um_name,0,j)]%;\
        /let um_set_name=$[replace(" ", "_", um_name)]%;\
        /eval /set um_last_value=%%ogolne_umiejetnosci_%um_set_name %;\
        /if ({wrapsize} > 90) \
            /let linia=$[strcat(linia,"|",pad(um_name,_szer - 18),": ",pad(um_ile,12), " (", pad({um_last_value}, 3), ")")]%; \
        /else \
            /let linia=$[strcat(linia,"|",pad(um_name,_szer - 12),": ",pad(um_ile,12))]%; \
        /endif %;\
        /if (cc==1) \
          /let cc=2%; \
        /else \
          /test echo(strcat({linia}, "|")) %; \
          /let cc=1%; \
          /let linia=%;\
        /endif%; \
      /done %;\
      /if (linia!~NULL)\
        /if ({wrapsize} > 90) \
            /test echo(strcat({linia}, "|", strrep(" ", _szer - 18), ":              (   )|"))%;\
        /else \
            /test echo(strcat({linia}, "|", strrep(" ", _szer - 12), ":             |"))%;\
        /endif %;\
        /let cc=1%; \
        /let linia=%;\
      /endif %;\
    /done %;\
    /unset umiejetnosci %;\
    /unset _umiejetnosci_i %;\
    /unset um_last_value %;\
    /test echo(strcat("+-", strrep("=", _szer * 2 + 3) , "-+"))


/def -mregexp -h'SEND ^[ ]*trenuj([ ]*intensywnie[ ]*){0,1}' _umiejetnosci_trenuj = \
    /send trenuj %{PR} %;\
    /purge _umiejetnosci_trig_* %;\
    /rstart -5 1 /purge _umiejetnosci_trig_* %;\
    /if ({PR} =~ NULL) \
        /def -mregexp -t'^  (.*?)\\\\s+(?:(\\\\d+) mithryl.+?){0,1}(?:(\\\\d+) zlot.+?){0,1}(?:(\\\\d+) srebr.+?){0,1}(?:(\\\\d+) miedzi.+?){0,1} monet' _umiejetnosci_trig_1 = \
            /_umiejetnosci_check %;\
        /def -mregexp -t'^(.*?):\\\\s+(?:(\\\\d+) mithryl.+?){0,1}(?:(\\\\d+) zlot.+?){0,1}(?:(\\\\d+) srebr.+?){0,1}(?:(\\\\d+) miedzi.+?){0,1} monet' _umiejetnosci_trig_2 = \
            /_umiejetnosci_check %;\
    /else \
        /def -mregexp -t' szkoli cie( intensywnie){0,1} ' _umiejetnosci_trig_1 = \
            /_umiejetnosci_add %;\
        /def -mregexp -t'Przechodzisz( intensywne){0,1} szkolenie ' _umiejetnosci_trig_2 = \
            /_umiejetnosci_add %;\
        /def -mregexp -t'Trenujesz ' _umiejetnosci_trig_3 = \
            /_umiejetnosci_add %;\
    /endif

/def _umiejetnosci_check = \
    /let um_orig_name=%{P1} %;\
    /let um_set_name=$[tolower(replace(" ", "_", {P1}))] %;\
    /if (um_set_name =~ 'cios_bronia_drzewcowa') \
        /let um_set_name=silny_cios %;\
    /endif %;\
    /let cost=$[{P2}*24000+{P3}*240+{P4}*12+{P5}] %;\
    /let factor=$(/_umiejetnosci_cost_factor %{P1}) %;\
    /if (factor > 0) \
        /let level=$[cost * 100 / factor] %;\
        /let to=$[trunc((sqrt(12 * level - 3) + 3) / 6 - 0.5)] %;\
        /eval /set ogolne_umiejetnosci_%%um_set_name=%{to} %;\
;        /echo Cost: %cost Fact: %factor Level: %level To: %to UM: %um_set_name %;\
    /else \
        /msg Brak danych na temat kosztow umiejetnosci '%{um_orig_name}' zglos to do Ingwara%;\
    /endif

/def _umiejetnosci_add = \
    /let um_str=%{PR} %;\
    /if (regmatch("walce sztyletem", {um_str})) \
        /test ++ogolne_umiejetnosci_sztylety %;\
    /elseif (regmatch("walce mieczem", {um_str})) \
        /test ++ogolne_umiejetnosci_miecze %;\
    /elseif (regmatch("walce toporem", {um_str})) \
        /test ++ogolne_umiejetnosci_topory %;\
    /elseif (regmatch("walce mlotem", {um_str})) \
        /test ++ogolne_umiejetnosci_mloty %;\
    /elseif (regmatch("walce maczuga", {um_str})) \
        /test ++ogolne_umiejetnosci_maczugi %;\
    /elseif (regmatch("walce bronia drzewcowa", {um_str})) \
        /test ++ogolne_umiejetnosci_bronie_drzewcowe %;\
    /elseif (regmatch("skutecznym uzywaniu tarczy", {um_str})) \
        /test ++ogolne_umiejetnosci_tarczownictwo %;\
    /elseif (regmatch("parowaniu ciosow przeciwnika", {um_str})) \
        /test ++ogolne_umiejetnosci_parowanie %;\
    /elseif (regmatch("unikaniu ciosow przeciwn", {um_str})) \
        /test ++ogolne_umiejetnosci_uniki %;\
    /elseif (regmatch("arozytnych i wspolczesnych jezykow i pism", {um_str})) \
        /test ++ogolne_umiejetnosci_znajomosc_jezykow %;\
    /elseif (regmatch("plywaniu i nurkowaniu", {um_str})) \
        /test ++ogolne_umiejetnosci_plywanie %;\
    /elseif (regmatch("wspinaniu sie", {um_str})) \
        /test ++ogolne_umiejetnosci_wspinanie %;\
    /elseif (regmatch("ocenianiu cech i stanow osob", {um_str})) \
        /test ++ogolne_umiejetnosci_ocena_przeciwnika %;\
    /elseif (regmatch("opiekowaniu sie zwierzetami", {um_str})) \
        /test ++ogolne_umiejetnosci_opieka_nad_zwierzetami %;\
    /elseif (regmatch("przemykaniu sie ukradkiem", {um_str})) \
        /test ++ogolne_umiejetnosci_skradanie_sie %;\
    /elseif (regmatch("ukrywaniu siebie i przedmiotow", {um_str})) \
        /test ++ogolne_umiejetnosci_ukrywanie_sie %;\
    /elseif (regmatch("zauwazaniu tego, co ukryte", {um_str})) \
        /test ++ogolne_umiejetnosci_spostrzegawczosc %;\
    /elseif (regmatch("szacowaniu wartosci przedmiotow", {um_str})) \
        /test ++ogolne_umiejetnosci_szacowanie %;\
    /elseif (regmatch("ocenianiu wlasnosci przedmiotow", {um_str})) \
        /test ++ogolne_umiejetnosci_ocena_obiektu %;\
    /elseif (regmatch("ocenianiu cech i stanow osob", {um_str})) \
        /test ++ogolne_umiejetnosci_ocena_przeciwnika %;\
    /elseif (regmatch("zawieraniu korzystnych transakcji handlowy", {um_str})) \
        /test ++ogolne_umiejetnosci_targowanie %;\
    /elseif (regmatch("otwieraniu zamkow bez wlasciwego klucza", {um_str})) \
        /test ++ogolne_umiejetnosci_otwieranie_zamkow %;\
    /elseif (regmatch("warzeniu i rozpoznawaniu mikstur", {um_str})) \
        /test ++ogolne_umiejetnosci_alchemia %;\
    /elseif (regmatch("walce w szyku bojowym", {um_str})) \
        /test ++ogolne_umiejetnosci_walka_w_szyku %;\
    /elseif (regmatch("wykrywaniu pulapek", {um_str})) \
        /test ++ogolne_umiejetnosci_wykrywanie_pulapek %;\
    /elseif (regmatch("rozpoznawaniu kierunkow i znajdowaniu", {um_str})) \
        /test ++ogolne_umiejetnosci_wyczucie_kierunku %;\
    /elseif (regmatch("walce w ciemnosci", {um_str})) \
        /test ++ogolne_umiejetnosci_walka_w_ciemnosci %;\
    /elseif (regmatch("lowieniu dzikich zwierzat", {um_str})) \
        /test ++ogolne_umiejetnosci_lowiectwo %;\
    /elseif (regmatch("w znajdowaniu i rozpoznawaniu sladow", {um_str})) \
        /test ++ogolne_umiejetnosci_tropienie %;\
    /elseif (regmatch("w walce bez broni", {um_str})) \
        /test ++ogolne_umiejetnosci_walka_bez_broni %;\
    /elseif (regmatch("w walce dwiema bronmi jednoczesnie", {um_str})) \
        /test ++ogolne_umiejetnosci_walka_dwiema_bronmi %;\
    /elseif (regmatch("zaslanianiu podczas walki", {um_str})) \
        /test ++ogolne_umiejetnosci_zaslanianie %;\
    /elseif (regmatch("w blokowaniu wyjsc", {um_str})) \
        /test ++ogolne_umiejetnosci_blokowanie_wyjscia %;\
    /elseif (regmatch("w znajomosci rozkazow", {um_str})) \
        /test ++ogolne_umiejetnosci_rozkazy %;\
    /elseif (regmatch("w wydawaniu rozkazow", {um_str})) \
        /test ++ogolne_umiejetnosci_rozkazy %;\
    /elseif (regmatch("w atakowaniu z zaskoczenia", {um_str})) \
        /test ++ogolne_umiejetnosci_atak_z_zaskoczenia %;\
    /elseif (regmatch("w atakowaniu z doskoku", {um_str})) \
        /test ++ogolne_umiejetnosci_atak_z_doskoku %;\
    /elseif (regmatch("miazdzeniu przeciwnika mlotem", {um_str})) \
        /test ++ogolne_umiejetnosci_miazdzenie %;\
    /elseif (regmatch("umiejetnosci ogluszania przeciwnik", {um_str})) \
        /test ++ogolne_umiejetnosci_ogluszanie %;\
    /elseif (regmatch("uzywanie ciosu specjalnego", {um_str})) \
        /test ++ogolne_umiejetnosci_ogluszanie %;\
        /test ++ogolne_umiejetnosci_silny_cios %;\
    /elseif (regmatch("silnym ciosie", {um_str})) \
        /test ++ogolne_umiejetnosci_silny_cios %;\
    /elseif (regmatch("w szale bojowym", {um_str})) \
        /test ++ogolne_umiejetnosci_szal_bojowy %;\
    /elseif (regmatch("odpornosci na ciosy", {um_str})) \
        /test ++ogolne_umiejetnosci_odpornosc_na_ciosy %;\
    /elseif (regmatch("w szybkim ciosie", {um_str})) \
        /test ++ogolne_umiejetnosci_szybki_cios %;\
;    /elseif (regmatch("", {um_str})) \
;        /test ++ogolne_umiejetnosci_ %;\
;    /elseif (regmatch("", {um_str})) \
;        /test ++ogolne_umiejetnosci_ %;\
;    /elseif (regmatch("", {um_str})) \
;        /test ++ogolne_umiejetnosci_ %;\
    /else \
        /msg Brak danych na temat umiejetnosci: '%{um_str}' zglos to do Ingwara %;\
    /endif

/def _umiejetnosci_special_cost_factor = \
    /_echo 0

/def _umiejetnosci_cost_factor = \
    /let _special=$(/_umiejetnosci_special_cost_factor %{*}) %;\
    /if ({_special}) \
        /echo %{_special} %;\
    /elseif (regmatch("miecz|walk. dwiema bronmi|walk. w szyku|miazdzeni|tworzeni. wynalazkow|zaslaniani|rozkaz|blokowani|rozbrajani|atakowani. z zaskoczeni|atakowani. z doskok|formacj|szybk. cios", {*})) \
        /echo 100 %;\
    /elseif (regmatch("walk. w ciemnosci", {*})) \
        /echo 95 %;\
    /elseif (regmatch("walk. bez broni", {*})) \
        /echo 90 %;\
    /elseif (regmatch("bronie drzewcowe|mlot|parowani|tarczownictw|unik", {*})) \
        /echo 80 %;\
    /elseif (regmatch("(?-i)akrobatyk|alchemi|kieszonkowstw|otwierani. zamkow|skradani. sie|topor|ukrywani|wykrywani. pulapek|zielarstw|ogluszani", {*})) \
        /echo 70 %;\
    /elseif (regmatch("lowiectw|maczug|ocen.+ obiekt|ocen.+ przeciwnik|opie.+ nad zwierzetami|plywani|spostrzegawczosc|szacowani|targowani|tropieni|wspinacz|wyczuci. kierunku|znajomosc.* jezykow", {*})) \
        /echo 50 %;\
    /elseif (regmatch("sztylet", {*})) \
        /echo 46 %;\
; Ogluszanie najemnikow
    /elseif (regmatch("Ogluszani|Cios bronia drzewcowa", {*})) \
        /echo 40 %;\
; Potrzebne w cost_factor aby poinformowac ze tego nie da sie trenowac.
    /elseif (regmatch("ocen. bestii chaos|gornictw|walk. z bestiami chaos", {*})) \
        /echo 1 %;\
    /else \
        /echo 0 %;\
    /endif

/def cost_factor = \
    /let _factor=$(/_umiejetnosci_cost_factor %{*}) %;\
    /if ({_factor}==0) \
         /msg No information about: @{B}%{*}@{n}. %;\
    /elseif ({_factor}==1) \
         /msg @{B}$[toupper({*}, 1)]@{n} doesn't have any factor. %;\
    /else \
         /msg @{B}$[toupper({*}, 1)]@{n} has a factor equal to: @{B}%{_factor}@{n}. %;\
    /endif
