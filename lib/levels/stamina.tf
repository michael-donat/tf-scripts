
/set _create_trigger_list=w pelni wypoczet[ay]|wypoczet[ay]|troche zmeczon[ay]|zmeczon[ay]|bardzo zmeczon[ay]|nieco wyczerpan[ay]|wyczerpan[ay]|bardzo wyczerpan[ay]|wycienczon[ay]|calkowicie wycienczon[ay]|
/set _create_trigger_trigger_prefix=_info_level_stamina_trigger
/set _create_trigger_trigger_name=_info_level_stamina_process
/set _create_trigger_match_prefix=(?:Jestes|jestes|Czujesz sie)\s(
/set _create_trigger_match_suffix=)\.
;above will autogenerate basic triggers

/_create_trigger

/def -p2 _info_level_stamina_process = \
    /let real_level=$[11-{1}]%;\
    /test _statusbar_update_stamina("%{real_level}")%;\
    /if ({_gag_stamina}==1) \
        /substitute %;\
        /set _gag_stamina=0 %;\
    /endif


