
/def -mregexp -t'.* wskazuje (.*) jako cel ataku.' _combat_event_set_attack_target = \
    /set _statusbar_var_attack_target=$(/odmien_B_M %{P1})

/def -mregexp -t'.* wskazuje (.*) jako cel obrony.' _combat_event_set_defence_target = \
    /if ({P1}=~"ciebie") \
        /set _statusbar_var_defence_target=TY%;\
    /else \
        /set _statusbar_var_defence_target=$(/odmien_B_M %{P1})%;\
    /endif