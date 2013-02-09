
/def -mregexp -t'.* wskazuje (.*) jako cel ataku.' _combat_event_set_attack_target = \
    /set _combat_attack_target=$(/odmien_B_M %{P1})

/def -mregexp -t'.* wskazuje (.*) jako cel obrony.' _combat_event_set_defence_target = \
    /if ({P1}=~"ciebie") \
        /set _combat_defence_target=TY%;\
    /else \
        /set _combat_defence_target=$(/odmien_B_M %{P1})%;\
    /endif

/def -mregexp -t'(.*) spoglada morderczo na (.*).' _combat_event_set_attack_target_by_killer_look = \
    /if ({P1}=~{_team_leader}) \
        /set _combat_attack_target=$(/odmien_B_M %{P2})%;\
    /endif
