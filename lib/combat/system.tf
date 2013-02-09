/def key_f2 = \
    /zabij $(/odmien_M_B %{_combat_attack_target})

/def key_esc_f2 = \
    /send przestan kryc sie za zaslona%;\
    /send przelam obrone $(/odmien_M_D %{_combat_attack_target})%;\
    /zabij $(/odmien_M_B %{_combat_attack_target})%;\
    /send kmodpocznij

/def zabij = \
    /let target=%{*}%;\
    /let target_M=$(/odmien_B_M %{*})%;\
    /test _combat_set_attack_target({target_M}, {target})%;\
    /if ({_team_leader}=~"-") \
        /send popatrz morderczo na %{target}%;\
        /if ({_combat_orders_enabled}==1) \
            /send rozkaz druzynie zabic %{target}%;\
        /endif%;\
    /endif%;\
    /send zabij %{target}

/def _combat_set_attack_target = \
    /set _combat_attack_target %{1}%;\
    /let target_B={2}%;\
    /if ({_team_leader}=~"-") \
        /if ({2}=/"") /let target_B=$(/odmien_M_B %{1})%; /endif%;\
        /send wskaz %{target_B} jako cel ataku%;\
    /endif

/def key_f3 = \
    /send zaslon $(/odmien_M_B %{_combat_defence_target})

/def key_esc_f3 = /order_defence

/def order_defence = \
    /let target=$(/odmien_M_B %{_combat_defence_target})%;\
    /send popatrz opiekunczo na %{target}%;\
    /if ({_team_leader}=~"-") \
        /if ({_combat_orders_enabled}==1) \
            /send rozkaz druzynie zaslonic %{target}%;\
        /endif%;\
    /endif

/def defend = \
    /set _combat_defence_target=$(/odmien_B_M %{*})%;\
    /order_defence

/def _combat_defence_generate_form_team_members = \
    /purge z[0-9]+%; /purge zr[0-9]+%; /purge zg[0-9]+%;\
    /set _combat_defence_write_for_team_member_pointer=0%;\
    /quote -S /_combat_defence_write_for_team_member `/listvar -s _team_member_name_*

/def _combat_defence_write_for_team_member = \
    /set _combat_defence_write_for_team_member_pointer=$[{_combat_defence_write_for_team_member_pointer}+1]%;\
    /def z%{_combat_defence_write_for_team_member_pointer} = /send zaslon $$(/odmien_M_B %%{%{*}})%;\
    /def zg%{_combat_defence_write_for_team_member_pointer} = /send zaslon $$(/odmien_M_B %%{%{*}}) przed grupa%;\
    /def zr%{_combat_defence_write_for_team_member_pointer} = /defend $$(/odmien_M_B %%{%{*}})%%;/oder_defence
