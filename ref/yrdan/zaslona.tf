; ## Linie dodane automagicznie   : tf_ver=1.4.5
; ## 
; ## Wersja pliku                 : 1.4.5
; ## Ostatnia zmiana pliku        : 2009-01-06 21:07:41
; ## Plik pobrany                 : 2009-01-06 21:08:07
; ## Wersja Tfupdate              : 2.0.1
; ##
; ##
;------------------------------------------------------------------------------
;|                        Zaslanianie i inne druzynowe duperszwance           |
;------------------------------------------------------------------------------
/def -q -h'SEND {sp|spojrz|zerknij}' _zaslona_unset_on_sp = \
    /_zaslona_unset_all

/def -Fp20 -P1BCyellow -t'^Atakujesz (.*) lecz ' _zaslona_nieudany_atak = \
    stan %;\
    /fast_bind przelam obrone $[tolower(replace('mezczyzne', 'mezczyzny', {P1}))]

/def -Fp20 -PLBCyellow;1BCyellow -t' zrecznie zaslania (.*) przed twoimi ciosami\\.$$' _zaslona_udana_przedemna = \
    stan %;\
    /fast_bind przelam obrone $[tolower(replace('mezczyzne', 'mezczyzny', {P1}))]

/def -Fp20 -PLCyellow;1BCyellow;2BCyellow -t'(?:zrecznie zaslania(?:sz|)|szybkim ruchem wysuwa sie przed) (.*)(?: przed ciosami (.*)|, zaslaniajac .*wlasnym cialem. rozgladajac .*uwaznie po okolicy, gotow. jest do odparcia kazdego ataku)\\.$$' _zaslona_udana = \
    /if (strlen({PL})) \
        /set _last_zaslona_przez=$[_string_rem_name({PL})] %;\
        /set _last_zaslona_przez=$(/_odmien_M_B %{_last_zaslona_przez}) %;\
        /set _last_zaslona_przez=$[toupper(_last_zaslona_przez, 1)] %;\
    /else \
        /set _last_zaslona_przez=cie %;\
        /if (ogolne_zaslona_przestawaj) \
            przestan zaslaniac %;\
        /endif %;\
    /endif %;\
    /test _zaslona_unset({P1}, {P2}) %;\
    /unset _last_zaslona_przez

/def -Fp20 -PLCyellow;1Cyellow;2Cyellow;3Cyellow -t' probuje (cie |)zaatakowac(?:| .*)(?:,|) (?:lecz|ale) (?:(.*) zagradza|(zagradzasz))' _zaslona_zagradza = \
    /let _kto=%{PL} %;\
    /let _zagradza=%{P2} %;\
    /if (regmatch(strcat("(", {ogolne_druzyna-druzyna}, "|", {ogolne_leader-leader}, ")"), {_zagradza})) \
        /let _zagradza=$(/_odmien_M_B %{_zagradza}) %;\
        /test _zaslona_set({_kto}, toupper({_zagradza}, 1)) %;\
    /endif
    
; Same kolorowanie, sprobujemy cos z tego wiecej wyciagnac.
/def -Fp20 -PLCyellow;2Cyellow;3Cyellow -t'probuje(sz|) zaslonic (.*|)przed ciosami (.*) jednak nie' _zaslona_nieudana
/def -Fp20 -PLCyellow;2BCyellow;3BCyellow -t'przestaje(sz|) (cie |)zaslaniac (.*)\\.$$' _zaslona_przestaje_zaslaniac 
/def -Fp20 -PCyellow;LBCyellow;1BCyellow; -t'przymierza sie do odciecia (.*) drogi ucieczki\\.$$' _zaslona_blokuje
/def -Fp20 -PLCyellow;2Cyellow;3Cyellow -t'rzuca(sz|) sie na (.*), bezskutecznie probujac przebic sie przez (.*) ochrone\\.$$' _zaslona_przebicie_nieudane
/def -Fp20 -PLCyellow;RCyellow -t'ukrywa sie przed ciosami za plecami' _zaslona_wycofanie_potepy
/def -Fp20 -P1Cyellow -mregexp -t'^Nie udaje ci sie zaslonic (.*) przed ciosami wrogow\\.$$' _zaslona_nieudana_3
/def -Fp20 -PLCyellow;1Cyellow -t'probuje zaslonic (.*|)przed ciosami wrogow, lecz nie udaje mu sie to \\.$$' _zaslona_nieudana_2

