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

/def _combat_health_add = \
    /set _combat_health_hp=$[_combat_health_to_int({2})]%;\
    /set _combat_health_hp_color=$[_combat_health_to_color({_combat_health_hp})]%;\
    /set _combat_health_who=%{1}%;\
    /test echo("---------------------------------------------------")%;\
    /if ({1} =~ "0") \
        /test echo("")%;\
        /set tmp_text=$[pad(strcat("K O N D Y C J A     ----    ",{3}),-55)] [ $[strrep("#", {_combat_health_hp})]$[strrep(" ", 7-{_combat_health_hp})] ]%;\
        /set _combat_health_is_team_member=-1%;\
    /elseif (strstr({_team_members_list_separated}, strcat("|",{_combat_health_who},"|")) != -1) \
        /set _combat_health_is_team_member=1%;\
        /set tmp_text=$[pad({3},-55)] [ $[strrep("#", {_combat_health_hp})]$[strrep(" ", 7-{_combat_health_hp})] ]%;\
    /else \
        /if ({_combat_health_is_team_member}==1) \
            /test echo("------------")%;\
        /endif%;\
        /set _combat_health_is_team_member=-1%;\
        /set tmp_text=$[pad({3},-55)] [ $[strrep("#", {_combat_health_hp})]$[strrep(" ", 7-{_combat_health_hp})] ]%;\
    /endif%;\
    /set tmp_text=$[decode_attr({tmp_text},{_combat_health_hp_color})]%;\
    /echo %{tmp_text}%;\
    /if ({1} =~ "0") \
        /test echo("----------------------")%;\
    /endif

/def -ag -Fp150 -mregexp -t'^Jestes (?:[w] |)(swietnej kondycji|dobrym stanie|lekko rann[a-z]|rann[a-z]|zlej kondycji|ciezko rann[a-z]|ledwo zyw[a-z])\.$' _combat_health_trigger_1=/test _combat_health_add(0,"%{P1}","%{P0}")
/def -ag -Fp150 -mregexp -t'^([A-z]+|[A-z]+ [a-z]+|[A-z]+ [a-z]+ [a-z]+) jest (?:[w] |)(swietnej kondycji|dobrym stanie|lekko rann[a-z]|rann[a-z]|zlej kondycji|ciezko rann[a-z]|ledwo zyw[a-z])\.$' _combat_health_trigger_2=/test _combat_health_add("%{P1}","%{P2}","%{P0}")
