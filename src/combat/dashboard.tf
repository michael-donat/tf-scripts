;-------------------------------------------------------
;       HEALTH - _combat_health_
;-------------------------------------------------------

/def _combat_health_to_int = \
; is max
    /if (strstr({1}, "swietnej") != -1) \
        /set tmp_return=7%;\
    /elseif (strstr({1}, "dobrym") != -1) \
        /set tmp_return=6%;\
    /elseif (strstr({1}, "lekko") != -1) \
        /set tmp_return=5%;\
    /elseif (strstr({1}, "ciezko") != -1) \
        /set tmp_return=3%;\
    /elseif (strstr({1}, "rann") != -1) \
        /set tmp_return=2%;\
    /elseif (strstr({1}, "ledwo") != -1) \
        /set tmp_return=1%;\
    /endif%;\
    /return {tmp_return}

/def -Fp150 -mregexp -t'Jestes w? (swietnej kondycji|dobrym stanie|lekko rann[a-z]|rann[a-z]|zlej kondycji|ciezko rann[a-z]|ledwo zyw[a-z])\.$' _combat_health_trigger_1= \
    /echo asddsf

/def -Fp150 -mregexp -t'^([A-z]+|[A-z]+ [a-z]+|[A-z]+ [a-z]+ [a-z]+) jest (?:[a-z] |)(swietnej kondycji|dobrym stanie|lekko rann[a-z]|rann[a-z]|zlej kondycji|ciezko rann[a-z]|ledwo zyw[a-z])\.$' _combat_health_trigger_2= \
    /set _combat_health_hp=$[_combat_health_to_int({P2})]%;\
    /substitute -p $[strrep({_combat_health_hp}, '#'/7 - %{P1}

