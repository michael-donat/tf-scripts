/set warn_curly_re=off

/def _string_rem_name = \
    /result substr({1}, 0, strchr(strcat({1}, " ("), "(") - 1)

/def _string_to_varname = \
    /result replace(" ", "_", tolower(_string_rem_name({1})))


/def -Fp150 -mregexp -t'(?:| )jest(?:es|) w swietnej kondycji\\.$$' _kondycha_swietna= \
    /test _kondycha_show("Cgreen", 7, "@{BCgreen}Swietna kondycja@{BCblue}.", {PL}, {P0})
        
/def -Fp150 -mregexp -t'(?<!ze, )(?:| )jest(?:es|) w dobrym stanie\\.$$' _kondycha_dobra= \
    /test _kondycha_show("BxCgreen", 6, "@{BCgreen}Dobry stan@{BCblue}.", {PL}, {P0})

/def -Fp150 -mregexp -t'(?:| )jest(?:es|) lekko rann.\\.$$' _kondycha_lekko_ranna= \
    /test _kondycha_show("BxCyellow", 5, "@{BCyellow}Lekko ranny@{BCblue}..", {PL}, {P0})

/def -Fp150 -mregexp -t'(?:| )jest(?:es|) rann.\\.$$' _kondycha_ranna= \
    /test _kondycha_show("Cyellow", 4, "@{BCyellow}Ranny@{BCblue}...", {PL}, {P0})

/def -Fp150 -mregexp -t'(?:| )jest(?:es|) w zlej kondycji\\.$$' _kondycha_zla_kondycja= \
    /test _kondycha_show("Crgb530", 3, "@{BCmagenta}W zlej kondycji@{BCblue}!", {PL}, {P0})

/def -Fp150 -mregexp -t'(?:| )jest(?:es|) ciezko rann.\\.$$' _kondycha_ciezko_ranny= \
    /test _kondycha_show("Crgb520", 2, "@{BCmagenta}Ciezko ranny@{BCblue}!!", {PL}, {P0})

/def -Fp150 -mregexp -t'(?:| )jest(?:es|) ledwo zyw.\\.$$' _kondycha_ledwo_zywy= \
    /test _kondycha_show("Crgb510", 1, "@{BCred}LEDWO ZYWY@{BCblue}!!!", {PL}, {P0})

    /def _kondycha_show = \
        /return _kondycha_show_new({1}, {2}, {3}, {4}, {5}) %;\

