/def _statusbar_update_hp = \
    /if ({1} =~ "1") \
        /set _statusbar_var_hp=[$[decode_attr("      L E D W O      ", {2})]]%;\
    /else \
        /let hp_bar_length=$[{1}*3]%;\
        /let hp_fill_length=$[21-{hp_bar_length}]%;\
        /let hp_bar=$[decode_attr(decode_attr(strrep("#", {hp_bar_length}), {2}),{3})]%;\
        /let kp_fill=$[decode_attr(strrep("#", {hp_fill_length}),"Cblack")]%;\
        /set _statusbar_var_hp=[%{hp_bar}%{kp_fill}] %;\
    /endif
