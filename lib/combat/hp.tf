;-------------------------------------------------------
;       HEALTH - _combat_health_
;-------------------------------------------------------

/def _combat_health_to_int = \
    /if (strstr({1}, "swietnej") != -1) \
        /let tmp_return=7%;\
    /elseif (strstr({1}, "dobrym") != -1) \
        /let tmp_return=6%;\
    /elseif (strstr({1}, "lekko") != -1) \
        /let tmp_return=5%;\
    /elseif (strstr({1}, "ciezko") != -1) \
        /let tmp_return=2%;\
    /elseif (strstr({1}, "rann") != -1) \
        /let tmp_return=4%;\
    /elseif (strstr({1}, "zlej") != -1) \
        /let tmp_return=3%;\
    /elseif (strstr({1}, "ledwo") != -1) \
        /let tmp_return=1%;\
    /endif%;\
    /return {tmp_return}

/def _combat_health_to_color = \
    /if ({1} == "1") \
        /let tmp_return=Cbgred%;\
    /elseif ({1} =="2") \
        /let tmp_return=Crgb500%;\
    /elseif ({1} =="3") \
        /let tmp_return=Crgb510%;\
    /elseif ({1} =="4") \
        /let tmp_return=Crgb530%;\
    /elseif ({1} =="5") \
        /let tmp_return=Crgb550%;\
    /elseif ({1} =="6") \
        /let tmp_return=Crgb350%;\
    /elseif ({1} =="7") \
        /let tmp_return=Crgb040%;\
    /endif%;\
    /return {tmp_return}

/def _combat_health_to_bgcolor = \
    /if ({1} == "1") \
        /let tmp_return=Cbgred%;\
    /elseif ({1} =="2") \
        /let tmp_return=Cbgrgb500%;\
    /elseif ({1} =="3") \
        /let tmp_return=Cbgrgb510%;\
    /elseif ({1} =="4") \
        /let tmp_return=Cbgrgb530%;\
    /elseif ({1} =="5") \
        /let tmp_return=Cbgrgb550%;\
    /elseif ({1} =="6") \
        /let tmp_return=Cbgrgb350%;\
    /elseif ({1} =="7") \
        /let tmp_return=Cbgrgb040%;\
    /endif%;\
    /return {tmp_return}

/def -ag -Fp150 -mregexp -t'^Jestes (?:[w] |)(swietnej kondycji|dobrym stanie|lekko rann[a-z]|rann[a-z]|zlej kondycji|ciezko rann[a-z]|ledwo zyw[a-z])\.$' _combat_health_trigger_1= \
    /let _combat_health_hp=$[_combat_health_to_int({P1})]%;\
    /let _combat_health_hp_color=$[_combat_health_to_color({_combat_health_hp})]%;\
    /let _combat_health_hp_bgcolor=$[_combat_health_to_bgcolor({_combat_health_hp})]%;\
    /test _statusbar_update_hp("%{_combat_health_hp}", "%{_combat_health_hp_color}", "%{_combat_health_hp_bgcolor}")
