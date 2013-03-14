;------------------------------------------------------------------------
;			   ... KONDYCJA ... 				  |
;------------------------------------------------------------------------

/def -Fp150 -mregexp -t'(?:Jestes| jest) (w swietnej kondycji)\.( Atakuj[^ ]+ [^ \.]+(.*)|)$' _condition_swietna = \
  /test _combat_health_display_line("Crgb040", 7, {PL-Ty}, {P1}, {P3}, "Cbgrgb040")
/def -Fp150 -mregexp -t'(?:Jestes| jest) (w dobrym stanie)\.( Atakuj[^ ]+ [^ \.]+(.*)|)$' _condition_dobra = \
  /test _combat_health_display_line("Crgb350", 6, {PL-Ty}, {P1}, {P2}, "Cbgrgb350")
/def -Fp150 -mregexp -t'(?:Jestes| jest) (lekko rann[yae])\.( Atakuj[^ ]+ [^ \.]+(.*)|)$' _condition_lekko = \
  /test _combat_health_display_line("Crgb550", 5, {PL-Ty}, {P1}, {P2}, "Cbgrgb550")
/def -Fp150 -mregexp -t'(?:Jestes| jest) (rann[yae])\.( Atakuj[^ ]+ [^ \.]+(.*)|)$' _condition_ranny = \
  /test _combat_health_display_line("Crgb530", 4, {PL-Ty}, {P1}, {P2}, "Cbgrgb530")
/def -Fp150 -mregexp -t'(?:Jestes| jest) (w zlej kondycji)\.( Atakuj[^ ]+ [^ \.]+(.*)|)$' _condition_zla = \
  /test _combat_health_display_line("Crgb510", 3, {PL-Ty}, {P1}, {P2}, "Cbgrgb510")
/def -Fp150 -mregexp -t'(?:Jestes| jest) (ciezko rann[yae])\.( Atakuj[^ ]+ [^ \.]+(.*)|)$' _condition_ciezko = \
  /test _combat_health_display_line("Crgb500", 2, {PL-Ty}, {P1}, {P2}, "Cbgrgb500")
/def -Fp150 -mregexp -t'(?:Jestes| jest) (ledwo zyw[yae])\.( Atakuj[^ ]+ [^ \.]+(.*)|)$' _condition_ledwo = \
  /test _combat_health_display_line("Cbgred", 1, {PL-Ty}, {P1}, {P2}, "Cbgred")

/def _combat_health_display_line = \
    \
    /let _combat_health_hp=%{2}%;\
    /let _combat_health_hp_color=%{1}%;\
    /let who=%{3}%;\
    /let hplabel=%{4}%;\
    \
    /let bar=$[decode_attr(strcat(strrep(" ", 14-{_combat_health_hp}*2),strrep("#", {_combat_health_hp}*2)), {_combat_health_hp_color})]%;\
    \
    /let is_member=$[_team_is_member({who})]%;\
    /if ({who}=~"Ty") \
        /echo%;\
        /let number=$[pad("TY", -2)]%;\
        /let line_color=Crgb550%;\
        /quote -S /unset `/listvar -s _combat_system_who_attacks_whom_*%;\
        /set _combat_system_who_attacks_whom_pointer=0%;\
        /let who_whom_indicator=1%;\
        /test _statusbar_update_hp({_combat_health_hp}, {_combat_health_hp_color}, {6})%;\
    /elseif ({is_member}==0) \
        /let number=$[strrep(" ", 2)]%;\
        /let who_whom_indicator=3%;\
    /else \
        /let number=$(/_team_get_number_by_name %{who})%;\
        /let number=$[pad({number}, 2)]%;\
        /let line_color=Crgb035%;\
        /let who_whom_indicator=2%;\
    /endif%;\
    \
    /let enemy_count=$[strrep(" ", 2)]%;\
    /if ({5}!~"") \
        /let enemy_count=$[_combat_health_count_enemy({5})]%;\
        /let enemy_count=$[pad(enemy_count, 2)]%;\
        /test _combat_system_who_attacks_whom_mark({3}, {5}, {who_whom_indicator})%;\
    /endif%; \
    \
    /let line=$[decode_attr(strcat("[",{_combat_health_hp},"/7][",{enemy_count},"][",{bar},"][",{number},"] ", decode_attr({who}, {_combat_health_hp_color}), " - ",  decode_attr({hplabel}, {_combat_health_hp_color})), {line_color})]%;\
    /substitute %{line}

/def _combat_health_count_enemy = \
    /let input=$[replace(".", "|", replace(", ", "|", replace(" i ", "|", {1})))]%; \
    /let return=0%; \
        /while ({input}!~"") \
            /let pointer=$[strstr({input}, "|")]%; \
            /let part=$[substr({input},0,{pointer})]%; \
            /if (regmatch("(cztery|czworo) ", {part})) \
                /let return=$[{return}+4]%; \
            /elseif (regmatch("(trzy|trzech|troje) ", {part})) \
                /let return=$[{return}+3]%; \
            /elseif (regmatch("(dwa|dwie|dwoch|dwoje) ", {part})) \
                /let return=$[{return}+2]%; \
            /else \
                /let return=$[{return}+1]%; \
            /endif%; \
            /let input=$[substr({input},{pointer}+1)]%; \
        /done%; \
    /return %{return}

/def _combat_system_who_attacks_whom_mark = \
    /set _combat_system_who_attacks_whom_pointer=$[{_combat_system_who_attacks_whom_pointer}+1]%;\
    /let pointer=%{3}%;\
    /let input=%{2}%;/if ({input}=~".") /let input=TY%; /endif%;\
    /let who=%{1}%;\
    /if ({pointer}==1) \
        /set _combat_system_who_attacks_whom_var_me=%{input}%;\
    /elseif ({pointer}==2) \
        /eval /set _combat_system_who_attacks_whom_var_team_%{_combat_system_who_attacks_whom_pointer}=%{who} <==> %{input}%;\
    /elseif ({pointer}==3) \
        /eval /set _combat_system_who_attacks_whom_var_mob_%{_combat_system_who_attacks_whom_pointer}=%{who} <==> %{input}%;\
    /endif

/def _combat_show_who_attacks_whom = \
    /test echo("============== CIEBIE ===============")%;\
    /listvar -v _combat_system_who_attacks_whom_var_me%;\
    /test echo("============== DRUZYNA ==============")%;\
    /listvar -v _combat_system_who_attacks_whom_var_team_*%;\
    /test echo("============== INNE =================")%;\
    /listvar -v _combat_system_who_attacks_whom_var_mob_*%;\
    /test echo("============== ==== =================")%;\
    /echo
