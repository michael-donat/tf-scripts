/def _team_is_member = \
    /return $[strstr({_team_members_list_separated}, strcat("|",{1},"|")) != -1]

/def _team_members_purge = \
    /purge _team_members_trigger*%;\

/def _team_members_set = \
    /set _team_members_list_separated=$[strcat("|", replace(" ", "|", replace(", ", "|", replace(" i ", ", ", replace("ty, ", "", %{*})))), "|")]%;\
    /_team_members_purge%;\
    /_team_members_generate_goodies

/def druzyna = \
    /def -t'Nie jestes w zadnej druzynie.' _team_members_trigger_no_team = /_team_members_purge%;/unset _team_members_list_separated%;\
    /def -mregexp -p5 -t'^Druzyne prowadzi (.*)( i|, w ktorej) oprocz ciebie (jest|sa) w niej jeszcze(|:) (.*)\.\$' _team_members_trigger_team_1 = /test _team_members_set("%%{P1}", "%%{P5}")%%;/set _team_leader %%{P1}%;\
    /def -mregexp -p5 -t'^Druzyne prowadzi (.*)\, zas ty jestes jej jedynym czlonkiem\.\$' _team_members_trigger_team_2 = /test _team_members_set("%%{P1}")%%;/set _team_leader %%{P1}%;\
    /def -mregexp -p5 -t'^Przewodzisz druzynie, w ktorej oprocz ciebie (jest jeszcze|sa(| w niej) jeszcze:) (.*)\.\$' _team_members_trigger_team_3 = /test _team_members_set("%%{P3}")%%;/set _team_leader=-%;\
    /send druzyna

;/def -mregexp -p20 -t'Od teraz jej sklad stanowicie (.*)\.' _team_members_trigger_team_4 = /test _team_members_set("%{P1}")

/def _team_members_generate_goodies = \
    /quote -S /unset `/listvar -s \_team\_member\_*%;\
    \
    /let _team_members_list=$[substr({_team_members_list_separated}, 1)]%;\
    /let _team_members_list_pointer=$[strstr({_team_members_list},"|")] %;\
    /let _team_members_list_i=0%;\
    \
    /while ({_team_members_list_pointer}!=-1) \
        /let _team_members_list_i=$[%{_team_members_list_i}+1]%;\
        /let _team_members_list_item=$[substr({_team_members_list},0,{_team_members_list_pointer})]%;\
        /let _team_members_list=$[substr({_team_members_list},{_team_members_list_pointer}+1)]%;\
        /let _team_members_list_pointer=$[strstr({_team_members_list}, "|")]%;\
        \
        /set _team_member_name_%{_team_members_list_i}=%{_team_members_list_item}%;\
        /set _team_member_number_%{_team_members_list_item}=%{_team_members_list_i}%;\
        \
     /done%;\
     /_combat_defence_generate_form_team_members


/def _team_get_number_by_name = \
    /eval /echo %%_team_member_number_%{1}

/def _team_get_number_by_number = \
    /eval /echo %%_team_member_name_%{1}