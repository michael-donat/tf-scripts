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
/load combat/subs/hits.tf

; status bar
/load statusbar/init.tf
/load statusbar/hp.tf
/load statusbar/compass.tf
/load statusbar/stamina.tf
/load statusbar/cover.tf
/load statusbar/order.tf
/load statusbar/blocks.tf

; other defs/binds
/load binds.tf
/load defs.tf
/load defs/smith.tf
/load defs/odmiana.tf
/load defs/herbs.tf
/load defs/fastbind.tf
/load defs/light.tf
/load defs/fishing.tf

; basic hilights
/load hilite.tf
/load warn.tf

; load external bits
/load vendor/compatibility.tf
/load vendor/ingwar/cechy.tf
/load vendor/ingwar/zielnik.tf

/load vendor/dhogrin/src/listy.tf
/load vendor/dhogrin/src/spece.tf
/load vendor/dhogrin/src/spece_npc.tf
/load vendor/dhogrin/src/spece_bronie.tf
/load vendor/dhogrin/src/map.tf
/load vendor/dhogrin/src/postepy.tf
/load vendor/dhogrin/src/skrzynia.tf
/load vendor/dhogrin/src/magiki.tf
/load vendor/dhogrin/src/ocena.tf
/load vendor/dhogrin/src/licznik.tf
/load vendor/dhogrin/src/stat.tf
/load vendor/dhogrin/src/ruch_zliczanie.tf

; load databases
/eval /load %{db_odmiana}
/eval /load init/subs.tf

; keys
/load profile.tf

; anything that needs to override vendor

; movement binds
/load movement.tf


