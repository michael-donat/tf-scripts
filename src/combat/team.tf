;------------------------------------------------------------
; CATCHING TEAM MEMBERS
;------------------------------------------------------------
;

/set _team_members_trigger_no_team=123123123

/def druzyna = \
    /def -t'Nie jestes w zadnej druzynie.' _team_members_trigger_no_team = /purse _team_members_list*%%;/echo OMG OMG%;\
    /send druzyna%;\
    /purge _team_members_trigger*