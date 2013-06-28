/def displayGuard= \
    /let who=%{1}%;\
    /let whom_B=%{2}%;\
    /let from=%{3}%;\
    /let from_p=%{3}%;\
    /if ({whom_B}=~"cie") \
        /let whom=$[decode_attr("-- CIEBIE -- ", "Crgb150")]%;\
    /else \
        /let whom=$(/odmien_B_M %{whom_B})%;\
        /if ({whom}=~{_combat_attack_target}) \
            /_combat_prompt_guard_break_for_someone %{whom_B}%;\
        /endif%;\
        /let whom=$[decode_attr({whom_B}, $(/_team_get_name_color %{whom}))]%;\
    /endif%;\
    /let who=$[decode_attr({who}, $(/_team_get_name_color %{who}))]%;\
    \
    /if ({5}=~'') \
        /let order=%;\
    /else \
        /let order= -@{Crgb025} rozkaz %{5}%;\
    /endif%;\
    \
    /if ({from}=~'twoimi') \
        /let from=@{Crgb150}-- PRZED TOBA --%;\
    /else \
        /let from=@{Cgray13}przed ciosami@{Crgb530} %{from}%;\
    /endif %;\
    \
    /if ({4}=~'true') \
        /let success=@{Crgb150}ZASLANIA%;\
    /else \
        /let success=@{Crgb020}probuje zaslonic%;\
        /if ({from_p}=~'twoimi') \
            /let from=@{Crgb020}-- PRZED TOBA --%;\
        /endif%;\
    /endif%;\
    \
    /if ({who}=~'ty') \
        /let who=@{Crgb150}-- TY --%;\
    /endif%;\
    \
    /echo -p >   %{who} %{success}@{n} %{whom} %{from}%{order}

/def displayRetreat = \
    /let who=%{1}%;\
    /if (tolower({who})=~{_combat_attack_target}) \
        /_combat_prompt_guard_break_for_oneself %{who}%;\
    /endif%;\
    /let whom_B=%{2}%;\
    /if ({whom_B}=~"ciebie") \
        /let whom=$[decode_attr("-- TOBA -- ", "Crgb150")]%;\
    /else \
        /let whom=$(/odmien_B_M %{whom_B})%;\
        /let whom=$[decode_attr({whom_B}, $(/_team_get_name_color %{whom}))]%;\
    /endif%;\
    /if ({4}=~'true') \
        /let success=@{Crgb150}CHOWA SIE ZA%;\
    /else \
        /let success=@{Crgb020}probuje schowac sie za%;\
    /endif %;\
    /let who=$[decode_attr({who}, $(/_team_get_name_color %{who}))]%;\
    /let from=%{3}%;\
    /if ({from}=~'twoimi') \
        /let from=@{Crgb150}-- TWOIMI --%;\
    /else \
        /let from=@{Crgb530}%{3}%;\
    /endif %;\
    \
    /echo -p >   %{who} %{success}@{n} %{whom} @{Cgray13}przed atakami %{from}

/def displayAttack = \
    /let who=%{1}%;\
    /let whom_B=%{2}%;\
    /let how=@{Crgb025}%{3}%;\
    /if ({whom_B}=~"cie" | {whom_B}=~"ciebie") \
        /let whom=$[decode_attr("-- CIEBIE! --", "Crgb150")]%;\
        /beep%;\
    /else \
        /let whom=$(/odmien_B_M %{whom_B})%;\
        /let whom=$[decode_attr({whom_B}, $(/_team_get_name_color %{whom}))]%;\
    /endif%;\
    /let who=$[decode_attr({who}, $(/_team_get_name_color %{who}))]%;\
    /echo -p >  >  >  %{who} @{Crgb500}ATAKUJE@{n} %{whom}%{how}

