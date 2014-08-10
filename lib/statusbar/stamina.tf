/def _info_level_stamina_process_to_color = \
    /if ({1} == "1") \
        /let tmp_return=Cbgred%;\
    /elseif ({1} =="2") \
        /let tmp_return=Crgb500%;\
    /elseif ({1} =="2") \
            /let tmp_return=Crgb530%;\
    /elseif ({1} =="3") \
        /let tmp_return=Crgb530%;\
    /elseif ({1} =="4") \
        /let tmp_return=Crgb550%;\
    /elseif ({1} =="5") \
        /let tmp_return=Crgb550%;\
    /elseif ({1} =="6") \
        /let tmp_return=Crgb550%;\
    /elseif ({1} =="7") \
        /let tmp_return=Crgb350%;\
    /elseif ({1} =="8") \
        /let tmp_return=Crgb350%;\
    /elseif ({1} =="9") \
        /let tmp_return=Crgb350%;\
    /elseif ({1} =="10") \
        /let tmp_return=Crgb040%;\
    /elseif ({1} =="11") \
        /let tmp_return=Crgb040%;\
    /endif%;\
    /return {tmp_return}

/def _info_level_stamina_process_to_bgcolor = \
    /if ({1} == "1") \
        /let tmp_return=Cbgred%;\
    /elseif ({1} =="2") \
        /let tmp_return=Cbgrgb500%;\
    /elseif ({1} =="2") \
            /let tmp_return=Cbgrgb530%;\
    /elseif ({1} =="3") \
        /let tmp_return=Cbgrgb530%;\
    /elseif ({1} =="4") \
        /let tmp_return=Cbgrgb550%;\
    /elseif ({1} =="5") \
        /let tmp_return=Cbgrgb550%;\
    /elseif ({1} =="6") \
        /let tmp_return=Cbgrgb550%;\
    /elseif ({1} =="7") \
        /let tmp_return=Cbgrgb350%;\
    /elseif ({1} =="8") \
        /let tmp_return=Cbgrgb350%;\
    /elseif ({1} =="9") \
        /let tmp_return=Cbgrgb350%;\
    /elseif ({1} =="10") \
        /let tmp_return=Cbgrgb040%;\
    /elseif ({1} =="11") \
        /let tmp_return=Cbgrgb040%;\
    /endif%;\
    /return {tmp_return}

/def _statusbar_update_stamina = \
    /let real_level=$[11-{1}]%;\
    /let color=$[_info_level_stamina_process_to_color({1})]%;\
    /let bgcolor=$[_info_level_stamina_process_to_bgcolor({1})]%;\
    /if ({1} =~ "1") \
        /set _statusbar_var_stamina=[$[decode_attr(" C A L K O W I C I E ", {color})]]%;\
    /else \
        /let bar_length=$[{1}*2+1]%;\
        /let fill_length=$[21-{bar_length}]%;\
        /let bar=$[decode_attr(decode_attr(strrep("#", {bar_length}), {color}),{bgcolor})]%;\
        /let fill=$[decode_attr(strrep("#", {fill_length}),"Cblack")]%;\
        /set _statusbar_var_stamina=[%{bar}%{fill}] %;\
    /endif

/def -Fp2 -mregexp -t'nie mozesz dalej podazac' _info_level_stamina_trigger_event_1 = \
    /test _info_level_stamina_process(10)

/def -Fp2 -mregexp -t'Czujesz sie smiertelnie zmeczony' _info_level_stamina_trigger_event_2 = \
    /test _info_level_stamina_process(10)
