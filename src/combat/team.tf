;------------------------------------------------------------
; CATCHING TEAM MEMBERS
;------------------------------------------------------------
;

/def _team_is_member = \
    /return $[strstr({_team_members_list_separated}, strcat("|",{1},"|")) != -1)]

/def _team_members_purge = \
    /purge _team_members_trigger*%;\

/def _team_members_set = \
    /set _team_members_list_separated=$[strcat("|", replace(" ", "|", replace(", ", "|", replace(" i ", ", ", %{*}))), "|")]%;\
    /_team_members_purge

/def druzyna = \
    /def -t'Nie jestes w zadnej druzynie.' _team_members_trigger_no_team = /_team_members_purge%;/unset _team_members_list_separated%;\
    /def -mregexp -p5 -t'^Druzyne prowadzi (.*)( i|, w ktorej) oprocz ciebie (jest|sa) w niej jeszcze(|:) (.*)\.\$' _team_members_trigger_team_1 = /test _team_members_set("%%{P1}", "%%{P5}")%;\
    /def -mregexp -p5 -t'^Druzyne prowadzi (.*)\, zas ty jestes jej jedynym czlonkiem\.\$' _team_members_trigger_team_2 = /test _team_members_set("%%{P1}")%;\
    /def -mregexp -p5 -t'^Przewodzisz druzynie, w ktorej oprocz ciebie (jest jeszcze|sa(| w niej) jeszcze:) (.*)\.\$' _team_members_trigger_team_3 = /test _team_members_set("%%{P3}")%;\
    /send druzyna%;\