/def displayGuardBreakAttempt = \
    /let who=%{1}%;\
    /let whom_B=%{2}%;\
    /let success=%{3}%;\
    /if ({whom_B}=~"") \
        /if ({success}=~"true") \
            /let info=~+-~+-~+-~+- RZUCA SIE NA ~+-~+-~+-~+- @{Crgb150} -- CIEBIE --%;\
            /let color=@{Cwhite}%;\
            /let linecolor=@{Cbgred}%;\
        /else \
            /let info=probuje rzucic sie na @{Crgb150}-- CIEBIE --%;\
            /let color=@{Cred}%;\
        /endif %;\
    /else \
        /let whom=$(/odmien_B_M %{whom_B})%;\
        /let is_member=$[_team_is_member({whom})]%;\
        /let whom_D=$(/odmien_M_D %{whom})%;\
        /if ({who}=~"") \
            /if ({success}=~"true") \
                /let info=-- TY -- PRZEBIJASZ OCHRONE%;\
                /let color=@{Crgb145}%;\
            /else \
                /let info=-- TY -- nie mozesz przebic ochrony%;\
                /let color=@{Crgb145}%;\
            /endif %;\
        /else \
            /if ({success}=~"true") \
                /if ({is_member}!=1) \
                    /let info=PRZEBIL OCHRONE%;\
                    /let color=@{Crgb145}%;\
                    /if ({whom}=~{_combat_attack_target}) \
                        /_combat_prompt_attack_after_break %{whom_B}%;\
                    /endif%;\
                /else \
                    /let info=~+-~+-~+-~+-  PRZEBIL OCHRONE  ~+-~+-~+-~+- %;\
                    /defend_next %{whom}%;\
                    /set defend_next_from=$(/odmien_M_N %{who})%;\
                    /_combat_prompt_defence_after_break %{whom_B}%;\
                    /let color=@{Cwhite}%;\
                    /let linecolor=@{Cbgred}%;\
                /endif%;\
            /else \
                /let info=nie moze przebic ochrony%;\
                /let color=@{Crgb145}%;\
            /endif%;\
        /endif%;\
    /endif%;\
    \
    /let who=$[decode_attr({who}, $(/_team_get_name_color %{who}))]%;\
    /let whom=$[decode_attr($(/ucfirstname %{whom_D}), $(/_team_get_name_color %{whom}))]%;\
    /substitute -p %{linecolor} >   %{who} %{color}%{info}@{n}%{linecolor} %{whom}

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
        /test _combat_set_attack_target({target_M}, {target})%;\
        /if ({_combat_orders_enabled}==1 & {_team_leader}=~"-") \
            /order_attack%;\
        /else \
            /send zabij %{target}%;\
            /prompt_attack%;\
        /endif%;\
        /if ({_team_leader}=~"-") \
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
	    /prompt_attack %{_combat_attack_target}%;\
            /send zabij %{target}%;\
        /else \
            /echo -p @{Crgb055} Nie mozesz rozkazywac kiedy nie dowodzisz%;\
        /endif%;\
    /endif

/def cover_target_next = \
    /send zaslon $(/odmien_M_B %{_combat_defence_next_target}) przed %{defend_next_from}

/def cover_target = \
    /if ({_combat_defence_target}!/"") \
        /let defenceTarget=%{_combat_defence_target}%;\
    /else \
        /let defenceTarget=%{*}%;\
    /endif %;\
    /if ({defenceTarget}=~"TY") \
        /echo -p @{Crgb055} Nie mozesz zaslonic siebie%;\
    /elseif ({defenceTarget}!/"") \
        /send zaslon $(/odmien_M_B %{defenceTarget})%;\
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

/def order_defence_next = \
    /order_defence %{_combat_defence_next_target}%;\
    /prompt_defence %{_combat_defence_next_target}

/def order_defence = \
    /if ({_combat_defence_target}!/"") \
        /let defenceTarget=%{_combat_defence_target}%;\
    /else \
        /let defenceTarget=%{*}%;\
    /endif %;\
    /if ({defenceTarget}!/"") \
        /if ({defenceTarget}=~"TY") /let target=ciebie %; /else /let target=$(/odmien_M_B %{defenceTarget}) %; /endif%;\
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

