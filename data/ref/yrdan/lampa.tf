/def -Fp10 -mglob -t"Zapalasz olejna lampe." _lampa_palenie_timer=/timer_lampa_stop%;/timer_lampa_start

/def timer_lampa_start = \
/test timer_pid2:=repeat("-270 1 /lecho")%;/set timer_lampa_act=1

/def lecho = /if ({lampa_echo}) /echo -p -aBCyellow             >>>>LAMPA PRAWIE PUSTA<<<<%;\
/endif

/set lampa_echo=1

/def timer_lampa_stop= /kill %{timer_pid2}

/def -Fp10 -mglob -t"Gasisz olejna lampe." _lampa_gaszenie_timer=/timer_lampa_stop