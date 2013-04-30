/set status_height 3


/eval /set status_line=$[strrep("_", columns())]
/eval /set status_pad=$[" "]
/set _statusbar_var_hp=[              ]
/set _statusbar_var_st=[                     ]
/set _statusbar_var_szyk=[   ]
/set _statusbar_var_rozkaz=[   ]
/set _statusbar_var_blok=[   ]

/eval /status_add -c -r0 @more:8:Br
/eval /status_add -r0 status_line
/eval /status_add -c -r1 "HP: ":: _statusbar_var_hp:17
/eval /status_add -r1 "ST: ":: _statusbar_var_st:24
/eval /status_add -r1 "SZYK: ":: _statusbar_var_szyk:5
/eval /status_add -r1 "ROZKAZY: ":: _statusbar_var_rozkaz:5
/eval /status_add -r1 "BLOK: ":: _statusbar_var_blok:5
/eval /status_add -c -r2
/clock on



/def _update_statusbar_hp = \
  /set _statusbar_var_hp=$[decode_attr(strcat("[", "@{", {2}, "}", pad(strrep("#", {1} * 2), 7 * 2),"@{n}]"))]
  
/def _update_statusbar_st = \
  /set _statusbar_var_st=$[decode_attr(strcat("[", "@{", {2}, "}", pad(strrep("#", {1} * 2), 10 * 2),"@{n}]"))]
