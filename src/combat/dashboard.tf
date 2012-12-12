;-------------------------------------------------------
;       HEALTH - _combat_health_
;-------------------------------------------------------

/def _combat_health_to_int = \
    /if (strstr({1}, "swietnej") != -1) \
        /set tmp_return=7%;\
    /elseif (strstr({1}, "dobrym") != -1) \
        /set tmp_return=6%;\
    /elseif (strstr({1}, "lekko") != -1) \
        /set tmp_return=5%;\
    /elseif (strstr({1}, "ciezko") != -1) \
        /set tmp_return=3%;\
    /elseif (strstr({1}, "rann") != -1) \
        /set tmp_return=4%;\
    /elseif (strstr({1}, "zlym") != -1) \
        /set tmp_return=3%;\
    /elseif (strstr({1}, "ledwo") != -1) \
        /set tmp_return=1%;\
    /endif%;\
    /return {tmp_return}

/def _combat_health_add = \
    /set _combat_health_hp=$[_combat_health_to_int({2})]%;\
    /if ({1} =~ "0") \
        /test echo("")%;\
        /test echo("---------------------------------------------------")%;\
        /echo -p $[pad("K O N D Y C J A",10)]     [ $[strrep("#", {_combat_health_hp})]$[strrep(" ", 7-{_combat_health_hp})] ] - %{2}%;\
        /test echo("----------------------")%;\
    /elseif (strstr({_combat_health_who}, " ") == -1) \
        /echo -p $[pad({3},-55)] [ $[strrep("#", {_combat_health_hp})]$[strrep(" ", 7-{_combat_health_hp})] ]%;\
    /else \
        /echo -p $[pad({3},-55)] [ $[strrep("#", {_combat_health_hp})]$[strrep(" ", 7-{_combat_health_hp})] ]%;\
    /endif%;\


/def -ag -Fp150 -mregexp -t'^Jestes (?:[w] |)(swietnej kondycji|dobrym stanie|lekko rann[a-z]|rann[a-z]|zlej kondycji|ciezko rann[a-z]|ledwo zyw[a-z])\.$' _combat_health_trigger_1=/test _combat_health_add(0,"%{P1}","%{P0}")
/def -ag -Fp150 -mregexp -t'^([A-z]+|[A-z]+ [a-z]+|[A-z]+ [a-z]+ [a-z]+) jest (?:[w] |)(swietnej kondycji|dobrym stanie|lekko rann[a-z]|rann[a-z]|zlej kondycji|ciezko rann[a-z]|ledwo zyw[a-z])\.$' _combat_health_trigger_2=/test _combat_health_add("%{P1}","%{P2}","%{P0}")
