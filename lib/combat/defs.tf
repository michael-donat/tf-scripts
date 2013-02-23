/def zr0 = rozkaz druzynie zaslonic ciebie%;/defend siebie
/def z0 = /defend siebie

/def zaslon = \
    /if ({2} =~ "") \
        /send zaslon %{1}%;\
    /else \
        /send zaslon %{1} przed %{-1}%;\
    /endif

/alias z /zaslon %{*}

/def zaslon_przed = \
    /send zaslon przed %{*}

/alias zp /zaslon_przed %{*}

/alias zz /send przestan zaslaniac
/alias zzz /send przestan kryc sie za zaslona

/def targetting = \
    /purge _combat_event_set_attack_target*%;\
    /purge _combat_event_set_defence_target*%;\
    /if ({1} == 1) \
        /_set_targetting_mode_set_target%;\
        /set _targetting_mode=[SET]%;\
    /elseif ({1} == 2) \
        /_set_targetting_mode_look_at_target%;\
        /set _targetting_mode=[LOK]%;\
    /elseif ({1} == 3) \
        /_set_targetting_mode_point_at%;\
        /set _targetting_mode=[PNT]%;\
    /else \
        /echo Setting atack mode%;\
        /test echo("      1   -   by setting target")%;\
        /test echo("      2   -   by looking")%;\
        /test echo("      3   -   by pointing")%;\
    /endif