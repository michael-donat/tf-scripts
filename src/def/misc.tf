/alias czyt /send przeczytaj %{*}

/def _def_read_info = \
    /echo %{1}%;\
    /if ({1} == 1) \
        /send ob tablice%;\
    /elseif ({1} == 2) \
        /send przeczataj tablice%;\
    /elseif ({1} == 3) \
        /send ob tabliczke%;\
    /elseif ({1} == 4) \
        /send przeczytaj tabliczke%;\
    /endif

/alias t1 /_def_read_info 1
/alias t2 /_def_read_info 2
/alias t3 /_def_read_info 3
/alias t4 /_def_read_info 4