/def _kondycha_show_new = \
    /let _who=$[replace("[", "", replace("]", "", tolower({4})))] %;\
    /let _wwho=$[_string_to_varname(_who)] %;\
    /let _state=%;\
    /let _col=%;\
    /let _n=%;\
    /if ({_who} =~ '') \
        /let _col=@{BCyellow} %;\
        /quote -S /unset `/listvar -s _kondycja_* %;\
    /else \
        /let i=$[strchr({_who}, "@{\\(")] %;\
        /if ({i} > -1) \
            /test _who := substr({_who}, 0, i - 1) %;\
        /else \
            /test _n := (strlen(_n) > 3 ? strcat(" ", _n) : "") %;\
        /endif %;\
        /if (strstr({ogolne_leader}, {_who}) != -1) \
            /let _state=L %;\
            /let _col=@{BCgreen} %;\
        /elseif (strstr({druzyna}, {_who}) != -1) \
            /let _state=$(/eval /eval /echo %%druzyna_state_%{_wwho})D %;\
            /let _col=@{Cgreen} %;\
        /endif %;\
    /endif %;\
    /let _wrog=$(/listvar -v _zaslony_wrog_%{_wwho}) %;\
    /let _wrog=$[strlen(_wrog) ? strcat(" @{Bn}-@{BCyellow}>@{BCgreen}>@{BCmagenta}>@{BCblue}> @{Bn}", strip_attr(toupper(_wrog, 1))) : ""] %;\
;    /echo [%_who] [%_wwho] [%_wrog] %;\
    /let _who=$(/odmien_M_B %{_who}) %;\
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
;    /_debug %{_who} %;\
    /let _wrogowie_count=$(/length $(/listvar -s _zaslony_wrog_* %{_who-cie*})) %;\
    /if (_wrogowie_count) \
        /let _wrog= @{BCyellow}<@{BCgreen}<@{BCmagenta}<@{BCblue}<@{Bn}- %;\
    /endif %;\
    /let _col_szer=2 %;\
    /if (ogolne_xtitle_show & {_who} =~ '') \
        /xtitle %{aktualna_kondycha} [%{obecnie_expujacy}] %;\
;        /xtitle $[strrep({_show}, {2} * {_col_szer})] %;\
    /endif %;\
    /if (!_hidden_cond | {ORIGTERM} =~ "zmuda") \
        /return substitute(pad(strcat("[", {2}, "/7][", _wrogowie_count, "]"), 0, "[@{", 0, {_c}, 0, "}", 0, strrep({_show}, {2} * {_col_szer}), 7 * {_col_szer}, "@{nCwhite}]", 0, "[", 0, {_state}, 2, "] ", 0, {_col}, 0, encode_attr({4-Ty}), 0, {_n}, 0, ".", 0, {_wrog}), "", 1) %;\
    /else \
        /return substitute("", "gL", 0) %;\
    /endif


    
/def _zaslony_set = \
;    /echo [%1] [%2] %;\
    /let _tmp1=$[_string_to_varname({1})] %;\
    /let _tmp2=$[tolower({2})] %;\
    /if (_tmp2=~"cie") /let _tmp2=ciebie%; /endif%;\
    /set _zaslony_wrog_%{_tmp1}=%{_tmp2} %;\
    /let _tmp_old=$[{second_line}] %;\
    /if (regmatch(strcat("(\\[", {1}, "->.*?\\] )"), {_tmp_old})) \
        /let _tmp_old=$[replace({P1}, "", {_tmp_old})] %;\
    /endif %;\
    /set second_line=$[strcat("[", {1}, "->", {2}, "] ", {_tmp_old})]

/def _zaslony_trigs = \
    /purge _zaslony_trig_* %;\
    /let _zaslon_trigs_who=cie|ciebie %;\
    /let _zaslon_trigs_who=%{druzynab-druzyna_bie}|%{ogolne_leader_bie-leader_bie}|%{_zaslon_trigs_who} %;\
    /def -Fp120 -mregexp -t'(?i)^((?:[a-z]+ ){0,3}?[a-z]+(?: \\\\(.*\\\\)|)) (?:ledwo muska|powaznie rani|lekko rani|bardzo ciezko rani|rani|masakruje|atakuje|trafia|wykonuje zamaszyste ciecie .* mierzac w|wykonuje zamach .* mierzac w|probuje trafic|wyprowadza szybkie pchniecie .* w) (%{_zaslon_trigs_who})[ .,!]' _zaslony_trig_1 = \
        /test _zaslony_set({P1}, {P2})%;\
    /def -Fp120 -mregexp -t'(?i)^((?:[a-z]+ ){0,3}?[a-z]+(?: \\\\(.*\\\\)|)) (probuje cie trafic)' _zaslony_trig_moj_1 = \
        /test _zaslony_set({P1}, "cie")

;/def -Fp20 -PLCyellow;1BCyellow;2BCyellow -t'(?:zrecznie zaslania(?:sz|)|szybkim ruchem wysuwa sie przed) (.*)(?: przed ciosami (.*)|, zaslaniajac .*wlasnym cialem. rozgladajac .*uwaznie po okolicy, gotow. jest do odparcia kazdego ataku)\\.$$' _zaslony_udana = \	
/def -Fp20 -t'(?:zrecznie zaslania(?:sz|)|szybkim ruchem wysuwa sie przed) (.*)(?: przed ciosami (.*)|, zaslaniajac .*wlasnym cialem. rozgladajac .*uwaznie po okolicy, gotow. jest do odparcia kazdego ataku)\\.$$' _zaslony_udana = \
    /if (strlen({PL})) \
        /set _last_zaslony_przez=$[_string_rem_name({PL})] %;\
        /set _last_zaslony_przez=$(/odmien_M_B %{_last_zaslony_przez}) %;\
        /set _last_zaslony_przez=$[toupper(_last_zaslony_przez, 1)] %;\
    /else \
        /set _last_zaslony_przez=cie %;\
        /if (ogolne_zaslony_przestawaj) \
            przestan zaslaniac %;\
        /endif %;\
    /endif %;\
    /test _zaslony_unset({P1}, {P2}) %;\
    /unset _last_zaslony_przez

/def -Fp20 -PLCyellow;1Cyellow;2Cyellow;3Cyellow -t' probuje (cie |)zaatakowac(?:| .*)(?:,|) (?:lecz|ale) (?:(.*) zagradza|(zagradzasz))' _zaslony_zagradza = \
;/def -Fp20 -t' probuje (cie |)zaatakowac(?:| .*)(?:,|) (?:lecz|ale) (?:(.*) zagradza|(zagradzasz))' _zaslony_zagradza = \
    /let _kto=%{PL} %;\
;    /echo looool%;\
    /let _zagradza=%{P2} %;\
    /if (regmatch(strcat("(", {druzyna-druzyna}, "|", {ogolne_leader-leader}, ")"), {_zagradza})) \
        /let _zagradza=$(/odmien_M_B %{_zagradza}) %;\
        /test _zaslony_set({_kto}, toupper({_zagradza}, 1)) %;\
    /endif
    
/def _zaslony_unset = \
    /let _kogo=%{1} %;\
    /let _kim=%{2} %;\
    /if ($(/listvar -v _zaslony_wrog_* %{_kogo}) !~ "") \
        /if (_kim =~ "wrogow" | _kim =~ NULL) \
            /quote -S /_zaslony_unset_one `"/listvar -s _zaslony_wrog_* %{_kogo}" %;\
        /else \
            /quote -S /_zaslony_unset_one `"/listvar -s _zaslony_wrog_* %{_kogo}" %{_kim} %;\
        /endif %;\
    /endif
            
            
/def _ustaw_druzyne = \
    /purge __druzyna_tmp_* %;\
;    /set ogolne_druzyna=$[strcat(toupper(substr({ogolne_druzyna},0,1)),substr({ogolne_druzyna},1))] %;\
    /set ogolne_druzyna=$[replace(" kleczacy na ziemi", "", ogolne_druzyna)] %;\
    /set ogolne_druzyna=$[replace(" kleczaca na ziemi", "", ogolne_druzyna)] %;\
    /set ogolne_druzyna=$[replace(" piszacy list", "", ogolne_druzyna)] %;\
    /set ogolne_druzyna=$[replace(" piszaca list", "", ogolne_druzyna)] %;\
    /set ogolne_druzyna=$[replace(" wygodnie siedzacy na lawie", "", ogolne_druzyna)] %;\
    /set ogolne_druzyna=$[replace(" wygodnie siedzaca na lawie", "", ogolne_druzyna)] %;\
    /set ogolne_druzyna=$[replace(" siedzacy na lawie", "", ogolne_druzyna)] %;\
    /set ogolne_druzyna=$[replace(" siedzaca na lawie", "", ogolne_druzyna)] %;\
    /set ogolne_druzyna=$[replace(" siedzacy na fotelu", "", ogolne_druzyna)] %;\
    /set ogolne_druzyna=$[replace(" siedzaca na fotelu", "", ogolne_druzyna)] %;\
    /set ogolne_druzyna=$[replace("[", "", ogolne_druzyna)] %;\
    /set ogolne_druzyna=$[replace("]", "", ogolne_druzyna)] %;\
    /set ogolne_druzyna=$[replace(" i ", "|", ogolne_druzyna)] %;\
    /set ogolne_druzyna=$[replace(", ", "|", ogolne_druzyna)] %;\
    /set ogolne_druzyna=$[escape("\\",escape("()+*",{ogolne_druzyna}))] %;\
    /set ogolne_druzyna_dop=$(/_l_odmien D %{ogolne_druzyna}) %;\
    /set ogolne_druzyna_bie=$(/_l_odmien B %{ogolne_druzyna}) %;\
    /set ogolne_druzyna_nar=$(/_l_odmien N %{ogolne_druzyna})
    
    
/def _zaslony_bind_one = \
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
    /def -b'%{_bind_a}' _zaslony_bind_a%{_ilosc} = /_zaslon %{_name} %;\
    /shift 14 %;\
    /let _bind_as=$[strcat('^[', {1})] %;\
    /purge -msimple -ib'%{_bind_as}' %;\
    /def -b'%{_bind_as}' _zaslony_bind_as%{_ilosc}= /_wycofaj %{_name}
;    /echo %{_ilosc}: %{_bind_a}: %{_bind_as}

/def _zaslony_binds = \
    /let _tmp=$[strcat({ogolne_leader_bie}, "|", {druzynab}, "|")] %;\
    /let _mtmp=$[strcat({ogolne_leader}, "|", {druzyna}, "|")] %;\
    /let _back=\\\\\\\\ %;\
    /while /let i=$[strstr({_tmp},"|")] %;/@test i >- 1 %;/do \
        /let _name=$[substr({_tmp},0,i)] %;\
        /let _tmp=$[substr({_tmp},i+1)] %;\
        /let mi=$[strstr({_mtmp},"|")] %;\
        /let _mname=$[substr({_mtmp},0,mi)] %;\
        /let _mtmp=$[substr({_mtmp},mi+1)] %;\
        /test _zaslony_bind_one({_name}, {_mname}, {_ilosc}, "`", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "-", "=", {_back}, "~", "!", "@", "#", "$$", "%%", "^", "&", "*", "(", ")", "_", "+", "|") %;\
        /let _ilosc=$[{_ilosc} + 1] %;\
    /done


