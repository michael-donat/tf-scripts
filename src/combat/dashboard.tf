;-------------------------------------------------------
;       HEALTH - _combat_health_
;-------------------------------------------------------

/def _combat_health_get_points = \
    /if ({1} = "lekko ranny" or {1} = {lekko ranna}) \
    /elseif \


/def -mregexp -t'Jestes (w )?(swietnej kondycji|dobrym stanie|lekko ranny)' _combat_health_trigger_1 = \
    /set _combat_health_ME=%{P2}%;\
    /eval /echo %{_combat_health_ME}
