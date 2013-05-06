/def target = \
    /let target=%{*}%;\
    /if ({target}!/"") \
        /let target_M=$(/odmien_B_M %{*})%;\
        /test _combat_set_attack_target({target_M}, {target})%;\
    /endif

/def zabij = \
    /let target=%{*}%;\
    /if ({target}!/"") \
        /let target_M=$(/odmien_B_M %{*})%;\
        /send zabij %{target}%;\
        /test _combat_set_attack_target({target_M}, {target})%;\
        /prompt_attack%;\
;        /if ({_combat_orders_enabled}==1) \
;            /order_attack%;\
;        /endif%;\
    /endif

;---------------------------------------------------------------------------------
; CEL ATAKU
;-----------------------------

/def _combat_clear_attack_target = \
    /set _combat_attack_target=

/def _combat_set_attack_target = \
    /set _combat_attack_target %{1}%;\

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
        /send zabij $(/odmien_M_B %{_combat_attack_target}) %;\
    /endif

/def break_target = \
    /if ({_combat_attack_target}!/"") \
        /send przestan kryc sie za zaslona%;\
        /send przelam obrone $(/odmien_M_D %{_combat_attack_target})%;\
        /send zabij $(/odmien_M_B %{_combat_attack_target})%;\
        /send zmeczenie%;\
        /prompt_attack%;\
    /endif

/def prompt_attack = \
    /if ({_team_leader}=~"-") \
        /let target=$(/odmien_M_B %{_combat_attack_target})%;\
        /if ({_combat_point_at_target_by_set}=1) /send wskaz %{target} jako cel ataku%;/endif%;\
        /if ({_combat_point_at_target_by_look}=1) /send popatrz morderczo na %{target} %;/endif%;\
        /if ({_combat_point_at_target_by_point}=1) /send wskaz %{target} %;/endif%;\
    /endif

/def order_attack = \
    /if ({_combat_attack_target}!/"") \
        /if ({_team_leader}=~"-") \
            /let target=$(/odmien_M_B %{_combat_attack_target})%;\
            /send rozkaz druzynie zabic %{target}%;\
            /send zabij %{target}%;\
        /else \
            /echo -p @{Crgb055} Nie mozesz rozkazywac kiedy nie dowodzisz%;\
        /endif%;\
    /endif

/def cover_target = \
    /if ({_combat_defence_target}=~"TY") \
        /echo -p @{Crgb055} Nie mozesz zaslonic siebie%;\
    /elseif ({_combat_defence_target}!/"") \
        /send zaslon $(/odmien_M_B %{_combat_defence_target})%;\
    /endif

/def group_cover_target = \
    /if ({_combat_defence_target}=~"TY") \
            /echo -p @{Crgb055} Nie mozesz zaslonic siebie%;\
    /elseif ({_combat_defence_target}!/"") \
        /send zaslon $(/odmien_M_B %{_combat_defence_target}) przed grupa%;\
    /endif

/def prompt_defence = \
    /if ({_combat_defence_target}!/"") \
        /if ({_team_leader}=~"-") \
            /if ({_combat_defence_target}=~"TY") /let target=siebie %; /else /let target=$(/odmien_M_B %{_combat_defence_target}) %; /endif%;\
            /if ({_combat_point_at_target_by_set}=1) /send wskaz %{target} jako cel obrony %;/endif%;\
            /if ({_combat_point_at_target_by_look}=1) /send popatrz opiekunczo na %{target} %;/endif%;\
        /endif%;\
    /endif

/def order_defence = \
    /if ({_combat_defence_target}!/"") \
        /if ({_combat_defence_target}=~"TY") /let target=ciebie %; /else /let target=$(/odmien_M_B %{_combat_defence_target}) %; /endif%;\
        /if ({_team_leader}=~"-") \
            /send rozkaz druzynie zaslonic %{target}%;\
        /else \
            /echo -p @{Crgb055} Nie mozesz rozkazywac kiedy nie dowodzisz%;\
        /endif%;\
    /endif

/def defend = \
    /if (%{*}=~"siebie") \
        /set _combat_defence_target=TY%;\
        /let target=siebie%;\
    /else \
        /set _combat_defence_target=$(/odmien_B_M %{*})%;\
        /let target=%{*}%;\
    /endif%;\
    /prompt_defence

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
        /eval /defend $$(/odmien_M_B %%{_team_member_name_%{1}})%;\
        /order_defence%;\
    /endif


/def _combat_prompt_attack = \
    /echo%;\
    /test echo(decode_attr(strcat("             ","F1      - ZABIJ    -   ", {*}), "Cred"))%;\
    /test echo(decode_attr(strcat("             ","META_F1 - PRZELAM  -   ", {*}), "Cred"))%;\
    /echo

/def _combat_prompt_attack_after_break = \
    /echo%;\
    /test echo(decode_attr(strcat("             ","F1      - ZABIJ    -   ", {*}), "Cred"))%;\
    /echo

/def _combat_prompt_guard_break = \
    /echo%;\
    /test echo(decode_attr(strcat("             ","META_F1 - PRZELAM  -   ", {*}), "Cred"))%;\
    /echo

/def _combat_prompt_defence = \
    /echo%;\
    /test echo(decode_attr(strcat("             ","F2      - ZASLON  -   ", {*}), "Cgreen"))%;\
    /test echo(decode_attr(strcat("             ","META_F2 - GRUPOWA -   ", {*}), "Cgreen"))%;\
    /echo

/def _combat_prompt_defence_with_order = \
    /echo%;\
    /test echo(decode_attr(strcat("             ","F4      - POPROS         -   ", {*}), "Cgreen"))%;\
    /test echo(decode_attr(strcat("             ","META_F4 - ROZKAZ         -   ", {*}), "Cgreen"))%;\
    /echo

/def _combat_prompt_guard_break_for_oneself = \
    /return%;\
    /echo%;\
    /test echo(decode_attr(strcat("             ","META_F1 - PRZELAM DLA SIEBIE -   ", {*}), "Cred"))%;\
    /echo

/def _combat_prompt_guard_break_for_someone = \
    /return%;\
    /echo%;\
    /test echo(decode_attr(strcat("             ","META_F1 - PRZELAM DLA KOGOS -   ", {*}), "Cred"))%;\
    /echo


/def processTargetSet = \
    /let target=%{1}%;\
    /set _combat_attack_target=$(/odmien_B_M %{1})%;\
    /test _combat_prompt_attack({target})

/def processDefenceSet = \
    /let target=%{1}%;\
    /let who=%{2}%;\
    /if ({target}=~"ciebie") \
        /set _combat_defence_target=TY%;\
    /elseif ({target}=~"siebie") \
        /set _combat_defence_target=%{who}%;\
        /let promptlabel=$(/odmien_M_B %{who})%;\
        /test _combat_prompt_defence({promptlabel})%;\
    /else \
        /set _combat_defence_target=$(/odmien_B_M %{target})%;\
        /test _combat_prompt_defence({target})%;\
    /endif