/def -q -h'SEND {sp|spojrz|zerknij}' _zaslony_unset_on_sp = \
    /_zaslony_unset_all

/def _zaslony_unset_one = \
    /_debug -t _zaslony_unset_one unseting 1: %{1} 2 %{-1} 3 %{_last_zaslony_przez} %;\
    /let _kim=$[replace("_", " ", replace("_zaslony_wrog_", "", {1}))] %;\
    /if ({2} !~ NULL) \
        /let _kimd=$(/odmien_M_D %{_kim}) %;\
    /endif %;\
    /if ({_kimd} =~ NULL | {_kimd} =~ {-1}) \
        /_debug -t _zaslony_unset_one poszlo unset 1: %{1} 2 %{-1} 3 %{_last_zaslony_przez} 4 %{_kim} 5 %{_kimd} %;\
        /if (regmatch(strcat("(\\[", {_kim}, "->.*?\\] )"), {second_line})) \
            /set second_line=$[replace({P1}, "", {second_line})] %;\
        /endif %;\
        /if (strlen({_last_zaslony_przez})) \
            /set %{1}=%{_last_zaslony_przez} %;\
            /set second_line=$[strcat("[", toupper({_kim}, 1), "->", {_last_zaslony_przez}, "] ", {second_line})] %;\
        /else \
            /unset %{1} %;\
        /endif %;\
    /endif

/def _zaslony_unset = \
    /let _kogo=%{1} %;\
    /let _kim=%{2} %;\
    /if ($(/listvar -v _zaslony_wrog_* %{_kogo}) !~ "") \
        /if (_kim =~ "wrogow" | _kim =~ NULL) \
            /quote -S /_zaslony_unset_one `"/listvar -s _zaslony_wrog_* %{_kogo}" %;\
        /else \
            /quote -S /_zaslony_unset_one `"/listvar -s _zaslony_wrog_* %{_kogo}" %{_kim} %;\
        /endif %;\
    /endif
        
/def _zaslony_unset_all = \
    /set second_line=$[strrep(" ", columns())] %;\
    /quote -S /unset `/listvar -s _zaslony_wrog_*

/def -p10 -F -aB -mregexp -t' ((umarl|polegl)(a|o|)|z cichym jekiem osuwa sie na ziemie)\\.$$' _komusik_siy_poleglo = \
    /let _wrog=$[replace(" ", "_", tolower({PL}))] %;\
    /let _wrog=$[substr({_wrog}, 0, strchr(strcat({_wrog}, "("), "("))] %;\
    /_zaslony_unset_one _zaslony_wrog_%{_wrog}
    
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
