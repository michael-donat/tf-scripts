/def -t'* atakuje cie!' -p15 _combat_event_attack_1 = \
    /substitute -p @{Cbgblue} ======  @{Cbgred}[ ATTACKS ME ]@{Cbgblue} - %{*}

/def -aCbgblue -t'* atakuje *' -p10 _combat_event_attack_2

/def -t'Zabiles *' -p15 _combat_event_kill_1 = \
    /substitute -p @{Cbgred} ======  [ I KILLED ] - %{*}

/def -t'* umarl.' -p15 _combat_event_kill_2 = \
    /substitute -p @{rCbgred} ======       %{*}      ======

/def -p15 -t'* zrecznie zaslania Cie przed ciosami *' _combat_event_guard_2 = \
    /substitute -p @{Cbggreen} @{Cblue} [ ZASLONA ] [CIEBIE] [OK] - %{*}

/def -F -p10 -t'* zrecznie zaslania * przed ciosami *' _combat_event_guard_1 = \
    /substitute -p @{Cbgblue} [ ZASLONA ] [OK] - %{*}

/def -F -p10 -t'Zrecznie zaslaniasz *' _combat_event_guard_3 = \
    /substitute -p @{Cbggreen}@{Cblue} [ ZASLANIASZ ] [OK] - %{*}

/def -F -p10 -t'Probujesz zaslonic *' _combat_event_guard_4 = \
    /substitute -p @{Cred} [ ZASLANIASZ ] [FAIL] - %{*}

/def -p10 -t'Nie jestes jeszcze gotow do wykonania kolejnego manewru.' _combat_event_guard_5 = \
    /substitute -p @{n} ------  %{*}

/def -p10 -t'* wspiera * w walce *' _combat_event_support = \
    /substitute -p @{Cbgblue} ------  %{*}


/def -ag -t'* rozpada sie!' _combat_event_trigger_1 = /_exaggerate_alert %{*}
/def -ag -t'* peka!*' _combat_event_trigger_2 = /_exaggerate_alert %{*}
/def -ag -t'Uderzenie jest tak silne, ze bezwiednie puszczasz *' _combat_event_trigger_3 = /_exaggerate_alert %{*}