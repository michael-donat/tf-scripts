/def _team_is_member = \
    /let search=$[tolower({1})]%;\
    /return $[strstr({_team_members_list_separated}, strcat("|",{search},"|")) != -1]

/def _team_members_purge = \
    /purge _team_members_trigger*%;\

/def _team_members_set = \
    /set _team_members_list_separated=$[tolower(strcat("|", replace(" ", "|", replace(", ", "|", replace(" i ", ", ", replace("ty, ", "", %{*})))), "|"))]%;\
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
    /purge _team_member_color_*%;\
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
        /_team_color_write_from_team_members %{_team_members_list_item} %{_team_members_list_i}%;\
        \
     /done%;\
     /_combat_defence_generate_form_team_members

/def _team_get_number_by_name = \
    /let search=$[tolower({1})]%;\
    /eval /echo %%_team_member_number_%{search}

/def _team_get_number_by_number = \
    /eval /echo %%_team_member_name_%{1}

/def _team_color_write_from_team_members = \
    /let member_M=$[tolower({1})]%;/let member_B=$(/odmien_M_B %{1})%;/let member_N=$(/odmien_M_N %{1})%;/let member_D=$(/odmien_M_D %{1})%;\
    /def -FPCrgb140 -mregexp -t'(%{member_B}|%{member_N}|%{member_D})|%{member_M}' _team_member_color_%{2}

/def _team_get_name_color = \
    /if (_team_is_member({*})) \
        /let color=Crgb140%;\
    /else \
        /let color=Crgb530%;\
    /endif%;\
    /echo %{color}