/def defend_next = \
    /if (%{*}=~"siebie") \
        /set _combat_defence_next_target=TY%;\
    /else \
        /set _combat_defence_next_target=$(/odmien_B_M %{*})%;\
    /endif

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
    /echo -p @{Cred}@----------------------------------------------%;\
    /test echo(decode_attr(strcat("| ","F1      - ZABIJ    -   ", {*}), "Cred"))%;\
    /test echo(decode_attr(strcat("| ","META_F1 - PRZELAM  -   ", {*}), "Cred"))%;\

/def _combat_prompt_attack_after_break = \
    /echo -p @{Cred}@----------------------------------------------%;\
    /test echo(decode_attr(strcat("| ","F1      - ZABIJ    -   ", {*}), "Cred"))%;\

/def _combat_prompt_guard_break = \
    /test echo(decode_attr(strcat("             ","META_F1 - PRZELAM  -   ", {*}), "Cred"))%;\

/def _combat_prompt_defence = \
    /echo -p @{Cgreen}@----------------------------------------------%;\
    /test echo(decode_attr(strcat("| ","F2      - ZASLON  -   ", {*}), "Cgreen"))%;\
    /test echo(decode_attr(strcat("| ","META_F2 - GRUPOWA -   ", {*}), "Cgreen"))%;\

/def _combat_prompt_defence_with_order = \
    /echo%;\
    /test echo(decode_attr(strcat("             ","F4      - POPROS         -   ", {*}), "Cgreen"))%;\
    /test echo(decode_attr(strcat("             ","META_F4 - ROZKAZ         -   ", {*}), "Cgreen"))%;\
    /echo

/def _combat_prompt_guard_break_for_oneself = \
    /return%;\
    /test echo(decode_attr(strcat("             ","META_F1 - PRZELAM DLA SIEBIE -   ", {*}), "Cred"))%;\
    /echo

/def _combat_prompt_defence_after_break = \
    /echo -p @{Crgb505}@----------------------------------------------%;\
    /test echo(decode_attr(strcat("| ","F5      - ZASLON -              ", {*}), "Crgb505"))%;\
    /test echo(decode_attr(strcat("| ","META_F5 - ROZKAZ ZASLONY -      ", {*}), "Crgb505"))%;\

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

/set _combat_auto_cover_index=0

/def -mregexp -t' koncentruje sie na walce z (.*)\.' _combat_auto_cover_event = \
    /let line=%{PL} %{P0}%;\
    /let who=%{PL}%;\
    /let whom_N=%{P1}%;\
    /let whom=$(/odmien_N_M %{whom_N})%;\
    /let is_member=$[_team_is_member({whom})]%;\
    /if ({is_member}!=0) \
        /set _combat_auto_cover_index=$[%{_combat_auto_cover_index}+1]%;\
        /let whom_B=$(/odmien_M_B %{whom})%;\
        /let who_N=$(/odmien_M_N %{who})%;\
        /if ({_combat_auto_cover_index}==1) \
            /eval /def key_f7 = zaslon %{whom_B} przed %{who_N}%;\
            /let label=F7%;\
        /elseif ({_combat_auto_cover_index}==2) \
            /eval /def key_f8 = zaslon %{whom_B} przed %{who_N}%;\
            /let label=F8%;\
        /elseif ({_combat_auto_cover_index}==3) \
            /eval /def key_f9 = zaslon %{whom_B} przed %{who_N}%;\
            /let label=F9%;\
        /else \
            /eval /def key_f10 = zaslon %{whom_B} przed %{who_N}%;\
            /let label=F10%;\
            /set _combat_auto_cover_index=0%;\
        /endif%;\
        /substitute -p %{line} @{Crgb055}[Zaslona: @{Crgb030}-%{label}-@{n}@{Crgb055}]%;\
    /endif

/def prompt_PVP = \
    /if ({1}=~"." | {1}=~"," | {1} =~"]," | {1} =~"].") \
        /let target=$(/_odmien_M_B %{-1})%;\
        /eval /def key_f19 = /zabij %{target}%%%;przedstaw %{target}%;\
        /echo -p @{Cbgred}# # # # # # # # #    S T O P     S T O P    # # # # # # # # #%;\
        /echo -p @{Cbgred} F19  F19  F19  F19  F19    %{target}    F19  F19  F19  F19  F19%;\
    /endif