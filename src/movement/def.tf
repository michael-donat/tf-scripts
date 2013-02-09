
/def _movement_go_sw    = /_movement_go_exec sw
/def _movement_go_s     = /_movement_go_exec s
/def _movement_go_se    = /_movement_go_exec se
/def _movement_go_w     = /_movement_go_exec w
/def _movement_go_e     = /_movement_go_exec e
/def _movement_go_nw    = /_movement_go_exec nw
/def _movement_go_n     = /_movement_go_exec n
/def _movement_go_ne    = /_movement_go_exec ne
/def _movement_go_down  = /_movement_go_exec d
/def _movement_go_up    = /_movement_go_exec u
/def _movement_go_exit  = /_movement_go_exec wyjscie

/set _movement_mode=1

/def _movement_normal = \
    /set _movement_mode=1

/def _movement_sneak = \
    /set _movement_mode=2

/def _movement_disable = \
    /set _movement_mode=0

/def _movement_map_track = \
    /set _movement_map_track=1

/def _movement_go_exec =    \
\
    /if (_movement_map_blind == 1) \
            /map_blind_go $[map_translate({1})] %;\
            /return 0 %;\
        /endif%;\
    /if (_movement_map_track == 1) \
        /map_go $[map_translate({1})] %;\
    /endif%;\
    /if (_movement_mode == 1) \
        /send %{1} %;\
    /endif%;\
    /if (_movement_mode == 2) \
        /send przemknij sie %{1} %;\
    /endif

/def -Fp2 -mregexp -t'((Jest|Sa) tutaj ([^ ]*) (widoczne|widocznych) (wyjsc|wyjscia|wyjscie): |Trakt wiedzie na |W mroku nocy dostrzegasz .* widoczn(e|ych) wyjsc(|ia|ie): |Trakt rozgalezia sie na |W gestych ciemnosciach dostrzegasz trakt wiodacy na |W gestych ciemnosciach dostrzegasz, ze trakt rozgalezia sie na |Sciezka prowadzi tutaj w .* (kierunkach|kierunku): |Szlak.* tutaj w .* kierunk.*: |Wyjsc.* prowadz.* tutaj w .* (kierunkach|kierunku): |Tunel.* ciagn.* na |Wedrowke przez rozlegle laki mozesz kontynuowac udajac sie na )' _movement_exists = \
    /set tmp_text=$[replace(" i ", ", ", {PR})]%;\
    /set tmp_text=$[replace(". Mozna jednak z niego zejsc i udac sie na ", " ", {tmp_text})] %;\
    /set tmp_text=$[replace(".", "", {tmp_text})]%;\
    /set _movement_exit_list=$[replace(", ", ";", {tmp_text})]%;\
    /substitute -p @{BCyellow} ==  @{BCgreen}%{tmp_text}


/def key_esc_nkpEnt = \
    /if (_movement_map_track == 1) \
        /echo Adding %{_movement_exit_list}%;\
        /test map_add_room({_movement_exit_list})%;\
    /endif