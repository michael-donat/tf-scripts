/def _statusbar_update_stamina = \
    /if ({1} =~ "1") \
        /set _statusbar_var_stamina=[$[decode_attr(" C A L K O W I C I E ", {2})]]%;\
    /else \
        /let bar_length=$[{1}*2+1]%;\
        /let fill_length=$[21-{bar_length}]%;\
        /let bar=$[decode_attr(decode_attr(strrep("#", {bar_length}), {2}),{3})]%;\
        /let fill=$[decode_attr(strrep("#", {fill_length}),"Cblack")]%;\
        /set _statusbar_var_stamina=[%{bar}%{fill}] %;\
    /endif

/def -Fp2 -mregexp -t'nie mozesz dalej podazac' _info_level_stamina_trigger_event_1 = \
    /test _info_level_stamina_process(10)

/def -Fp2 -mregexp -t'Czujesz sie smiertelnie zmeczony' _info_level_stamina_trigger_event_2 = \
    /test _info_level_stamina_process(10)
