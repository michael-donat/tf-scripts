/def _bind_kb_key_nkp1      = /_movement_go_exec sw
/def _bind_kb_key_nkp2      = /_movement_go_exec s
/def _bind_kb_key_nkp3      = /_movement_go_exec se
/def _bind_kb_key_nkp4      = /_movement_go_exec w
/def _bind_kb_key_nkp6      = /_movement_go_exec e
/def _bind_kb_key_nkp7      = /_movement_go_exec nw
/def _bind_kb_key_nkp8      = /_movement_go_exec n
/def _bind_kb_key_nkp9      = /_movement_go_exec ne
/def _bind_kb_key_nkp0      = /_movement_go_exec d
/def _bind_kb_key_nkpDot    = /_movement_go_exec u
/def _bind_kb_key_nkpMinus  = /_movement_go_exec wyjscie

/def _bind_kb_key_nkp5      = /send zerknij

/def move = \
    /if ({1}=~"-") \
        /set _movement_disabled=1%;\
        /set _movement_disabled_label=$[decode_attr("[MV]", "Cbgred")]%;\
    /else \
        /set _movement_disabled=0%;\
        /set _movement_disabled_label=$[decode_attr("[MV]", "Cbggreen")]%;\
    /endif

/def map = \
    /if ({1}=~"run") \
        /echo runnin %;\
    /elseif ({1}=~"+") \
        /set _movement_map_track=1%;\
        /set _map_tracking_enabled_label=$[decode_attr("[MAP]", "Cbggreen")]%;\
        /def %{_map_setting_custom_exit_key}  = /x%;\
        /def %{_map_setting_custom_exit_switch_key} = /_map_custom_switch%%;/_map_custom_show%;\
        /mapa on%;\
    /else \
        /set _movement_map_track=0%;\
        /set _map_tracking_enabled_label=$[decode_attr("[MAP]", "Cbgred")]%;\
        /def %{_map_setting_custom_exit_key}  = /_movement_go_exec wyjscie%;\
        /mapa off%;\
    /endif

/def _movement_go_mask_eval = \
    /eval /echo %%_movement_go_mask_%{1}

/def _movement_get_rebind = \
    /eval /echo %%_map_rebind_exit_%{1}

/def _movement_go_exec =    \
\
    /let direction=%{1}%;\
    /let command=%;\
    /let rebind=$(/_movement_get_rebind %{direction})%;\
    /if ({rebind}!~NULL) \
        /let direction=%{rebind}%;\
    /endif%;\
    /if (_movement_disabled!=1) \
        /let command=%{direction}%;\
    /elseif (_movement_sneak==1) \
        /let command=przemknij sie %{direction} %;\
    /elseif (_movement_sneak_team==1) \
        /let command=przemknij sie z druzyna %{direction} %;\
    /endif%;\
    /send -h %{command}

/def -agL -mregexp -t'(Linia brzegowa ciagnie sie na |Krete, widmowe drozki prowadza na |(Jest|Sa) tutaj ([^ ]*) (widoczne|widocznych) (wyjsc|wyjscia|wyjscie): |Rozpadlina ciagnie sie na |Trakt wiedzie na |W mroku nocy dostrzegasz .* widoczn(e|ych) wyjsc(|ia|ie): |Trakt rozgalezia sie na |W gestych ciemnosciach dostrzegasz trakt wiodacy na |W gestych ciemnosciach dostrzegasz, ze trakt rozgalezia sie na |Sciezka prowadzi tutaj w .* (kierunkach|kierunku): |Szlak.* tutaj w .* kierunk.*: |Wyjsc.* prowadz.* tutaj w .* (kierunkach|kierunku): |Tunel.* ciagn.* na |Wedrowke przez rozlegle laki mozesz kontynuowac udajac sie na )' _movement_match_exists = \
    /let _movement_exists=$[replace(". Mozna jednak z niego zejsc i udac sie na ", ", ", {PR})] %;\
    /let _movement_exists=$[replace(". Jedyne inne widoczne wyjscie to: ", ", ", {_movement_exists})] %;\
    /let _movement_exists=$[replace(".", "", replace(" i ", ", ", {_movement_exists}))]%;\
    /let _movement_exists_clean=$[replace(", ", " ", {_movement_exists})]%;\
    /_statusbar_update_compass %{_movement_exists_clean}%;\
    /set __movement_exits=%{_movement_exists}%; \
    /_movement_exists %{_movement_exists}

/def _movement_exists = \
    /_movement_exits_prepare%; \
    /echo -p @{BCyellow} ==  @{BCgreen}%{__movement_exits}

/def _movement_exits_prepare = \
    /quote -S /_movement_exit_prepare `/listvar -mregexp _map_rebind_exit_(.*)

/def _movement_exit_prepare = \
    /let __all=%{*}%; \
    /let __cos=$[regmatch("_map_rebind_exit_(.*)=(.*)", {__all})]%; \
    /set __movement_exits=$[replace({P2}, strcat({P2}, " (", {P1}, ")"), {__movement_exits})]%;\
    /let index=$[strstr({__movement_exits}, {P2}, 0)]%;\
    /if ({index}==-1) \
        /set __movement_exits=%{__movement_exits}, %{P2} (%{P1})%;\
    /endif

/def _map_custom_show = \
  /set _map_bound_exit=%;\
  /if ({_map_custom_exits_count} == 0) /return%; /endif%; \
  /let __exits=%{_map_custom_all}%; \
  /let __exits=$[replace({_map_custom_current}, strcat("@{Crgb050}", {_map_custom_current}, "@{Crgb045}"), {__exits})]%; \
  /let __exits=$[replace("|", " ", {__exits})]%; \
  /set _map_bound_exit=$(/echo -p @{Crgb045}%{__exits})
