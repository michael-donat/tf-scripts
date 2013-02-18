
;---------------------------------------------------------------------------------
; CEL ATAKU
;-----------------------------

/def _combat_clear_attack_target = \
    /set _combat_attack_target=

/def _combat_set_attack_target = \
    /set _combat_attack_target %{1}%;\
    /let target_B=%{2}%;\
    /if ({_team_leader}=~"-") \
        /if ({2}=/"") /let target_B=$(/odmien_M_B %{1})%; /endif%;\
        /send wskaz %{target_B} jako cel ataku%;\
    /endif

;---------------------------------------------------------------------------------
;---------------------------------------------------------------------------------

;---------------------------------------------------------------------------------
; CEL OBRONY
;-----------------------------

/def _combat_clear_defence_target = \
    /set _combat_defence_target=

;---------------------------------------------------------------------------------
;---------------------------------------------------------------------------------

/def key_f16 = \
    /if ({_combat_orders_enabled}==1) \
        /orders -%;\
    /else \
        /orders +%;\
    /endif

/def orders = \
    /if ({1}=~"+") \
        /set _combat_orders_enabled=1%;\
        /set _combat_orders_enabled_label=$[decode_attr("[OR]", "Cbggreen")]%;\
    /else \
        /set _combat_orders_enabled=0%;\
        /set _combat_orders_enabled_label=$[decode_attr("[OR]", "Cbgred")]%;\
    /endif

/def key_f2 = \
    /if ({_combat_attack_target}!/"") \
        /zabij $(/odmien_M_B %{_combat_attack_target}) %;\
    /endif

/def key_esc_f2 = \
    /if ({_combat_attack_target}!/"") \
        /send przestan kryc sie za zaslona%;\
        /send przelam obrone $(/odmien_M_D %{_combat_attack_target})%;\
        /zabij $(/odmien_M_B %{_combat_attack_target})%;\
        /send kmodpocznij%;\
    /endif

/def zabij = \
    /let target=%{*}%;\
    /if ({target}!/"") \
        /let target_M=$(/odmien_B_M %{*})%;\
        /send zabij %{target}%;\
        /test _combat_set_attack_target({target_M}, {target})%;\
        /if ({_team_leader}=~"-") \
            /send popatrz morderczo na %{target}%;\
            /if ({_combat_orders_enabled}==1) \
                /send rozkaz druzynie zabic %{target}%;\
            /endif%;\
        /endif%;\
    /endif

/def key_f3 =

/def key_esc_f3 = \
    /if ({_combat_attack_target}!/"") \
        /if ({_team_leader}=~"-") \
            /let target=$(/odmien_M_B %{_combat_attack_target})%;\
            /send popatrz morderczo na %{target}%;\
            /send rozkaz druzynie zabic %{target}%;\
        /endif%;\
    /endif



/def key_f4 = \
    /if ({_combat_defence_target}!/"") \
        /send zaslon $(/odmien_M_B %{_combat_defence_target})%;\
    /endif

/def key_esc_f4 = \
    /if ({_combat_defence_target}!/"") \
        /send zaslon $(/odmien_M_B %{_combat_defence_target}) przed grupa%;\
    /endif

/def order_defence = \
    /if ({_combat_defence_target}!/"") \
        /let target=$(/odmien_M_B %{_combat_defence_target})%;\
        /send popatrz opiekunczo na %{target}%;\
        /if ({_team_leader}=~"-") \
            /send rozkaz druzynie zaslonic %{target}%;\
        /endif%;\
    /endif

/def key_esc_f5 = \
    /set _combat_orders_enabled=1%;\
    /order_defence%;\
    /set _combat_orders_enabled=0

/def key_f5 = \
    /set _combat_orders_enabled=0%;\
    /order_defence

/def defend = \
    /set _combat_defence_target=$(/odmien_B_M %{*})%;\
    /send wskaz %{*} jako cel obrony%;\
    /order_defence

/def _combat_defence_generate_form_team_members = \
    /purge z[0-9]+%; /purge zr[0-9]+%; /purge zg[0-9]+%;\
    /set _combat_defence_write_for_team_member_pointer=0%;\
    /quote -S /_combat_defence_write_for_team_member `/listvar -s _team_member_name_*

/def _combat_defence_write_for_team_member = \
    /set _combat_defence_write_for_team_member_pointer=$[{_combat_defence_write_for_team_member_pointer}+1]%;\
    /def z%{_combat_defence_write_for_team_member_pointer} = /send zaslon $$(/odmien_M_B %%{%{*}})%;\
    /def zg%{_combat_defence_write_for_team_member_pointer} = /send zaslon $$(/odmien_M_B %%{%{*}}) przed grupa%;\
    /def zr%{_combat_defence_write_for_team_member_pointer} = /defend $$(/odmien_M_B %%{%{*}})%%;/order_defence

/def _combat_prompt_attack = \
    /echo%;\
    /test echo(decode_attr(strcat("             ","F2      - ZABIJ    -   ", {*}), "Cred"))%;\
    /test echo(decode_attr(strcat("             ","META_F2 - PRZELAM  -   ", {*}), "Cred"))%;\
    /echo

/def _combat_prompt_guard_break = \
    /echo%;\
    /test echo(decode_attr(strcat("             ","META_F2 - PRZELAM  -   ", {*}), "Cred"))%;\
    /echo

/def _combat_prompt_defence = \
    /echo%;\
    /test echo(decode_attr(strcat("             ","F4      - ZASLON  -   ", {*}), "Cgreen"))%;\
    /test echo(decode_attr(strcat("             ","META_F4 - GRUPOWA -   ", {*}), "Cgreen"))%;\
    /echo

/def _combat_prompt_defence_with_order = \
    /echo%;\
    /test echo(decode_attr(strcat("             ","F3      - POPROS         -   ", {*}), "Cgreen"))%;\
    /test echo(decode_attr(strcat("             ","META_F3 - ROZKAZ         -   ", {*}), "Cgreen"))%;\
    /echo
