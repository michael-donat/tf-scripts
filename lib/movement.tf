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
        /def _bind_kb_key_nkpMinus  = /x%;\
        /mapa on%;\
    /else \
        /set _movement_map_track=0%;\
        /set _map_tracking_enabled_label=$[decode_attr("[MAP]", "Cbgred")]%;\
        /def _bind_kb_key_nkpMinus  = /_movement_go_exec wyjscie%;\
        /mapa off%;\
    /endif

/def _movement_go_exec =    \
\
    /if (_movement_disabled!=1) \
        /send -h %{1}%;\
    /endif

/def -ag -mregexp -t'((Jest|Sa) tutaj ([^ ]*) (widoczne|widocznych) (wyjsc|wyjscia|wyjscie): |Rozpadlina ciagnie sie na |Trakt wiedzie na |W mroku nocy dostrzegasz .* widoczn(e|ych) wyjsc(|ia|ie): |Trakt rozgalezia sie na |W gestych ciemnosciach dostrzegasz trakt wiodacy na |W gestych ciemnosciach dostrzegasz, ze trakt rozgalezia sie na |Sciezka prowadzi tutaj w .* (kierunkach|kierunku): |Szlak.* tutaj w .* kierunk.*: |Wyjsc.* prowadz.* tutaj w .* (kierunkach|kierunku): |Tunel.* ciagn.* na |Wedrowke przez rozlegle laki mozesz kontynuowac udajac sie na )' _movement_match_exists = \
    /let _movement_exists=$[replace(". Mozna jednak z niego zejsc i udac sie na ", ", ", {PR})] %;\
    /let _movement_exists=$[replace(".", "", replace(" i ", ", ", {_movement_exists}))]%;\
    /_movement_exists %{_movement_exists}%;\
    /let _movement_exists=$[replace(", ", " ", {_movement_exists})]%;\
    /_statusbar_update_compass %{_movement_exists}

/def _movement_exists = \
    /echo -p @{BCyellow} ==  @{BCgreen}%{*}


/def -p500 -aL -mregexp -t'exit:([A-Z]+):(.*)' _map_exit_rebind_mine = \
  /echo -p @{Cblue}         /%{P1} -> %{P2}%;\
  /def %{P1} = /send -h %{P2}

/def -p500 -aL -mregexp -t'exit:custom:(.*)' _map_exit_rebind_custom_mine = \
  /set _map_bound_exit=%{P1}%;\
  /def x = /send -h %{P1}

/def -p500 -aL -mregexp -t'exit:reset' _map_exit_reset_nolog_mine = \
  /set _map_bound_exit=%;\
  /purge _map_location_*%;\
  /purge x%; /purge n%; /purge ne%; /purge r%; /purge se%; /purge s%; /purge sw%; /purge w%; /purge nw%; /purge up%; /purge dn%;