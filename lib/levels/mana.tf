
/set _create_trigger_list=u kresu sil|wykonczon[ay]|wyczerpan[ay]|w zlej kondycji|bardzo zmeczon[ay]|zmeczon[ay]|oslabion[ay]|lekko oslabion[ay]|w pelni sil|
/set _create_trigger_trigger_prefix=_info_level_mana_trigger
/set _create_trigger_trigger_name=_info_level_mana_process
/set _create_trigger_match_prefix=zas mentalnie\s(
/set _create_trigger_match_suffix=)\.
;above will autogenerate basic triggers

/_create_trigger

/def -p2 _info_level_mana_process = \
    /let real_level=$[{1}-1]%;\
    /test _statusbar_update_mana("%{real_level}")



