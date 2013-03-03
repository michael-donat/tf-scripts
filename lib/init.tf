
; load and connect
/load data/worlds/thornag.tf

; init logging
/load lib/init/log.tf

; init keyboard maps
/load lib/init/kbmac.tf

; load settings
/load lib/init/settings.tf

/cd lib

; load and init libraries
/load functions.tf
/load init/includes.tf

; reload def
/def reload = /purge * %; /cd .. %; /load lib/init.tf
/def showme = /test $[fake_recv({*})]

/def -ag -h'Redef' hide_redef

/targetting 1
/move +
/orders -

/pointing + - -