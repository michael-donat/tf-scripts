
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
/def _movement_go_exit  = /_movement_go_exec exit

/def _movement_go_exec =    \
\
    %{1}


/def -mregexp -t'(Sa|Jest) tutaj [a-z]+ widocz[a-z]+ wyjsc[a-z]+: ([^.]+)\.' = \
    /set tmp_text=$[replace(" i ", ", ", {P2})]%;\
    /substitute -p @{BCyellow} ==  @{BCgreen}%{tmp_text}
