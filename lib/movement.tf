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

/def _bind_kb_key_nkp5      = /send zerknij%;/_nkp5bind

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
    /if (_movement_disabled==1) \
        /echo -p @{Crgb400} Move mode: Disabled%;\
        /let command=%;\
        /return%;\
    /elseif (_movement_mode==0) \
        /let command=%{direction}%;\
    /elseif (_movement_mode==1) \
        /let command=przemknij sie %{direction} %;\
    /elseif (_movement_mode==2) \
        /let command=przemknij sie z druzyna %{direction} %;\
    /elseif (_movement_mode==3) \
        /let command=jedz na %{direction} %;\
    /endif%;\
    /send -h %{command}

/def -F -agL -mregexp -t'(Mozesz sie stad udac na |Wykopany w ziemi tunel wiedzie w dwoch kierunkach: |Wykopany w ziemi tunel rozgalezia sie tutaj, zas jego odnogi wioda na |Wykop konczy sie tutaj, zas jedyne widoczne przejscie prowadzi na |Mozesz skierowac lodz na |Linia brzegowa ciagnie sie na |Krete, widmowe drozki prowadza na |(Jest|Sa) tutaj ([^ ]*) (widoczne|widocznych) (wyjsc|wyjscia|wyjscie): |Rozpadlina ciagnie sie na |Trakt wiedzie na |W mroku nocy dostrzegasz .* widoczn(e|ych) wyjsc(|ia|ie): |Trakt rozgalezia sie na |W gestych ciemnosciach dostrzegasz trakt wiodacy na |W gestych ciemnosciach dostrzegasz, ze trakt rozgalezia sie na |Sciezka prowadzi tutaj w .* (kierunkach|kierunku): |Szlak.* tutaj w .* kierunk.*: |Wyjsc.* prowadz.* tutaj w .* (kierunkach|kierunku): |Tunel.* ciagn.* na |Wedrowke przez rozlegle laki mozesz kontynuowac udajac sie na )' _movement_match_exists = \
    /_movement_exists %{_movement_exists}
;    /let _movement_exists=$[replace(". Mozna jednak z niego zejsc i udac sie na ", ", ", {PR})] %;\
;    /let _movement_exists=$[replace(". Jedyne inne widoczne wyjscie to: ", ", ", {_movement_exists})] %;\
;    /let _movement_exists=$[replace(" oraz ", ", ", {_movement_exists})] %;\
;    /let _movement_exists=$[replace(" lub ", ", ", {_movement_exists})] %;\
;    /let _movement_exists=$[replace(".", "", replace(" i ", ", ", {_movement_exists}))]%;\
;    /let _movement_exists_clean=$[replace(", ", " ", {_movement_exists})]%;\
;    /_statusbar_update_compass %{_movement_exists_clean}%;\
;    /set __movement_exits=%{_movement_exists}%; \
;    /_movement_exists %{_movement_exists}

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

/def key_shift_right = \
    /if (_movement_mode==1) \
        /set _movement_mode=2%;\
        /echo -p @{Crgb045} Move mode: Team sneak%;\
    /elseif (_movement_mode==2) \
        /set _movement_mode=3%;\
        /echo -p @{Crgb045} Move mode: Cart%;\
    /elseif (_movement_mode==3) \
        /set _movement_mode=0%;\
        /echo -p @{Crgb045} Move mode: Walk%;\
    /else \
        /set _movement_mode=1%;\
        /echo -p @{Crgb045} Move mode: Sneak%;\
    /endif

/def key_shift_left = \
    /if (_movement_mode==3) \
        /set _movement_mode=2%;\
        /echo -p @{Crgb045} Move mode: Sneak Team%;\
    /elseif (_movement_mode==2) \
        /set _movement_mode=1%;\
        /echo -p @{Crgb045} Move mode: Sneak%;\
    /elseif (_movement_mode==1) \
        /set _movement_mode=0%;\
        /echo -p @{Crgb045} Move mode: Walk%;\
    /else \
        /set _movement_mode=3%;\
        /echo -p @{Crgb045} Move mode: Cart%;\
    /endif


/def -mregexp -t'Siadasz na .* (bryczce|wozie)\.' _cart_enter_1 = \
    /if ({P1}=/"bryczce") \
        /set _cart_type=bryczke%;\
    /else \
        /set _cart_type=woz%;\
    /endif %;\
    /set _movement_mode=2%;\
    /key_shift_right

/def -mregexp -t'Zsiadasz z .*(bryczki|wozu)\.' _cart_exit_1 = \
    /set _movement_mode=3%;\
    /key_shift_right

/def key_shift_up = \
    /if (_movement_mode==3) \
        /send -h wstan%;\
    /else \
        /send -h usiadz na wozie%;\
        /send -h usiadz na bryczce%;\
    /endif

/def key_shift_down = \
    /send -h zatrzymaj %{_cart_type}