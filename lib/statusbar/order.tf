/def -mregexp -Fp2 -t'(Wydajesz rozkaz|Niestety, nikt nie|Glosno wypowiadasz rozkaz)' _statusbar_trigger_order = \
    /set _statusbar_var_order=[  $[strcat(decode_attr("4", "BCred"))]  ]%;\
    /repeat -00:00:01 1 /set _statusbar_var_order=[  $$[strcat(decode_attr("3", "BCred"))]  ]%;\
    /repeat -00:00:02.40 1 /set _statusbar_var_order=[  $$[strcat(decode_attr("2", "BCyellow"))]  ]%;\
    /repeat -00:00:03.50 1 /set _statusbar_var_order=[  $$[strcat(decode_attr("1", "BCred"))]  ]%;\
    /repeat -00:00:04.60 1 /set _statusbar_var_order=[ $$[strcat(decode_attr("rdy", "BCgreen"))] ]


