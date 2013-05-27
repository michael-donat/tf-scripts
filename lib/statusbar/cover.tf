/def -mregexp -Fp999 -t'( i szybko przesuwa sie w twoja strone| i szybko przesuwa sie za ciebie, kryjac sie|Zrecznie zaslaniasz|Nie udaje ci sie zaslonic|Probujesz zaslonic|Na rozkaz .* (zaslaniasz|probujesz zaslonic)|Rzucasz sie na|Bezskutecznie rzucasz sie na)' _statusbar_trigger_cover = \
    /set _statusbar_var_cover=[  $[strcat(decode_attr("4", "BCred"))]  ]%;\
    /repeat -00:00:01.25 1 /set _statusbar_var_cover=[  $$[strcat(decode_attr("3", "BCred"))]  ]%;\
    /repeat -00:00:02.35 1 /set _statusbar_var_cover=[  $$[strcat(decode_attr("2", "BCyellow"))]  ]%;\
    /repeat -00:00:03.45 1 /set _statusbar_var_cover=[  $$[strcat(decode_attr("1", "BCyellow"))]  ]%;\
    /repeat -00:00:04.58 1 /set _statusbar_var_cover=[ $$[strcat(decode_attr("rdy", "BCgreen"))] ]

;Dhogrin unosi swoja stalowa ciezka tarcze i szybko przesuwa sie za ciebie, kryjac sie przed atakami okrutnego kobolda.