/def -Fp20 -PLCyellow;1BCyellow -t' rzuca sie na (.*) przebijajac sie przez jego ochrone\\.$$' _zaslona_przebicie = \
    /let _kto=$[tolower({PL})] %;\
    /let _kogo=$[tolower({P1})] %;\
    /if (strstr(strcat("|", {ogolne_druzyna-druzyna}, "|", {ogolne_leader-leader}, "|"), strcat("|", {_kto}, "|")) > -1) \
        /fast_bind /_zabij %{_kogo} %;\
    /elseif (strstr(strcat("|", {ogolne_druzyna_bie-druzyna_bie}, "|", {ogolne_leader_bie-leader_bie}, "|"), strcat("|", {_kogo}, "|")) > -1) \
        /fast_bind /_zaslon %{_kogo} %;\
    /endif


;Wesoly mlody goblin probuje wesprzec wysokiego czarnego orka w walce z Omira lecz Vaxon zagradza mu droge.
;Muskularny czarny ork rzuca sie na Omira przebijajac sie przez jego ochrone.
;wycofka potepow... moze by dodac jakies bindowanie sie na atak na tego, co sie wycofuje? :>
;Szerokousy ruchliwy potepieniec ukrywa sie przed ciosami za plecami bezokiego ruchliwego potepienca.
;Nie udaje ci sie zaslonic Yargrena przed ciosami wrogow.
;Hugon probuje zaslonic cie przed ciosami wrogow, lecz nie udaje mu sie to.
;Miecznikow nie ma juz;(
;Widzisz jak twarz Tukiego nabiera dziwnego wyrazu, a jego skronie zaczynaja intensywnie pulsowac. Nagle z niespodziewana odwaga i szalenczym krzykiem na ustach rzuca sie on w kierunku Uthera, calkowicie zaslaniajac jego wlasnym cialem i odpiera atak brudnozielonej wyglodnialej wyverny.
;Widzisz jak twarz Tukiego nabiera dziwnego wyrazu, a jego skronie zaczynaja intensywnie pulsowac. Nagle z niespodziewana odwaga i szalenczym krzykiem na ustach rzuca sie on w kierunku Daga, usilujac zaslonic jego wlasnym cialem i odpiera atak brudnozielonej szybkiej wyverny.
;Widzisz jak twarz Tukiego nabiera dziwnego wyrazu, a jego skronie zaczynaja intensywnie pulsowac. Nagle z niespodziewana odwaga i szalenczym krzykiem na ustach rzuca sie on w twoim kierunku, calkowicie zaslaniajac cie swoim cialem i odpiera atak oliwkowozielonej wyglodnialej wyverny.
;Tuki przyjmujac dogodna pozycje w szyku i zaslaniajac sie tarcza, pewniej chwyta swoja bron i ustawia sie bokiem do przeciwnika.
;/def -Fp20 -P1Cyellow;2BCyellow;3BCyellow -t'Widzisz jak twarz (.*) nabiera dziwnego.*kierunku( .*|), .*odpiera atak (.*)\\.$$' _zaslona_udana_najm = \
;    /if (strlen({P1})) \
;        /set _last_zaslona_przez=$[_string_rem_name({P1})] %;\
;        /set _last_zaslona_przez=$[toupper(_last_zaslona_przez, 1)] %;\
;    /endif %;\
;    /test _zaslona_unset({P2}, 'wrogow') %;\
;    /unset _last_zaslona_przez
;Helkan dyskretnym ruchem glowy rozglada sie na boki po czym gwaltownie odpycha swa tarcza przerazajacego bojowego mezczyzne robiac sobie miejsce do zajecia bezpiecznej pozycji i blyskawicznie wycofujac sie za Blammora.
;/def -Fp20 -PLCyellow;1BCyellow -t' (?:rzuca fachowe .*|dyskretnym ruchem glowy .*|)wycofuj(?:esz|ac|e) sie za (.*)\\.$$' _zaslona_wycofuje = \
;    /if (strlen({P1})) \
;        /set _last_zaslona_przez=$[_string_rem_name({P1})] %;\
;        /set _last_zaslona_przez=$[toupper(_last_zaslona_przez, 1)] %;\
;    /endif %;\
;    /let _kto=$(/_odmien_M_B %{PL}) %;\
;    /test _zaslona_unset(_kto, 'wrogow') %;\
;    /unset _last_zaslona_przez


/def _zaslona_trigs = \
    /purge _zaslona_trig_* %;\
    /let _zaslon_trigs_who=cie|ciebie %;\
    /if (_have_druzyna()) \
        /let _zaslon_trigs_who=%{ogolne_druzyna_bie-druzyna_bie}|%{ogolne_leader_bie-leader_bie}|%{_zaslon_trigs_who} %;\
    /endif %;\
    /def -Fp99 -mregexp -t'(?i)^((?:[a-z]+ ){0,3}?[a-z]+(?: \\\\(.*\\\\)|)) (?:ledwo muska|powaznie rani|lekko rani|bardzo ciezko rani|rani|masakruje|atakuje|trafia|wykonuje zamaszyste ciecie .* mierzac w|probuje trafic) (%{_zaslon_trigs_who})[ .,!]' _zaslona_trig_1 = \
        /test _zaslona_set({P1}, {P2})

/_zaslona_trigs

/def _zaslona_set = \
;    /echo [%1] [%2] %;\
    /let _tmp1=$[_string_to_varname({1})] %;\
    /let _tmp2=$[tolower({2})] %;\
    /set _zaslona_wrog_%{_tmp1}=%{_tmp2} %;\
    /let _tmp_old=$[{second_line}] %;\
    /if (regmatch(strcat("(\\[", {1}, "->.*?\\] )"), {_tmp_old})) \
        /let _tmp_old=$[replace({P1}, "", {_tmp_old})] %;\
    /endif %;\
    /set second_line=$[strcat("[", {1}, "->", {2}, "] ", {_tmp_old})] %;\
    /_check_hkw 5

/def _zaslona_unset_one = \
    /_debug -t _zaslona_unset_one unseting 1: %{1} 2 %{-1} 3 %{_last_zaslona_przez} %;\
    /let _kim=$[replace("_", " ", replace("_zaslona_wrog_", "", {1}))] %;\
    /if ({2} !~ NULL) \
        /let _kimd=$(/_odmien_M_D %{_kim}) %;\
    /endif %;\
    /if ({_kimd} =~ NULL | {_kimd} =~ {-1}) \
        /_debug -t _zaslona_unset_one poszlo unset 1: %{1} 2 %{-1} 3 %{_last_zaslona_przez} 4 %{_kim} 5 %{_kimd} %;\
        /if (regmatch(strcat("(\\[", {_kim}, "->.*?\\] )"), {second_line})) \
            /set second_line=$[replace({P1}, "", {second_line})] %;\
        /endif %;\
        /if (strlen({_last_zaslona_przez})) \
            /set %{1}=%{_last_zaslona_przez} %;\
            /set second_line=$[strcat("[", toupper({_kim}, 1), "->", {_last_zaslona_przez}, "] ", {second_line})] %;\
        /else \
            /unset %{1} %;\
        /endif %;\
    /endif

/def _zaslona_unset = \
    /let _kogo=%{1} %;\
    /let _kim=%{2} %;\
    /if ($(/listvar -v _zaslona_wrog_* %{_kogo}) !~ "") \
        /if (_kim =~ "wrogow" | _kim =~ NULL) \
            /quote -S /_zaslona_unset_one `"/listvar -s _zaslona_wrog_* %{_kogo}" %;\
        /else \
            /quote -S /_zaslona_unset_one `"/listvar -s _zaslona_wrog_* %{_kogo}" %{_kim} %;\
        /endif %;\
    /endif
        
/def _zaslona_unset_all = \
    /set second_line=$[strrep(" ", columns())] %;\
    /quote -S /unset `/listvar -s _zaslona_wrog_*

/def zaa = \
    /let _ret=$[_zas_auto('-f')] %;\
    /if ({_ret} == 2) \
        /msg Jestes zbyt pociety by zaslaniac! %;\
    /elseif ({_ret} != 1) \
        /msg Nie widze nikogo do zasloniecia. %;\
    /endif

/def _zas_auto = \
    /if ({_kondycja_} < 2) \
        /return 2 %;\
    /endif %;\
    /if ({1} =~ '-f') \
        /let _zas_lev=$[1] %;\
    /else \
        /let _zas_lev=$[{ogolne_zaslona_level-2}] %;\
    /endif %;\
    /let _i=0 %;\
    /while ({_i} + {_zas_lev} <= {_kondycja_}) \
        /let _imiona=$(/listvar -s _kondycja_* %{_i}) %;\
        /let _imiona=$[replace("_kondycja_", "", {_imiona})] %;\
        /if (strlen(_imiona) > 0) \
            /let _zasl=$(/_zas_first -f%{opt_f-0} %{_imiona}) %;\
            /_debug imiona %{_i} %{_imiona}: %_zasl %;\
            /if (strlen(_zasl)) \
                /echo %_zasl %;\
                /return 1 %;\
            /endif %;\
        /endif %;\
        /test ++_i %;\
    /done

/def _zas_first = \
    /if (!getopts("f#", "")) /return 0%; /endif%; \
    /if (!{opt_f} & {_zaslona_niegotowa}) \
        /return 2 %;\
    /endif %;\
    /while ({#}) \
        /let _tmp=$[replace("_", " ", {1})] %;\
;        /let _tmp=$(/listvar -v _zaslona_wrog_* %{_tmp}) %;\
        /if ($(/listvar -v _zaslona_wrog_* %{_tmp}) !~ "") \
            /set _zaslona_niegotowa=1 %;\
            /repeat -5 1 /unset _zaslona_niegotowa %;\
            /zas %{_tmp} %;\
        /endif %;\
        /shift %;\
    /done

/def zas = \
    /if ({*} !~ NULL) \
        /let _tmp=$[tolower({*})] %;\
        /msg zaslona: zaslon %{_tmp} %;\
        /_zaslon %{_tmp} %;\
; Nowa wersja bez potrzeby definiowania kogo
;        /let _tmp=$[replace(" ", "_", tolower({*}))] %;\
;        /let _tmp_zaslona_przed=$(/listvar -s _zaslona_wrog_* %{_tmp}) %;\
;        /if ({_tmp_zaslona_przed} =~ NULL) \
;            /test echo("Nie mam informacji na temat wrogow @{B}%{*}@{n}.", "Cgreen", 1) %;\
;            /return %;\
;        /endif %;\
;        /let _tmp_zaslona_przed=$[substr({_tmp_zaslona_przed}, 0, strchr(strcat({_tmp_zaslona_przed}, "("), " ("))] %;\
;        /let _tmp_zaslona_przed=$[replace("_zaslona_wrog_", "", _tmp_zaslona_przed)] %;\
;        /let _tmp_zaslona_przed=$[replace("_", " ", _tmp_zaslona_przed)] %;\
;        /let _tmp_zaslona_przed=$(/_odmien_M_N %{_tmp_zaslona_przed}) %;\
;        /msg zaslona: zaslon %{_tmp} przed %{_tmp_zaslona_przed} %;\
;        zaslon %{_tmp} przed %{_tmp_zaslona_przed} %;\
    /else \
        /let _last_zas=$[substr({second_line}, strchr({second_line}, ">") + 1)] %;\
        /let _last_zas=$[substr({_last_zas}, 0, strchr({_last_zas}, "]"))] %;\
        /let _tmp=$[replace(" ", "", {_last_zas})] %;\
        /if ({_tmp} !~ NULL & {_tmp} !~ "" & {_tmp} !~ "cie" & {_tmp} !~ "ciebie") \
            /zas %{_last_zas} %;\
        /else \
            /echo -aCgreen Nie wiem kogo mialbym zaslonic.. %;\
       /endif %;\
    /endif     

/def _zaslona_bind_one = \
    /if ({3} >= 14) \
        /return %;\
    /endif %;\
    /let _name=%{1} %;\
    /let _mname=$[_string_to_varname({2})] %;\
    /let _ilosc=%{3} %;\
    /shift $[3 + {_ilosc}] %;\
    /let _bind_a=$[strcat('^[', {1})] %;\
    /eval /set druzyna_state_%{_mname}=%{1} %;\
    /purge -msimple -ib'%{_bind_a}' %;\
    /def -b'%{_bind_a}' _zaslona_bind_a%{_ilosc} = /_zaslon %{_name} %;\
    /shift 14 %;\
    /let _bind_as=$[strcat('^[', {1})] %;\
    /purge -msimple -ib'%{_bind_as}' %;\
    /def -b'%{_bind_as}' _zaslona_bind_as%{_ilosc}= /_wycofaj %{_name}
;    /echo %{_ilosc}: %{_bind_a}: %{_bind_as}

/def _zaslona_binds = \
    /let _tmp=$[strcat({ogolne_leader_bie}, "|", {ogolne_druzyna_bie}, "|")] %;\
    /let _mtmp=$[strcat({ogolne_leader}, "|", {ogolne_druzyna}, "|")] %;\
    /let _back=\\\\\\\\ %;\
	/let _ilosc=0 %;\
    /while /let i=$[strstr({_tmp},"|")] %;/@test i >- 1 %;/do \
        /let _name=$[substr({_tmp},0,i)] %;\
        /let _tmp=$[substr({_tmp},i+1)] %;\
        /let mi=$[strstr({_mtmp},"|")] %;\
        /let _mname=$[substr({_mtmp},0,mi)] %;\
        /let _mtmp=$[substr({_mtmp},mi+1)] %;\
        /test _zaslona_bind_one({_name}, {_mname}, {_ilosc}, "`", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "-", "=", {_back}, "~", "!", "@", "#", "$$", "%%", "^", "&", "*", "(", ")", "_", "+", "|") %;\
        /let _ilosc=$[{_ilosc} + 1] %;\
    /done

/_zaslona_binds

/def _zaslon =  zaslon %{*}
/def _wycofaj = przestan zaslaniac $[tolower({*})]

/def zaslo = /za %{*}
/def za = \
    /if ({*} =~ NULL) \
        /msg Zaslon kogo?? %;\
        /return %;\
    /endif %;\
    ob $[tolower({*})] %;\
    /purge _zaso_trig %;\
    /def -1 -mregexp -t'Walczy z (.*)\\\\.' _zaso_trig = \
        /_zaslon $[tolower({*})] przed $$[tolower({P1})]

/def zas_test = \
    zaslon %{*} %;\
    /repeat -0.1 100 zaslon %{*} %;\
    /def -ag -1 -p80 -t'zrecznie zaslaniasz %{*} przed ciosami wrogow.' _zas_test_start = \
        /set _zas_test_start=$[time()] %%;\
        /msg Test zaslony start %%{_zas_test_start}. %;\
    /def -ag -1 -p79 -t'zrecznie zaslaniasz %{*} przed ciosami wrogow.' _zas_test_stop = \
        /set zaslona_time=$$[time() - _zas_test_start] %%;\
        /unset _zas_test_start %%;\
        /undef _zas_test_gag %%;\
        /msg Test zaslony stop %%{zaslona_time}. %%;\
        /rstop zaslon %{*} %;\
    /def -ag -t'Musisz troche odpoczac przed kolejna zmiana szyku.' _zas_test_gag
    
        
