/eval /set status_pad=$[" "]
/eval /set status_line=$[strrep(decode_attr(" ", "BCwhite"), columns())]

/set status_height 4

/eval /set _combat_orders_enabled_label=$[decode_attr("[OR]", "Cbgred")]
/eval /set _movement_disabled_label=$[decode_attr("[MV]", "Cbggreen")]
/eval /set _targetting_mode=[   ]
/eval /set _setting_target_mode=[---]
/eval /set _statusbar_mail=[MAIL]
/eval /set _map_tracking_enabled_label=$[decode_attr("[MAP]", "Cbgred")]

/eval /status_add -c -r0 status_line::

/set _statusbar_var_hp=[                     ]
/set _statusbar_var_stamina=[                     ]
/set _statusbar_var_cover=[ rdy ]
/set _statusbar_var_order=[ rdy ]
/set _statusbar_var_block_i=[     ]
/set _statusbar_var_block_me=[     ]

/eval /status_add -c -r1 "[ " _movement_compass_exit_nw:1 " ":1 _movement_compass_exit_n:1 " ":1 _movement_compass_exit_ne:2 _movement_compass_exit_up:1 "] "::
/eval /status_add -r1 "HP: ":: _statusbar_var_hp:24
/eval /status_add -r1 "ST: ":: _statusbar_var_stamina:24
/eval /status_add -r1 "AT: ":: _combat_attack_target::Cred

/eval /status_add -c -r2 "[ ":: _movement_compass_exit_w:1  " ":1 "#":1:Cyellow " ":1 _movement_compass_exit_e:2 _movement_compass_exit_dn:1 "] "::
/eval /status_add -r2 "CV: ":: _statusbar_var_cover:11
/eval /status_add -r2 "OR: ":: _statusbar_var_order:8
/eval /status_add -r2 "BI: ":: _statusbar_var_block_i:11
/eval /status_add -r2 "BM: ":: _statusbar_var_block_me:8
/eval /status_add -r2 "DT: ":: _combat_defence_target::Cgreen

/set _mana=1

/eval /status_add -c -r3 "[ ":: _movement_compass_exit_sw:1 " ":1 _movement_compass_exit_s:1 " ":1 _movement_compass_exit_se:2 _movement_compass_exit_ot:1 "] "::
/eval /status_add -r3 "WB: [":: _fast_bind_label:21 "]"
/eval /status_add -r3 "  M: ":: _mana:1 "/8":7
/eval /status_add -r3 " ":: _combat_orders_enabled_label:4
/eval /status_add -r3 _movement_disabled_label:4
/eval /status_add -r3 _map_tracking_enabled_label:5
/eval /status_add -r3 "X: " _map_bound_exit::

;/eval /status_add -r3 _statusbar_mail:6
;/eval /status_add -r3 _targetting_mode:5
;/eval /status_add -r3 _setting_target_mode:5

;/eval /status_add -r3 "R: [ ":: rozkaz_ataku:46:BC%kolor_alarm
;/eval /status_add -r3 "]  Bind: ":: bindings:35:BC%kolor_info
;/eval /status_add -r3 spacebreak::
;/eval /status_add -r3 ownkills:3:BC%kolor_main
;/eval /status_add -r3 "/ ":: allkills:3:BC%kolor_main