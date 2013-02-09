; Someone blocking me

/def -Fp2 -t'* przymierza sie do odciecia ci drogi ucieczki.' _statusbar_trigger_block_me_start = \
    /set _statusbar_var_block_me=[  $[strcat(decode_attr("4", "BCgreen"))]  ]%;\
    /repeat -00:00:01 1 /set _statusbar_var_block_me=[  $$[strcat(decode_attr("3", "BCyellow"))]  ]%;\
    /repeat -00:00:02.40 1 /set _statusbar_var_block_me=[  $$[strcat(decode_attr("2", "BCyellow"))]  ]%;\
    /repeat -00:00:03.50 1 /set _statusbar_var_block_me=[  $$[strcat(decode_attr("1", "BCred"))]  ]%;\
    /repeat -00:00:04.60 1 /set _statusbar_var_block_me=[  $$[strcat(decode_attr("0", "BCred"))]  ]

/def -Fp2 -t'* zajmuje pozycje umozliwiajaca odciecie ci drogi ucieczki.' _statusbar_trigger_block_me_done = \
    /set _statusbar_var_block_me=[$[strcat(decode_attr(decode_attr("BLOCK", "BCyellow"), "Cbgred"))]]

/def -Fp2 -t'Udaje ci sie ominac *' _statusbar_trigger_block_me_end_1 = \
    /set _statusbar_var_block_me=[     ]

; I'm blocking

/def -Fp2 -t'Przymierzasz sie do odciecia *' _statusbar_trigger_block_i_start = \
    /set _statusbar_var_block_i=[  $[strcat(decode_attr("1", "BCred"))]  ]%;\
    /repeat -00:00:01 1 /set _statusbar_var_block_i=[  $$[strcat(decode_attr("2", "BCred"))]  ]%;\
    /repeat -00:00:02.40 1 /set _statusbar_var_block_i=[  $$[strcat(decode_attr("3", "BCyellow"))]  ]%;\
    /repeat -00:00:03.50 1 /set _statusbar_var_block_i=[  $$[strcat(decode_attr("4", "BCyellow"))]  ]%;\
    /repeat -00:00:04.60 1 /set _statusbar_var_block_i=[  $$[strcat(decode_attr("5", "BCgreen"))]  ]

/def -Fp2 -t'Zajmujesz pozycje umozliwiajaca odciecie *' _statusbar_trigger_block_i_done = \
    /set _statusbar_var_block_i=[$[strcat(decode_attr(decode_attr("BLOCK", "Cbggreen"), "Crgb550"))]]

/def -Fp2 -t'Przestajesz odcinac droge ucieczki *' _statusbar_trigger_block_i_end_1 = \
    /set _statusbar_var_block_i=[     ]

/def -Fp2 -t'*omija twoj nieskuteczny *' _statusbar_trigger_block_i_end_2 = \
    /set _statusbar_var_block_i=[     ]