; loads everything to turn level description into numbers
/load levels/stamina.tf
/load levels/misc.tf

; loads combat related stuff
/load combat/hp.tf
/load combat/team.tf
/load combat/events.tf
/load combat/system.tf
/load combat/defs.tf
/load combat/exp.tf
/load combat/binds.tf

; status bar
/load statusbar/init.tf
/load statusbar/hp.tf
/load statusbar/compass.tf
/load statusbar/stamina.tf
/load statusbar/cover.tf
/load statusbar/order.tf
/load statusbar/blocks.tf

; movement binds
/load movement.tf

; other defs/binds
/load binds.tf
/load defs.tf
/load defs/smith.tf
/load defs/odmiana.tf
/load defs/herbs.tf
/load defs/fastbind.tf

; basic hilights
/load hilite.tf
/load warn.tf

/load map.tf

; load external bits
/load vendor/ingwar/cechy.tf
/load vendor/ingwar/zielnik.tf
/load vendor/dhogrin/ocena.tf
/load vendor/dhogrin/skrzynia.tf
/load vendor/dhogrin/postepy.tf

; load databases
/eval /load %{db_odmiana}

; temp
;/load ../src/combat/colors_events.tf
;/load ../src/combat/colors_hits.tf
;/load ../src/combat/colors_weapons.tf
/load ../src/subs/OK.tf
/load ../src/subs/MC.tf


