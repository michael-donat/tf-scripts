
/def light_on_bind_set = \
    /let label=$[strcat(decode_attr("  --   LAMPA    --   ", "BCbgblue"), "  ")]%;\
    /test _fast_bind_set({label}, "nap%%;zapal lampe", 1)

/def light_fill_bind_set = \
    /let label=$[strcat(decode_attr("  --    OLEJ    --   ", "BCbgblue"), "  ")]%;\
    /test _fast_bind_set({label}, "nap", 1)

/def light_fill_tick = \
    /tickoff %;\
    /def -i tick_warn = %;\
    /def -i tick_action = /light_fill_bind_set %;\
    /ticksize 240 %;\
    /tickon

/def -mglob -p2 -t'*lampa wypala sie i gasnie*' light_trigger_1 = /light_on_bind_set
/def -mglob -p2 -t'*Probujesz zapalic* lampe, ale ci sie*' light_trigger_2 = /light_on_bind_set
/def -mglob -p2 -t'pelniasz .*lampe\\\.' light_trigger_3 = /light_fill_tick
/def -mglob -p2 -t'*lampe, oprozniajac *' light_trigger_4 = \
    /info KONIEC OLEJU%;\
    /light_fill_tick
/def -mglob -p2 -t'*Zapalasz*lampe*' light_trigger_5 = /light_fill_tick
/def -mglob -p2 -t'*Gasisz*' light_trigger_6 = /tickoff
/def -mglob -p2 -t'*nie jest zapalona*' light_trigger_7 = /tickoff