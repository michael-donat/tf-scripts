/def _statusbar_update_compass = \
    /quote -S /unset `/listvar -s \_movement\_compass\_exit\_* %;\
    /let _movement_compass_exit_check_list=%{*}%;\
    /while /let i=$[i+1]%; /@test i<={#}%; /do \
        /let _movement_compass_exit_check=$(/list_shift %{_movement_compass_exit_check_list})%;\
        /if ({_movement_compass_exit_check}=~"polnoc") \
            /set _movement_compass_exit_n=$[decode_attr("|", "BCyellow")]%;\
        /elseif ({_movement_compass_exit_check}=~"polnocny-wschod") \
            /set _movement_compass_exit_ne=$[decode_attr("/", "BCyellow")]%;\
        /elseif ({_movement_compass_exit_check}=~"wschod") \
            /set _movement_compass_exit_e=$[decode_attr("-", "BCyellow")]%;\
        /elseif ({_movement_compass_exit_check}=~"poludniowy-wschod") \
            /set _movement_compass_exit_se=$[decode_attr("\\", "BCyellow")]%;\
        /elseif ({_movement_compass_exit_check}=~"poludnie") \
            /set _movement_compass_exit_s=$[decode_attr("|", "BCyellow")]%;\
        /elseif ({_movement_compass_exit_check}=~"poludniowy-zachod") \
            /set _movement_compass_exit_sw=$[decode_attr("/", "BCyellow")]%;\
        /elseif ({_movement_compass_exit_check}=~"zachod") \
            /set _movement_compass_exit_w=$[decode_attr("-", "BCyellow")]%;\
        /elseif ({_movement_compass_exit_check}=~"polnocny-zachod") \
            /set _movement_compass_exit_nw=$[decode_attr("\\", "BCyellow")]%;\
        /elseif ({_movement_compass_exit_check}=~"gora") \
            /set _movement_compass_exit_up=$[decode_attr("U", "BCyellow")]%;\
        /elseif ({_movement_compass_exit_check}=~"dol") \
            /set _movement_compass_exit_dn=$[decode_attr("D", "BCyellow")]%;\
        /else \
            /set _movement_compass_exit_ot=$[decode_attr("X", "BCyellow")]%;\
        /endif %;\
        /let _movement_compass_exit_check_list=$(/list_remove_first %{_movement_compass_exit_check_list})%;\
    /done