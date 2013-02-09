/def -t'* atakuje cie!' -p15 _combat_event_attack_1 = \
    /substitute -p @{Cbgblue} ======  @{Cbgred}[ ATTACKS ME ]@{Cbgblue} - %{*}

/def -aCbgblue -t'* atakuje *' -p10 _combat_event_attack_2

/def -ag -t'* rozpada sie!' _combat_event_trigger_1 = /_exaggerate_alert %{*}
/def -ag -t'* peka!*' _combat_event_trigger_2 = /_exaggerate_alert %{*}
/def -ag -t'Uderzenie jest tak silne, ze bezwiednie puszczasz *' _combat_event_trigger_3 = /_exaggerate_alert %{*}

/def -ag -t'Zabiles *' -p15 _combat_event_kill_1 = \
    /echo -p @{Cbgred} |  ############  Z A B I L E S  ############%;\
    /echo -p @{Cbgred} |  ############  Z A B I L E S  ############%;\
    /echo -p @{Cbgred} |  ############  Z A B I L E S  ############%;\

/def -mregexp -ag -t'(.*) (polegl|umarl)(a|)\.' -p15 _combat_event_kill_2 = \
    /echo%;\
    /echo -p @{Cred} |  ############  Z G O N  ############%;\
    /echo -p @{Cred} |  ############  Z G O N  ############    %{P1}%;\
    /echo -p @{Cred} |  ############  Z G O N  ############%;\
    /echo


; ZASLONY

/def -ag -mregexp -F -p10 -t'Zrecznie zaslaniasz (.*) przed ciosami (.*)\.' _combat_event_guard_3 = \
    /echo%;\
    /echo -p @{Crgb035}      [ ZASLONA ]     TY -> %{P1} -> %{P2}%;\
    /echo

/def -ag -mregexp -F -p10 -t'Probujesz zaslonic (.*) przed ciosami (.*), jednak nie jestes w stanie tego uczynic.' _combat_event_guard_4 = \
    /echo%;\
    /echo -p @{Crgb501}      [ ZASLONA ]     TY -> %{P1} -> %{P2}%;\
    /echo

/def -ag -mregexp -F -p10 -t'(.*) zrecznie zaslania (.*) przed ciosami (.*)' _combat_event_guard_1 = \
    /let whom=%{P2} %; /if ({P2} =~ "cie") /let whom=CIEBIE %; /endif%;\
    /echo%;\
    /echo -p @{Crgb035}      [ ZASLONA ]     %{P1} -> %{whom} -> %{P3}%;\
    /echo

/def -ag -mregexp -F -p10 -t'(.*) probuje zaslonic (.*) przed ciosami (.*), jednak nie jest w stanie tego uczynic.' _combat_event_guard_6 = \
    /let whom=%{P2} %; /if ({P2} =~ "cie") /let whom=CIEBIE %; /endif%;\
    /echo%;\
    /echo -p @{Crgb501}      [ ZASLONA ]     %{P1} -> %{whom} -> %{P3}%;\
    /echo

/def -ag -mregexp -F -p10 -t'Rzucasz sie na (.*) przebijajac sie przez .* ochrone.' _combat_event_break_1 = \
    /let whom=%{P1} %;\
    /echo -p @{Crgb150}      [ PRZELAMANIE ]  TY -> %{whom}

/def -ag -mregexp -F -p10 -t'(.*) rzuca sie na (.*), bezskutecznie probujac przebic sie przez .* ochrone.' _combat_event_break_2 = \
    /let who=%{P1} %;\
    /let whom=%{P2} %;\
    /echo -p @{Crgb501}      [ PRZELAMANIE ]  %{who} -> %{whom}

/def -ag -mregexp -F -p10 -t'(.*) rzuca sie na (.*) przebijajac sie przez .* ochrone.' _combat_event_break_3 = \
    /let who=%{P1} %;\
    /let whom=%{P2} %;\
    /echo -p @{Crgb150}      [ PRZELAMANIE ]  %{who} -> %{whom}

/def -ag -mregexp -F -p10 -t'Bezskutecznie rzucasz sie na (.*), probujac przebic sie przez .* ochrone.' _combat_event_break_4 = \
    /let whom=%{P1} %;\
    /echo -p @{Crgb501}      [ PRZELAMANIE ]  TY -> %{whom}

/def -aCrgb552 -t'Otaczajaca * sfera znika z cichym szumem.' _combat_amulet_1
/def -aCrgb552 -t'* z calych sil skupia sie na widniejacym na czarnym zdobionym amulecie wizerunku tarczy. Po chwili widzisz jak otacza go migotliwa sfera.' _combat_amulet_2


