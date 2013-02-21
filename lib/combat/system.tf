
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

/def toggle_orders = \
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

/def attack_target = \
    /if ({_combat_attack_target}!/"") \
        /zabij $(/odmien_M_B %{_combat_attack_target}) %;\
    /endif

/def break_target = \
    /if ({_combat_attack_target}!/"") \
        /send przestan kryc sie za zaslona%;\
        /send przelam obrone $(/odmien_M_D %{_combat_attack_target})%;\
        /zabij $(/odmien_M_B %{_combat_attack_target})%;\
        /send stan%;\
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

/def prompt_attack = \
    /if ({_team_leader}=~"-") \
        /let target=$(/odmien_M_B %{_combat_attack_target})%;\
        /send popatrz morderczo na %{target}%;\
    /endif

/def order_attack = \
    /if ({_combat_attack_target}!/"") \
        /if ({_team_leader}=~"-") \
            /let target=$(/odmien_M_B %{_combat_attack_target})%;\
            /send popatrz morderczo na %{target}%;\
            /send rozkaz druzynie zabic %{target}%;\
        /endif%;\
    /endif

/def cover_target = \
    /if ({_combat_defence_target}!/"") \
        /send zaslon $(/odmien_M_B %{_combat_defence_target})%;\
    /endif

/def group_cover_target = \
    /if ({_combat_defence_target}!/"") \
        /send zaslon $(/odmien_M_B %{_combat_defence_target}) przed grupa%;\
    /endif

/def prompt_defence = \
    /if ({_combat_defence_target}!/"") \
        /let target=$(/odmien_M_B %{_combat_defence_target})%;\
        /send popatrz opiekunczo na %{target}%;\
    /endif

/def order_defence = \
    /if ({_combat_defence_target}!/"") \
        /let target=$(/odmien_M_B %{_combat_defence_target})%;\
        /send popatrz opiekunczo na %{target}%;\
        /if ({_team_leader}=~"-") \
            /send rozkaz druzynie zaslonic %{target}%;\
        /endif%;\
    /endif

/def defend = \
    /set _combat_defence_target=$(/odmien_B_M %{*})%;\
    /send wskaz %{*} jako cel obrony%;\

/def d = \
    /let name=$(/eval /echo %%{_team_member_name_%{1}})%;\
    /if ({name}!/"") \
        /eval /defend $$(/odmien_M_B %%{_team_member_name_%{1}})%;\
    /endif

/def z = \
    /let name=$(/eval /echo %%{_team_member_name_%{1}})%;\
    /if ({name}!/"") \
        /eval /send zaslon $$(/odmien_M_B %%{_team_member_name_%{1}})%;\
    /endif

/def zz = \
    /let name=$(/eval /echo %%{_team_member_name_%{1}})%;\
    /if ({name}!/"") \
        /eval /send zaslon $$(/odmien_M_B %%{_team_member_name_%{1}}) przed grupa%;\
    /endif

/def zg = \
    /let name=$(/eval /echo %%{_team_member_name_%{1}})%;\
    /if ({name}!/"") \
        /eval /send zaslon $$(/odmien_M_B %%{_team_member_name_%{1}}) przed grupa%;\
    /endif

/def zr = \
    /let name=$(/eval /echo %%{_team_member_name_%{1}})%;\
    /if ({name}!/"") \
        /eval /defend $$(/odmien_M_B %%{_team_member_name_%{1}})%%;/order_defence%;\
    /endif


/def _combat_prompt_attack = \
    /echo%;\
    /test echo(decode_attr(strcat("             ","F1      - ZABIJ    -   ", {*}), "Cred"))%;\
    /test echo(decode_attr(strcat("             ","META_F1 - PRZELAM  -   ", {*}), "Cred"))%;\
    /echo

/def _combat_prompt_guard_break = \
    /echo%;\
    /test echo(decode_attr(strcat("             ","META_F1 - PRZELAM  -   ", {*}), "Cred"))%;\
    /echo

/def _combat_prompt_defence = \
    /echo%;\
    /test echo(decode_attr(strcat("             ","F3      - ZASLON  -   ", {*}), "Cgreen"))%;\
    /test echo(decode_attr(strcat("             ","META_F3 - GRUPOWA -   ", {*}), "Cgreen"))%;\
    /echo

/def _combat_prompt_defence_with_order = \
    /echo%;\
    /test echo(decode_attr(strcat("             ","F4      - POPROS         -   ", {*}), "Cgreen"))%;\
    /test echo(decode_attr(strcat("             ","META_F4 - ROZKAZ         -   ", {*}), "Cgreen"))%;\
    /echo
