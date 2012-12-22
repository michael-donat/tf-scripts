;------------------------------------------------------------------------
; POSSIBLE VARIABLES FOR AUTOGENERATOR
;
; _create_trigger_list - pipe (|) separated list of strings to match (can be in regexp format)
; _create_trigger_trigger_prefix - prefix for trigger names (will have iteration index appended to it)
; _create_trigger_trigger_name - name of the callback that will be executed upon match
; _create_trigger_match_prefix - a (optional) prefix for pattern that will be constructed form list item (can be in regexp format)
; _create_trigger_match_suffix - a (optional) suffix for pattern that will be constructed form list item (can be in regexp format)

/set _create_trigger_list_separator=|
/def _create_trigger = \
    /set _create_trigger_list_pointer=$[strstr({_create_trigger_list},{_create_trigger_list_separator})] %;\
    /set _create_trigger_i=0%;\
    \
    /while ({_create_trigger_list_pointer}!=-1) \
        /set _create_trigger_i=$[%{_create_trigger_i}+1]%;\
        /set _create_trigger_list_item=$[substr({_create_trigger_list},0,{_create_trigger_list_pointer})]%;\
        /set _create_trigger_list=$[substr({_create_trigger_list},{_create_trigger_list_pointer}+1)]%;\
        /set _create_trigger_list_pointer=$[strstr({_create_trigger_list}, {_create_trigger_list_separator})]%;\
        /def -mregexp -Fp15 -t'%{_create_trigger_match_prefix}%{_create_trigger_list_item}%{_create_trigger_match_suffix}' %{_create_trigger_trigger_prefix}%{_create_trigger_i} = /test %{_create_trigger_trigger_name}(%{_create_trigger_i},"%%{*}")%;\
     /done%;\
     /unset _create_trigger_list%;\
     /unset _create_trigger_trigger_prefix%;\
     /unset _create_trigger_trigger_name%;\
     /unset _create_trigger_match_prefix%;\
     /unset _create_trigger_match_suffix%;\
     /set _create_trigger_list_separator=|




 /def _exaggerate_alert = \
    /echo -p @{Cbgrgb330}$[strrep("-", 80)]%;\
    /echo -p @{Cbgrgb320}$[strrep("-", 80)]%;\
    /echo -p @{Cbgrgb310}$[strrep("-", 80)]%;\
    /echo -p @{Cbgrgb300}$[pad(strcat({*}, "                    ======="), 80)]%;\
    /echo -p @{Cbgrgb310}$[strrep("-", 80)]%;\
    /echo -p @{Cbgrgb320}$[strrep("-", 80)]%;\
    /echo -p @{Cbgrgb330}$[strrep("-", 80)]
