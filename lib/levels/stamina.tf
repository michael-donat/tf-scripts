
/set _create_trigger_list=w pelni wypoczet[ay]|wypoczet[ay]|troche zmeczon[ay]|zmeczon[ay]|bardzo zmeczon[ay]|nieco wyczerpan[ay]|wyczerpan[ay]|bardzo wyczerpan[ay]|wycienczon[ay]|calkowicie wycienczon[ay]|
/set _create_trigger_trigger_prefix=_info_level_stamina_trigger
/set _create_trigger_trigger_name=_info_level_stamina_process
/set _create_trigger_match_prefix=(?:Jestes|jestes|Czujesz sie)\s(
/set _create_trigger_match_suffix=)\.
;above will autogenerate basic triggers

/_create_trigger

/def -p2 _info_level_stamina_process = \
    /let real_level=$[11-{1}]%;\
    /let color=$[_info_level_stamina_process_to_color({real_level})]%;\
    /let bgcolor=$[_info_level_stamina_process_to_bgcolor({real_level})]%;\
    /test _statusbar_update_stamina("%{real_level}", "%{color}", "%{bgcolor}")%;\
    /if ({_gag_stamina}==1) \
        /substitute %;\
        /set _gag_stamina=0 %;\
    /endif

/def _info_level_stamina_process_to_color = \
    /if ({1} == "1") \
        /let tmp_return=Cbgred%;\
    /elseif ({1} =="2") \
        /let tmp_return=Crgb500%;\
    /elseif ({1} =="2") \
            /let tmp_return=Crgb530%;\
    /elseif ({1} =="3") \
        /let tmp_return=Crgb530%;\
    /elseif ({1} =="4") \
        /let tmp_return=Crgb550%;\
    /elseif ({1} =="5") \
        /let tmp_return=Crgb550%;\
    /elseif ({1} =="6") \
        /let tmp_return=Crgb550%;\
    /elseif ({1} =="7") \
        /let tmp_return=Crgb350%;\
    /elseif ({1} =="8") \
        /let tmp_return=Crgb350%;\
    /elseif ({1} =="9") \
        /let tmp_return=Crgb350%;\
    /elseif ({1} =="10") \
        /let tmp_return=Crgb040%;\
    /elseif ({1} =="11") \
        /let tmp_return=Crgb040%;\
    /endif%;\
    /return {tmp_return}

/def _info_level_stamina_process_to_bgcolor = \
    /if ({1} == "1") \
        /let tmp_return=Cbgred%;\
    /elseif ({1} =="2") \
        /let tmp_return=Cbgrgb500%;\
    /elseif ({1} =="2") \
            /let tmp_return=Cbgrgb530%;\
    /elseif ({1} =="3") \
        /let tmp_return=Cbgrgb530%;\
    /elseif ({1} =="4") \
        /let tmp_return=Cbgrgb550%;\
    /elseif ({1} =="5") \
        /let tmp_return=Cbgrgb550%;\
    /elseif ({1} =="6") \
        /let tmp_return=Cbgrgb550%;\
    /elseif ({1} =="7") \
        /let tmp_return=Cbgrgb350%;\
    /elseif ({1} =="8") \
        /let tmp_return=Cbgrgb350%;\
    /elseif ({1} =="9") \
        /let tmp_return=Cbgrgb350%;\
    /elseif ({1} =="10") \
        /let tmp_return=Cbgrgb040%;\
    /elseif ({1} =="11") \
        /let tmp_return=Cbgrgb040%;\
    /endif%;\
    /return {tmp_return}
